<?php
// Set header agar merespons format JSON dan mengizinkan CORS
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

// KONEKSI KE DATABASE (Sesuaikan nama database)
$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_rs_bhayangkara"; // Menggunakan nama database yang baru

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    echo json_encode([
        "status" => "error", 
        "message" => "Koneksi database gagal: " . mysqli_connect_error()
    ]);
    exit();
}

$method = $_SERVER['REQUEST_METHOD'];

if ($method === 'POST') {
    // Ambil data JSON dari request Body
    $rawInput = file_get_contents("php://input");
    $data = json_decode($rawInput, true);

    // Ambil data variabel dengan fallback jika kosong
    $nama     = isset($data['nama']) ? mysqli_real_escape_string($conn, $data['nama']) : '';
    $nik      = isset($data['nik']) ? mysqli_real_escape_string($conn, $data['nik']) : '';
    $kategori = isset($data['kategori']) ? mysqli_real_escape_string($conn, $data['kategori']) : 'Masyarakat Umum';
    $bayar    = isset($data['bayar']) ? mysqli_real_escape_string($conn, $data['bayar']) : 'Umum / Mandiri';
    $dokter   = isset($data['dokter']) ? mysqli_real_escape_string($conn, $data['dokter']) : '';
    $tanggal  = isset($data['tanggal']) && !empty($data['tanggal']) ? mysqli_real_escape_string($conn, $data['tanggal']) : date('Y-m-d');

    // 1. Generate Nomor Antrean Otomatis untuk hari/tanggal kunjungan tersebut
    $queryCount = mysqli_query($conn, "SELECT COUNT(*) as total FROM pendaftaran WHERE tanggal_kunjungan = '$tanggal'");
    $rowCount   = mysqli_fetch_assoc($queryCount);
    $nextNo     = $rowCount['total'] + 1;
    $noAntrean  = "A-" . str_pad($nextNo, 3, '0', STR_PAD_LEFT);

    // 2. Query INSERT sesuai skema tabel pendaftaran
    $sql = "INSERT INTO pendaftaran (no_antrean, nama_pasien, nik_nrp, kategori, pembayaran, dokter_nama, tanggal_kunjungan, status) 
            VALUES ('$noAntrean', '$nama', '$nik', '$kategori', '$bayar', '$dokter', '$tanggal', 'Menunggu')";

    if (mysqli_query($conn, $sql)) {
        echo json_encode([
            "status" => "success", 
            "no_antrean" => $noAntrean,
            "message" => "Pendaftaran berhasil disimpan ke MySQL!"
        ]);
    } else {
        echo json_encode([
            "status" => "error", 
            "message" => "Gagal simpan ke MySQL: " . mysqli_error($conn)
        ]);
    }
} 
else if ($method === 'GET') {
    // Ambil semua data pendaftaran untuk Dashboard Admin
    $result = mysqli_query($conn, "SELECT * FROM pendaftaran ORDER BY id_pendaftaran DESC");
    $list = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $list[] = $row;
    }
    echo json_encode($list);
}

mysqli_close($conn);
?>