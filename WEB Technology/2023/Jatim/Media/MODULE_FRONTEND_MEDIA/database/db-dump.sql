-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 06, 2022 at 04:56 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db-dump`
--

-- --------------------------------------------------------

--
-- Table structure for table `available_positions`
--

CREATE TABLE `available_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_vacancy_id` bigint(20) UNSIGNED NOT NULL,
  `position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `capacity` bigint(20) DEFAULT 1,
  `apply_capacity` bigint(20) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_apply_positions`
--

CREATE TABLE `job_apply_positions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `date` date NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `job_vacancy_id` bigint(20) UNSIGNED DEFAULT NULL,
  `position_id` bigint(20) UNSIGNED DEFAULT NULL,
  `job_apply_societies_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','accepted','rejected') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_apply_societies`
--

CREATE TABLE `job_apply_societies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date` date NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `job_vacancy_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `job_category`) VALUES
(1, 'Computing and ICT'),
(2, 'Construction and building'),
(3, 'Animals, land and environment'),
(4, 'Design, arts and crafts'),
(5, 'Design, arts and crafts');

-- --------------------------------------------------------

--
-- Table structure for table `job_vacancies`
--

CREATE TABLE `job_vacancies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category_id` bigint(20) UNSIGNED NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `regionals`
--

CREATE TABLE `regionals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `district` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `regionals`
--

INSERT INTO `regionals` (`id`, `province`, `district`) VALUES
(1, 'DKI Jakarta', 'Central Jakarta'),
(2, 'DKI Jakarta', 'South Jakarta'),
(3, 'West Java', 'Bandung');

-- --------------------------------------------------------

--
-- Table structure for table `societies`
--

CREATE TABLE `societies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_card_number` char(8) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `born_date` date NOT NULL,
  `gender` enum('male','female') COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `regional_id` bigint(20) UNSIGNED NOT NULL,
  `login_tokens` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `societies`
--

