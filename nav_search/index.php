<?php
include '../database/koneksi.php';

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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title></title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.9.4/dist/leaflet.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.9.4/dist/leaflet.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"></script>
</head>
<body>
    <div id="map"></div>
    <div class="content">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <form class="d-flex">
                        <div class="input-group">
                            <input class="form-control form-control-lg" type="search" id="stasiunSearch" placeholder="Search" aria-label="Search">
                            <button class="btn btn-primary px-4" type="submit">
                                <i class="fa-solid fa-magnifying-glass"></i>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <div></div>

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

        

        $(document).ready(function() {
            // Initialize the autocomplete feature
            $("#stasiunSearch").autocomplete({
                source: function(request, response) {
                    $.ajax({
                        url: 'search_stasiun.php', // The PHP file that returns the station names
                        dataType: 'json',
                        success: function(data) {
                            // Filter the stations based on the user input (request.term)
                            var filteredStations = $.map(data, function(item) {
                                // Match station names that include the user's typed input (case-insensitive)
                                if (item.nama.toLowerCase().indexOf(request.term.toLowerCase()) !== -1) {
                                    return item.nama; // Return only the matching station names
                                }
                            });
                            // Pass the filtered station names to the autocomplete widget
                            response(filteredStations);
                        }
                    });
                },
                minLength: 2, // Set minimum length of characters before suggestions appear
                select: function(event, ui) {
                    // Handle the selection of a station
                    var selectedStation = ui.item.value;
                    console.log('Station selected: ' + selectedStation);

                    var station = stasiun.find(s => s.nama === selectedStation);

            if (station) {
                // Move the map to the selected station's coordinates and zoom in
                map.setView(station.koordinat, 15); // 15 is the zoom level
                L.marker(station.koordinat).addTo(map).bindPopup(station.nama).openPopup();
            }
                }
            });
        });
    </script>
</body>
</html>