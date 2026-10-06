-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 06, 2026 at 06:27 PM
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
-- Database: `tpa_system_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `activity_logs`
--

CREATE TABLE `activity_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(100) NOT NULL,
  `entity_type` varchar(100) NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`old_values`)),
  `new_values` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`new_values`)),
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('tpa-system-cache-1b6453892473a467d07372d45eb05abc2031647a', 'i:3;', 1791303725),
('tpa-system-cache-1b6453892473a467d07372d45eb05abc2031647a:timer', 'i:1791303725;', 1791303725),
('tpa-system-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6', 'i:1;', 1791303787),
('tpa-system-cache-livewire-rate-limiter:16d36dff9abd246c67dfac3e63b993a169af77e6:timer', 'i:1791303787;', 1791303787);

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
-- Table structure for table `claims`
--

CREATE TABLE `claims` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `member_id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `reviewer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `statement_id` bigint(20) UNSIGNED DEFAULT NULL,
  `service_date` date NOT NULL,
  `claimed_amount` decimal(12,2) NOT NULL,
  `approved_amount` decimal(12,2) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `reviewer_notes` varchar(255) DEFAULT NULL,
  `locked_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claims`
--

INSERT INTO `claims` (`id`, `member_id`, `provider_id`, `reviewer_id`, `statement_id`, `service_date`, `claimed_amount`, `approved_amount`, `status`, `reviewer_notes`, `locked_at`, `created_at`, `updated_at`) VALUES
(3, 1, 3, 2, 8, '2026-10-02', 1000.00, 1000.00, 'appr', 'approv', NULL, '2026-10-02 10:11:14', '2026-10-02 10:27:19'),
(4, 1, 3, 2, 8, '2026-10-02', 80.00, 0.00, 'rej', NULL, NULL, '2026-10-02 10:11:36', '2026-10-02 10:28:35'),
(5, 1, 3, 2, 8, '2026-10-02', 90.00, 80.00, 'part', 'no', NULL, '2026-10-02 10:12:04', '2026-10-02 10:28:55'),
(6, 1, 4, 2, 9, '2026-10-02', 200.00, 200.00, 'appr', NULL, NULL, '2026-10-02 10:30:52', '2026-10-02 10:31:19'),
(7, 1, 4, 2, 10, '2026-10-02', 200.00, 200.00, 'appr', NULL, NULL, '2026-10-02 10:46:01', '2026-10-02 10:46:31'),
(8, 1, 4, 2, 11, '2026-10-02', 200.00, 200.00, 'appr', NULL, NULL, '2026-10-02 10:49:29', '2026-10-02 10:50:30'),
(9, 1, 4, 2, 11, '2026-10-02', 30.00, 15.00, 'part', 'abc', '2026-10-02 11:06:52', '2026-10-02 10:50:00', '2026-10-02 11:06:52'),
(10, 1, 4, 2, 12, '2026-10-02', 45.00, 45.00, 'appr', NULL, '2026-10-02 11:00:55', '2026-10-02 11:00:21', '2026-10-02 11:00:55'),
(11, 1, 4, 2, 13, '2026-10-02', 100.00, 100.00, 'appr', NULL, '2026-10-02 11:14:05', '2026-10-02 11:10:04', '2026-10-02 11:14:05'),
(12, 1, 4, 2, 13, '2026-10-02', 30.00, 0.00, 'rej', NULL, '2026-10-02 11:14:20', '2026-10-02 11:13:26', '2026-10-02 11:14:20'),
(13, 1, 4, 2, 14, '2026-10-02', 80.00, 0.00, 'rej', NULL, '2026-10-02 11:18:23', '2026-10-02 11:17:53', '2026-10-02 11:18:23'),
(14, 1, 4, 2, 15, '2026-10-02', 30.00, 30.00, 'appr', NULL, '2026-10-02 11:47:51', '2026-10-02 11:45:40', '2026-10-02 11:47:51'),
(15, 1, 4, 2, 15, '2026-10-02', 50.00, 0.00, 'rej', NULL, '2026-10-02 12:15:38', '2026-10-02 11:45:54', '2026-10-02 12:15:38'),
(16, 1, 4, 2, 15, '2026-10-02', 40.00, NULL, 'rej', NULL, '2026-10-02 12:15:43', '2026-10-02 11:46:07', '2026-10-02 12:15:43'),
(17, 1, 4, 2, 15, '2026-10-02', 180.00, NULL, 'rej', NULL, '2026-10-02 12:15:49', '2026-10-02 11:46:34', '2026-10-02 12:15:49'),
(18, 1, 3, 2, 16, '2026-10-02', 40.00, NULL, 'rej', NULL, '2026-10-02 12:15:56', '2026-10-02 11:47:05', '2026-10-02 12:15:56'),
(19, 1, 3, 2, 16, '2026-10-02', 200.00, NULL, 'rej', NULL, '2026-10-02 12:16:01', '2026-10-02 11:47:17', '2026-10-02 12:16:01'),
(20, 2, 3, 2, 17, '2026-10-02', 30.00, 30.00, 'appr', NULL, '2026-10-02 15:11:56', '2026-10-02 15:10:16', '2026-10-02 15:11:56'),
(21, 2, 3, 2, 17, '2026-10-02', 80.00, 50.00, 'part', 'notes', '2026-10-02 15:12:35', '2026-10-02 15:11:01', '2026-10-02 15:12:35'),
(22, 2, 3, 2, 18, '2026-10-03', 10000.00, 5000.00, 'appr', NULL, '2026-10-03 10:24:04', '2026-10-03 10:21:41', '2026-10-03 10:24:04'),
(23, 3, 3, 2, 19, '2026-10-05', 80.00, 80.00, 'appr', NULL, '2026-10-05 14:10:20', '2026-10-05 13:39:47', '2026-10-05 14:10:20'),
(24, 2, 3, 2, 20, '2026-10-05', 80.00, 0.00, 'rej', 'no reason', '2026-10-05 14:27:44', '2026-10-05 14:26:59', '2026-10-05 14:27:44'),
(25, 2, 3, 2, 21, '2026-10-05', 30.00, 20.00, 'part', 'no reason', '2026-10-05 14:29:42', '2026-10-05 14:28:19', '2026-10-05 14:29:42'),
(26, 2, 3, 2, 23, '2026-10-05', 250.00, 200.00, 'part', 'no reason', '2026-10-05 14:35:56', '2026-10-05 14:35:09', '2026-10-05 14:35:56'),
(28, 4, 4, 5, 26, '2026-10-06', 100.00, 101.00, 'appr', NULL, '2026-10-06 14:22:49', '2026-10-06 14:21:11', '2026-10-06 14:22:49'),
(29, 4, 4, 5, 26, '2026-10-06', 250.00, 250.00, 'appr', NULL, '2026-10-06 14:23:48', '2026-10-06 14:21:26', '2026-10-06 14:23:48'),
(30, 4, 4, 5, 26, '2026-10-06', 890.00, 600.00, 'part', 'no reason', '2026-10-06 14:24:12', '2026-10-06 14:21:43', '2026-10-06 14:24:12');

