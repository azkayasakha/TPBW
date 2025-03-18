<?php
$host = 'sql12.freesqldatabase.com';
$user = 'sql12767953';
$pass = 't9ZSnI2KiW';
$db = 'sql12767953';

$conn = mysqli_connect($host, $user, $pass, $db);
if ($conn) {
    // echo "Koneksi berhasil";
} else {
    echo "Koneksi gagal";
}

mysqli_select_db($conn, $db);
?>