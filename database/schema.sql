poekii
CREATE DATABASE IF NOT EXISTS `si_laundry`;
USE `si_laundry`;

-- 1. Tabel Akun/Petugas (Login)
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama` VARCHAR(100) NOT NULL,
  `username` VARCHAR(50) UNIQUE NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `role` ENUM('admin', 'petugas') DEFAULT 'petugas',
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Tabel Pelanggan
CREATE TABLE IF NOT EXISTS `pelanggan` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama` VARCHAR(100) NOT NULL,
  `telepon` VARCHAR(20),
  `alamat` TEXT,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 3. Tabel Jenis Layanan & Harga
CREATE TABLE IF NOT EXISTS `layanan` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `nama_layanan` VARCHAR(100) NOT NULL,
  `harga_per_kg` DECIMAL(10,2) NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 4. Tabel Transaksi / Pesanan
CREATE TABLE IF NOT EXISTS `transaksi` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `kode_transaksi` VARCHAR(50) UNIQUE NOT NULL,
  `pelanggan_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `tgl_transaksi` DATETIME DEFAULT CURRENT_TIMESTAMP,
  `tgl_selesai` DATETIME NULL,
  `total_harga` DECIMAL(10,2) DEFAULT 0.00,
  `status_cucian` ENUM('disetujui', 'dicuci', 'disetrika', 'selesai', 'diambil') DEFAULT 'disetujui',
  `status_bayar` ENUM('belum_lunas', 'lunas') DEFAULT 'belum_lunas',
  FOREIGN KEY (`pelanggan_id`) REFERENCES `pelanggan`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

-- 5. Tabel Detail Transaksi (Rincian Cucian)
CREATE TABLE IF NOT EXISTS `detail_transaksi` (
  `id` INT AUTO_INCREMENT PRIMARY KEY,
  `transaksi_id` INT NOT NULL,
  `layanan_id` INT NOT NULL,
  `berat_kg` DECIMAL(5,2) NOT NULL,
  `subtotal` DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (`transaksi_id`) REFERENCES `transaksi`(`id`) ON DELETE CASCADE,
  FOREIGN KEY (`layanan_id`) REFERENCES `layanan`(`id`) ON DELETE CASCADE
);