-- --------------------------------------------------------

--
-- Table structure for table `claim_attachments`
--

CREATE TABLE `claim_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `file_path` varchar(500) NOT NULL,
  `file_type` enum('pdf','jpg','png') NOT NULL,
  `file_size` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claim_attachments`
--

INSERT INTO `claim_attachments` (`id`, `claim_id`, `file_path`, `file_type`, `file_size`, `created_at`, `updated_at`) VALUES
(4, 3, 'claim-documents/01M3Y8D5V44H8QNRPAR49T5TQ6.pdf', 'pdf', 45744, '2026-10-02 10:11:14', '2026-10-02 10:11:14'),
(5, 3, 'claim-documents/01M3Y8D5V8S678GJS96DSFHCWM.pdf', 'pdf', 153160, '2026-10-02 10:11:14', '2026-10-02 10:11:14'),
(6, 4, 'claim-documents/01M3Y8DVYAS0PJ6X27BPZF04VQ.pdf', 'pdf', 254210, '2026-10-02 10:11:36', '2026-10-02 10:11:36'),
(7, 5, 'claim-documents/01M3Y8EQAMPG1A23XEBWRSJVHQ.pdf', 'pdf', 43900, '2026-10-02 10:12:04', '2026-10-02 10:12:04'),
(8, 6, 'claim-documents/01M3Y9H4EHPZ8XACH26H2F4RN8.pdf', 'pdf', 66692, '2026-10-02 10:30:52', '2026-10-02 10:30:52'),
(9, 7, 'claim-documents/01M3YACWE0V0WHRKW3RSQW1HTX.pdf', 'pdf', 45744, '2026-10-02 10:46:01', '2026-10-02 10:46:01'),
(10, 8, 'claim-documents/01M3YAK7R7M21E3HMH9QEARADV.pdf', 'pdf', 60612, '2026-10-02 10:49:29', '2026-10-02 10:49:29'),
(11, 9, 'claim-documents/01M3YAM59GN0NFVVGCP8T74CMW.pdf', 'pdf', 310499, '2026-10-02 10:50:00', '2026-10-02 10:50:00'),
(12, 10, 'claim-documents/01M3YB73T3GK2TTS9VWHVB8R0N.pdf', 'pdf', 300831, '2026-10-02 11:00:21', '2026-10-02 11:00:21'),
(13, 11, 'claim-documents/01M3YBRXHWSREF6TS9VJ1QDP1Q.pdf', 'pdf', 233869, '2026-10-02 11:10:04', '2026-10-02 11:10:04'),
(14, 12, 'claim-documents/01M3YBZ2MCDNZWKSXGPFKP4XKC.pdf', 'pdf', 236952, '2026-10-02 11:13:26', '2026-10-02 11:13:26'),
(15, 13, 'claim-documents/01M3YC77KGAW00C5S5HCDBJ1RQ.pdf', 'pdf', 218272, '2026-10-02 11:17:53', '2026-10-02 11:17:53'),
(16, 14, 'claim-documents/01M3YDT3GKG960EBV8WB6ZRBY0.pdf', 'pdf', 236952, '2026-10-02 11:45:40', '2026-10-02 11:45:40'),
(17, 15, 'claim-documents/01M3YDTHFBZBE521WBBCCRHJQX.pdf', 'pdf', 280466, '2026-10-02 11:45:54', '2026-10-02 11:45:54'),
(18, 16, 'claim-documents/01M3YDTXPKDNBPZ8WTRKYRJ8YD.pdf', 'pdf', 300473, '2026-10-02 11:46:07', '2026-10-02 11:46:07'),
(19, 17, 'claim-documents/01M3YDVR6H2BN9ZY907J0PCMDR.pdf', 'pdf', 250051, '2026-10-02 11:46:34', '2026-10-02 11:46:34'),
(20, 18, 'claim-documents/01M3YDWP2EX02BG2B0VWCX15X0.pdf', 'pdf', 294729, '2026-10-02 11:47:05', '2026-10-02 11:47:05'),
(21, 19, 'claim-documents/01M3YDX27XNHAR9EAS9RAP6SC0.pdf', 'pdf', 233869, '2026-10-02 11:47:17', '2026-10-02 11:47:17'),
(22, 20, 'claim-documents/01M3YSGQP8ZBNBDZCJP3AB7MXG.pdf', 'pdf', 310499, '2026-10-02 15:10:16', '2026-10-02 15:10:16'),
(23, 21, 'claim-documents/01M3YSJ40C57M283QVRMJW6P4P.pdf', 'pdf', 243795, '2026-10-02 15:11:01', '2026-10-02 15:11:01'),
(24, 22, 'claim-documents/01M40VD1G36DHZNHVBH7DAPZ7W.png', 'png', 261365, '2026-10-03 10:21:41', '2026-10-03 10:21:41'),
(25, 23, 'claim-documents/01M46BH7BK4C901J7ZPTRJRMJK.pdf', 'pdf', 243795, '2026-10-05 13:39:48', '2026-10-05 13:39:48'),
(26, 24, 'claim-documents/01M46E7M353P222M79AS8K1D04.pdf', 'pdf', 234591, '2026-10-05 14:26:59', '2026-10-05 14:26:59'),
(27, 25, 'claim-documents/01M46EA278YJJGVR6J4Z4GHFYF.pdf', 'pdf', 236952, '2026-10-05 14:28:19', '2026-10-05 14:28:19'),
(28, 26, 'claim-documents/01M46EPKG03HPKYAB95524955X.pdf', 'pdf', 244387, '2026-10-05 14:35:09', '2026-10-05 14:35:09'),
(30, 28, 'claim-documents/01M4909QJPAA5R98SQAEXQ2HZ7.pdf', 'pdf', 302508, '2026-10-06 14:21:11', '2026-10-06 14:21:11'),
(31, 29, 'claim-documents/01M490A61H33E4CYH2V8A4BGKK.pdf', 'pdf', 244387, '2026-10-06 14:21:26', '2026-10-06 14:21:26'),
(32, 30, 'claim-documents/01M490APESPENZXDY1TJMVNZEG.pdf', 'pdf', 241792, '2026-10-06 14:21:43', '2026-10-06 14:21:43');

