# SI Laundry

Sistem Informasi Laundry berbasis web (PHP dan MySQL) untuk mencatat pesanan, menghitung harga otomatis, melacak status cucian, mencatat pembayaran, dan membuat laporan transaksi. Proyek kuliah RPL, Kelompok 6.

## Anggota dan peran

| Nama   | Peran                                                                                                       |
| ------ | ----------------------------------------------------------------------------------------------------------- |
| Satria | Project Manager: Koordinasi tim, Jadwal, Pengesahan SRS                                                     |
| Rusdy  | System Analyst: DFD dan SRS                                                                                 |
| Noval  | SCM Administrator: Repository GitHub, Branch, Tag Versi, Data Access Layer (database)                       |
| Raihan | Backend Developer: Skema Database, Aturan Bisnis dan Dokumen Visual Backend, Business Logic Layer (backend) |
| Dwiky  | Frontend Developer: Wireframe dan Desain UI di Figma, Presentation Layer (frontend, prototipe Figma)        |
| Nabil  | Tester dan Dokumentasi: Test Case, Dokumentasi                                                              |

## Ruang lingkup MVP (versi 1.0)

Tujuh modul: login dan akun petugas, data pelanggan, layanan dan harga, pesanan dan nota, status cucian, pembayaran, laporan transaksi.

- Admin (Pemilik): dashboard, pelanggan, layanan dan harga (ubah), laporan per periode, kelola akun.
- Kasir: dashboard (ringkasan hari ini), pelanggan, pesanan baru, daftar pesanan dan status, pembayaran.

## Struktur folder

```
Kelompok-6_SI-Laundry/
├── README.md
├── database/          schema.sql dan seed.sql
├── src/               kode aplikasi (index.html)
└── docs/
    ├── srs/           dokumen SRS
    ├── rencana/       rencana proyek, SCM Plan, kamus bersama
    ├── desain/
    │   ├── dfd/       diagram DFD
    │   ├── erd/       ERD (erd.pdf, erd.png)
    │   ├── backend/   dokumen desain backend
    │   └── wireframe/ wireframe dan prototipe
    └── uji/           dokumen pengujian
```

## Cara menjalankan database

Prasyarat: XAMPP dengan Apache dan MySQL berjalan.

1. Buka http://localhost/phpmyadmin.
2. Tab SQL (tanpa memilih database): tempel isi `database/schema.sql`, lalu Go. Ini membuat database `db_si_laundry` beserta 7 tabel.
3. Pilih database `db_si_laundry`, buka tab SQL, tempel isi `database/seed.sql`, lalu Go. Ini mengisi 2 akun contoh (`admin` dan `kasir1`) dan 4 layanan contoh. Kata sandi contoh tertulis di komentar awal `seed.sql`, hanya untuk pengembangan.
4. Urutan wajib: `schema.sql` dulu, baru `seed.sql`. Untuk mengulang, hapus dulu database `db_si_laundry`, lalu ulangi dari langkah 2.

## Alur cabang dan versi

- `main`: versi stabil.
- `develop`: tempat pengerjaan bersama.
- Tag `v0.1`: repo siap dan SRS draft.
- Tag `v0.2`: desain dan prototipe.
- Perubahan setelah SRS disahkan dicatat lewat change control (PM, System Analyst, SCM Administrator).