INSERT INTO `societies` (`id`, `id_card_number`, `password`, `name`, `born_date`, `gender`, `address`, `regional_id`, `login_tokens`) VALUES
(1, '20210001', '121212', 'Omar Gunawan', '1990-04-18', 'male', 'Jln. Baranang Siang No. 479, DKI Jakarta', 1, NULL),
(2, '20210002', '121212', 'Nilam Sinaga', '1998-09-11', 'female', 'Gg. Sukajadi No. 26, DKI Jakarta', 1, NULL),
(3, '20210003', '121212', 'Rosman Lailasari', '1983-02-12', 'male', 'Jln. Moch. Ramdan No. 242, DKI Jakarta', 1, NULL),
(4, '20210004', '121212', 'Ifa Adriansyah', '1993-05-17', 'female', 'Gg. Setia Budi No. 215, DKI Jakarta', 1, NULL),
(5, '20210005', '121212', 'Sakura Susanti', '1973-11-05', 'male', 'Kpg. B.Agam 1 No. 729, DKI Jakarta', 1, NULL),
(6, '20210006', '121212', 'Jail Utama', '2001-12-28', 'male', 'Kpg. Cikutra Timur No. 57, DKI Jakarta', 1, NULL),
(7, '20210007', '121212', 'Gawati Wibowo', '1971-08-23', 'male', 'Kpg. Bara No. 346, DKI Jakarta', 1, NULL),
(8, '20210008', '121212', 'Pia Rajata', '1976-08-04', 'male', 'Kpg. Yohanes No. 445, DKI Jakarta', 1, NULL),
(9, '20210009', '121212', 'Darmaji Suartini', '1999-10-05', 'male', 'Gg. Kusmanto No. 622, DKI Jakarta', 1, NULL),
(10, '20210010', '121212', 'Kiandra Tamba', '1988-05-31', 'male', 'Ki. Sutarto No. 66, DKI Jakarta', 1, NULL),
(11, '20210011', '121212', 'Manah Thamrin', '1989-06-20', 'female', 'Jln. Baung No. 871, DKI Jakarta', 1, NULL),
(12, '20210012', '121212', 'Banara Ardianto', '1978-10-27', 'male', 'Ki. Yos Sudarso No. 411, DKI Jakarta', 1, NULL),
(13, '20210013', '121212', 'Anggabaya Mustofa', '1979-05-11', 'female', 'Psr. Pacuan Kuda No. 351, DKI Jakarta', 1, NULL),
(14, '20210014', '121212', 'Emong Purnawati', '1979-07-15', 'male', 'Jln. Jayawijaya No. 141, DKI Jakarta', 1, NULL),
(15, '20210015', '121212', 'Nardi Pertiwi', '1981-05-14', 'male', 'Psr. Barasak No. 554, DKI Jakarta', 1, NULL),
(16, '20210016', '121212', 'Ina Nasyiah', '1971-05-21', 'female', 'Ds. Suryo No. 100, DKI Jakarta', 2, NULL),
(17, '20210017', '121212', 'Jinawi Wastuti', '1994-06-18', 'male', 'Ki. Sugiono No. 918, DKI Jakarta', 2, NULL),
(18, '20210018', '121212', 'Marsudi Utama', '1979-06-04', 'female', 'Kpg. Cikapayang No. 229, DKI Jakarta', 2, NULL),
(19, '20210019', '121212', 'Ilsa Gunarto', '1992-06-11', 'female', 'Gg. Baing No. 871, DKI Jakarta', 2, NULL),
(20, '20210020', '121212', 'Hani Pratiwi', '1990-07-10', 'male', 'Dk. Yap Tjwan Bing No. 528, DKI Jakarta', 2, NULL),
(21, '20210021', '121212', 'Najwa Pratiwi', '1996-11-05', 'male', 'Kpg. Raden No. 688, DKI Jakarta', 2, NULL),
(22, '20210022', '121212', 'Samiah Haryanto', '1985-10-26', 'male', 'Gg. Juanda No. 863, DKI Jakarta', 2, NULL),
(23, '20210023', '121212', 'Olga Safitri', '1971-03-04', 'male', 'Psr. Ir. H. Juanda No. 728, DKI Jakarta', 2, NULL),
(24, '20210024', '121212', 'Halim Winarsih', '1974-11-16', 'male', 'Dk. Nakula No. 730, DKI Jakarta', 2, NULL),
(25, '20210025', '121212', 'Vivi Widodo', '1988-09-19', 'male', 'Kpg. Astana Anyar No. 983, DKI Jakarta', 2, NULL),
(26, '20210026', '121212', 'Dian Firmansyah', '1985-04-01', 'male', 'Kpg. Baha No. 855, DKI Jakarta', 2, NULL),
(27, '20210027', '121212', 'Patricia Usada', '1986-08-28', 'male', 'Psr. Ters. Jakarta No. 993, DKI Jakarta', 2, NULL),
(28, '20210028', '121212', 'Soleh Mandasari', '1988-09-28', 'female', 'Ki. Flores No. 869, DKI Jakarta', 2, NULL),
(29, '20210029', '121212', 'Kamal Pranowo', '1976-08-10', 'male', 'Jln. Baung No. 80, DKI Jakarta', 2, NULL),
(30, '20210030', '121212', 'Ade Kusmawati', '1996-08-29', 'male', 'Jln. Kiaracondong No. 398, DKI Jakarta', 2, NULL),
(31, '20210031', '121212', 'Irwan Sinaga', '1976-10-06', 'female', 'Dk. Basmol Raya No. 714, West Java', 3, NULL),
(32, '20210032', '121212', 'Lulut Lestari', '1981-03-31', 'male', 'Ds. Cihampelas No. 933, West Java', 3, NULL),
(33, '20210033', '121212', 'Balijan Rahimah', '1972-04-25', 'female', 'Ki. Ciwastra No. 539, West Java', 3, NULL),
(34, '20210034', '121212', 'Kasiyah Sitompul', '1975-01-14', 'male', 'Dk. Sutarto No. 434, West Java', 3, NULL),
(35, '20210035', '121212', 'Wulan Nasyidah', '1974-11-04', 'male', 'Dk. Mahakam No. 367, West Java', 3, NULL),
(36, '20210036', '121212', 'Damar Palastri', '1981-03-24', 'female', 'Jr. Teuku Umar No. 547, West Java', 3, NULL),
(37, '20210037', '121212', 'Gamanto Simanjuntak', '1972-01-13', 'female', 'Jln. Salam No. 421, West Java', 3, NULL),
(38, '20210038', '121212', 'Lukita Gunarto', '1998-11-27', 'female', 'Jr. HOS. Cjokroaminoto (Pasirkaliki) No. 9, West Java', 3, NULL),
(39, '20210039', '121212', 'Malika Nashiruddin', '1989-07-05', 'male', 'Psr. Kartini No. 960, West Java', 3, NULL),
(40, '20210040', '121212', 'Siska Hutapea', '1972-03-30', 'female', 'Ki. Wora Wari No. 501, West Java', 3, NULL),
(41, '20210041', '121212', 'Laras Sirait', '1971-01-13', 'male', 'Psr. Basmol Raya No. 859, West Java', 3, NULL),
(42, '20210042', '121212', 'Embuh Mulyani', '1996-08-05', 'male', 'Kpg. Wahidin No. 512, West Java', 3, NULL),
(43, '20210043', '121212', 'Mutia Nashiruddin', '1985-05-08', 'female', 'Ds. Hang No. 765, West Java', 3, NULL),
(44, '20210044', '121212', 'Pangestu Lazuardi', '2001-08-02', 'male', 'Dk. Bass No. 886, West Java', 3, NULL),
(45, '20210045', '121212', 'Gaduh Suwarno', '1971-07-27', 'female', 'Psr. Basuki No. 591, West Java', 3, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`) VALUES
(1, 'validator2', '$2y$10$V7z9OQH9hZM8ye75Q/4rmepz0pi6fOBgAnDOpgDXKQ3TlHQ3Tu9uS'),
(2, 'validator3', '$2y$10$rOrHOux.okJgDMsIsfo3NuWkvH2cRrOJwZdJTSF27YoSOVrUmEnD.'),
(3, 'validator4', '$2y$10$GWv/sRUK3.eFzxitt9wFFO.ota5iuLsu5kigK06jUdHTkbGbQqW.a'),
(4, 'officer2', '$2y$10$mgTW6Wkgs/KsyCyadyko1eK9EGGJkqa9.wUvQ8xM1CgqZi83T8T5e'),
(5, 'officer3', '$2y$10$kOn1NIOzTMatKONRfD15Fu7/bydNQYeUkeFmBVibpaoPod4Irwile'),
(6, 'validator5', '$2y$10$mdahUg9DO/xQj8Kuv92vgeQy0Jh2g8BePVhFzllVTryLlOJItpOEW'),
(7, 'validator6', '$2y$10$3bqtfrOff5ap7Vf7tJ6sEedA9/BWjkc0hIlEtlQklKidCKxxLrGEa'),
(8, 'validator7', '$2y$10$LvkcQMls02ndhFlmRYj80ORbEvAsQISQ0jup4o9OmJatla5BJx7n2'),
(9, 'officer5', '$2y$10$lE5Ro1yB8eMqPmvGr5TZo.H3PvakN0JJ4bQ3gcyZpeIerfSYMuwgy'),
(10, 'officer6', '$2y$10$G49YMKMsayKNntpVmjgieu45JaDr1EY1amj37i94Vnw6jmJ5v.xuy'),
(11, 'validator8', '$2y$10$6AOsg8r8I9JxGYzESet1Re6fguHiWYh6.xK4/CiWwbVJrwszsVEPO'),
(12, 'validator9', '$2y$10$vEpJNZVYVmxmGa6yLcmlse5hBzyS4AmIsCfU5Ium7h4P1BGxyxkva'),
(13, 'validator10', '$2y$10$FHuPvu2KdeJKiaXDAnJn3edcjogY8vggHT1tyFLdcj44VDx3AaNWe'),
(14, 'officer8', '$2y$10$6bbYntlsOWxN1149KRQoLuPxpqj7Fwom9QSxcQ/MJ.TJ/50DOcRWG'),
(15, 'officer9', '$2y$10$7dtqW7kllABipA8bHaZG4.I0GQpgznnnkMV1KCV5r37lwLC5PReDC'),
(16, 'validator11', '$2y$10$1sSY.iVLjdZ.nN6C1diGQuQe5A/ku9H5dGv5mpEwmOigx7Ku6SXT.'),
(17, 'validator12', '$2y$10$Et2lcahneYVmvqSMB0H3E.6jGrBURmKm4LZHbhvYQufsEsRr8MeMC'),
(18, 'validator13', '$2y$10$zMs5XMdw9UnVffXyM6ydlOXwfKY5/v6FyP8.eMnEqHxWl7OpeUjNO'),
(19, 'officer11', '$2y$10$4P7xMiRGstOOGMzdzmKt7O5uTh9pXh8WmSIg3TaXidpQpFPU9mwZS'),
(20, 'officer12', '$2y$10$vE8NMh6rmM0xencAduABTe8J7DmYMqP8wsYxNHdy1qU0bgehX1zEm'),
(21, 'validator14', '$2y$10$7fLg.UbvPNSXb8UvE2vkHeF.sV4Q82c.uvaBriJAsXKxj0FzFpHg6'),
(22, 'validator15', '$2y$10$pQ/1tvf6XF9S/swwk4Y7jOTuJm1/K4vDvlOmsuLI1lMtYyFukFBAW'),
(23, 'validator16', '$2y$10$CHCyk8QBkCR5qJTqG6f7re3ccR.VMbRrcHsbZYfh1EAhVl1ufheyi'),
(24, 'officer14', '$2y$10$rM/lVVEj2S2GmosC.2Lyu.Y3.yMnsUmzxViYGs66t.UZj5Pe/QGsu'),
(25, 'officer15', '$2y$10$NcAshNWgVKbdYQTZBNTXvOBqFHP6O2AwJUbvAm4Gja8HM7G1KyVSW'),
(26, 'validator17', '$2y$10$MN7EUEP7WEpx9CGYRy2tNOvpBwZYwCqj2tNpiKo4QIVaPC7ARcAH2'),
(27, 'validator18', '$2y$10$S4Z5eVPCEItajH7bUUMqZe.ncK7Xyq7ULPhaB1Af8EOk.iyi.pIa2'),
(28, 'validator19', '$2y$10$641mZPy3lze56Yd62Vdk8u5jLYt9iJhnXkwo//guI.R5c78dq.LuG'),
(29, 'officer17', '$2y$10$EvRoWw8ZJs9EnVxhKlQPO.O.KxsFxyby7iI6duleda6i.zPNGsxRu'),
(30, 'officer18', '$2y$10$U60MhOJNq2vHgOPRjUCB4.s3WsbeUFb6.kSy7N1db8rI3XFpZK5Yu'),
(31, 'validator20', '$2y$10$M9Zgl0c2ngaTR9HkB154fekeqGCarTNgdGnQa1LbBj256oJL6Nn/e'),
(32, 'validator21', '$2y$10$lBJLht2hCzdYGydSVwv.eOuhc.begKuWVqDqL7R1RgjejXr3yKwWS'),
(33, 'validator22', '$2y$10$Y/mZoTyQHJK3aNcR57KdUuoahcMvUfDiFmHSp/LzyybhDx8bmkQdS'),
(34, 'officer20', '$2y$10$sP/ikW5Qan9UrDgLkv3nEOIsV61RfnDvpOoXg3aK9hsQTdC1amWeC'),
(35, 'officer21', '$2y$10$//J0Hb5rFpW7MuyUYu6Rfu8mP0D6vZUjnquZSJsOL8TvKBuJkz8fe'),
(36, 'validator23', '$2y$10$GRmdMl81XBWBFMHppIIPd.ggbUtwX7ppYWIi/Wp1SFoDJSNBvrLii'),
(37, 'validator24', '$2y$10$AG/vUaRyzGNxUac3l3EOg.HjSwxGoKB4HbN7SQor0oPD3T9aENGRa'),
(38, 'validator25', '$2y$10$BGW0QtLlVVL6pwEMxo29X.UwW.oK9BGFEFVRU4j2Gr9.upAaCv1vq'),
(39, 'officer23', '$2y$10$lR.qikgtYjE3gJEATbkwNeRZzU5p232G/Ma0b.Ujl/FhLBjWDdRSG'),
(40, 'officer24', '$2y$10$qbzIQvYNKcqXpADHMj4KUugsV18e2GHqAWfrTND0fpfcdRSddPXWK'),
(41, 'validator26', '$2y$10$t3YFb0GECtPVmfFPVmSyk.8j1T78h3./OEv7qEmbASHM0wextK2v6'),
(42, 'validator27', '$2y$10$mZjsimCruvmGeMFP5n0AEOyPNHkqaWHzKTSq.P6.v77FiMmpn/p4.'),
(43, 'validator28', '$2y$10$iMXNS39pX7aHQhK3dernaO182ID6JEtHqGQ3J8YlMPBO5KxtvCJka'),
(44, 'officer26', '$2y$10$h9ELcDTKj7RDmTJc8EPRjuapfpQBl1JxIB0mPNdEHKXCFQyBi2Ki2'),
(45, 'officer27', '$2y$10$hdZvbbf2IJCXzRRcdagABujMEE5Yn0957lrsOKXCJUOUgAl42xbnW'),
(46, 'validator29', '$2y$10$jRj2r8rz1R/9VhltykU3mOXS8kE/QoV/g5w8L21n8mE9aRQBqF0Za'),
(47, 'validator30', '$2y$10$3U3cboyx2sWV9q8q6pE5peOk8z0JGXXeuq.Ec1/i.ubmgMdPU1OAq'),
(48, 'validator31', '$2y$10$.8YtovrrXJY0peoOZQd9meqfufh5I3ufChiTyDdT5cB.r1QqmTLj2'),
(49, 'officer29', '$2y$10$CylKSQ9n9ch4Eve.Nghq7Obeq.mcz7iVYlqk8MZQdW1X60nB8YlI6'),
(50, 'officer30', '$2y$10$f8v.1AnOVhaGQQJLpwPeZ.Uuj/lJc1EW9fSEADbRs3l0LgBIyMsnm'),
(51, 'validator32', '$2y$10$pqMPqIKLFHbba/JZmcSrF.Zbs3tqwwv1yPeq5LDpDZkS6XZ0lQosK'),
(52, 'validator33', '$2y$10$w6gb2/wthVt.D851iWVMV.eeTg2cUuJaKUl3Zre.7d16M9RVzsk/S'),
(53, 'validator34', '$2y$10$DT31BLPJXocCysZATI2wc.zUcLphroJ9JnT5vJukC3LEmyI8nlgyO'),
(54, 'officer32', '$2y$10$Bz4QX7lfmZ6XzIL8d54hQelHJ/W3oIeHjs2gpqtdUF0ilpocc0i12'),
(55, 'officer33', '$2y$10$jIIiDhxn25u5w5CyjRK0muk8a95wIDyqdZqWb4064WRtcqNOFD4qi'),
(56, 'validator35', '$2y$10$5iiqslrC1UjpIr5mUr4eFeUKg06JDVwY.ABsLNH/mrs2NZn5P9w5W'),
(57, 'validator36', '$2y$10$2yp2Sa8MM/gwkaz/fb.VceEvw6YQ9zqH2TcGEgQnwpoAkfP03Bnr2'),
(58, 'validator37', '$2y$10$yB9QkeTaabcNqMNOu0kUUOZ1jtgF06qi61mtnX9pFO6UkQWj4iBvu'),
(59, 'officer35', '$2y$10$UOX.akGzKvL1gLrWRioGBu3vonMt0KKVuLAA2cOVLPuRFmYPCkoEu'),
(60, 'officer36', '$2y$10$kJ.EC6WMaAerfVwIUhvLm.lMysMp2OrQsFxMkHibwakNdUXVo2dwi'),
(61, 'validator38', '$2y$10$PeJ6hc7F/yqAVn6BMFkmoOqots5nfVlg.vkit.MsxXIOLzgKQmzNS'),
(62, 'validator39', '$2y$10$Y/z3/H7dxCODjSktd8o7RO4GjTBu0GgYtjXzUuy6gBVQRK6q7YP2e'),
(63, 'validator40', '$2y$10$kF0b0mJPVKvlT.WhQm52ReNwAgYzfLnh.l//tdQ9v8FWGrHrjrfqK'),
(64, 'officer38', '$2y$10$c/HPFLBj8Ms6ACTKwUsBPuMODyopjA5u5/.trDxacDncdqqjUDMee'),
(65, 'officer39', '$2y$10$QdedI8c2E5nMta1.6NyXY.28g3malBKilhHbWWZfZpek4x9Uoe3fS'),
(66, 'validator41', '$2y$10$SZruoxjIMWWTIfrYlaYq9eRI.eozOrkuGb8LtAyXIZtS14cU7wKHS'),
(67, 'validator42', '$2y$10$Fv.HBZ28qG5FeskggImjMekFOGkwAnpbtsia.qkUgoYxQpyXBH.tG'),
(68, 'validator43', '$2y$10$HEYvBl7rkq1Znmb6uGnZEe6.5JzTOdp9A3bu71oaIEZj8OqJgW7EO'),
(69, 'officer41', '$2y$10$3c.aTUHy5f/zIikynhA7vOqNEqes1OBqzEzS1.1Dgr3jj/Ps.sy5K'),
(70, 'officer42', '$2y$10$4OUqJgVuwK1Lfbqhbt4Iv./IGZTxTY84zLKT3WkETVJG8pryDfQUe'),
(71, 'validator44', '$2y$10$hxqc5IlwAKIhA9RkEA8iOeCbXXUgtr5sgkQUCtOVIfRn.H1wmLdUq'),
(72, 'validator45', '$2y$10$cNptHZZ8ZrOusJs49mQ8zuT2VUgRh5WOFVDHEboCP5RdbrPM02PTW'),
(73, 'validator46', '$2y$10$CZKA4E3DUr0N6UOx8tkwueL438dNQRSpToqqs8VaT/a06X7ksVmyC'),
(74, 'officer44', '$2y$10$./todE9ybLYEE4qwMU/WUO9CIbU1IgJ4rE7ZaDn10Xx67Tow2u7iG'),
(75, 'officer45', '$2y$10$T8bOs2y82y8EaPV3XUi0heGLWCukmQOfzItOE9W0c.OJ66UJewXye');

-- --------------------------------------------------------

--
-- Table structure for table `validations`
--

CREATE TABLE `validations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `job_category_id` bigint(20) UNSIGNED NOT NULL,
  `society_id` bigint(20) UNSIGNED NOT NULL,
  `validator_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('accepted','declined','pending') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `work_experience` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `job_position` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_accepted` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `validator_notes` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `validators`
--

CREATE TABLE `validators` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `role` enum('officer','validator') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'officer',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `validators`
--

INSERT INTO `validators` (`id`, `user_id`, `role`, `name`) VALUES
(1, 1, 'validator', 'Kamila Wibisono'),
(2, 2, 'validator', 'Maya Kusmawati'),
(3, 3, 'validator', 'Gaduh Prasetyo'),
(4, 4, 'officer', 'Indra Usamah'),
(5, 5, 'officer', 'Kalim Yulianti'),
(6, 6, 'validator', 'Eva Mandasari'),
(7, 7, 'validator', 'Jatmiko Handayani'),
(8, 8, 'validator', 'Ratna Riyanti'),
(9, 9, 'officer', 'Ayu Iswahyudi'),
(10, 10, 'officer', 'Azalea Mulyani'),
(11, 11, 'validator', 'Hesti Andriani'),
(12, 12, 'validator', 'Kusuma Nasyidah'),
(13, 13, 'validator', 'Gaman Sihotang'),
(14, 14, 'officer', 'Bella Habibi'),
(15, 15, 'officer', 'Titin Agustina'),
(16, 16, 'validator', 'Ami Kurniawan'),
(17, 17, 'validator', 'Hasta Riyanti'),
(18, 18, 'validator', 'Laila Hassanah'),
(19, 19, 'officer', 'Martana Hakim'),
(20, 20, 'officer', 'Aurora Siregar'),
(21, 21, 'validator', 'Tina Prastuti'),
(22, 22, 'validator', 'Farhunnisa Widiastuti'),
(23, 23, 'validator', 'Olga Hartati'),
(24, 24, 'officer', 'Tira Purwanti'),
(25, 25, 'officer', 'Darmanto Nuraini'),
(26, 26, 'validator', 'Okto Pradana'),
(27, 27, 'validator', 'Dian Hariyah'),
(28, 28, 'validator', 'Ganda Gunawan'),
(29, 29, 'officer', 'Najam Rajata'),
(30, 30, 'officer', 'Hani Maulana'),
(31, 31, 'validator', 'Galak Uyainah'),
(32, 32, 'validator', 'Eka Suartini'),
(33, 33, 'validator', 'Asmianto Kusumo'),
(34, 34, 'officer', 'Prayitna Yuniar'),
(35, 35, 'officer', 'Banawi Prastuti'),
(36, 36, 'validator', 'Kania Maulana'),
(37, 37, 'validator', 'Salwa Mansur'),
(38, 38, 'validator', 'Dagel Puspita'),
(39, 39, 'officer', 'Jamal Rahimah'),
(40, 40, 'officer', 'Ami Prastuti'),
(41, 41, 'validator', 'Puput Suryatmi'),
(42, 42, 'validator', 'Hani Uyainah'),
(43, 43, 'validator', 'Aditya Kusmawati'),
(44, 44, 'officer', 'Agnes Permadi'),
(45, 45, 'officer', 'Edison Susanti'),
(46, 46, 'validator', 'Winda Pertiwi'),
(47, 47, 'validator', 'Emil Nuraini'),
(48, 48, 'validator', 'Raden Sinaga'),
(49, 49, 'officer', 'Sadina Nurdiyanti'),
(50, 50, 'officer', 'Jessica Habibi'),
(51, 51, 'validator', 'Maya Napitupulu'),
(52, 52, 'validator', 'Nurul Utama'),
(53, 53, 'validator', 'Asmianto Ardianto'),
(54, 54, 'officer', 'Cawisono Wulandari'),
(55, 55, 'officer', 'Candrakanta Palastri'),
(56, 56, 'validator', 'Uda Sitorus'),
(57, 57, 'validator', 'Paiman Zulaika'),
(58, 58, 'validator', 'Eko Putra'),
(59, 59, 'officer', 'Mariadi Samosir'),
(60, 60, 'officer', 'Chandra Januar'),
(61, 61, 'validator', 'Padma Hariyah'),
(62, 62, 'validator', 'Taufik Uyainah'),
(63, 63, 'validator', 'Maria Laksmiwati'),
(64, 64, 'officer', 'Harjo Tamba'),
(65, 65, 'officer', 'Vanesa Palastri'),
(66, 66, 'validator', 'Diah Mulyani'),
(67, 67, 'validator', 'Syahrini Farida'),
(68, 68, 'validator', 'Fitria Winarsih'),
(69, 69, 'officer', 'Clara Pratiwi'),
(70, 70, 'officer', 'Dian Habibi'),
(71, 71, 'validator', 'Aurora Wulandari'),
(72, 72, 'validator', 'Safina Hassanah'),
(73, 73, 'validator', 'Cinthia Adriansyah'),
(74, 74, 'officer', 'Wadi Prakasa'),
(75, 75, 'officer', 'Parman Namaga');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `available_positions`
--
ALTER TABLE `available_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `spot_vaccines_spot_id_foreign` (`job_vacancy_id`);

--
-- Indexes for table `job_apply_positions`
--
ALTER TABLE `job_apply_positions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `job_apply_position_id_foreign` (`position_id`),
  ADD KEY `job_apply_position_society_id_foreign` (`society_id`),
  ADD KEY `job_apply_position_job_vacancy_id_foreign` (`job_vacancy_id`),
  ADD KEY `job_apply_position_job_apply_societies_id_foreign` (`job_apply_societies_id`);

--
-- Indexes for table `job_apply_societies`
--
ALTER TABLE `job_apply_societies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `society_id` (`society_id`),
  ADD KEY `job_vacancy_id` (`job_vacancy_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `job_vacancies`
--
ALTER TABLE `job_vacancies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `regionals`
--
ALTER TABLE `regionals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `societies`
--
ALTER TABLE `societies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `societies_id_card_number_unique` (`id_card_number`),
  ADD KEY `societies_regional_id_foreign` (`regional_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`);

--
-- Indexes for table `validations`
--
ALTER TABLE `validations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `consultations_society_id_foreign` (`society_id`),
  ADD KEY `consultations_doctor_id_foreign` (`validator_id`),
  ADD KEY `validations_job_category_id_foreign` (`job_category_id`);

--
-- Indexes for table `validators`
--
ALTER TABLE `validators`
  ADD PRIMARY KEY (`id`),
  ADD KEY `validators_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `available_positions`
--
ALTER TABLE `available_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `job_apply_positions`
--
ALTER TABLE `job_apply_positions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `job_apply_societies`
--
ALTER TABLE `job_apply_societies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `job_vacancies`
--
ALTER TABLE `job_vacancies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `regionals`
--
ALTER TABLE `regionals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `societies`
--
ALTER TABLE `societies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `validations`
--
ALTER TABLE `validations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `validators`
--
ALTER TABLE `validators`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `available_positions`
--
ALTER TABLE `available_positions`
  ADD CONSTRAINT `spot_vaccines_spot_id_foreign` FOREIGN KEY (`job_vacancy_id`) REFERENCES `job_vacancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_apply_positions`
--
ALTER TABLE `job_apply_positions`
  ADD CONSTRAINT `job_apply_position_id_foreign` FOREIGN KEY (`position_id`) REFERENCES `available_positions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_apply_position_job_apply_societies_id_foreign` FOREIGN KEY (`job_apply_societies_id`) REFERENCES `job_apply_societies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_apply_position_job_vacancy_id_foreign` FOREIGN KEY (`job_vacancy_id`) REFERENCES `job_vacancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `job_apply_position_society_id_foreign` FOREIGN KEY (`society_id`) REFERENCES `societies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_apply_societies`
--
ALTER TABLE `job_apply_societies`
  ADD CONSTRAINT `apply_job_vacancy_id_foreign` FOREIGN KEY (`job_vacancy_id`) REFERENCES `job_vacancies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `apply_society_id_foreign` FOREIGN KEY (`society_id`) REFERENCES `societies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `job_vacancies`
--
ALTER TABLE `job_vacancies`
  ADD CONSTRAINT `job_vacancies_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `societies`
--
ALTER TABLE `societies`
  ADD CONSTRAINT `societies_regional_id_foreign` FOREIGN KEY (`regional_id`) REFERENCES `regionals` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `validations`
--
ALTER TABLE `validations`
  ADD CONSTRAINT `validations_job_category_id_foreign` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `validations_society_id_foreign` FOREIGN KEY (`society_id`) REFERENCES `societies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `validations_validator_id_foreign` FOREIGN KEY (`validator_id`) REFERENCES `validators` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `validators`
--
ALTER TABLE `validators`
  ADD CONSTRAINT `validators_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