-- --------------------------------------------------------

--
-- Table structure for table `claim_statements`
--

CREATE TABLE `claim_statements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `provider_id` bigint(20) UNSIGNED NOT NULL,
  `statement_number` varchar(100) NOT NULL,
  `total_claimed` decimal(14,2) NOT NULL DEFAULT 0.00,
  `status` varchar(20) NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `claim_statements`
--

INSERT INTO `claim_statements` (`id`, `provider_id`, `statement_number`, `total_claimed`, `status`, `created_at`, `updated_at`) VALUES
(8, 3, 'STMT-6ABFA3049EC3D', 1170.00, 'processing', '2026-10-02 10:26:44', '2026-10-02 10:26:44'),
(9, 4, 'STMT-6ABFA40984620', 200.00, 'processing', '2026-10-02 10:31:05', '2026-10-02 10:31:05'),
(10, 4, 'STMT-6ABFA798DD8DC', 200.00, 'processing', '2026-10-02 10:46:16', '2026-10-02 10:46:16'),
(11, 4, 'STMT-6ABFA87F9BD53', 230.00, 'processing', '2026-10-02 10:50:07', '2026-10-02 10:50:07'),
(12, 4, 'STMT-6ABFAAEA683EE', 45.00, 'processing', '2026-10-02 11:00:26', '2026-10-02 11:00:26'),
(13, 4, 'STMT-6ABFAE003D07C', 130.00, 'processing', '2026-10-02 11:13:36', '2026-10-02 11:13:36'),
(14, 4, 'STMT-6ABFAF0CC44BC', 80.00, 'processing', '2026-10-02 11:18:04', '2026-10-02 11:18:04'),
(15, 4, 'STMT-6ABFB5BE8BEDE', 300.00, 'processing', '2026-10-02 11:46:38', '2026-10-02 11:46:38'),
(16, 3, 'STMT-6ABFB5EF66084', 240.00, 'processing', '2026-10-02 11:47:27', '2026-10-02 11:47:27'),
(17, 3, 'STMT-6ABFE5BA6989A', 110.00, 'processing', '2026-10-02 15:11:22', '2026-10-02 15:11:22'),
(18, 3, 'STMT-6AC0F3A7C1CDC', 10000.00, 'processing', '2026-10-03 10:23:03', '2026-10-03 10:23:03'),
(19, 3, 'STMT-6AC3C52E73D53', 80.00, 'processing', '2026-10-05 13:41:34', '2026-10-05 13:41:34'),
(20, 3, 'STMT-6AC3CFD8EC372', 80.00, 'processing', '2026-10-05 14:27:04', '2026-10-05 14:27:04'),
(21, 3, 'STMT-6AC3D0273D9C3', 30.00, 'processing', '2026-10-05 14:28:23', '2026-10-05 14:28:23'),
(22, 3, 'STMT-6AC3D029D3179', 0.00, 'processing', '2026-10-05 14:28:25', '2026-10-05 14:28:25'),
(23, 3, 'STMT-6AC3D1CD7C0D6', 250.00, 'processing', '2026-10-05 14:35:25', '2026-10-05 14:35:25'),
(24, 3, 'STMT-6AC3D3CF6F892', 80.00, 'processing', '2026-10-05 14:43:59', '2026-10-05 14:43:59'),
(25, 3, 'STMT-6AC3D3D0B0126', 0.00, 'processing', '2026-10-05 14:44:00', '2026-10-05 14:44:00'),
(26, 4, 'STMT-6AC5202112BD4', 1240.00, 'processing', '2026-10-06 14:21:53', '2026-10-06 14:21:53');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `annual_limit` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `email`, `phone_number`, `annual_limit`, `created_at`, `updated_at`) VALUES
(1, 'comp_1', 'comp_1@admin.com', '09210020030', 150000.00, NULL, NULL),
(2, 'comp_2', 'comp2@example.com', '0922893222', 20000.00, '2026-10-05 15:35:39', '2026-10-05 15:35:39');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` varchar(255) NOT NULL,
  `queue` varchar(255) NOT NULL,
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
  `attempts` smallint(5) UNSIGNED NOT NULL,
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
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `company_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `member_ID` varchar(100) NOT NULL,
  `family_ID` varchar(100) NOT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `balance` decimal(12,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`id`, `company_id`, `name`, `member_ID`, `family_ID`, `is_active`, `balance`, `created_at`, `updated_at`) VALUES
(1, 1, 'member_1', '100050001', '23972', 0, 149810.00, '2026-10-01 18:07:41', '2026-10-02 15:25:14'),
(2, 1, 'member_2', '100050002', '8732', 1, 144700.00, '2026-10-02 12:09:14', '2026-10-05 14:35:56'),
(3, 1, 'member_3', '100050003', '87432', 1, 149920.00, '2026-10-02 12:09:32', '2026-10-05 14:10:20'),
(4, 2, 'member_4', '100050004', '68743', 1, 19049.00, '2026-10-06 14:20:48', '2026-10-06 14:24:12');

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
(4, '2026_09_29_104229_create_companies_table', 1),
(5, '2026_09_29_104504_create_members_table', 1),
(7, '2026_09_29_104849_create_claims_table', 1),
(8, '2026_09_29_105040_create_claim_attachments_table', 1),
(9, '2026_09_29_105206_create_activity_logs_table', 1),
(14, '2026_09_29_104648_create_claim_statements_table', 2);

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

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('QTi1qJrJIPnhxVu75lYmpivaDGTXIwbKbZObn7FP', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', 'eyJfdG9rZW4iOiJiVlc4WmMxajdYcmZJOEt0U2JnWW9nRDdJTEJWd20xTUVuMnl6TzNuIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9hZG1pblwvbWVtYmVycyIsInJvdXRlIjoiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLm1lbWJlcnMuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJ1cmwiOltdLCJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI6MSwicGFzc3dvcmRfaGFzaF93ZWIiOiIwNmJjOTA5MzhjNmUwYWI3M2IwYjI3NWVlM2IwZTYwZDU3MjE5ZjI0YjA4MWU1Njc5ZmJhMTE1ZmNkM2UxNDNhIiwidGFibGVzIjp7ImU2NDQ4MzNmNGU0ZTA4NzEyMzE1ZGE3MWIzM2ZhY2QyX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmFtZSIsImxhYmVsIjoiTmFtZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJlbWFpbCIsImxhYmVsIjoiRW1haWwiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoicm9sZSIsImxhYmVsIjoiUm9sZSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9XSwiYmM5ZmVmYmExNzkwYWIyZDEyNjQ4YjhlMzliZWYzMmJfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZW1iZXJfSUQiLCJsYWJlbCI6Ik1lbWJlciBJRCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJuYW1lIiwibGFiZWwiOiJGdWxsIE5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY29tcGFueS5uYW1lIiwibGFiZWwiOiJDb21wYW55IiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImZhbWlseV9JRCIsImxhYmVsIjoiRmFtaWx5IElEIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImJhbGFuY2UiLCJsYWJlbCI6IkJhbGFuY2UiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiaXNfYWN0aXZlIiwibGFiZWwiOiJTdGF0dXMiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sImZjZWQ5ZmJlZDI2ZWMwOTFkOTU2NTdjZjk5ZjJlNDZkX2NvbHVtbnMiOlt7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibmFtZSIsImxhYmVsIjoiQ29tcGFueSBOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImVtYWlsIiwibGFiZWwiOiJFbWFpbCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJwaG9uZV9udW1iZXIiLCJsYWJlbCI6IlBob25lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImFubnVhbF9saW1pdCIsImxhYmVsIjoiQW5udWFsIExpbWl0IiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im1lbWJlcnNfY291bnQiLCJsYWJlbCI6IlRvdGFsIE1lbWJlcnMiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY3JlYXRlZF9hdCIsImxhYmVsIjoiQ3JlYXRlZCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjpmYWxzZSwiaXNUb2dnbGVhYmxlIjp0cnVlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOnRydWV9XSwiMjY0MzgxOWE4NzY3MzkyYjM4MzBkYTE1ZGFhNGI1MmZfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZW1iZXIubWVtYmVyX0lEIiwibGFiZWwiOiJNZW1iZXIgSUQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibWVtYmVyLm5hbWUiLCJsYWJlbCI6Ik1lbWJlciBOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNlcnZpY2VfZGF0ZSIsImxhYmVsIjoiU2VydmljZSBEYXRlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImNsYWltZWRfYW1vdW50IiwibGFiZWwiOiJDbGFpbWVkIEFtb3VudCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJwcm92aWRlci5uYW1lIiwibGFiZWwiOiJwcm92aWRlciIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdGF0dXMiLCJsYWJlbCI6IlN0YXR1cyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9XX0sImZpbGFtZW50IjpbXX0=', 1791303943),
('RNiD5C0nUb84nGFnpybzMN94RIsEReVr2XEmEyRs', 4, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:156.0) Gecko/20100101 Firefox/156.0', 'eyJfdG9rZW4iOiJ5eDdvN3h3aTExd0NkMzM1WFVySWFOQzJmR0x0M2dDWGdEelJjb0JhIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9jbGFpbXMiLCJyb3V0ZSI6ImZpbGFtZW50LmFkbWluLnJlc291cmNlcy5jbGFpbXMuaW5kZXgifSwibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiOjQsInBhc3N3b3JkX2hhc2hfd2ViIjoiZjJiYTBmY2EzOTk4NzkxOGE5NWJkZTMyYzE4MDFmZWY4YmQ2ZmQ4YjY2NDlhMzllZDQxN2IzMTdmNjU3ZWY0YSIsInRhYmxlcyI6eyIyNjQzODE5YTg3NjczOTJiMzgzMGRhMTVkYWE0YjUyZl9jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6Im1lbWJlci5tZW1iZXJfSUQiLCJsYWJlbCI6Ik1lbWJlciBJRCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZW1iZXIubmFtZSIsImxhYmVsIjoiTWVtYmVyIE5hbWUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoic2VydmljZV9kYXRlIiwibGFiZWwiOiJTZXJ2aWNlIERhdGUiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY2xhaW1lZF9hbW91bnQiLCJsYWJlbCI6IkNsYWltZWQgQW1vdW50IiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InByb3ZpZGVyLm5hbWUiLCJsYWJlbCI6InByb3ZpZGVyIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InN0YXR1cyIsImxhYmVsIjoiU3RhdHVzIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dLCIwZTFlYTJkMmFiNmE1ODdlYTQ4Yzk5NmU3MTg3OGU3MF9jb2x1bW5zIjpbeyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InN0YXRlbWVudC5zdGF0ZW1lbnRfbnVtYmVyIiwibGFiZWwiOiJTdGF0ZW1lbnQgIyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZW1iZXIubWVtYmVyX0lEIiwibGFiZWwiOiJNZW1iZXIgSUQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiY2xhaW1lZF9hbW91bnQiLCJsYWJlbCI6IkNsYWltZWQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoiYXBwcm92ZWRfYW1vdW50IiwibGFiZWwiOiJBcHByb3ZlZCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdGF0dXMiLCJsYWJlbCI6IkZpbmFsIFN0YXR1cyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJwcm92aWRlci5uYW1lIiwibGFiZWwiOiJwcm92aWRlciIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJyZXZpZXdlci5uYW1lIiwibGFiZWwiOiJSZXZpZXdlZCBCeSIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJyZXZpZXdlcl9ub3RlcyIsImxhYmVsIjoiTm90ZXMiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfV0sIjBlMWVhMmQyYWI2YTU4N2VhNDhjOTk2ZTcxODc4ZTcwX3Blcl9wYWdlIjoiNTAifSwiZmlsYW1lbnQiOltdfQ==', 1791303938),
('Wj7VPQuHcR3y1eHWxRFvB0b4nbV8amrTcmYBquyw', 5, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/154.0.0.0 Safari/537.36 Edg/154.0.0.0', 'eyJfdG9rZW4iOiIzYkJObnRXNHBiWldIUkNwamY0R1JCYjAxWkFxZHJ0OGFSbHJjN25GIiwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL2FkbWluXC9zZXR0bGVkLWNsYWltcyIsInJvdXRlIjoiZmlsYW1lbnQuYWRtaW4ucmVzb3VyY2VzLnNldHRsZWQtY2xhaW1zLmluZGV4In0sImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjo1LCJwYXNzd29yZF9oYXNoX3dlYiI6Ijg3MDE4MTVhOWExZTlkOWQxMWFlMWYwM2UxNmNhZDQ5NzQ2OWUwZDQ4YzFhZmYxMTMzNTc1MDY4NGE0OWQ5OTEiLCJ0YWJsZXMiOnsiMjY0MzgxOWE4NzY3MzkyYjM4MzBkYTE1ZGFhNGI1MmZfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJtZW1iZXIubWVtYmVyX0lEIiwibGFiZWwiOiJNZW1iZXIgSUQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibWVtYmVyLm5hbWUiLCJsYWJlbCI6Ik1lbWJlciBOYW1lIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6InNlcnZpY2VfZGF0ZSIsImxhYmVsIjoiU2VydmljZSBEYXRlIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImNsYWltZWRfYW1vdW50IiwibGFiZWwiOiJDbGFpbWVkIEFtb3VudCIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJwcm92aWRlci5uYW1lIiwibGFiZWwiOiJwcm92aWRlciIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9LHsidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdGF0dXMiLCJsYWJlbCI6IlN0YXR1cyIsImlzSGlkZGVuIjpmYWxzZSwiaXNUb2dnbGVkIjp0cnVlLCJpc1RvZ2dsZWFibGUiOmZhbHNlLCJpc1RvZ2dsZWRIaWRkZW5CeURlZmF1bHQiOm51bGx9XSwiMGUxZWEyZDJhYjZhNTg3ZWE0OGM5OTZlNzE4NzhlNzBfY29sdW1ucyI6W3sidHlwZSI6ImNvbHVtbiIsIm5hbWUiOiJzdGF0ZW1lbnQuc3RhdGVtZW50X251bWJlciIsImxhYmVsIjoiU3RhdGVtZW50ICMiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoibWVtYmVyLm1lbWJlcl9JRCIsImxhYmVsIjoiTWVtYmVyIElEIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImNsYWltZWRfYW1vdW50IiwibGFiZWwiOiJDbGFpbWVkIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH0seyJ0eXBlIjoiY29sdW1uIiwibmFtZSI6ImFwcHJvdmVkX2Ftb3VudCIsImxhYmVsIjoiQXBwcm92ZWQiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoic3RhdHVzIiwibGFiZWwiOiJGaW5hbCBTdGF0dXMiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoicHJvdmlkZXIubmFtZSIsImxhYmVsIjoicHJvdmlkZXIiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoicmV2aWV3ZXIubmFtZSIsImxhYmVsIjoiUmV2aWV3ZWQgQnkiLCJpc0hpZGRlbiI6ZmFsc2UsImlzVG9nZ2xlZCI6dHJ1ZSwiaXNUb2dnbGVhYmxlIjpmYWxzZSwiaXNUb2dnbGVkSGlkZGVuQnlEZWZhdWx0IjpudWxsfSx7InR5cGUiOiJjb2x1bW4iLCJuYW1lIjoicmV2aWV3ZXJfbm90ZXMiLCJsYWJlbCI6Ik5vdGVzIiwiaXNIaWRkZW4iOmZhbHNlLCJpc1RvZ2dsZWQiOnRydWUsImlzVG9nZ2xlYWJsZSI6ZmFsc2UsImlzVG9nZ2xlZEhpZGRlbkJ5RGVmYXVsdCI6bnVsbH1dfSwiZmlsYW1lbnQiOltdfQ==', 1791303854);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('adm','doc','prv') NOT NULL DEFAULT 'doc',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `role`, `email_verified_at`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin@admin.com', '$2y$12$m4ujfI6d1kr3uekB2hskfOrLSM12U.PlQVKCMD21/hoXuYJd9FRty', 'adm', NULL, NULL, '2026-10-01 17:34:26', '2026-10-01 17:34:26'),
(2, 'doctor_1', 'doctor_1@admin.com', '$2y$12$sqwhntRJy.d6RnAoJMJR1OSCttZD6Y0qY7VGK7jG7skITautuRATG', 'doc', NULL, NULL, '2026-10-01 20:07:14', '2026-10-02 12:02:41'),
(3, 'hos_1', 'hos_1@admin.com', '$2y$12$RZDTKi2tPszpg8a1O9hdper1GGIa1se1G2s18CpfGZFilKbKQ3tVK', 'prv', NULL, 'aDfIIaCc9zkrcFc2o9Z5yraCIjGeY0glJMM5D1AAQCvvBCdBtsloSyzSSkwy', '2026-10-01 20:07:29', '2026-10-02 10:29:50'),
(4, 'hos_2', 'hos_2@admin.com', '$2y$12$t2kJSeCGSVixTOdGtP1T5e87fxz7/8Pv.1GZnOXa/EL9jKTpPEOTW', 'prv', NULL, NULL, '2026-10-02 10:30:09', '2026-10-02 10:30:09'),
(5, 'doctor_2', 'doctor_2@admin.com', '$2y$12$hHgRKCGFpUa/0xpRl.i88..PvR5M.ajp7mPTkxTWQqIXg4VwE8WxW', 'doc', NULL, NULL, '2026-10-05 14:54:49', '2026-10-05 14:54:49');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `activity_logs_user_id_foreign` (`user_id`),
  ADD KEY `activity_logs_entity_type_entity_id_index` (`entity_type`,`entity_id`);

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
-- Indexes for table `claims`
--
ALTER TABLE `claims`
  ADD PRIMARY KEY (`id`),
  ADD KEY `claims_member_id_foreign` (`member_id`),
  ADD KEY `claims_provider_id_foreign` (`provider_id`),
  ADD KEY `claims_reviewer_id_foreign` (`reviewer_id`),
  ADD KEY `claims_statement_id_foreign` (`statement_id`);

--
-- Indexes for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `claim_attachments_claim_id_foreign` (`claim_id`);

--
-- Indexes for table `claim_statements`
--
ALTER TABLE `claim_statements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `claim_statements_statement_number_unique` (`statement_number`),
  ADD KEY `claim_statements_provider_id_foreign` (`provider_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_email_unique` (`email`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  ADD KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`);

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
-- Indexes for table `members`
--
ALTER TABLE `members`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `members_member_id_unique` (`member_ID`),
  ADD UNIQUE KEY `members_family_id_unique` (`family_ID`),
  ADD KEY `members_company_id_foreign` (`company_id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

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
-- AUTO_INCREMENT for table `activity_logs`
--
ALTER TABLE `activity_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `claims`
--
ALTER TABLE `claims`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `claim_statements`
--
ALTER TABLE `claim_statements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
-- AUTO_INCREMENT for table `members`
--
ALTER TABLE `members`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `activity_logs`
--
ALTER TABLE `activity_logs`
  ADD CONSTRAINT `activity_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `claims_member_id_foreign` FOREIGN KEY (`member_id`) REFERENCES `members` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `claims_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `claims_reviewer_id_foreign` FOREIGN KEY (`reviewer_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `claims_statement_id_foreign` FOREIGN KEY (`statement_id`) REFERENCES `claim_statements` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `claim_attachments`
--
ALTER TABLE `claim_attachments`
  ADD CONSTRAINT `claim_attachments_claim_id_foreign` FOREIGN KEY (`claim_id`) REFERENCES `claims` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `claim_statements`
--
ALTER TABLE `claim_statements`
  ADD CONSTRAINT `claim_statements_provider_id_foreign` FOREIGN KEY (`provider_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `members`
--
ALTER TABLE `members`
  ADD CONSTRAINT `members_company_id_foreign` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
