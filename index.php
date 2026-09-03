<?php
// Entry point Apache/XAMPP untuk project RS Bhayangkara.
// Menyajikan index.html melalui PHP agar project dijalankan lewat server, bukan file://.
header("Cache-Control: no-store, no-cache, must-revalidate, max-age=0");
header("Pragma: no-cache");
header("Expires: 0");
readfile(__DIR__ . "/index.html");
?>
