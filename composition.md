
---

### 1. `VaultHeaderCard`

* **Pemicu Ekstraksi (Trigger):** *Readability* — Memisahkan tampilan kartu ringkasan di bagian atas agar struktur kode pada halaman utama tidak terlalu kompleks dan mudah dibaca.
* **Tanggung Jawab Widget (What it owns):** Mengelola elemen visual komponen ringkasan, seperti tata letak *container*, teks label, serta pemformatan nilai mata uang (`$`).
* **Pelaporan ke Atas (What it reports upward):** Tidak ada (*Pure UI/Stateless*). Widget ini bersifat pasif dan hanya menerima data yang dikirimkan oleh *parent* (`totalValue` dan `totalCards`) untuk ditampilkan ke layar.

---

### 2. `VaultSearchBar`

* **Pemicu Ekstraksi (Trigger):** *Readability & Reuse* — Memisahkan komponen bidang pencarian agar logika antarmuka terisolasi dan dapat digunakan kembali secara konsisten di modul lain jika diperlukan.
* **Tanggung Jawab Widget (What it owns):** Mengelola elemen antarmuka bidang teks (`TextField`), ikon pencarian, dekorasi garis tepi (*border*), serta warna latar belakang.
* **Pelaporan ke Atas (What it reports upward):** `onSearchChanged` — Mengirimkan pemberitahuan ke *parent screen* setiap kali terjadi perubahan teks pada bidang input untuk memperbarui status (*state*) pencarian.

---

### 3. `CategoryFilterChips`

* **Pemicu Ekstraksi (Trigger):** *Readability* — Memisahkan logika iterasi daftar tombol filter dari struktur hierarki widget utama (*main render tree*).
* **Tanggung Jawab Widget (What it owns):** Mengelola daftar pilihan kategori horizontal yang dapat digeser (`ChoiceChip`), gaya visual tombol, serta perubahan status warna saat komponen dalam kondisi aktif atau tidak aktif.
* **Pelaporan ke Atas (What it reports upward):** `onCategorySelected` — Melaporkan objek kategori (`TcgCategory`) yang dipilih oleh pengguna agar *parent screen* dapat memperbarui status penyaringan data.

---

### 4. `CardGridTile`

* **Pemicu Ekstraksi (Trigger):** *Reuse* — Diekstraksi karena widget ini dipanggil secara berulang oleh `SliverGrid` untuk memetakan setiap item kartu TCG ke dalam bentuk kisi (*grid*).
* **Tanggung Jawab Widget (What it owns):** Mengelola tata letak internal satu unit kartu (memuat gambar dari jaringan, menampilkan indikator kondisi *loading* atau *error*, teks informasi kartu, serta posisi tombol penanda favorit).
* **Pelaporan ke Atas (What it reports upward):** `onFavoriteToggle` — Mengirimkan sinyal ke *parent screen* saat tombol favorit diklik, sehingga *parent* dapat memperbarui nilai properti `isFavorite` pada ID kartu yang sesuai.