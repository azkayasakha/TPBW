<?php
include '../data/local/koneksi.php';

$queryStasiun = "SELECT * FROM tbl_stasiun ORDER BY area ASC, nama ASC;";
$sqlStasiun = mysqli_query($conn, $queryStasiun);
$stasiunList = [];
while ($resultStasiun = mysqli_fetch_assoc($sqlStasiun)) {
    $stasiunList[] = $resultStasiun;
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <title>Rute Commuter Line</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
</head>

<body>
    <div id="map"></div>
    <div class="content">
        <div class="card">
            <div class="card-body">
                <div class="d-flex flex-row gap-4 align-items-center">
                    <div class="container text-center">
                        <label for="st-dari" class="form-label">Dari</label>
                        <select class="form-select" name="st-dari" id="st-dari">
                            <option value="">-- Pilih Stasiun --</option>
                            <?php
                            $areas = ['Jabodetabek', 'Merak', 'Serang', 'Yogyakarta'];
                            foreach ($areas as $area) {
                                echo "<option value='' disabled>-- $area --</option>";
                                foreach ($stasiunList as $stasiun) {
                                    if ($stasiun['area'] == strtolower($area)) {
                                        echo "<option value='{$stasiun['id']}'>{$stasiun['nama']}</option>";
                                    }
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <div><i class="fa-solid fa-train fs-1"></i></div>
                    <div class="container text-center">
                        <label for="st-ke" class="form-label">Ke</label>
                        <select class="form-select" name="st-ke" id="st-ke">
                            <option value="">-- Pilih Stasiun --</option>
                            <?php
                            $areas = ['Jabodetabek', 'Merak', 'Serang', 'Yogyakarta'];
                            foreach ($areas as $area) {
                                echo "<option value='' disabled>-- $area --</option>";
                                foreach ($stasiunList as $stasiun) {
                                    if ($stasiun['area'] == strtolower($area)) {
                                        echo "<option value='{$stasiun['id']}'>{$stasiun['nama']}</option>";
                                    }
                                }
                            }
                            ?>
                        </select>
                    </div>
                    <button type="button" class="btn btn-primary me-2" style="white-space: nowrap;" onclick="btnSubmit()">Cek Rute & Tarif</button>
                    <h2 class="me-2" id="tarif">Rp0.000</h2>
                </div>
            </div>
        </div>
    </div>

    <script src="js/rute.js"></script>
    <script>
        var map = L.map('map').setView([-6.5, 107], 10);

        // Tambahkan peta dasar dari OSM
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            attribution: '&copy; OpenStreetMap contributors'
        }).addTo(map);

        // Tambahkan marker untuk setiap stasiun
        var stasiun = [
            <?php
            foreach ($stasiunList as $stasiun) {
                $idStasiun = $stasiun['id'];
                $namaStasiun = $stasiun['nama'];
                $queryLokasi = "SELECT * FROM tbl_lokasi WHERE id = '$idStasiun'";
                $sqlLokasi = mysqli_query($conn, $queryLokasi);
                $dataLokasi = mysqli_fetch_assoc($sqlLokasi);
                $latitude = $dataLokasi['latitude'];
                $longitude = $dataLokasi['longitude'];
                echo "{nama: '$namaStasiun', koordinat: [$latitude, $longitude]},";
            }
            ?>
        ];

        stasiun.forEach(s => {
            L.marker(s.koordinat).addTo(map).bindPopup(s.nama);
        });

        var currentRoute = null; // Menyimpan polyline yang sedang ditampilkan

        function btnSubmit() {
            const stationFrom = document.getElementById('st-dari').value;
            const stationTo = document.getElementById('st-ke').value;
            console.log(stationFrom, stationTo);
            const tarifElement = document.getElementById('tarif');
            const loadingIcon = document.getElementById('loading-icon');

            let listRute = findRoute(stationFrom, stationTo);

            console.log("List Rute:", listRute);

            // Kirim data rute ke PHP dengan Fetch API
            fetch('proses_rute.php', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        rute: listRute
                    })
                })
                .then(response => response.json())
                .then(data => {
                    console.log("Data dari PHP:", data);

                    if (currentRoute) {
                        map.removeLayer(currentRoute); // Hapus rute sebelumnya jika ada
                    }

                    // Gambar rute baru
                    currentRoute = L.polyline(data.krlRoute, {
                        color: 'blue',
                        weight: 4
                    }).addTo(map);
                })
                .catch(error => console.error('Error:', error));

            tarifElement.innerHTML = '<i class="fa-solid fa-spinner fa-spin"></i>';

            fetch(`http://localhost:3000/fare?from=${stationFrom}&to=${stationTo}`)
                .then(response => response.json())
                .then(data => {
                    if (data.fare !== 'Rp') {
                        tarifElement.innerText = data.fare.replace(/\s+/g, "");
                    } else {
                        tarifElement.innerText = 'Rp0.000';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    alert('Gagal mengambil data tarif.');
                });
        }
    </script>
</body>

</html>