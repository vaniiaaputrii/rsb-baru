<?php
// Sembunyikan pesan warning PHP agar tidak merusak format JSON
error_reporting(0);
ini_set('display_errors', 0);

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$conn = mysqli_connect("localhost", "root", "", "db_rs_bhayangkara");

if (!$conn) {
    echo json_encode(["status" => "error", "message" => "Koneksi DB gagal: " . mysqli_connect_error()]);
    exit();
}

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    $rawInput = file_get_contents("php://input");
    $data = json_decode($rawInput, true);

    $nama     = mysqli_real_escape_string($conn, $data['nama'] ?? 'Anonim');
    $kategori = mysqli_real_escape_string($conn, $data['kategori'] ?? 'Pelayanan Medis');
    $isi      = mysqli_real_escape_string($conn, $data['isi'] ?? '');

    $kodeAduan = "ADU-" . rand(1000, 9999);

    $sql = "INSERT INTO pengaduan (kode_pengaduan, nama_pelapor, kategori_layanan, isi_pengaduan, status) 
            VALUES ('$kodeAduan', '$nama', '$kategori', '$isi', 'Baru')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode([
            "status" => "success", 
            "kode_pengaduan" => $kodeAduan
        ]);
    } else {
        echo json_encode([
            "status" => "error", 
            "message" => mysqli_error($conn)
        ]);
    }
} 
else if ($method === 'GET') {
    $result = mysqli_query($conn, "SELECT * FROM pengaduan ORDER BY id_pengaduan DESC");
    $list = [];
    if ($result) {
        while ($row = mysqli_fetch_assoc($result)) {
            $list[] = $row;
        }
    }
    echo json_encode($list);
}

mysqli_close($conn);
?>      