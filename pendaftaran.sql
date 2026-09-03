-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 12 Agu 2026 pada 04.55
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_klinik_rs`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL,
  `no_pendaftaran` varchar(50) DEFAULT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `nik_nrp` varchar(30) NOT NULL,
  `kategori` varchar(50) DEFAULT 'Masyarakat Umum',
  `pembayaran` varchar(50) DEFAULT 'Umum / Mandiri',
  `dokter_nama` varchar(150) DEFAULT NULL,
  `dokter` varchar(150) DEFAULT NULL,
  `tanggal_kunjungan` date DEFAULT NULL,
  `no_antrean` int(11) DEFAULT 1,
  `status` enum('Menunggu','Diproses','Selesai','Batal') DEFAULT 'Menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pendaftaran`, `no_pendaftaran`, `nama_pasien`, `nik_nrp`, `kategori`, `pembayaran`, `dokter_nama`, `dokter`, `tanggal_kunjungan`, `no_antrean`, `status`, `created_at`) VALUES
(1, NULL, 'papa', '12312312312', 'Umum', 'Umum', 'dr. HENRY SANTOSO, Sp. PD (SPESIALIS PENYAKIT DALAM)', NULL, '2026-08-14', 0, 'Menunggu', '2026-08-12 02:47:28'),
(2, NULL, 'll', '12312312312', 'Umum', 'Umum', 'dr. KHUMAYROH RACHMAWATI BUANA, Sp.DVE (SPESIALIS KULIT, KELAMIN DAN KECANTIKAN)', NULL, '2026-08-26', 0, 'Menunggu', '2026-08-12 02:48:16');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
