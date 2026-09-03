-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 28 Agu 2026 pada 06.46
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

CREATE DATABASE IF NOT EXISTS `db_rs_bhayangkara` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE `db_rs_bhayangkara`;

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_rs_bhayangkara`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `berita`
--

CREATE TABLE `berita` (
  `id_berita` int(11) NOT NULL,
  `judul` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `kategori` varchar(50) NOT NULL DEFAULT 'Edukasi Kesehatan',
  `tanggal` date NOT NULL,
  `gambar` varchar(255) DEFAULT 'assets/images/berita/default.jpg',
  `ringkasan` text NOT NULL,
  `isi` longtext NOT NULL,
  `tampil` tinyint(1) NOT NULL DEFAULT 1,
  `penulis` varchar(100) DEFAULT 'Admin RS',
  `views` int(11) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `berita`
--

INSERT INTO `berita` (`id_berita`, `judul`, `slug`, `kategori`, `tanggal`, `gambar`, `ringkasan`, `isi`, `tampil`, `penulis`, `views`, `created_at`, `updated_at`) VALUES
(1, 'Pentingnya Pemeriksaan Kesehatan Rutin (MCU) Bagi Usia Produktif', 'pentingnya-pemeriksaan-kesehatan-rutin-mcu-bagi-usia-produktif', 'Edukasi Kesehatan', '2026-08-02', 'mcu.jpeg', 'Pencegahan dini terhadap penyakit kronis menjadi langkah terpenting dalam menjaga kualitas hidup dan stamina kerja.', 'Pemeriksaan kesehatan secara rutin merupakan salah satu langkah penting untuk menjaga kondisi tubuh, khususnya bagi masyarakat pada usia produktif.\n\nMelalui Medical Check Up (MCU), kondisi kesehatan dapat diketahui lebih awal sehingga berbagai risiko gangguan kesehatan dapat mendapatkan perhatian dan penanganan yang sesuai.\n\nPencegahan dini terhadap penyakit kronis menjadi langkah penting dalam menjaga kualitas hidup dan stamina dalam menjalankan aktivitas sehari-hari.', 1, 'Admin RS', 124, '2026-08-28 04:19:28', '2026-08-28 04:19:28'),
(2, 'Bakti Kesehatan RS Bhayangkara Akpol untuk Masyarakat Semarang', 'bakti-kesehatan-rs-bhayangkara-akpol-untuk-masyarakat-semarang', 'Kegiatan RS', '2026-07-28', 'bakti.jpg', 'Pelaksanaan pengobatan gratis dan konsultasi kesehatan gratis yang diselenggarakan dalam rangka memperingati Hari Bhayangkara.', 'RS Bhayangkara Akpol turut melaksanakan kegiatan bakti kesehatan sebagai bentuk kepedulian terhadap kesehatan masyarakat di Kota Semarang.\n\nKegiatan tersebut mencakup pelayanan pengobatan gratis dan konsultasi kesehatan gratis bagi masyarakat.\n\nKegiatan bakti kesehatan diselenggarakan dalam rangka memperingati Hari Bhayangkara serta sebagai bentuk kontribusi RS Bhayangkara Akpol.', 1, 'Humas RS', 210, '2026-08-28 04:19:28', '2026-08-28 04:19:28'),
(3, 'Menjaga Kesehatan Telinga, Hidung, dan Tenggorokan di Musim Pancaroba', 'menjaga-kesehatan-telinga-hidung-dan-tenggorokan-di-musim-pancaroba', 'Tips Medis', '2026-07-15', 'THT.jpg', 'Panduan dari dokter spesialis THT RS Bhayangkara Akpol untuk mencegah infeksi dan alergi pada saluran pernapasan.', 'Perubahan cuaca pada musim pancaroba dapat meningkatkan risiko gangguan pada saluran pernapasan, termasuk telinga, hidung, dan tenggorokan.\n\nMenjaga kebersihan diri, menjaga daya tahan tubuh, serta memperhatikan kondisi lingkungan merupakan beberapa langkah yang dapat dilakukan untuk membantu menjaga kesehatan.', 1, 'Tim Medis', 95, '2026-08-28 04:19:28', '2026-08-28 04:19:28'),
(5, 'ppp', 'ppp', 'Edukasi Kesehatan', '2026-08-28', '', 'pppp', 'p', 1, 'Admin RS', 0, '2026-08-28 04:44:08', '2026-08-28 04:44:08');

-- --------------------------------------------------------

--
-- Struktur dari tabel `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `id_poli` int(11) NOT NULL,
  `nama_dokter` varchar(150) NOT NULL,
  `spesialis` varchar(100) NOT NULL,
  `sip` varchar(50) DEFAULT NULL,
  `no_hp` varchar(20) DEFAULT NULL,
  `hari_praktik` varchar(100) NOT NULL,
  `jam_praktik` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `id_poli`, `nama_dokter`, `spesialis`, `sip`, `no_hp`, `hari_praktik`, `jam_praktik`) VALUES
