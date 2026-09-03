<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Content-Type: application/json; charset=UTF-8");

$host = "localhost";
$user = "root";
$pass = "";
$db   = "db_rs_bhayangkara";

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    echo json_encode(["status" => "error", "message" => "Koneksi database gagal: " . mysqli_connect_error()]);
    exit();
}

$method = $_SERVER['REQUEST_METHOD'];

// Helper pembuat Slug URL
function createSlug($text) {
    $text = preg_replace('~[^\pL\d]+~u', '-', $text);
    $text = iconv('utf-8', 'us-ascii//TRANSLIT', $text);
    $text = preg_replace('~[^-\w]+~', '', $text);
    $text = trim($text, '-');
    $text = preg_replace('~-+~', '-', $text);
    return strtolower($text);
}

// 1. GET: Ambil Semua Berita / Berita Berdasarkan ID
if ($method === 'GET') {
    if (isset($_GET['id'])) {
        $id = intval($_GET['id']);
        $result = mysqli_query($conn, "SELECT * FROM berita WHERE id_berita = $id");
        $data = mysqli_fetch_assoc($result);
        
        // Tambahkan jumlah view
        if ($data) {
            mysqli_query($conn, "UPDATE berita SET views = views + 1 WHERE id_berita = $id");
        }
    } else if (isset($_GET['public'])) {
        // Hanya ambil berita yang di-set 'Tampil' untuk Halaman Depan
        $result = mysqli_query($conn, "SELECT * FROM berita WHERE tampil = 1 ORDER BY tanggal DESC, id_berita DESC");
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) { $data[] = $row; }
    } else {
        // Ambil semua data berita untuk Admin
        $result = mysqli_query($conn, "SELECT * FROM berita ORDER BY id_berita DESC");
        $data = [];
        while ($row = mysqli_fetch_assoc($result)) { $data[] = $row; }
    }
    echo json_encode($data);
}

// 2. POST: Tambah Berita Baru
else if ($method === 'POST') {
    $input = json_decode(file_get_contents("php://input"), true);

    $judul     = mysqli_real_escape_string($conn, $input['judul'] ?? '');
    $slug      = createSlug($judul);
    $kategori  = mysqli_real_escape_string($conn, $input['kategori'] ?? 'Edukasi Kesehatan');
    $tanggal   = mysqli_real_escape_string($conn, $input['tanggal'] ?? date('Y-m-d'));
    $gambar    = mysqli_real_escape_string($conn, $input['gambar'] ?? 'mcu.jpeg');
    $ringkasan = mysqli_real_escape_string($conn, $input['ringkasan'] ?? '');
    $isi       = mysqli_real_escape_string($conn, $input['isi'] ?? '');
    $tampil    = isset($input['tampil']) ? intval($input['tampil']) : 1;

    $sql = "INSERT INTO berita (judul, slug, kategori, tanggal, gambar, ringkasan, isi, tampil) 
            VALUES ('$judul', '$slug', '$kategori', '$tanggal', '$gambar', '$ringkasan', '$isi', $tampil)";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(["status" => "success", "message" => "Berita berhasil ditambahkan!"]);
    } else {
        echo json_encode(["status" => "error", "message" => mysqli_error($conn)]);
    }
}

// 3. PUT: Update Berita
else if ($method === 'PUT') {
    $input = json_decode(file_get_contents("php://input"), true);
    $id        = intval($input['id_berita']);
    $judul     = mysqli_real_escape_string($conn, $input['judul']);
    $slug      = createSlug($judul);
    $kategori  = mysqli_real_escape_string($conn, $input['kategori']);
    $tanggal   = mysqli_real_escape_string($conn, $input['tanggal']);
    $gambar    = mysqli_real_escape_string($conn, $input['gambar']);
    $ringkasan = mysqli_real_escape_string($conn, $input['ringkasan']);
    $isi       = mysqli_real_escape_string($conn, $input['isi']);
    $tampil    = intval($input['tampil']);

    $sql = "UPDATE berita SET 
            judul = '$judul', 
            slug = '$slug', 
            kategori = '$kategori', 
            tanggal = '$tanggal', 
            gambar = '$gambar', 
            ringkasan = '$ringkasan', 
            isi = '$isi', 
            tampil = $tampil 
            WHERE id_berita = $id";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(["status" => "success", "message" => "Berita berhasil diperbarui!"]);
    } else {
        echo json_encode(["status" => "error", "message" => mysqli_error($conn)]);
    }
}

// 4. DELETE: Hapus Berita
else if ($method === 'DELETE') {
    $id = intval($_GET['id']);
    $sql = "DELETE FROM berita WHERE id_berita = $id";

    if (mysqli_query($conn, $sql)) {
        echo json_encode(["status" => "success", "message" => "Berita berhasil dihapus!"]);
    } else {
        echo json_encode(["status" => "error", "message" => mysqli_error($conn)]);
    }
}

mysqli_close($conn);
?>