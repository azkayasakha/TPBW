<?php
$host = 'localhost';
$user = 'root';
$pass = '';
$db = 'db_kai';

$conn = mysqli_connect($host, $user, $pass, $db);
if ($conn) {
    // echo "Koneksi berhasil";
} else {
    echo "Koneksi gagal";
}

mysqli_select_db($conn, $db);
?>