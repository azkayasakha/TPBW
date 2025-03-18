<?php
include '../database/koneksi.php';

$queryStasiun = "SELECT * FROM tbl_stasiun ORDER BY area ASC, nama ASC;";
$sqlStasiun = mysqli_query($conn, $queryStasiun);
$stasiunList = [];
while ($resultStasiun = mysqli_fetch_assoc($sqlStasiun)) {
    $stasiunList[] = $resultStasiun;
}

echo json_encode($stasiunList);
?>