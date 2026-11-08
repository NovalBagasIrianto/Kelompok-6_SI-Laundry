-- Data Awal (Seed) Sistem Informasi Laundry
-- Jalankan SETELAH schema.sql. Hanya mengisi tabel PETUGAS dan LAYANAN.
-- Kata sandi contoh (HANYA untuk pengujian, ganti sebelum dipakai sungguhan):
--   admin  -> admin123
--   kasir1 -> kasir123
-- Kolom password berisi hash bcrypt (hasil password_hash() PHP), bukan teks biasa.

USE db_si_laundry;

-- --------------------------------------------------------
-- PETUGAS: 1 Admin (Pemilik) dan 1 Kasir
-- --------------------------------------------------------
INSERT INTO PETUGAS (nama, username, password, peran, aktif) VALUES
('Pemilik Laundry', 'admin',  '$2y$10$QI.qQrygZGlbTITacphOCeiUZfRWd4UxJj9kS3pMALTKvmCsqn.Fm', 'Admin', TRUE),
('Kasir Satu',      'kasir1', '$2y$10$ItHyZyt913zi8LDyk0aJQOBlHSEWEd/NTPyqC5aGryXuxuQvEVi2W', 'Kasir', TRUE);

-- --------------------------------------------------------
-- LAYANAN: 4 contoh (2 kiloan, 2 satuan), termasuk 1 Express
-- Express = layanan tersendiri: harga lebih tinggi, estimasi lebih singkat
-- --------------------------------------------------------
INSERT INTO LAYANAN (nama_layanan, jenis_hitung, harga, satuan, estimasi_hari, aktif) VALUES
('Cuci Setrika Reguler', 'Kiloan',  7000.00, 'kg',  3, TRUE),
('Cuci Setrika Express', 'Kiloan', 12000.00, 'kg',  1, TRUE),
('Bed Cover',            'Satuan', 30000.00, 'pcs', 4, TRUE),
('Jaket',                'Satuan', 15000.00, 'pcs', 3, TRUE);
