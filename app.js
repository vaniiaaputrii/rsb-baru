// DATA DOKTER TERUPDATE BERDASARKAN JADWAL PRAKTIK RS BHAYANGKARA AKPOL[cite: 2]
const dokterList = [
    { id: 1, nama: "dr. HENRY SANTOSO, Sp. PD", spesialis: "SPESIALIS PENYAKIT DALAM", hari: "Senin, Rabu, Jumat", jam: "Senin & Rabu: 09.00-11.00 | Jumat: 10.00-11.00" },
    { id: 2, nama: "dr. SHINTA HARFINIA, Sp. Rad", spesialis: "SPESIALIS RADIOLOGI", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "Senin-Rabu: 08.00-12.00 | Kamis: 09.00-11.45 | Jumat: 11.30-15.00" },
    { id: 3, nama: "dr. WAHYU HENDRA PRABOWO, M.Biomed, Sp.B, FINACS", spesialis: "SPESIALIS BEDAH", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "Senin & Rabu: 12.00-14.00 | Selasa & Kamis: 09.00-11.00 | Jumat: 12.00-14.00" },
    { id: 4, nama: "dr. ICHDINAVIA HARSAYA, Sp. KJ", spesialis: "SPESIALIS KEDOKTERAN JIWA", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "Senin & Rabu: 08.00-10.00 & 15.00-16.00 | Selasa, Kamis, Jumat: 08.00-10.00" },
    { id: 5, nama: "dr. RISMA GAYANTI, Sp.FM", spesialis: "SPESIALIS FORENSIK DAN MEDIKOLEGAL", hari: "Senin, Selasa, Rabu", jam: "14.00-16.00" },
    { id: 6, nama: "dr. NANUNG BUDI PRAKOSO, Sp. N", spesialis: "SPESIALIS SARAF", hari: "Senin, Rabu, Jumat", jam: "16.00-17.00" },
    { id: 7, nama: "dr. IVANDER PURVANCE, Sp. OT", spesialis: "SPESIALIS ORTHOPEDI", hari: "Rabu, Jumat", jam: "10.00-12.00" },
    { id: 8, nama: "dr. RETNO HARTANTI, Sp. KFR", spesialis: "SPESIALIS REHABILITASI MEDIK", hari: "Selasa, Jumat", jam: "16.00-17.00" },
    { id: 9, nama: "dr. FERRY SANTOSO, Sp. OG", spesialis: "SPESIALIS KANDUNGAN & KEBIDANAN", hari: "Senin, Rabu, Kamis", jam: "14.00-16.00" },
    { id: 10, nama: "dr. WINRES SAPTO PRIAMBODO, Sp. A", spesialis: "SPESIALIS ANAK", hari: "Senin, Selasa, Rabu, Kamis", jam: "15.30-16.30" },
    { id: 11, nama: "INDRA DWI PURNOMO, M. Psi., Phd. Psikolog", spesialis: "PSIKOLOG KLINIS", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "12.00-14.00" },
    { id: 12, nama: "dr. AGRI VINA BRAHMANTIANI SURYONO, Sp.PK", spesialis: "PATOLOGI KLINIK", hari: "Rabu, Kamis, Sabtu", jam: "Rabu & Kamis: 17.00-19.00 | Sabtu: 18.00-19.00" },
    { id: 13, nama: "dr. KHUMAYROH RACHMAWATI BUANA, Sp.DVE", spesialis: "SPESIALIS KULIT, KELAMIN DAN KECANTIKAN", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "Senin-Kamis: 12.00-13.00 | Jumat: 14.00-15.00" },
    { id: 14, nama: "dr. NI MADE ATIKA NURINA YANTI SUTARTA, Sp.KJ", spesialis: "SPESIALIS KEDOKTERAN JIWA", hari: "Senin, Selasa, Rabu, Kamis, Jumat", jam: "Senin & Rabu: 09.00-11.00 | Selasa, Kamis, Jumat: 14.00-16.00" },
    { id: 15, nama: "dr. JOSE TYMOTHY MANUPUTTY, Sp.OG", spesialis: "SPESIALIS KANDUNGAN & KEBIDANAN", hari: "Senin, Selasa, Rabu, Kamis, Jumat, Sabtu", jam: "Senin & Kamis: 18.00-19.30 | Selasa: 15.00-17.00 | Rabu: 19.00-20.00 | Jumat: 09.00-11.00 | Sabtu: 15.30-17.30" }
];

// DATA STATE LOCALSTORAGE
let pendaftaranData = JSON.parse(localStorage.getItem('rs_pendaftaran')) || [];
let pengaduanData = JSON.parse(localStorage.getItem('rs_pengaduan')) || [];
let currentUser = JSON.parse(localStorage.getItem('rs_current_user')) || null;

