RS BHAYANGKARA AKPOL - CARA MENJALANKAN DI LAPTOP LAIN
=======================================================

A. SOFTWARE
1. Install XAMPP (Apache + MySQL/MariaDB).
2. Buka XAMPP Control Panel.
3. Start Apache dan MySQL.

B. PASANG PROJECT
1. Extract folder RS-Bhayangkara-main ke:
   C:\xampp\htdocs\
2. Pastikan hasil akhirnya seperti:
   C:\xampp\htdocs\RS-Bhayangkara-main\index.php

C. DATABASE
1. Buka http://localhost/phpmyadmin
2. Import file: db_rs_bhayangkara.sql
3. Database yang digunakan project adalah:
   db_rs_bhayangkara
4. Jangan import file SQL lain. Database utama sudah berisi tabel
   berita, dokter, kamar, pasien, pendaftaran, pengaduan, poli, dan users.

D. BUKA WEBSITE
Gunakan:
   http://localhost/RS-Bhayangkara-main/

JANGAN menjalankan project utama dengan double-click index.html atau
Live Server VS Code jika ingin fitur PHP/API/database bekerja.

E. KONEKSI DATABASE DEFAULT XAMPP
Host     : localhost
Username : root
Password : (kosong)
Database : db_rs_bhayangkara

Jika MySQL XAMPP memakai password root atau port berbeda, ubah file
koneksi.php sesuai konfigurasi XAMPP laptop tersebut.

F. LOGIN DEMO
Admin: admin@gmail.com / admin123
Pasien: pasien@gmail.com / pasien123

G. JIKA TAMPILAN LAMA
Tekan Ctrl+F5 pada browser. File index.php juga mengirim header no-cache.

