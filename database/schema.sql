-- Skema Database Sistem Informasi Laundry v0.2
-- Pengelola: Noval (SCM Administrator)

CREATE DATABASE IF NOT EXISTS db_si_laundry;
USE db_si_laundry;

-- 1. Tabel User / Petugas
CREATE TABLE User (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    nama_user VARCHAR(100) NOT NULL,
    peran ENUM('Admin', 'Kasir') NOT NULL DEFAULT 'Kasir'
);

-- 2. Tabel Pelanggan
CREATE TABLE Pelanggan (
    id_pelanggan INT AUTO_INCREMENT PRIMARY KEY,
    nama_pelanggan VARCHAR(100) NOT NULL,
    no_hp VARCHAR(15) NOT NULL,
    alamat TEXT
);

-- 3. Tabel Layanan
CREATE TABLE Layanan (
    id_layanan INT AUTO_INCREMENT PRIMARY KEY,
    nama_layanan VARCHAR(100) NOT NULL,
    harga_per_satuan DECIMAL(10,2) NOT NULL,
    satuan VARCHAR(20) NOT NULL -- Contoh: Kg, Pcs, Pasang
);

-- 4. Tabel Transaksi
CREATE TABLE Transaksi (
    id_transaksi INT AUTO_INCREMENT PRIMARY KEY,
    kode_transaksi VARCHAR(20) NOT NULL UNIQUE,
    id_pelanggan INT NOT NULL,
    id_user INT NOT NULL,
    tgl_transaksi DATETIME DEFAULT CURRENT_TIMESTAMP,
    tgl_tenggat DATETIME NULL,
    total_bayar DECIMAL(10,2) DEFAULT 0.00,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan) ON DELETE CASCADE,
    FOREIGN KEY (id_user) REFERENCES User(id_user) ON DELETE CASCADE
);

-- 5. Tabel Detail Transaksi
CREATE TABLE Detail_Transaksi (
    id_detail INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL,
    id_layanan INT NOT NULL,
    jumlah DECIMAL(8,2) NOT NULL,
    subtotal DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi) ON DELETE CASCADE,
    FOREIGN KEY (id_layanan) REFERENCES Layanan(id_layanan) ON DELETE CASCADE
);

-- 6. Tabel Status Cucian
CREATE TABLE Status_Cucian (
    id_status INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL UNIQUE,
    status_proses ENUM('Diterima', 'Dicuci', 'Disetrika', 'Selesai', 'Diambil') DEFAULT 'Diterima',
    tgl_pembaruan DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    keterangan VARCHAR(255) NULL,
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi) ON DELETE CASCADE
);

-- 7. Tabel Pembayaran
CREATE TABLE Pembayaran (
    id_pembayaran INT AUTO_INCREMENT PRIMARY KEY,
    id_transaksi INT NOT NULL UNIQUE,
    tgl_bayar DATETIME NULL,
    jumlah_bayar DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    metode_bayar ENUM('Tunai', 'Transfer') DEFAULT 'Tunai',
    status_lunas ENUM('Lunas', 'Belum Lunas') DEFAULT 'Belum Lunas',
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi) ON DELETE CASCADE
);