// INIT PAGE
document.addEventListener("DOMContentLoaded", () => {
    renderDokter();
    populateSelectDokter();
    renderInternalTables();
    applyUserSession(currentUser);

    // Event filter jadwal dokter
    document.getElementById("search-dokter")?.addEventListener("input", filterDokter);
    document.getElementById("filter-hari")?.addEventListener("change", filterDokter);
});

// LOGIKA SWITCH TAB DI HALAMAN INFORMASI PASIEN
function switchInfoTab(tabName) {
    const tabBtnJadwal = document.getElementById('tab-btn-jadwal');
    const tabBtnPendaftaran = document.getElementById('tab-btn-pendaftaran');
    const tabContentJadwal = document.getElementById('tab-content-jadwal');
    const tabContentPendaftaran = document.getElementById('tab-content-pendaftaran');

    if (tabName === 'pendaftaran') {
        tabContentJadwal?.classList.add('hidden');
        tabContentPendaftaran?.classList.remove('hidden');

        tabBtnJadwal?.classList.remove('border-maroon', 'text-maroon');
        tabBtnJadwal?.classList.add('border-transparent', 'text-gray-500');

        tabBtnPendaftaran?.classList.remove('border-transparent', 'text-gray-500');
        tabBtnPendaftaran?.classList.add('border-maroon', 'text-maroon');
    } else {
        tabContentPendaftaran?.classList.add('hidden');
        tabContentJadwal?.classList.remove('hidden');

        tabBtnPendaftaran?.classList.remove('border-maroon', 'text-maroon');
        tabBtnPendaftaran?.classList.add('border-transparent', 'text-gray-500');

        tabBtnJadwal?.classList.remove('border-transparent', 'text-gray-500');
        tabBtnJadwal?.classList.add('border-maroon', 'text-maroon');
    }
}

