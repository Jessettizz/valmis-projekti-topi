-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 21, 2024 at 01:31 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `kurssienhallinta`
--

-- --------------------------------------------------------

--
-- Table structure for table `kurssikirjautumiset`
--

CREATE TABLE `kurssikirjautumiset` (
  `tunnus` int(11) NOT NULL,
  `opiskelija_id` int(11) NOT NULL,
  `kurssi_id` int(11) NOT NULL,
  `kirjautumisaika` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kurssikirjautumiset`
--

INSERT INTO `kurssikirjautumiset` (`tunnus`, `opiskelija_id`, `kurssi_id`, `kirjautumisaika`) VALUES
(2, 2, 2, '2024-11-21 09:57:16'),
(3, 3, 3, '2024-11-21 09:57:16'),
(6, 1, 2, '2024-11-21 12:59:13'),
(7, 1, 5, '2024-11-21 12:59:17'),
(8, 1, 1, '2024-11-21 13:07:41'),
(9, 1, 101, '2024-11-21 13:07:46'),
(10, 3, 102, '2024-11-21 13:08:02'),
(12, 3, 3, '2024-11-21 13:08:06');

-- --------------------------------------------------------

--
-- Table structure for table `kurssit`
--

CREATE TABLE `kurssit` (
  `tunnus` int(11) NOT NULL,
  `nimi` varchar(100) NOT NULL,
  `kuvaus` text DEFAULT NULL,
  `alkupaiva` date NOT NULL,
  `loppupaiva` date NOT NULL,
  `opettaja_id` int(11) NOT NULL,
  `tila_id` int(11) NOT NULL,
  `viikonpaiva` varchar(20) NOT NULL,
  `alkuaika` time NOT NULL,
  `loppuaika` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `kurssit`
--

INSERT INTO `kurssit` (`tunnus`, `nimi`, `kuvaus`, `alkupaiva`, `loppupaiva`, `opettaja_id`, `tila_id`, `viikonpaiva`, `alkuaika`, `loppuaika`) VALUES
(1, 'Laskenta I', 'Peruskurssi matematiikasta', '2024-01-10', '2024-05-15', 1, 1, 'Maanantai', '08:00:00', '10:00:00'),
(2, 'Fysiikan perusteet', 'Johdanto fysiikkaan', '2024-02-01', '2024-06-01', 2, 2, 'Tiistai', '10:00:00', '12:00:00'),
(3, 'Ekologia', 'Ekologian perusteet', '2024-03-01', '2024-07-01', 3, 3, 'Keskiviikko', '13:00:00', '15:00:00'),
(5, 'Biologia', 'Biologian koe ja uusintakoe', '2024-11-21', '2024-12-07', 3, 3, 'Torstai', '08:00:00', '10:00:00'),
(101, 'Matematiikka 1', 'Johdanto matematiikkaan', '2024-01-01', '2024-06-01', 1, 1, 'Perjantai', '15:00:00', '17:00:00'),
(102, 'Fysiikka 1', 'Johdanto fysiikkaan', '2024-02-01', '2024-06-30', 2, 2, 'Maanantai', '10:00:00', '12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `opettajat`
--

CREATE TABLE `opettajat` (
  `tunnusnumero` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `aine` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opettajat`
--

INSERT INTO `opettajat` (`tunnusnumero`, `etunimi`, `sukunimi`, `aine`) VALUES
(1, 'Liisa', 'Virtanen', 'Matematiikka'),
(2, 'Pekka', 'Salo', 'Fysiikka'),
(3, 'Sari', 'Niemi', 'Biologia');

-- --------------------------------------------------------

--
-- Table structure for table `opiskelijat`
--

CREATE TABLE `opiskelijat` (
  `opiskelijanumero` int(11) NOT NULL,
  `etunimi` varchar(50) NOT NULL,
  `sukunimi` varchar(50) NOT NULL,
  `syntymapaiva` date NOT NULL,
  `vuosikurssi` int(11) DEFAULT NULL CHECK (`vuosikurssi` between 1 and 3)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `opiskelijat`
--

INSERT INTO `opiskelijat` (`opiskelijanumero`, `etunimi`, `sukunimi`, `syntymapaiva`, `vuosikurssi`) VALUES
(1, 'Matti', 'Mehiläinen', '2000-05-15', 2),
(2, 'Anna', 'Korhonen', '2002-08-15', 2),
(3, 'Teemu', 'Laakso', '2001-12-20', 3),
(7, 'Zhenjie', 'Cao', '0000-00-00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `tilat`
--

CREATE TABLE `tilat` (
  `tunnus` int(11) NOT NULL,
  `nimi` varchar(50) NOT NULL,
  `kapasiteetti` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tilat`
--

INSERT INTO `tilat` (`tunnus`, `nimi`, `kapasiteetti`) VALUES
(1, 'Luokka A', 30),
(2, 'Luokka B', 25),
(3, 'Auditorio', 100);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `kurssikirjautumiset`
--
ALTER TABLE `kurssikirjautumiset`
  ADD PRIMARY KEY (`tunnus`),
  ADD KEY `opiskelija_id` (`opiskelija_id`),
  ADD KEY `kurssi_id` (`kurssi_id`);

--
-- Indexes for table `kurssit`
--
ALTER TABLE `kurssit`
  ADD PRIMARY KEY (`tunnus`),
  ADD KEY `opettaja_id` (`opettaja_id`),
  ADD KEY `tila_id` (`tila_id`);

--
-- Indexes for table `opettajat`
--
ALTER TABLE `opettajat`
  ADD PRIMARY KEY (`tunnusnumero`);

--
-- Indexes for table `opiskelijat`
--
ALTER TABLE `opiskelijat`
  ADD PRIMARY KEY (`opiskelijanumero`);

--
-- Indexes for table `tilat`
--
ALTER TABLE `tilat`
  ADD PRIMARY KEY (`tunnus`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `kurssikirjautumiset`
--
ALTER TABLE `kurssikirjautumiset`
  MODIFY `tunnus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `kurssit`
--
ALTER TABLE `kurssit`
  MODIFY `tunnus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `opettajat`
--
ALTER TABLE `opettajat`
  MODIFY `tunnusnumero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `opiskelijat`
--
ALTER TABLE `opiskelijat`
  MODIFY `opiskelijanumero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tilat`
--
ALTER TABLE `tilat`
  MODIFY `tunnus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `kurssikirjautumiset`
--
ALTER TABLE `kurssikirjautumiset`
  ADD CONSTRAINT `kurssikirjautumiset_ibfk_1` FOREIGN KEY (`opiskelija_id`) REFERENCES `opiskelijat` (`opiskelijanumero`) ON DELETE CASCADE,
  ADD CONSTRAINT `kurssikirjautumiset_ibfk_2` FOREIGN KEY (`kurssi_id`) REFERENCES `kurssit` (`tunnus`) ON DELETE CASCADE;

--
-- Constraints for table `kurssit`
--
ALTER TABLE `kurssit`
  ADD CONSTRAINT `kurssit_ibfk_1` FOREIGN KEY (`opettaja_id`) REFERENCES `opettajat` (`tunnusnumero`) ON DELETE CASCADE,
  ADD CONSTRAINT `kurssit_ibfk_2` FOREIGN KEY (`tila_id`) REFERENCES `tilat` (`tunnus`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