(1, 1, 'dr. HENRY SANTOSO, Sp. PD', 'SPESIALIS PENYAKIT DALAM', NULL, NULL, 'Senin, Rabu, Jumat', '09.00-11.00 WIB'),
(2, 2, 'dr. SHINTA HARFINIA, Sp. Rad', 'SPESIALIS RADIOLOGI', NULL, NULL, 'Senin - Jumat', '08.00-12.00 WIB'),
(3, 3, 'dr. WAHYU HENDRA PRABOWO, Sp.B', 'SPESIALIS BEDAH', NULL, NULL, 'Senin - Jumat', '12.00-14.00 WIB'),
(4, 4, 'dr. WINRES SAPTO PRIAMBODO, Sp. A', 'SPESIALIS ANAK', NULL, NULL, 'Senin - Kamis', '15.30-16.30 WIB');

-- --------------------------------------------------------

--
-- Struktur dari tabel `kamar`
--

CREATE TABLE `kamar` (
  `id_kamar` int(11) NOT NULL,
  `kelas` enum('VIP','Kelas I','Kelas II','Kelas III','ICU') NOT NULL,
  `nama_bangsal` varchar(100) NOT NULL,
  `kapasitas_bed` int(11) NOT NULL DEFAULT 0,
  `bed_terisi` int(11) NOT NULL DEFAULT 0,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `kamar`
--

INSERT INTO `kamar` (`id_kamar`, `kelas`, `nama_bangsal`, `kapasitas_bed`, `bed_terisi`, `updated_at`) VALUES
(1, 'VIP', 'Mawar VIP', 4, 2, '2026-08-19 04:28:21'),
(2, 'Kelas I', 'Melati 1', 6, 3, '2026-08-19 04:28:21'),
(3, 'Kelas II', 'Melati 2', 8, 5, '2026-08-19 04:28:21'),
(4, 'Kelas III', 'Anggrek', 10, 7, '2026-08-19 04:28:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pasien`
--

CREATE TABLE `pasien` (
  `id_pasien` int(11) NOT NULL,
  `no_rm` varchar(20) DEFAULT NULL,
  `nik_nrp` varchar(30) NOT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `kategori` enum('Masyarakat Umum','Anggota Polri','Taruna Akpol') DEFAULT 'Masyarakat Umum',
  `pembayaran` enum('Umum / Mandiri','BPJS Kesehatan') DEFAULT 'Umum / Mandiri',
  `no_hp` varchar(20) DEFAULT NULL,
  `alamat` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `pendaftaran`
--

CREATE TABLE `pendaftaran` (
  `id_pendaftaran` int(11) NOT NULL,
  `no_antrean` varchar(20) NOT NULL,
  `id_pasien` int(11) DEFAULT NULL,
  `nama_pasien` varchar(100) NOT NULL,
  `nik_nrp` varchar(30) NOT NULL,
  `kategori` varchar(50) DEFAULT 'Masyarakat Umum',
  `pembayaran` varchar(50) DEFAULT 'Umum / Mandiri',
  `id_dokter` int(11) DEFAULT NULL,
  `dokter_nama` varchar(150) NOT NULL,
  `tanggal_kunjungan` date NOT NULL,
  `status` enum('Menunggu','Terkonfirmasi','Diproses','Selesai','Batal') DEFAULT 'Menunggu',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pendaftaran`
--

INSERT INTO `pendaftaran` (`id_pendaftaran`, `no_antrean`, `id_pasien`, `nama_pasien`, `nik_nrp`, `kategori`, `pembayaran`, `id_dokter`, `dokter_nama`, `tanggal_kunjungan`, `status`, `created_at`) VALUES
(1, 'A-001', NULL, 'windd', '12312312312', 'Umum', 'Umum', NULL, 'dr. WAHYU HENDRA PRABOWO, M.Biomed, Sp.B, FINACS (SPESIALIS BEDAH)', '2026-08-21', 'Menunggu', '2026-08-19 04:31:51'),
(2, 'A-001', NULL, 'wiwin', '1111111121221', 'Umum', 'Umum', NULL, 'dr. FERRY SANTOSO, Sp. OG (SPESIALIS KANDUNGAN & KEBIDANAN)', '2026-08-24', 'Menunggu', '2026-08-19 04:44:28'),
(3, 'A-001', NULL, 'velocit', '1111111121221', 'Umum', 'Umum', NULL, 'dr. JOSE TYMOTHY MANUPUTTY, Sp.OG (SPESIALIS KANDUNGAN & KEBIDANAN)', '2026-09-01', 'Menunggu', '2026-08-19 04:51:23'),
(4, 'A-001', NULL, 'siniia', '12312312312', 'Umum', 'Umum', NULL, 'dr. NI MADE ATIKA NURINA YANTI SUTARTA, Sp.KJ (SPESIALIS KEDOKTERAN JIWA)', '2026-09-02', 'Menunggu', '2026-08-19 05:03:25'),
(5, 'A-002', NULL, 'khair', '12312312312', 'Umum', 'Umum', NULL, 'dr. WAHYU HENDRA PRABOWO, M.Biomed, Sp.B, FINACS (SPESIALIS BEDAH)', '2026-09-01', 'Menunggu', '2026-08-19 06:33:37');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pengaduan`
--

CREATE TABLE `pengaduan` (
  `id_pengaduan` int(11) NOT NULL,
  `kode_pengaduan` varchar(25) NOT NULL,
  `nama_pelapor` varchar(100) NOT NULL DEFAULT 'Anonim',
  `no_hp` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `kategori_layanan` varchar(50) NOT NULL,
  `isi_pengaduan` text NOT NULL,
  `tanggapan_admin` text DEFAULT NULL,
  `status` enum('Baru','Diproses','Selesai','Ditolak') NOT NULL DEFAULT 'Baru',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `pengaduan`
--

INSERT INTO `pengaduan` (`id_pengaduan`, `kode_pengaduan`, `nama_pelapor`, `no_hp`, `email`, `kategori_layanan`, `isi_pengaduan`, `tanggapan_admin`, `status`, `created_at`) VALUES
(1, 'ADU-4342', 'ririn', NULL, NULL, 'Pelayanan Medis', 'nn', NULL, 'Baru', '2026-08-19 05:10:37'),
(2, 'ADU-4115', 'LALA', NULL, NULL, 'Pelayanan Medis', 'BGOES', NULL, 'Baru', '2026-08-19 05:13:08'),
(3, 'ADU-4696', 'khaii', NULL, NULL, 'Pelayanan Medis', 'masalah', NULL, 'Baru', '2026-08-19 06:34:21');

-- --------------------------------------------------------

--
-- Struktur dari tabel `poli`
--

CREATE TABLE `poli` (
  `id_poli` int(11) NOT NULL,
  `nama_poli` varchar(50) NOT NULL,
  `deskripsi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `poli`
--

INSERT INTO `poli` (`id_poli`, `nama_poli`, `deskripsi`) VALUES
(1, 'Poli Penyakit Dalam', 'Layanan spesialis penyakit organ dalam'),
(2, 'Poli Radiologi', 'Pemeriksaan rontgen dan USG'),
(3, 'Poli Bedah', 'Tindakan bedah umum dan spesialis'),
(4, 'Poli Anak', 'Layanan kesehatan anak');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `nama_lengkap` varchar(100) NOT NULL,
  `role` enum('admin','petugas','dokter','pasien') NOT NULL DEFAULT 'pasien',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id_user`, `username`, `email`, `password`, `nama_lengkap`, `role`, `created_at`) VALUES
(1, 'admin', 'admin@gmail.com', '$2y$10$e0MYzXyjpJS7Pd0RVvHwHe1eB2g0WdGrkvdM084yP4R3GqT1H1Ote', 'Administrator Utama', 'admin', '2026-08-19 04:28:21');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `berita`
--
ALTER TABLE `berita`
  ADD PRIMARY KEY (`id_berita`),
  ADD KEY `idx_kategori` (`kategori`),
  ADD KEY `idx_tampil_tanggal` (`tampil`,`tanggal`);

--
-- Indeks untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`),
  ADD KEY `fk_dokter_poli` (`id_poli`);

--
-- Indeks untuk tabel `kamar`
--
ALTER TABLE `kamar`
  ADD PRIMARY KEY (`id_kamar`);

--
-- Indeks untuk tabel `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`id_pasien`),
  ADD UNIQUE KEY `idx_nik_nrp` (`nik_nrp`),
  ADD UNIQUE KEY `idx_no_rm` (`no_rm`);

--
-- Indeks untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD PRIMARY KEY (`id_pendaftaran`),
  ADD KEY `fk_pendaftaran_dokter` (`id_dokter`),
  ADD KEY `fk_pendaftaran_pasien` (`id_pasien`);

--
-- Indeks untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  ADD PRIMARY KEY (`id_pengaduan`),
  ADD UNIQUE KEY `idx_kode_pengaduan` (`kode_pengaduan`);

--
-- Indeks untuk tabel `poli`
--
ALTER TABLE `poli`
  ADD PRIMARY KEY (`id_poli`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `idx_username` (`username`),
  ADD UNIQUE KEY `idx_email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `berita`
--
ALTER TABLE `berita`
  MODIFY `id_berita` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `kamar`
--
ALTER TABLE `kamar`
  MODIFY `id_kamar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `pasien`
--
ALTER TABLE `pasien`
  MODIFY `id_pasien` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  MODIFY `id_pendaftaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT untuk tabel `pengaduan`
--
ALTER TABLE `pengaduan`
  MODIFY `id_pengaduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `poli`
--
ALTER TABLE `poli`
  MODIFY `id_poli` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `dokter`
--
ALTER TABLE `dokter`
  ADD CONSTRAINT `fk_dokter_poli` FOREIGN KEY (`id_poli`) REFERENCES `poli` (`id_poli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ketidakleluasaan untuk tabel `pendaftaran`
--
ALTER TABLE `pendaftaran`
  ADD CONSTRAINT `fk_pendaftaran_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pendaftaran_pasien` FOREIGN KEY (`id_pasien`) REFERENCES `pasien` (`id_pasien`) ON DELETE SET NULL ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
