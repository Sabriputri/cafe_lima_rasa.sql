-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 05, 2026 at 12:47 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cafe_lima_rasa`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahan_baku`
--

CREATE TABLE `bahan_baku` (
  `Id_Bahan` int(11) NOT NULL,
  `Nama_Bahan` varchar(100) NOT NULL,
  `Stok` decimal(10,2) DEFAULT 0.00,
  `Satuan` varchar(50) NOT NULL,
  `Minimal_Stok` decimal(10,2) NOT NULL
) ;

--
-- Dumping data for table `bahan_baku`
--

INSERT INTO `bahan_baku` (`Id_Bahan`, `Nama_Bahan`, `Stok`, `Satuan`, `Minimal_Stok`) VALUES
(1, 'Kopi Bubuk', 5000.00, 'gram', 1000.00),
(2, 'Gula', 3000.00, 'gram', 500.00),
(3, 'Beras', 10000.00, 'gram', 2000.00);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pembelian`
--

CREATE TABLE `detail_pembelian` (
  `Id_Detail_Pembelian` int(11) NOT NULL,
  `Id_Pembelian` int(11) NOT NULL,
  `Id_Bahan` int(11) NOT NULL,
  `Jumlah` decimal(10,2) NOT NULL,
  `Harga_Satuan` decimal(12,2) NOT NULL,
  `Subtotal` decimal(12,2) NOT NULL
) ;

--
-- Dumping data for table `detail_pembelian`
--

INSERT INTO `detail_pembelian` (`Id_Detail_Pembelian`, `Id_Pembelian`, `Id_Bahan`, `Jumlah`, `Harga_Satuan`, `Subtotal`) VALUES
(1, 1, 1, 2000.00, 50000.00, 100000.00),
(2, 1, 2, 1000.00, 20000.00, 20000.00),
(3, 2, 3, 5000.00, 40000.00, 200000.00);

-- --------------------------------------------------------

--
-- Table structure for table `detail_pesanan`
--

CREATE TABLE `detail_pesanan` (
  `Id_Detail` int(11) NOT NULL,
  `Id_Pesanan` int(11) NOT NULL,
  `Id_Menu` int(11) NOT NULL,
  `Jumlah` int(11) NOT NULL,
  `Subtotal` decimal(12,2) NOT NULL
) ;

--
-- Dumping data for table `detail_pesanan`
--

INSERT INTO `detail_pesanan` (`Id_Detail`, `Id_Pesanan`, `Id_Menu`, `Jumlah`, `Subtotal`) VALUES
(1, 1, 1, 2, 30000.00),
(2, 1, 2, 1, 8000.00),
(3, 2, 3, 1, 25000.00);

-- --------------------------------------------------------

--
-- Table structure for table `jabatan`
--

CREATE TABLE `jabatan` (
  `Id_Jabatan` int(11) NOT NULL,
  `Nama_Jabatan` varchar(100) NOT NULL,
  `Gaji_Pokok` decimal(12,2) NOT NULL,
  `Tunjangan` decimal(12,2) DEFAULT 0.00,
  `Keterangan` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `jabatan`
--

INSERT INTO `jabatan` (`Id_Jabatan`, `Nama_Jabatan`, `Gaji_Pokok`, `Tunjangan`, `Keterangan`) VALUES
(1, 'Kasir', 3000000.00, 500000.00, 'Melayani transaksi'),
(2, 'Barista', 3200000.00, 600000.00, 'Membuat minuman'),
(3, 'Manager', 5000000.00, 1000000.00, 'Mengelola operasional');

-- --------------------------------------------------------

--
-- Table structure for table `karyawan`
--

CREATE TABLE `karyawan` (
  `Id_Karyawan` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `Id_Jabatan` int(11) NOT NULL,
  `Alamat` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `karyawan`
--

INSERT INTO `karyawan` (`Id_Karyawan`, `Nama`, `Id_Jabatan`, `Alamat`) VALUES
(1, 'Sari', 1, 'Jl. Melati No.1'),
(2, 'Doni', 2, 'Jl. Kenanga No.2'),
(3, 'Rina', 3, 'Jl. Mawar No.3');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `Id_Kategori` int(11) NOT NULL,
  `Nama_Kategori` varchar(100) NOT NULL,
  `Keterangan` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`Id_Kategori`, `Nama_Kategori`, `Keterangan`) VALUES
(1, 'Minuman', 'Aneka minuman'),
(2, 'Makanan', 'Menu makanan'),
(3, 'Snack', 'Camilan');

-- --------------------------------------------------------

--
-- Table structure for table `meja`
--

CREATE TABLE `meja` (
  `No_Meja` int(11) NOT NULL,
  `Status` enum('Kosong','Terisi') NOT NULL
) ;

--
-- Dumping data for table `meja`
--

INSERT INTO `meja` (`No_Meja`, `Status`) VALUES
(1, 'Kosong'),
(2, 'Terisi'),
(3, 'Kosong');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `Jenis_Member` enum('Reguler','Gold','Platinum') NOT NULL,
  `Diskon` decimal(5,2) NOT NULL DEFAULT 0.00,
  `Minimal_Transaksi` decimal(12,2) NOT NULL DEFAULT 0.00,
  `Benefit` text DEFAULT NULL,
  `Masa_Berlaku` int(11) DEFAULT NULL,
  `Keterangan` varchar(255) DEFAULT NULL
) ;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`Jenis_Member`, `Diskon`, `Minimal_Transaksi`, `Benefit`, `Masa_Berlaku`, `Keterangan`) VALUES
('Reguler', 0.00, 0.00, 'Tanpa diskon', NULL, 'Member biasa'),
('Gold', 5.00, 100000.00, 'Diskon 5%', 365, 'Member menengah'),
('Platinum', 10.00, 200000.00, 'Diskon 10% + bonus', 365, 'Member premium');

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `Id_Menu` int(11) NOT NULL,
  `Nama_Menu` varchar(100) NOT NULL,
  `Id_Kategori` int(11) NOT NULL,
  `Harga` decimal(12,2) NOT NULL,
  `Deskripsi` text DEFAULT NULL,
  `Status` enum('Tersedia','Kosong') NOT NULL DEFAULT 'Tersedia'
) ;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`Id_Menu`, `Nama_Menu`, `Id_Kategori`, `Harga`, `Deskripsi`, `Status`) VALUES
(1, 'Kopi Hitam', 1, 15000.00, 'Kopi hitam panas', 'Tersedia'),
(2, 'Es Teh', 1, 8000.00, 'Teh dingin segar', 'Tersedia'),
(3, 'Nasi Goreng', 2, 25000.00, 'Nasi goreng spesial', 'Tersedia');

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `Id_Pelanggan` int(11) NOT NULL,
  `Nama` varchar(100) NOT NULL,
  `No_Hp` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Jenis_Member` enum('Reguler','Gold','Platinum') DEFAULT NULL,
  `Point` int(11) DEFAULT 0
) ;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`Id_Pelanggan`, `Nama`, `No_Hp`, `Email`, `Jenis_Member`, `Point`) VALUES
(1, 'Andi', '081234567890', 'andi@email.com', 'Reguler', 50),
(2, 'Budi', '081298765432', 'budi@email.com', 'Gold', 120),
(3, 'Citra', '081355566677', 'citra@email.com', 'Platinum', 300);

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_bahan`
--

CREATE TABLE `pembelian_bahan` (
  `Id_Pembelian` int(11) NOT NULL,
  `Id_Supplier` int(11) DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Total` decimal(12,2) DEFAULT 0.00
) ;

