<?php
header('Content-Type: application/json');
include '../data/local/koneksi.php';

// Ambil data JSON dari JavaScript
$data = json_decode(file_get_contents("php://input"), true);

if (isset($data['rute'])) {
    $ruteList = $data['rute'];
    $krlRoute = [];

    foreach ($ruteList as $rute) {
        $queryLokasi = "SELECT latitude, longitude FROM tbl_lokasi WHERE id = '$rute'";
        $sqlLokasi = mysqli_query($conn, $queryLokasi);
        $dataLokasi = mysqli_fetch_assoc($sqlLokasi);

        if ($dataLokasi) {
            $krlRoute[] = [
                floatval($dataLokasi['latitude']),
                floatval($dataLokasi['longitude'])
            ];
        }
    }

    echo json_encode(['krlRoute' => $krlRoute]);
} else {
    echo json_encode(['error' => 'Data rute tidak ditemukan!!']);
}
?>
