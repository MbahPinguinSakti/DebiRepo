# Skrip Pengubah Repositori Debian

Skrip Bash ini membantu Anda mengganti repositori Debian pada sistem Anda dengan mudah. Skrip ini akan:

1. **Memeriksa Koneksi Internet:** Skrip akan melakukan ping ke `google.com` untuk memastikan Anda memiliki koneksi internet yang aktif sebelum melanjutkan.
2. **Meminta Pilihan Versi Debian:** Anda akan diminta untuk memilih versi Debian yang ingin Anda gunakan (Debian 10, 11, atau 12).
3. **Membuat Cadangan:** Skrip akan membuat cadangan file `/etc/apt/sources.list` sebelum melakukan perubahan.
4. **Mengganti Repositori:** Berdasarkan pilihan Anda, skrip akan mengganti isi file `/etc/apt/sources.list` dengan repositori yang sesuai.
5. **Memberikan Konfirmasi:** Skrip akan memberikan pesan konfirmasi jika penggantian repositori berhasil.

## Prasyarat

* **Akses Root:** Skrip ini harus dijalankan dengan hak akses root (menggunakan `sudo` atau login sebagai root).
* **Koneksi Internet:** Pastikan Anda memiliki koneksi internet yang aktif.

## Cara Menggunakan

1. Simpan kode ini dalam sebuah file (misalnya, `ganti_repo.sh`).
2. Berikan izin eksekusi pada file tersebut: `chmod +x ganti_repo.sh`.
3. Jalankan skrip dengan hak akses root: `sudo ./ganti_repo.sh`.
4. Ikuti petunjuk yang ditampilkan di layar.

## Penjelasan Kode

* **Pemeriksaan Akses Root:** Skrip akan memeriksa apakah sedang dijalankan dengan hak akses root. Jika tidak, skrip akan menampilkan pesan kesalahan dan berhenti.
* **Ping:** Skrip akan melakukan ping ke `google.com` untuk memastikan koneksi internet aktif. Sebuah animasi sederhana akan ditampilkan selama proses ping.
* **Pilihan Versi:** Skrip akan menampilkan daftar versi Debian yang tersedia dan meminta Anda untuk memilih salah satu.
* **Backup:** Skrip akan membuat salinan file `/etc/apt/sources.list` sebagai cadangan.
* **Penggantian Repositori:** 
    * Sebuah file sementara (`/etc/apt/sources.list_temp`) dibuat untuk menyimpan perubahan.
    * Baris yang mengandung "dvd" (mungkin repositori pihak ketiga) akan dihapus dari file sementara.
    * Repositori Debian yang sesuai dengan pilihan Anda akan ditambahkan ke file sementara.
    * Jika semua berhasil, file sementara akan menggantikan file `/etc/apt/sources.list` yang asli.

## Catatan

* Pastikan Anda memahami konsekuensi dari mengganti repositori Debian.
* Selalu buat cadangan sebelum melakukan perubahan pada file sistem penting.
* Skrip ini telah diuji pada Debian 10, 11, dan 12.