--
-- Dumping data for table `pembelian_bahan`
--

INSERT INTO `pembelian_bahan` (`Id_Pembelian`, `Id_Supplier`, `Tanggal`, `Total`) VALUES
(1, 1, '2025-01-05', 500000.00),
(2, 2, '2025-01-06', 300000.00);

-- --------------------------------------------------------

--
-- Table structure for table `penggunaan_bahan`
--

CREATE TABLE `penggunaan_bahan` (
  `Id_Penggunaan` int(11) NOT NULL,
  `Id_Menu` int(11) NOT NULL,
  `Id_Bahan` int(11) NOT NULL,
  `Quantity_Digunakan` decimal(10,2) NOT NULL
) ;

--
-- Dumping data for table `penggunaan_bahan`
--

INSERT INTO `penggunaan_bahan` (`Id_Penggunaan`, `Id_Menu`, `Id_Bahan`, `Quantity_Digunakan`) VALUES
(1, 1, 1, 18.00),
(2, 1, 2, 5.00),
(3, 3, 3, 100.00);

-- --------------------------------------------------------

--
-- Table structure for table `pesanan`
--

CREATE TABLE `pesanan` (
  `Id_Pesanan` int(11) NOT NULL,
  `Id_Pelanggan` int(11) DEFAULT NULL,
  `Metode_Pesanan` enum('dine in','take away') NOT NULL,
  `No_Meja` int(11) DEFAULT NULL,
  `Tanggal` date NOT NULL,
  `Total_Pesanan` decimal(12,2) DEFAULT 0.00,
  `Status_Pesanan` enum('pending','diproses','selesai','dibatalkan') DEFAULT 'pending'
) ;