// LOGIKA NAVIGASI / PINDAH HALAMAN
function showPage(page, subTabOrSection = null) {
    const viewHome = document.getElementById('view-home');
    const viewProfil = document.getElementById('view-profil');
    const viewInformasi = document.getElementById('view-informasi');
    const viewInternal = document.getElementById('view-internal');

    const navHome = document.getElementById('nav-home');
    const navProfil = document.getElementById('nav-profil');
    const navInformasi = document.getElementById('nav-informasi');

    // Jika admin login, arahkan ke dashboard admin saja
    if (currentUser && currentUser.role === 'Admin') {
        if (viewHome) viewHome.classList.add('hidden');
        if (viewProfil) viewProfil.classList.add('hidden');
        if (viewInformasi) viewInformasi.classList.add('hidden');
        if (viewInternal) viewInternal.classList.remove('hidden');
        return;
    }

    // Reset underline indikator menu navbar
    navHome?.classList.remove('text-maroon', 'border-b-2', 'border-maroon');
    navProfil?.classList.remove('text-maroon', 'border-b-2', 'border-maroon');
    navInformasi?.classList.remove('text-maroon', 'border-b-2', 'border-maroon');

    if (viewHome) viewHome.classList.add('hidden');
    if (viewProfil) viewProfil.classList.add('hidden');
    if (viewInformasi) viewInformasi.classList.add('hidden');
    if (viewInternal) viewInternal.classList.add('hidden');

    if (page === 'profil') {
        if (viewProfil) viewProfil.classList.remove('hidden');
        navProfil?.classList.add('text-maroon', 'border-b-2', 'border-maroon');

        if (subTabOrSection) {
            setTimeout(() => {
                const target = document.getElementById(subTabOrSection);
                if (target) target.scrollIntoView({ behavior: 'smooth' });
            }, 50);
        } else {
            window.scrollTo({ top: 0, behavior: 'smooth' });
        }
    } else if (page === 'informasi') {
        if (viewInformasi) viewInformasi.classList.remove('hidden');
        navInformasi?.classList.add('text-maroon', 'border-b-2', 'border-maroon');

        if (subTabOrSection === 'pendaftaran') {
            switchInfoTab('pendaftaran');
        } else {
            switchInfoTab('jadwal');
        }
        window.scrollTo({ top: 0, behavior: 'smooth' });
    } else {
        // Default: Halaman Home
        if (viewHome) viewHome.classList.remove('hidden');
        navHome?.classList.add('text-maroon', 'border-b-2', 'border-maroon');
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

// LOGIKA RENDER JADWAL DOKTER TERPISAH
function renderDokter(filtered = dokterList) {
    const grid = document.getElementById("grid-dokter");
    if (!grid) return;
    grid.innerHTML = "";

    if (filtered.length === 0) {
        grid.innerHTML = `<p class="col-span-2 text-xs text-gray-400 py-4 text-center">Jadwal dokter tidak ditemukan.</p>`;
        return;
    }

    filtered.forEach(doc => {
        grid.innerHTML += `
            <div class="p-4 border rounded-xl bg-gray-50 flex justify-between items-center hover:border-maroon transition shadow-sm">
                <div>
                    <h4 class="font-bold text-gray-900 text-xs sm:text-sm">${doc.nama}</h4>
                    <p class="text-[11px] text-maroon font-semibold mt-0.5">${doc.spesialis}</p>
                    <p class="text-[10px] sm:text-xs text-gray-500 mt-2">🗓 ${doc.hari}</p>
                    <p class="text-[10px] sm:text-xs text-gray-500">⏰ ${doc.jam}</p>
                </div>
                <button onclick="pilihDokterDanDaftar('${doc.nama}')" class="px-3.5 py-2 bg-maroon text-white text-xs font-bold rounded-lg hover:bg-maroon-hover transition shadow-sm flex-shrink-0">
                    Pilih
                </button>
            </div>
        `;
    });
}

function pilihDokterDanDaftar(namaDokter) {
    showPage('informasi', 'pendaftaran');
    const select = document.getElementById("reg-dokter");
    if (select) {
        select.value = namaDokter;
    }
}

function filterDokter() {
    const search = document.getElementById("search-dokter").value.toLowerCase();
    const hari = document.getElementById("filter-hari").value;

    const result = dokterList.filter(doc => {
        const matchSearch = doc.nama.toLowerCase().includes(search) || doc.spesialis.toLowerCase().includes(search);
        const matchHari = hari === "" || doc.hari.includes(hari);
        return matchSearch && matchHari;
    });

    renderDokter(result);
}

function populateSelectDokter() {
    const select = document.getElementById("reg-dokter");
    if (!select) return;
    select.innerHTML = '<option value="">-- Pilih Dokter --</option>';
    dokterList.forEach(doc => {
        select.innerHTML += `<option value="${doc.nama}">${doc.nama} (${doc.spesialis})</option>`;
    });
}

// HANDLER PENDAFTARAN ONLINE
function submitPendaftaran(e) {
    e.preventDefault();
    const nama = document.getElementById("reg-nama").value;
    const nik = document.getElementById("reg-nik").value;
    const kategori = document.getElementById("reg-kategori").value;
    const bayar = document.getElementById("reg-bayar").value;
    const dokter = document.getElementById("reg-dokter").value;
    const tanggal = document.getElementById("reg-tanggal").value;

    const noAntrean = "A-" + String(pendaftaranData.length + 1).padStart(3, '0');

    const barubergabung = { noAntrean, nama, nik, kategori, bayar, dokter, tanggal };
    pendaftaranData.push(barubergabung);
    localStorage.setItem('rs_pendaftaran', JSON.stringify(pendaftaranData));

    document.getElementById("tiket-no").innerText = noAntrean;
    document.getElementById("tiket-info").innerText = `${nama} | ${dokter} | ${tanggal}`;
    document.getElementById("tiket-pendaftaran").classList.remove("hidden");
    document.getElementById("form-pendaftaran").reset();

    renderInternalTables();
}

// HANDLER PENGADUAN
function submitPengaduan(e) {
    e.preventDefault();
    const nama = document.getElementById("aduan-nama").value || "Anonim";
    const kategori = document.getElementById("aduan-kategori").value;
    const isi = document.getElementById("aduan-isi").value;

    const idTiket = "ADU-" + Math.floor(1000 + Math.random() * 9000);

    pengaduanData.push({ idTiket, nama, kategori, isi });
    localStorage.setItem('rs_pengaduan', JSON.stringify(pengaduanData));

    document.getElementById("tiket-aduan-id").innerText = idTiket;
    document.getElementById("status-pengaduan").classList.remove("hidden");
    document.getElementById("form-pengaduan").reset();

    renderInternalTables();
}

// RENDER TABEL DASHBOARD INTERNAL (ADMIN)
function renderInternalTables() {
    const tbodyPendaftaran = document.getElementById("tabel-internal-pendaftaran");
    const tbodyPengaduan = document.getElementById("tabel-internal-pengaduan");

    if (tbodyPendaftaran) {
        tbodyPendaftaran.innerHTML = pendaftaranData.map(item => `
            <tr>
                <td class="p-3 font-bold text-maroon">${item.noAntrean}</td>
                <td class="p-3">${item.nama}</td>
                <td class="p-3">${item.kategori}</td>
                <td class="p-3">${item.dokter}</td>
                <td class="p-3">${item.tanggal}</td>
            </tr>
        `).join('') || `<tr><td colspan="5" class="p-3 text-center text-gray-400">Belum ada data pendaftaran</td></tr>`;
    }

    if (tbodyPengaduan) {
        tbodyPengaduan.innerHTML = pengaduanData.map((item, index) => `
            <tr>
                <td class="p-3 font-mono font-bold text-amber-600">${item.idTiket}</td>
                <td class="p-3">${item.nama}</td>
                <td class="p-3">${item.kategori}</td>
                <td class="p-3">${item.isi}</td>
                <td class="p-3"><button onclick="hapusPengaduan(${index})" class="text-red-600 font-bold hover:underline">Hapus</button></td>
            </tr>
        `).join('') || `<tr><td colspan="5" class="p-3 text-center text-gray-400">Belum ada data pengaduan</td></tr>`;
    }

    const statPendaftaran = document.getElementById("stat-total-pendaftaran");
    const statPengaduan = document.getElementById("stat-total-pengaduan");
    if (statPendaftaran) statPendaftaran.innerText = pendaftaranData.length;
    if (statPengaduan) statPengaduan.innerText = pengaduanData.length;
}

function hapusPengaduan(index) {
    pengaduanData.splice(index, 1);
    localStorage.setItem('rs_pengaduan', JSON.stringify(pengaduanData));
    renderInternalTables();
}

// LOGIKA AUTHENTICATION & POPUP MODAL

function openLoginModal() {
    const modal = document.getElementById('modal-login');
    if (modal) modal.classList.remove('hidden');
}

function closeLoginModal() {
    const modal = document.getElementById('modal-login');
    if (modal) modal.classList.add('hidden');
}

function handleAuthButtonClick() {
    if (currentUser) {
        currentUser = null;
        localStorage.removeItem('rs_current_user');
        applyUserSession(null);
        showPage('home');
    } else {
        openLoginModal();
    }
}

function toggleAuthForm(mode) {
    const boxLogin = document.getElementById('box-login');
    const boxRegister = document.getElementById('box-register');

    if (mode === 'register') {
        boxLogin.classList.add('hidden');
        boxRegister.classList.remove('hidden');
    } else {
        boxRegister.classList.add('hidden');
        boxLogin.classList.remove('hidden');
    }
}

function submitRegister(e) {
    e.preventDefault();
    const nama = document.getElementById('reg-nama-user').value.trim();
    const email = document.getElementById('reg-email-user').value.toLowerCase().trim();
    const pass = document.getElementById('reg-pass-user').value;

    let users = JSON.parse(localStorage.getItem('registered_users')) || [];

    if (users.some(u => u.email === email) || email === 'admin@gmail.com') {
        alert('Email sudah terdaftar. Silakan gunakan email lain atau langsung masuk.');
        return;
    }

    users.push({ nama, email, pass, role: 'Pasien' });
    localStorage.setItem('registered_users', JSON.stringify(users));

    alert('Pendaftaran akun berhasil! Silakan masuk.');
    toggleAuthForm('login');
    document.getElementById('login-email').value = email;
}

function submitLogin(e) {
    e.preventDefault();
    const email = document.getElementById('login-email').value.toLowerCase().trim();
    const pass = document.getElementById('login-password').value;

    let users = JSON.parse(localStorage.getItem('registered_users')) || [];
    const foundUser = users.find(u => u.email === email && u.pass === pass);

    if (email === "admin@gmail.com" && pass === "admin123") {
        currentUser = { email: email, role: "Admin" };
    } 
    else if (email === "pasien@gmail.com" && pass === "pasien123") {
        currentUser = { email: email, role: "Pasien" };
    } 
    else if (foundUser) {
        currentUser = { email: foundUser.email, role: foundUser.role };
    } 
    else {
        alert("Email atau password tidak ditemukan!");
        return;
    }

    localStorage.setItem('rs_current_user', JSON.stringify(currentUser));
    closeLoginModal();
    applyUserSession(currentUser);
}

function applyUserSession(user) {
    const btnText = document.getElementById('txt-portal-btn');

    if (user && user.role === 'Admin') {
        showPage('internal');
        if (btnText) btnText.innerText = "Keluar (Admin)";
    } else if (user && user.role === 'Pasien') {
        showPage('home');
        if (btnText) btnText.innerText = "Keluar (" + user.email.split('@')[0] + ")";
    } else {
        showPage('home');
        if (btnText) btnText.innerText = "Masuk / Login";
    }
}