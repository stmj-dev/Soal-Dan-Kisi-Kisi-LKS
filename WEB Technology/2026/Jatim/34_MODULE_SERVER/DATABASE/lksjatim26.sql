-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 09, 2026 at 07:06 AM
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
-- Database: `lksjatim26`
--

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2026_04_06_133234_create_pages_table', 1),
(5, '2026_04_06_133814_create_templates_table', 1),
(6, '2026_04_06_133821_create_template_fields_table', 1),
(7, '2026_04_06_133827_create_page_sections_table', 1),
(8, '2026_04_06_133835_create_section_field_values_table', 1),
(9, '2026_04_06_141420_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `summary` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `page_sections`
--

CREATE TABLE `page_sections` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `page_id` bigint(20) UNSIGNED NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `position` tinyint(4) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `expires_at`, `created_at`, `updated_at`) VALUES
(1, 'App\\Models\\User', 4, 'sanctum', '4e93ba662d4a4c7ceb16169992ababac7aecec7f2ede425d448c8c5d60a08fdd', '[\"*\"]', NULL, NULL, '2026-04-08 20:36:38', '2026-04-08 20:36:38'),
(2, 'App\\Models\\User', 1, 'sanctum', 'd48da4f3ed8ea1a7006cb2637b3130227222890880edc29b991f71c57af0bd76', '[\"*\"]', NULL, NULL, '2026-04-08 20:38:36', '2026-04-08 20:38:36');

-- --------------------------------------------------------

--
-- Table structure for table `section_field_values`
--

CREATE TABLE `section_field_values` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_section_id` bigint(20) UNSIGNED NOT NULL,
  `template_field_id` bigint(20) UNSIGNED NOT NULL,
  `value` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `templates`
--

CREATE TABLE `templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `templates`
--

INSERT INTO `templates` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Hero Section', 'hero', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(2, 'About Section', 'about', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(3, 'Services Section', 'services', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'Contact Section', 'contact', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(5, 'Call To Action Section', 'cta', '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(6, 'Footer Section', 'footer', '2026-04-08 08:45:28', '2026-04-08 08:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `template_fields`
--

CREATE TABLE `template_fields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` enum('image','text') NOT NULL,
  `template_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `template_fields`
--

INSERT INTO `template_fields` (`id`, `name`, `type`, `template_id`, `created_at`, `updated_at`) VALUES
(1, 'title', 'text', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(2, 'subtitle', 'text', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(3, 'background_image', 'image', 1, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'heading', 'text', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(5, 'description', 'text', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(6, 'image', 'image', 2, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(7, 'title', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(8, 'service_1_name', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(9, 'service_1_icon', 'image', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(10, 'service_2_name', 'text', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(11, 'service_2_icon', 'image', 3, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(12, 'title', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(13, 'email', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(14, 'phone', 'text', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(15, 'map_image', 'image', 4, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(16, 'title', 'text', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(17, 'button_text', 'text', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(18, 'background_image', 'image', 5, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(19, 'copyright_text', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(20, 'logo', 'image', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(21, 'facebook_link', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(22, 'instagram_link', 'text', 6, '2026-04-08 08:45:28', '2026-04-08 08:45:28');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'John Doe', 'john.doe@gmail.com', NULL, '$2y$12$fPKbVALIOfWyBeThmRfTze61Qp88zdtVEbGbOeSzo/Ie0tbk7z8ze', NULL, '2026-04-08 08:45:27', '2026-04-08 08:45:27'),
(2, 'Richard Roe', 'richard.roe@gmail.com', NULL, '$2y$12$TNsA1dSYWqRhXHlJEr0YHeUinhNATPlTa6.26Opvm2AABooZYBRy2', NULL, '2026-04-08 08:45:27', '2026-04-08 08:45:27'),
(3, 'Jane Poe', 'jane.poe@gmail.com', NULL, '$2y$12$f5NJHdjwINfN9QF6UQDgjuTa5axR9WtRPvqHoQ.sF2L266pJbnFxS', NULL, '2026-04-08 08:45:28', '2026-04-08 08:45:28'),
(4, 'Mahefud', 'mahefud@gmail.com', NULL, '$2y$12$V8QpAhE2PKHrGzD3cCai8.PXlXEy/xqiC/IZiXF.jSm5mx0WN2VK2', NULL, '2026-04-08 20:36:38', '2026-04-08 20:36:38');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_expiration_index` (`expiration`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`),
  ADD KEY `cache_locks_expiration_index` (`expiration`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_user_id_foreign` (`user_id`);

--
-- Indexes for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `page_sections_page_id_foreign` (`page_id`),
  ADD KEY `page_sections_template_id_foreign` (`template_id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `section_field_values`
--
ALTER TABLE `section_field_values`
  ADD PRIMARY KEY (`id`),
  ADD KEY `section_field_values_page_section_id_foreign` (`page_section_id`),
  ADD KEY `section_field_values_template_field_id_foreign` (`template_field_id`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `templates`
--
ALTER TABLE `templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `templates_slug_unique` (`slug`);

--
-- Indexes for table `template_fields`
--
ALTER TABLE `template_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `template_fields_template_id_foreign` (`template_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `page_sections`
--
ALTER TABLE `page_sections`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `section_field_values`
--
ALTER TABLE `section_field_values`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `templates`
--
ALTER TABLE `templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `template_fields`
--
ALTER TABLE `template_fields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `page_sections`
--
ALTER TABLE `page_sections`
  ADD CONSTRAINT `page_sections_page_id_foreign` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `page_sections_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `section_field_values`
--
ALTER TABLE `section_field_values`
  ADD CONSTRAINT `section_field_values_page_section_id_foreign` FOREIGN KEY (`page_section_id`) REFERENCES `page_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `section_field_values_template_field_id_foreign` FOREIGN KEY (`template_field_id`) REFERENCES `template_fields` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `template_fields`
--
ALTER TABLE `template_fields`
  ADD CONSTRAINT `template_fields_template_id_foreign` FOREIGN KEY (`template_id`) REFERENCES `templates` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