--
-- Dumping data for table `pesanan`
--

INSERT INTO `pesanan` (`Id_Pesanan`, `Id_Pelanggan`, `Metode_Pesanan`, `No_Meja`, `Tanggal`, `Total_Pesanan`, `Status_Pesanan`) VALUES
(1, 1, 'dine in', 1, '2025-01-18', 40000.00, 'diproses'),
(2, 2, 'take away', NULL, '2025-01-10', 25000.00, 'selesai');

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Id_Supplier` int(11) NOT NULL,
  `Nama_Supplier` varchar(100) DEFAULT NULL,
  `Kontak` varchar(50) DEFAULT NULL,
  `Alamat` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Id_Supplier`, `Nama_Supplier`, `Kontak`, `Alamat`) VALUES
(1, 'PT Sumber Makmur', '081299998888', 'Jakarta'),
(2, 'CV Pangan Jaya', '081277776666', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `Id_Transaksi` int(11) NOT NULL,
  `Id_Pesanan` int(11) NOT NULL,
  `Metode_Bayar` enum('Cash','QRIS','E-Wallet') NOT NULL,
  `Total_Bayar` decimal(12,2) NOT NULL,
  `Waktu_Bayar` datetime NOT NULL,
  `Status` enum('Lunas','Belum bayar') DEFAULT 'Belum bayar'
) ;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`Id_Transaksi`, `Id_Pesanan`, `Metode_Bayar`, `Total_Bayar`, `Waktu_Bayar`, `Status`) VALUES
(1, 1, 'Cash', 40000.00, '2025-01-10 10:30:00', 'Lunas'),
(2, 2, 'QRIS', 25000.00, '2025-01-10 11:00:00', 'Lunas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahan_baku`
--
ALTER TABLE `bahan_baku`
  ADD PRIMARY KEY (`Id_Bahan`);

--
-- Indexes for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD PRIMARY KEY (`Id_Detail_Pembelian`),
  ADD KEY `fk_detailpembelian_pembelian` (`Id_Pembelian`),
  ADD KEY `fk_detailpembelian_bahan` (`Id_Bahan`);

--
-- Indexes for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD PRIMARY KEY (`Id_Detail`),
  ADD KEY `fk_detailpesanan_pesanan` (`Id_Pesanan`),
  ADD KEY `fk_detailpesanan_menu` (`Id_Menu`);

--
-- Indexes for table `jabatan`
--
ALTER TABLE `jabatan`
  ADD PRIMARY KEY (`Id_Jabatan`);

--
-- Indexes for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD PRIMARY KEY (`Id_Karyawan`),
  ADD KEY `fk_karyawan_jabatan` (`Id_Jabatan`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`Id_Kategori`);

--
-- Indexes for table `meja`
--
ALTER TABLE `meja`
  ADD PRIMARY KEY (`No_Meja`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`Jenis_Member`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`Id_Menu`),
  ADD KEY `fk_menu_kategori` (`Id_Kategori`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`Id_Pelanggan`),
  ADD UNIQUE KEY `No_Hp` (`No_Hp`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `fk_pelanggan_member` (`Jenis_Member`);

--
-- Indexes for table `pembelian_bahan`
--
ALTER TABLE `pembelian_bahan`
  ADD PRIMARY KEY (`Id_Pembelian`),
  ADD KEY `fk_pembelian_supplier` (`Id_Supplier`);

--
-- Indexes for table `penggunaan_bahan`
--
ALTER TABLE `penggunaan_bahan`
  ADD PRIMARY KEY (`Id_Penggunaan`),
  ADD KEY `fk_penggunaan_menu` (`Id_Menu`),
  ADD KEY `fk_penggunaan_bahan` (`Id_Bahan`);

--
-- Indexes for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`Id_Pesanan`),
  ADD KEY `fk_pesanan_pelanggan` (`Id_Pelanggan`),
  ADD KEY `fk_pesanan_meja` (`No_Meja`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Id_Supplier`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`Id_Transaksi`),
  ADD KEY `fk_transaksi_pesanan` (`Id_Pesanan`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  MODIFY `Id_Detail_Pembelian` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jabatan`
--
ALTER TABLE `jabatan`
  MODIFY `Id_Jabatan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `Id_Pelanggan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `Id_Pesanan` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `Id_Transaksi` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detail_pembelian`
--
ALTER TABLE `detail_pembelian`
  ADD CONSTRAINT `fk_detailpembelian_bahan` FOREIGN KEY (`Id_Bahan`) REFERENCES `bahan_baku` (`Id_Bahan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detailpembelian_pembelian` FOREIGN KEY (`Id_Pembelian`) REFERENCES `pembelian_bahan` (`Id_Pembelian`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detail_pesanan`
--
ALTER TABLE `detail_pesanan`
  ADD CONSTRAINT `fk_detailpesanan_menu` FOREIGN KEY (`Id_Menu`) REFERENCES `menu` (`Id_Menu`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detailpesanan_pesanan` FOREIGN KEY (`Id_Pesanan`) REFERENCES `pesanan` (`Id_Pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `karyawan`
--
ALTER TABLE `karyawan`
  ADD CONSTRAINT `fk_karyawan_jabatan` FOREIGN KEY (`Id_Jabatan`) REFERENCES `jabatan` (`Id_Jabatan`) ON UPDATE CASCADE;

--
-- Constraints for table `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_menu_kategori` FOREIGN KEY (`Id_Kategori`) REFERENCES `kategori` (`Id_Kategori`) ON UPDATE CASCADE;

--
-- Constraints for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD CONSTRAINT `fk_pelanggan_member` FOREIGN KEY (`Jenis_Member`) REFERENCES `member` (`Jenis_Member`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pembelian_bahan`
--
ALTER TABLE `pembelian_bahan`
  ADD CONSTRAINT `fk_pembelian_supplier` FOREIGN KEY (`Id_Supplier`) REFERENCES `supplier` (`Id_Supplier`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `penggunaan_bahan`
--
ALTER TABLE `penggunaan_bahan`
  ADD CONSTRAINT `fk_penggunaan_bahan` FOREIGN KEY (`Id_Bahan`) REFERENCES `bahan_baku` (`Id_Bahan`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_penggunaan_menu` FOREIGN KEY (`Id_Menu`) REFERENCES `menu` (`Id_Menu`) ON UPDATE CASCADE;

--
-- Constraints for table `pesanan`
--
ALTER TABLE `pesanan`
  ADD CONSTRAINT `fk_pesanan_meja` FOREIGN KEY (`No_Meja`) REFERENCES `meja` (`No_Meja`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pesanan_pelanggan` FOREIGN KEY (`Id_Pelanggan`) REFERENCES `pelanggan` (`Id_Pelanggan`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD CONSTRAINT `fk_transaksi_pesanan` FOREIGN KEY (`Id_Pesanan`) REFERENCES `pesanan` (`Id_Pesanan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
