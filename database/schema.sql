-- Skema Database Sistem Informasi Laundry v0.2
-- Pengelola: Noval (SCM Administrator)

CREATE DATABASE IF NOT EXISTS db_si_laundry;
USE db_si_laundry;

-- --------------------------------------------------------
-- 1. Tabel PETUGAS
-- --------------------------------------------------------
CREATE TABLE PETUGAS (
    id_petugas INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    peran ENUM('Admin', 'Kasir') NOT NULL DEFAULT 'Kasir',
    aktif BOOLEAN NOT NULL DEFAULT TRUE
);

-- --------------------------------------------------------
-- 2. Tabel PELANGGAN
-- --------------------------------------------------------
CREATE TABLE PELANGGAN (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15) NULL,
    alamat TEXT NULL
);

-- --------------------------------------------------------
-- 3. Tabel LAYANAN
-- --------------------------------------------------------
CREATE TABLE LAYANAN (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(100) NOT NULL,
    jenis_hitung ENUM('Kiloan', 'Satuan') NOT NULL DEFAULT 'Kiloan',
    harga DECIMAL(10,2) NOT NULL,
    satuan VARCHAR(20) NOT NULL,
    estimasi_hari INT NOT NULL DEFAULT 1,
    aktif BOOLEAN NOT NULL DEFAULT TRUE
);

-- --------------------------------------------------------
-- 4. Tabel PESANAN
-- --------------------------------------------------------
CREATE TABLE PESANAN (
    id_pesanan INT AUTO_INCREMENT PRIMARY KEY,
    no_nota VARCHAR(20) NOT NULL UNIQUE,
    id_pelanggan INT NOT NULL,
    id_petugas INT NOT NULL,
    tgl_masuk DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    tgl_estimasi_selesai DATETIME NULL,
    tgl_diambil DATETIME NULL,
    status ENUM('Diterima', 'Dicuci', 'Disetrika', 'Selesai', 'Diambil') NOT NULL DEFAULT 'Diterima',
    catatan TEXT NULL,
    diskon DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    FOREIGN KEY (id_pelanggan) REFERENCES PELANGGAN(id_pelanggan) ON DELETE CASCADE,
    FOREIGN KEY (id_petugas) REFERENCES PETUGAS(id_petugas) ON DELETE CASCADE
);

-- --------------------------------------------------------
-- 5. Tabel DETAIL_PESANAN
-- --------------------------------------------------------
CREATE TABLE DETAIL_PESANAN (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT NOT NULL,
    id_layanan INT NOT NULL,
    jumlah DECIMAL(8,2) NOT NULL,
    harga_saat_pesan DECIMAL(10,2) NOT NULL,
    keterangan VARCHAR(255) NULL,
    FOREIGN KEY (id_pesanan) REFERENCES PESANAN(id_pesanan) ON DELETE CASCADE,
    FOREIGN KEY (id_layanan) REFERENCES LAYANAN(id_layanan) ON DELETE CASCADE
);

-- --------------------------------------------------------
-- 6. Tabel RIWAYAT_STATUS
-- --------------------------------------------------------
CREATE TABLE RIWAYAT_STATUS (
    id_riwayat INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT NOT NULL,
    id_petugas INT NOT NULL,
    status ENUM('Diterima', 'Dicuci', 'Disetrika', 'Selesai', 'Diambil') NOT NULL,
    waktu DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_pesanan) REFERENCES PESANAN(id_pesanan) ON DELETE CASCADE,
    FOREIGN KEY (id_petugas) REFERENCES PETUGAS(id_petugas) ON DELETE CASCADE
);

-- --------------------------------------------------------
-- 7. Tabel PEMBAYARAN
-- --------------------------------------------------------
CREATE TABLE PEMBAYARAN (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_pesanan INT NOT NULL,
    id_petugas INT NOT NULL,
    tgl_bayar DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    jumlah DECIMAL(10,2) NOT NULL,
    metode ENUM('Tunai', 'Transfer') NOT NULL DEFAULT 'Tunai',
    FOREIGN KEY (id_pesanan) REFERENCES PESANAN(id_pesanan) ON DELETE CASCADE,
    FOREIGN KEY (id_petugas) REFERENCES PETUGAS(id_petugas) ON DELETE CASCADE
);