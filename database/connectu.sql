-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 17, 2023 at 03:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `connectu`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `username` varchar(40) DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `username`, `email_verified_at`, `image`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', 'admin@example.com', 'admin', NULL, '635ce2abe4bf81667031723.png', '$2y$10$ZOWPSwbB7098UQHq/GZX5uGq43wfuDDjMBNASktSNK55T/4jC/xvy', 'PprsaXdpzCCsHib8OLlOuw0mX4rELgme0l4vdZOPkhbbVKdLwYtWU3UYMoxB', NULL, '2023-01-14 08:18:34');

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) DEFAULT NULL,
  `read_status` tinyint(1) NOT NULL DEFAULT 0,
  `click_url` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_notifications`
--

INSERT INTO `admin_notifications` (`id`, `user_id`, `title`, `read_status`, `click_url`, `created_at`, `updated_at`) VALUES
(1, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-01-21 07:29:16', '2023-01-21 07:29:16'),
(2, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-01-21 07:40:48', '2023-01-21 07:40:48'),
(3, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-01-21 07:43:51', '2023-01-21 07:43:51'),
(4, 32, 'New member registered', 0, '/admin/manage/users/detail/32', '2023-03-22 04:09:55', '2023-03-22 04:09:55'),
(5, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-03-22 04:09:57', '2023-03-22 04:09:57'),
(6, 32, 'Deposit request from testuser1', 0, '/admin/manage/deposits/details/64', '2023-05-27 02:51:35', '2023-05-27 02:51:35'),
(7, 0, 'SMTP Error: Could not connect to SMTP host. Failed to connect to server', 0, '#', '2023-05-27 02:51:35', '2023-05-27 02:51:35'),
(8, 33, 'New member registered', 0, '/admin/manage/users/detail/33', '2023-09-16 23:24:11', '2023-09-16 23:24:11');

-- --------------------------------------------------------

--
-- Table structure for table `admin_password_resets`
--

CREATE TABLE `admin_password_resets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin_password_resets`
--

INSERT INTO `admin_password_resets` (`id`, `email`, `token`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin@example.com', '427158', 0, '2023-09-14 04:37:08', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL,
  `duration` int(11) NOT NULL,
  `max_show` int(11) NOT NULL,
  `showed` int(11) DEFAULT NULL,
  `ads_type` int(11) DEFAULT NULL COMMENT '1=>link|2=>image|3=>script 4=youtube',
  `ads_body` longtext DEFAULT NULL,
  `remain` int(11) NOT NULL COMMENT 'max_show-showed',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `user_id`, `title`, `amount`, `duration`, `max_show`, `showed`, `ads_type`, `ads_body`, `remain`, `status`, `created_at`, `updated_at`) VALUES
(38, 33, 'Test', '5.00000000', 10, 100, NULL, 1, 'https://wstacks.com/', 100, 1, '2023-09-17 05:08:17', '2023-09-17 05:08:17'),
(39, 33, 'Test3', '5.00000000', 10, 100, NULL, 1, 'https://wstacks.com/', 100, 1, '2023-09-17 05:08:30', '2023-09-17 05:45:02');

-- --------------------------------------------------------

--
-- Table structure for table `commission_logs`
--

CREATE TABLE `commission_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `from_id` int(11) NOT NULL,
  `to_id` int(11) NOT NULL,
  `level` varchar(191) NOT NULL,
  `amount` decimal(11,2) NOT NULL,
  `type` varchar(40) NOT NULL,
  `details` varchar(255) NOT NULL,
  `trx` varchar(191) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `method_code` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `method_currency` varchar(40) DEFAULT NULL,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `final_amo` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `detail` text DEFAULT NULL,
  `btc_amo` varchar(255) DEFAULT NULL,
  `btc_wallet` varchar(255) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `try` int(10) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel',
  `from_api` tinyint(1) NOT NULL DEFAULT 0,
  `admin_feedback` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `deposits`
--

INSERT INTO `deposits` (`id`, `user_id`, `method_code`, `amount`, `method_currency`, `charge`, `rate`, `final_amo`, `detail`, `btc_amo`, `btc_wallet`, `trx`, `try`, `status`, `from_api`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 8, 103, '20.00000000', 'USD', '2.00000000', '1.00000000', '102.00000000', NULL, '0', '', 'XN7REMJGE4C4', 0, 1, 0, NULL, '2022-01-05 12:12:50', '2022-03-30 12:12:50'),
(2, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', '[{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"asdfasdf\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/03\\/30\\/62446a3b559711648650811.jpg\"}]', '0', '', 'R3G56TCAUJMM', 0, 1, 0, 'sdfgsdfgsd', '2022-05-04 13:03:24', '2022-03-30 13:04:13'),
(3, 8, 1000, '100.00000000', 'USD', '0.58000000', '1.00000000', '100.58000000', '[{\"name\":\"Send From Number\",\"type\":\"text\",\"value\":\"sdfg\"},{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"asdfasdf\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/03\\/30\\/62446a83a6cdb1648650883.jpg\"}]', '0', '', 'QR37YU2V2MAA', 0, 1, 0, NULL, '2022-03-30 13:04:37', '2022-03-30 13:04:43'),
(4, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', '[{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"asdfasdf\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/04\\/02\\/6247e7d13a7001648879569.pdf\"}]', '0', '', 'NHFHX4TO5ETR', 0, 1, 0, NULL, '2022-04-02 04:35:26', '2022-04-02 04:36:09'),
(5, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', '[{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"asdfasdf\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/04\\/02\\/6247e7fa216ab1648879610.pdf\"}]', '0', '', '6RQ5DFRGCDVH', 0, 1, 0, NULL, '2022-04-02 04:36:23', '2022-04-02 04:36:50'),
(6, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', '[{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"asdfasdf\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/04\\/02\\/6247e8dc05b9a1648879836.PDF\"}]', '0', '', 'WD65AUAU418T', 0, 1, 0, NULL, '2022-04-02 04:37:08', '2022-04-02 04:40:36'),
(7, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', NULL, '0', '', 'QFQ1J7GJ4AX2', 0, 1, 0, NULL, '2022-06-09 04:40:54', '2022-04-02 04:40:54'),
(8, 8, 501, '1.00000000', 'BTC', '11.01000000', '1.00000000', '12.01000000', NULL, '0', '', 'OEW63JWSU8Q7', 0, 0, 0, NULL, '2022-04-04 06:58:01', '2022-04-04 06:58:01'),
(9, 8, 501, '1.00000000', 'BTC', '11.01000000', '1.00000000', '12.01000000', NULL, '0', '', 'CWQAFRUY2CYN', 0, 0, 0, NULL, '2022-04-04 06:58:46', '2022-04-04 06:58:46'),
(10, 8, 506, '10.00000000', 'USD', '2.00000000', '10.00000000', '120.00000000', NULL, '0', '', '8HFWBM1HKGXZ', 0, 0, 0, NULL, '2022-04-04 07:00:22', '2022-04-04 07:00:22'),
(11, 8, 506, '10.00000000', 'USD', '2.00000000', '10.00000000', '120.00000000', NULL, '0', '', 'KBWTC2PFT3Y4', 0, 0, 0, NULL, '2022-04-04 07:00:49', '2022-04-04 07:00:49'),
(12, 8, 1001, '10.00000000', 'USD', '5.10000000', '1.00000000', '15.10000000', '[{\"name\":\"Transaction Number\",\"type\":\"text\",\"value\":\"66\"},{\"name\":\"Screenshot\",\"type\":\"file\",\"value\":\"2022\\/04\\/11\\/6253b35a2066f1649652570.jpg\"},{\"name\":\"asdf\",\"type\":\"file\",\"value\":\"2022\\/04\\/11\\/6253b35a48fe31649652570.png\"}]', '0', '', 'F75X3ZFZJJXM', 0, 2, 0, NULL, '2022-04-11 03:16:59', '2022-04-11 03:19:30'),
(13, 8, 108, '100.00000000', 'USD', '1.00000000', '1.00000000', '101.00000000', NULL, '0', '', '1M4GTD3568MO', 0, 0, 0, NULL, '2022-05-08 10:25:41', '2022-05-08 10:25:41'),
(52, 60, 1000, '10000.00000000', 'TK', '510.00000000', '100.00000000', '1051000.00000000', '[]', '0', '', '2K4E2V4T49YB', 0, 1, 0, NULL, '2022-11-09 03:11:15', '2022-11-09 03:12:13'),
(53, 62, 1000, '10000.00000000', 'TK', '510.00000000', '100.00000000', '1051000.00000000', '[]', '0', '', 'P5X4QSWBKT48', 0, 1, 0, NULL, '2022-11-09 03:36:14', '2022-11-09 03:36:45'),
(54, 63, 1000, '10000.00000000', 'TK', '510.00000000', '100.00000000', '1051000.00000000', '[]', '0', '', 'DDN2MOS9ECB3', 0, 1, 0, NULL, '2022-11-09 03:55:36', '2022-11-09 03:55:53'),
(55, 60, 1000, '500.00000000', 'TK', '35.00000000', '100.00000000', '53500.00000000', '[]', '0', '', 'CCRSGBFT6N2K', 0, 1, 0, NULL, '2022-11-09 04:39:26', '2022-11-09 04:39:39'),
(56, 60, 1000, '500.00000000', 'TK', '35.00000000', '100.00000000', '53500.00000000', '[]', '0', '', 'DKSDCBGY8RVF', 0, 1, 0, NULL, '2022-11-09 08:37:31', '2022-11-09 11:12:32'),
(57, 60, 1000, '500.00000000', 'TK', '35.00000000', '100.00000000', '53500.00000000', NULL, '0', '', 'CEW5EHBF47JB', 0, 0, 0, NULL, '2022-11-09 08:43:04', '2022-11-09 08:43:04'),
(58, 64, 1000, '10000.00000000', 'TK', '510.00000000', '100.00000000', '1051000.00000000', '[]', '0', '', 'WF6PH46P55JB', 0, 1, 0, NULL, '2022-11-09 10:39:59', '2022-11-09 10:40:28'),
(59, 65, 1000, '10000.00000000', 'TK', '510.00000000', '100.00000000', '1051000.00000000', '[]', '0', '', 'TZ6FE3TO2EE2', 0, 1, 0, NULL, '2022-11-09 11:12:04', '2022-11-09 11:13:15'),
(60, 66, 1000, '50000.00000000', 'TK', '2510.00000000', '100.00000000', '5251000.00000000', '[]', '0', '', 'H5U92ODF7BQP', 0, 1, 0, NULL, '2022-11-14 04:34:08', '2022-11-14 04:34:27'),
(61, 60, 114, '5000.00000000', 'USD', '260.00000000', '100.00000000', '526000.00000000', NULL, '0', 'cs_test_a1kTQYYmEI7ImJRadDutBu64CCdtAULEnvTu18PdlvGu4c59bVwjAQOzcP', 'DUANPRNU9VQP', 0, 0, 0, NULL, '2022-11-14 05:40:40', '2022-11-14 05:40:43'),
(62, 60, 1000, '500.00000000', 'TK', '35.00000000', '100.00000000', '53500.00000000', '[]', '0', '', '314RWBNG3C4U', 0, 2, 0, NULL, '2022-11-14 10:28:25', '2022-11-14 10:28:27'),
(63, 60, 101, '500.00000000', 'USD', '35.00000000', '80.00000000', '42800.00000000', NULL, '0', '', '88OMNT4KYEB3', 0, 0, 0, NULL, '2022-11-14 10:29:03', '2022-11-14 10:29:03'),
(64, 32, 1002, '100.00000000', 'BDT', '0.00000000', '107.00000000', '10700.00000000', '[{\"name\":\"Transaction ID\",\"type\":\"text\",\"value\":\"2534523452345\"}]', '0', '', '27MPFMEBEG2U', 0, 2, 0, NULL, '2023-05-27 02:51:18', '2023-05-27 02:51:35'),
(65, 32, 101, '20.00000000', 'USD', '0.00000000', '1.00000000', '20.00000000', NULL, '0', '', 'NEVXEPRGTTJA', 0, 0, 0, NULL, '2023-08-09 04:07:48', '2023-08-09 04:07:48');

-- --------------------------------------------------------

--
-- Table structure for table `extensions`
--

CREATE TABLE `extensions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `script` text DEFAULT NULL,
  `shortcode` text DEFAULT NULL COMMENT 'object',
  `support` text DEFAULT NULL COMMENT 'help section',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `extensions`
--

INSERT INTO `extensions` (`id`, `act`, `name`, `description`, `image`, `script`, `shortcode`, `support`, `status`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'tawk-chat', 'Live Chat(Tawk.to)', 'Key location is shown bellow', 'chat-png.png', '<script>\n                        var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();\n                        (function(){\n                        var s1=document.createElement(\"script\"),s0=document.getElementsByTagName(\"script\")[0];\n                        s1.async=true;\n                        s1.src=\"https://embed.tawk.to/{{app_key}}\";\n                        s1.charset=\"UTF-8\";\n                        s1.setAttribute(\"crossorigin\",\"*\");\n                        s0.parentNode.insertBefore(s1,s0);\n                        })();\n                    </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"55\"}}', 'twak.png', 0, NULL, '2019-10-18 23:16:05', '2023-03-22 06:04:56'),
(2, 'google-recaptcha2', 'Google Recaptcha 2', 'Key location is shown bellow', 'recaptcha2.png', '\n<script src=\"https://www.google.com/recaptcha/api.js\"></script>\n<div class=\"g-recaptcha\" data-sitekey=\"{{site_key}}\" data-callback=\"verifyCaptcha\"></div>\n<div id=\"g-recaptcha-error\"></div>', '{\"site_key\":{\"title\":\"Site Key\",\"value\":\"6LdPC88fAAAAADQlUf_DV6Hrvgm-pZuLJFSLDOWV\"},\"secret_key\":{\"title\":\"Secret Key\",\"value\":\"6LdPC88fAAAAAG5SVaRYDnV2NpCrptLg2XLYKRKB\"}}', 'recaptcha.png', 0, NULL, '2019-10-18 23:16:05', '2022-05-08 04:01:36'),
(7, 'google-analytics', 'Google Analytics', 'Key location is shown bellow', 'google_analytics.png', '<script async src=\"https://www.googletagmanager.com/gtag/js?id={{app_key}}\"></script>\r\n                <script>\r\n                  window.dataLayer = window.dataLayer || [];\r\n                  function gtag(){dataLayer.push(arguments);}\r\n                  gtag(\"js\", new Date());\r\n                \r\n                  gtag(\"config\", \"{{app_key}}\");\r\n                </script>', '{\"app_key\":{\"title\":\"App Key\",\"value\":\"----\"}}', 'ganalytics.png', 0, NULL, '2019-10-18 23:16:05', '2023-09-14 05:24:33');

-- --------------------------------------------------------

--
-- Table structure for table `forms`
--

CREATE TABLE `forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `form_data` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `forms`
--

INSERT INTO `forms` (`id`, `act`, `form_data`, `created_at`, `updated_at`) VALUES
(2, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_22\":{\"name\":\"NID Number 22\",\"label\":\"nid_number_22\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"},\"sadfg\":{\"name\":\"sadfg\",\"label\":\"sadfg\",\"is_required\":\"optional\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"asdf\":{\"name\":\"asdf\",\"label\":\"asdf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test2\",\"Test3\"],\"type\":\"select\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"Test 2\",\"Test 3\"],\"type\":\"checkbox\"},\"nid_number_3333\":{\"name\":\"NID Number 3333\",\"label\":\"nid_number_3333\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Test\",\"asdf\"],\"type\":\"radio\"},\"nid_number_3333587\":{\"name\":\"NID Number 3333587\",\"label\":\"nid_number_3333587\",\"is_required\":\"optional\",\"extensions\":\"jpg,bmp,png,pdf\",\"options\":[],\"type\":\"file\"}}', '2022-03-16 01:09:49', '2022-03-17 00:02:54'),
(3, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number_226985\":{\"name\":\"NID Number 226985\",\"label\":\"nid_number_226985\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-16 04:32:29', '2022-03-16 04:35:32'),
(5, 'withdraw_method', '{\"nid_number_33\":{\"name\":\"NID Number 33\",\"label\":\"nid_number_33\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:45:35', '2022-03-17 00:53:17'),
(6, 'withdraw_method', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-17 00:47:04', '2022-03-17 00:47:04'),
(7, 'kyc', '{\"full_name\":{\"name\":\"Full Name\",\"label\":\"full_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"gender\":{\"name\":\"Gender\",\"label\":\"gender\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Male\",\"Female\",\"Others\"],\"type\":\"select\"},\"you_hobby\":{\"name\":\"You Hobby\",\"label\":\"you_hobby\",\"is_required\":\"required\",\"extensions\":null,\"options\":[\"Programming\",\"Gardening\",\"Traveling\",\"Others\"],\"type\":\"checkbox\"},\"nid_photo\":{\"name\":\"NID Photo\",\"label\":\"nid_photo\",\"is_required\":\"required\",\"extensions\":\"jpg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-17 02:56:14', '2022-04-11 03:23:40'),
(8, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:53:25', '2022-03-21 07:53:25'),
(9, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-03-21 07:54:15', '2022-03-21 07:54:15'),
(10, 'manual_deposit', '{\"nid_number\":{\"name\":\"NID Number\",\"label\":\"nid_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"textarea\"}}', '2022-03-21 07:55:15', '2022-03-21 07:55:22'),
(11, 'withdraw_method', '{\"nid_number_2658\":{\"name\":\"NID Number 2658\",\"label\":\"nid_number_2658\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[\"asdf\"],\"type\":\"checkbox\"}}', '2022-03-22 00:14:09', '2022-03-22 00:14:18'),
(12, 'withdraw_method', '[]', '2022-03-30 09:03:12', '2022-03-30 09:03:12'),
(13, 'withdraw_method', '{\"bank_name\":{\"name\":\"Bank Name\",\"label\":\"bank_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_name\":{\"name\":\"Account Name\",\"label\":\"account_name\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"account_number\":{\"name\":\"Account Number\",\"label\":\"account_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:09:11', '2022-09-28 04:05:20'),
(14, 'withdraw_method', '{\"mobile_number\":{\"name\":\"Mobile Number\",\"label\":\"mobile_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"}}', '2022-03-30 09:10:12', '2022-09-29 09:55:20'),
(15, 'manual_deposit', '{\"send_from_number\":{\"name\":\"Send From Number\",\"label\":\"send_from_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,jpeg,png\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:15:27', '2022-03-30 09:15:27'),
(16, 'manual_deposit', '{\"transaction_number\":{\"name\":\"Transaction Number\",\"label\":\"transaction_number\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"text\"},\"screenshot\":{\"name\":\"Screenshot\",\"label\":\"screenshot\",\"is_required\":\"required\",\"extensions\":\"jpg,pdf,docx\",\"options\":[],\"type\":\"file\"}}', '2022-03-30 09:16:43', '2022-04-11 03:19:54'),
(17, 'manual_deposit', '[]', '2022-03-30 09:21:19', '2022-03-30 09:21:19'),
(18, 'manual_deposit', '{\"asdfasddf\":{\"name\":\"asdfasddf\",\"label\":\"asdfasddf\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2022-09-28 04:50:55', '2022-09-28 04:50:55'),
(19, 'manual_deposit', '{\"sadf\":{\"name\":\"sadf\",\"label\":\"sadf\",\"is_required\":\"required\",\"extensions\":null,\"options\":[],\"type\":\"textarea\"}}', '2022-09-28 05:13:04', '2022-09-28 05:13:59'),
(20, 'manual_deposit', '{\"transaction_id\":{\"name\":\"Transaction ID\",\"label\":\"transaction_id\",\"is_required\":\"required\",\"extensions\":\"\",\"options\":[],\"type\":\"text\"}}', '2023-05-27 02:50:43', '2023-05-27 02:50:43');

-- --------------------------------------------------------

--
-- Table structure for table `frontends`
--

CREATE TABLE `frontends` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_keys` varchar(40) DEFAULT NULL,
  `data_values` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `frontends`
--

INSERT INTO `frontends` (`id`, `data_keys`, `data_values`, `created_at`, `updated_at`) VALUES
(1, 'seo.data', '{\"seo_image\":\"1\",\"keywords\":[\"website\",\"services\"],\"description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit\",\"social_title\":\"Minstack Limited\",\"social_description\":\"Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit ff\",\"image\":\"645b7b926567e1683717010.png\"}', '2020-07-04 23:42:52', '2023-05-10 05:10:10'),
(24, 'about.content', '{\"has_image\":\"1\",\"heading\":\"Latest Newsddd\",\"subheading\":\"dddd\",\"description\":\"fdg sdfgsdf g gggddd\",\"about_icon\":\"<i class=\\\"fab fa-accusoft\\\"><\\/i>\",\"background_image\":\"60951a84abd141620384388.png\",\"about_image\":\"5f9914e907ace1603867881.jpg\"}', '2020-10-28 00:51:20', '2023-05-10 02:06:51'),
(25, 'blog.content', '{\"heading\":\"Latest News\",\"subheading\":\"------ddd\"}', '2020-10-28 00:51:34', '2023-03-21 08:44:54'),
(26, 'blog.element', '{\"has_image\":[\"1\",\"1\"],\"title\":\"This is a Blog Post\",\"description\":\"This is a Blog Post\",\"description_nic\":\"<p>This is a Blog Post<\\/p>\",\"blog_icon\":\"<i class=\\\"fab fa-accusoft\\\"><\\/i>\",\"blog_image_1\":\"5f99164f1baec1603868239.jpg\",\"blog_image_2\":\"5ff2e146346d21609752902.jpg\"}', '2020-10-28 00:57:19', '2022-09-29 10:05:34'),
(27, 'contact_us.content', '{\"title\":\"Auctor gravida vestibulu\",\"short_details\":\"Auctor gravida vestibulu\",\"email_address\":\"admin@test.com\",\"contact_details\":\"688967896896\",\"contact_number\":\"9876897689698\",\"latitude\":\"876768\",\"longitude\":\"67867868\",\"website_footer\":\"<p>Copyright 2022. All rights reserved.<\\/p>\"}', '2020-10-28 00:59:19', '2022-09-28 14:01:44'),
(28, 'counter.content', '{\"heading\":\"Clients\",\"subheading\":\"Auctor gravida vestibulu\"}', '2020-10-28 01:04:02', '2022-09-28 14:02:14'),
(31, 'social_icon.element', '{\"title\":\"Facebook\",\"social_icon\":\"<i class=\\\"fab fa-facebook-f\\\"><\\/i>\",\"url\":\"https:\\/\\/www.google.com\\/\"}', '2020-11-12 04:07:30', '2022-09-30 09:38:49'),
(33, 'feature.content', '{\"heading\":\"asdf\",\"sub_heading\":\"asdf\"}', '2021-01-03 23:40:54', '2021-01-03 23:40:55'),
(34, 'feature.element', '{\"title\":\"asdf\",\"description\":\"asdf\",\"feature_icon\":\"asdf\"}', '2021-01-03 23:41:02', '2021-01-03 23:41:02'),
(35, 'service.element', '{\"trx_type\":\"withdraw\",\"service_icon\":\"<i class=\\\"las la-highlighter\\\"><\\/i>\",\"title\":\"asdfasdf\",\"description\":\"asdfasdfasdfasdf\"}', '2021-03-06 01:12:10', '2021-03-06 01:12:10'),
(36, 'service.content', '{\"trx_type\":\"deposit\",\"heading\":\"asdf fffff\",\"subheading\":\"555\"}', '2021-03-06 01:27:34', '2022-03-30 08:07:06'),
(39, 'banner.content', '{\"heading\":\"Latest News\",\"subheading\":\"Lorem, Ipsum Dolor Sit Amet Consectetur Adipisicing Elit. Quod, Minus?\"}', '2021-05-02 06:09:30', '2023-03-21 08:44:46'),
(41, 'cookie.data', '{\"short_desc\":\"We use cookies to enhance your browsing experience, serve personalized ads or content, and analyze our traffic. By clicking \\\"Accept\\\", you consent to our use of cookies.\",\"description\":\"<h4>GDPR, cookies and compliance&nbsp;<\\/h4><ul><li>The&nbsp;General Data Protection Regulation (GDPR)&nbsp;is an EU legislation that governs all collection and processing of personal data from individuals inside the EU.<\\/li><li>Under the EU\\u2019s GDPR, it is the&nbsp;legal responsibility of website owners and operators&nbsp;to make sure that personal data is collected and processed lawfully.<\\/li><li>A website outside of the EU is required to comply with the GDPR if it collects&nbsp;data from users inside the EU.<\\/li><\\/ul><p>&nbsp;<\\/p><p>Even though cookies are mentioned only once in the GDPR,&nbsp;cookie consent&nbsp;is nonetheless a cornerstone of compliance for websites with EU-located users.<\\/p><p>This is because&nbsp;one of the most common ways for personal data to be collected and shared online is through website cookies. The GDPR sets out specific rules for the use of cookies.<\\/p><p>That\\u2019s why end-user consent to cookies is the GDPR\\u2019s most used legal basis that allows websites to process personal data and use cookies.&nbsp;<\\/p>\",\"status\":1}', '2020-07-04 23:42:52', '2023-02-18 09:03:29'),
(42, 'policy_pages.element', '{\"title\":\"Privacy Policy\",\"details\":\"<h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>\\u00a0<\\/p><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.\\u00a0<\\/p><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:50:42', '2022-12-17 06:01:31'),
(43, 'policy_pages.element', '{\"title\":\"Terms of Service\",\"details\":\"<h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.<\\/p><p>\\u00a0<\\/p><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><ul><li>Consequuntur quia consequuntur\\u00a0<\\/li><li>Eos qui ratione voluptatem\\u00a0<\\/li><li>Dolores eos qui ratione voluptatem<\\/li><li>Quis autem vel eum iure\\u00a0<\\/li><\\/ul><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p><p>\\u00a0<\\/p><h3><strong>Sed ut perspiciatis unde omnis iste\\u00a0<\\/strong><\\/h3><p>natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est.\\u00a0<\\/p><p>\\u00a0<\\/p><h3><strong>Nisi ut aliquid ex ea commodi consequatur<\\/strong><\\/h3><p>qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?<\\/p>\"}', '2021-06-09 08:51:18', '2022-12-17 06:01:43'),
(44, 'maintenance.data', '{\"description\":\"<div class=\\\"mb-5\\\" style=\\\"color: rgb(111, 111, 111); font-family: Nunito, sans-serif; margin-bottom: 3rem !important;\\\"><h3 class=\\\"mb-3\\\" style=\\\"text-align: center; font-weight: 600; line-height: 1.3; font-size: 24px; font-family: Exo, sans-serif; color: rgb(54, 54, 54);\\\">What information do we collect?<\\/h3><p class=\\\"font-18\\\" style=\\\"text-align: center; margin-right: 0px; margin-left: 0px; font-size: 18px !important;\\\">We gather data from you when you register on our site, submit a request, buy any services, react to an overview, or round out a structure. At the point when requesting any assistance or enrolling on our site, as suitable, you might be approached to enter your: name, email address, or telephone number. You may, nonetheless, visit our site anonymously.<\\/p><\\/div>\"}', '2020-07-04 23:42:52', '2022-05-11 03:57:17'),
(45, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(46, 'feature.element', '{\"title\":\"sytry\",\"description\":\"ertyerty\",\"feature_icon\":\"<i class=\\\"fas fa-address-book\\\"><\\/i>\"}', '2022-10-17 10:23:22', '2022-10-17 10:23:22'),
(51, 'blog.element', '{\"has_image\":[\"1\"],\"title\":\"dd\",\"description\":\"<p>ffaa<\\/p>\",\"blog_image\":\"641991bc922611679397308.png\"}', '2023-03-21 08:45:08', '2023-03-21 08:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `gateways`
--

CREATE TABLE `gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `code` int(10) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `alias` varchar(40) NOT NULL DEFAULT 'NULL',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '1=>enable, 2=>disable',
  `gateway_parameters` text DEFAULT NULL,
  `supported_currencies` text DEFAULT NULL,
  `crypto` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: fiat currency, 1: crypto currency',
  `extra` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateways`
--

INSERT INTO `gateways` (`id`, `form_id`, `code`, `name`, `alias`, `status`, `gateway_parameters`, `supported_currencies`, `crypto`, `extra`, `description`, `created_at`, `updated_at`) VALUES
(1, 0, 101, 'Paypal', 'Paypal', 1, '{\"paypal_email\":{\"title\":\"PayPal Email\",\"global\":true,\"value\":\"sb-58ira22618401@business.example.com\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:03:45'),
(2, 0, 102, 'Perfect Money', 'PerfectMoney', 1, '{\"passphrase\":{\"title\":\"ALTERNATE PASSPHRASE\",\"global\":true,\"value\":\"---------------------\"},\"wallet_id\":{\"title\":\"PM Wallet\",\"global\":false,\"value\":\"\"}}', '{\"USD\":\"$\",\"EUR\":\"\\u20ac\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:01'),
(3, 0, 105, 'PayTM', 'Paytm', 1, '{\"MID\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"-----------\"},\"merchant_key\":{\"title\":\"Merchant Key\",\"global\":true,\"value\":\"--------------------\"},\"WEBSITE\":{\"title\":\"Paytm Website\",\"global\":true,\"value\":\"example.com\"},\"INDUSTRY_TYPE_ID\":{\"title\":\"Industry Type\",\"global\":true,\"value\":\"Retail\"},\"CHANNEL_ID\":{\"title\":\"CHANNEL ID\",\"global\":true,\"value\":\"WEB\"},\"transaction_url\":{\"title\":\"Transaction URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/oltp-web\\/processTransaction\"},\"transaction_status_url\":{\"title\":\"Transaction STATUS URL\",\"global\":true,\"value\":\"https:\\/\\/pguat.paytm.com\\/paytmchecksum\\/paytmCallback.jsp\"}}', '{\"AUD\":\"AUD\",\"ARS\":\"ARS\",\"BDT\":\"BDT\",\"BRL\":\"BRL\",\"BGN\":\"BGN\",\"CAD\":\"CAD\",\"CLP\":\"CLP\",\"CNY\":\"CNY\",\"COP\":\"COP\",\"HRK\":\"HRK\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EGP\":\"EGP\",\"EUR\":\"EUR\",\"GEL\":\"GEL\",\"GHS\":\"GHS\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"KES\":\"KES\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"MAD\":\"MAD\",\"NPR\":\"NPR\",\"NZD\":\"NZD\",\"NGN\":\"NGN\",\"NOK\":\"NOK\",\"PKR\":\"PKR\",\"PEN\":\"PEN\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"RON\":\"RON\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"ZAR\":\"ZAR\",\"KRW\":\"KRW\",\"LKR\":\"LKR\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"TRY\":\"TRY\",\"UGX\":\"UGX\",\"UAH\":\"UAH\",\"AED\":\"AED\",\"GBP\":\"GBP\",\"USD\":\"USD\",\"VND\":\"VND\",\"XOF\":\"XOF\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:10:37'),
(4, 0, 107, 'PayStack', 'Paystack', 1, '{\"public_key\":{\"title\":\"Public key\",\"global\":true,\"value\":\"--------\"},\"secret_key\":{\"title\":\"Secret key\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"NGN\":\"NGN\"}', 0, '{\"callback\":{\"title\": \"Callback URL\",\"value\":\"ipn.Paystack\"},\"webhook\":{\"title\": \"Webhook URL\",\"value\":\"ipn.Paystack\"}}\r\n', NULL, '2019-09-14 13:14:22', '2022-11-26 07:49:18'),
(5, 0, 108, 'VoguePay', 'Voguepay', 1, '{\"merchant_id\":{\"title\":\"MERCHANT ID\",\"global\":true,\"value\":\"-------------------\"}}', '{\"USD\":\"USD\",\"GBP\":\"GBP\",\"EUR\":\"EUR\",\"GHS\":\"GHS\",\"NGN\":\"NGN\",\"ZAR\":\"ZAR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 07:50:14'),
(6, 0, 109, 'Flutterwave', 'Flutterwave', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"----------------\"},\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"-----------------------\"},\"encryption_key\":{\"title\":\"Encryption Key\",\"global\":true,\"value\":\"------------------\"}}', '{\"BIF\":\"BIF\",\"CAD\":\"CAD\",\"CDF\":\"CDF\",\"CVE\":\"CVE\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"GHS\":\"GHS\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"KES\":\"KES\",\"LRD\":\"LRD\",\"MWK\":\"MWK\",\"MZN\":\"MZN\",\"NGN\":\"NGN\",\"RWF\":\"RWF\",\"SLL\":\"SLL\",\"STD\":\"STD\",\"TZS\":\"TZS\",\"UGX\":\"UGX\",\"USD\":\"USD\",\"XAF\":\"XAF\",\"XOF\":\"XOF\",\"ZMK\":\"ZMK\",\"ZMW\":\"ZMW\",\"ZWD\":\"ZWD\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-06-05 11:37:45'),
(7, 0, 110, 'RazorPay', 'Razorpay', 1, '{\"key_id\":{\"title\":\"Key Id\",\"global\":true,\"value\":\"------------\"},\"key_secret\":{\"title\":\"Key Secret \",\"global\":true,\"value\":\"--------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-21 02:51:32'),
(8, 0, 112, 'Instamojo', 'Instamojo', 1, '{\"api_key\":{\"title\":\"API KEY\",\"global\":true,\"value\":\"------------\"},\"auth_token\":{\"title\":\"Auth Token\",\"global\":true,\"value\":\"---------\"},\"salt\":{\"title\":\"Salt\",\"global\":true,\"value\":\"-------\"}}', '{\"INR\":\"INR\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2022-11-26 08:00:15'),
(9, 0, 503, 'CoinPayments', 'Coinpayments', 1, '{\"public_key\":{\"title\":\"Public Key\",\"global\":true,\"value\":\"---------------\"},\"private_key\":{\"title\":\"Private Key\",\"global\":true,\"value\":\"------------\"},\"merchant_id\":{\"title\":\"Merchant ID\",\"global\":true,\"value\":\"----------------\"}}', '{\"BTC\":\"Bitcoin\",\"BTC.LN\":\"Bitcoin (Lightning Network)\",\"LTC\":\"Litecoin\",\"CPS\":\"CPS Coin\",\"VLX\":\"Velas\",\"APL\":\"Apollo\",\"AYA\":\"Aryacoin\",\"BAD\":\"Badcoin\",\"BCD\":\"Bitcoin Diamond\",\"BCH\":\"Bitcoin Cash\",\"BCN\":\"Bytecoin\",\"BEAM\":\"BEAM\",\"BITB\":\"Bean Cash\",\"BLK\":\"BlackCoin\",\"BSV\":\"Bitcoin SV\",\"BTAD\":\"Bitcoin Adult\",\"BTG\":\"Bitcoin Gold\",\"BTT\":\"BitTorrent\",\"CLOAK\":\"CloakCoin\",\"CLUB\":\"ClubCoin\",\"CRW\":\"Crown\",\"CRYP\":\"CrypticCoin\",\"CRYT\":\"CryTrExCoin\",\"CURE\":\"CureCoin\",\"DASH\":\"DASH\",\"DCR\":\"Decred\",\"DEV\":\"DeviantCoin\",\"DGB\":\"DigiByte\",\"DOGE\":\"Dogecoin\",\"EBST\":\"eBoost\",\"EOS\":\"EOS\",\"ETC\":\"Ether Classic\",\"ETH\":\"Ethereum\",\"ETN\":\"Electroneum\",\"EUNO\":\"EUNO\",\"EXP\":\"EXP\",\"Expanse\":\"Expanse\",\"FLASH\":\"FLASH\",\"GAME\":\"GameCredits\",\"GLC\":\"Goldcoin\",\"GRS\":\"Groestlcoin\",\"KMD\":\"Komodo\",\"LOKI\":\"LOKI\",\"LSK\":\"LSK\",\"MAID\":\"MaidSafeCoin\",\"MUE\":\"MonetaryUnit\",\"NAV\":\"NAV Coin\",\"NEO\":\"NEO\",\"NMC\":\"Namecoin\",\"NVST\":\"NVO Token\",\"NXT\":\"NXT\",\"OMNI\":\"OMNI\",\"PINK\":\"PinkCoin\",\"PIVX\":\"PIVX\",\"POT\":\"PotCoin\",\"PPC\":\"Peercoin\",\"PROC\":\"ProCurrency\",\"PURA\":\"PURA\",\"QTUM\":\"QTUM\",\"RES\":\"Resistance\",\"RVN\":\"Ravencoin\",\"RVR\":\"RevolutionVR\",\"SBD\":\"Steem Dollars\",\"SMART\":\"SmartCash\",\"SOXAX\":\"SOXAX\",\"STEEM\":\"STEEM\",\"STRAT\":\"STRAT\",\"SYS\":\"Syscoin\",\"TPAY\":\"TokenPay\",\"TRIGGERS\":\"Triggers\",\"TRX\":\" TRON\",\"UBQ\":\"Ubiq\",\"UNIT\":\"UniversalCurrency\",\"USDT\":\"Tether USD (Omni Layer)\",\"USDT.BEP20\":\"Tether USD (BSC Chain)\",\"USDT.ERC20\":\"Tether USD (ERC20)\",\"USDT.TRC20\":\"Tether USD (Tron/TRC20)\",\"VTC\":\"Vertcoin\",\"WAVES\":\"Waves\",\"XCP\":\"Counterparty\",\"XEM\":\"NEM\",\"XMR\":\"Monero\",\"XSN\":\"Stakenet\",\"XSR\":\"SucreCoin\",\"XVG\":\"VERGE\",\"XZC\":\"ZCoin\",\"ZEC\":\"ZCash\",\"ZEN\":\"Horizen\"}', 1, NULL, NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:51'),
(10, 0, 506, 'Coinbase Commerce', 'CoinbaseCommerce', 1, '{\"api_key\":{\"title\":\"API Key\",\"global\":true,\"value\":\"---------\"},\"secret\":{\"title\":\"Webhook Shared Secret\",\"global\":true,\"value\":\"----------------\"}}', '{\"USD\":\"USD\",\"EUR\":\"EUR\",\"JPY\":\"JPY\",\"GBP\":\"GBP\",\"AUD\":\"AUD\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"CNY\":\"CNY\",\"SEK\":\"SEK\",\"NZD\":\"NZD\",\"MXN\":\"MXN\",\"SGD\":\"SGD\",\"HKD\":\"HKD\",\"NOK\":\"NOK\",\"KRW\":\"KRW\",\"TRY\":\"TRY\",\"RUB\":\"RUB\",\"INR\":\"INR\",\"BRL\":\"BRL\",\"ZAR\":\"ZAR\",\"AED\":\"AED\",\"AFN\":\"AFN\",\"ALL\":\"ALL\",\"AMD\":\"AMD\",\"ANG\":\"ANG\",\"AOA\":\"AOA\",\"ARS\":\"ARS\",\"AWG\":\"AWG\",\"AZN\":\"AZN\",\"BAM\":\"BAM\",\"BBD\":\"BBD\",\"BDT\":\"BDT\",\"BGN\":\"BGN\",\"BHD\":\"BHD\",\"BIF\":\"BIF\",\"BMD\":\"BMD\",\"BND\":\"BND\",\"BOB\":\"BOB\",\"BSD\":\"BSD\",\"BTN\":\"BTN\",\"BWP\":\"BWP\",\"BYN\":\"BYN\",\"BZD\":\"BZD\",\"CDF\":\"CDF\",\"CLF\":\"CLF\",\"CLP\":\"CLP\",\"COP\":\"COP\",\"CRC\":\"CRC\",\"CUC\":\"CUC\",\"CUP\":\"CUP\",\"CVE\":\"CVE\",\"CZK\":\"CZK\",\"DJF\":\"DJF\",\"DKK\":\"DKK\",\"DOP\":\"DOP\",\"DZD\":\"DZD\",\"EGP\":\"EGP\",\"ERN\":\"ERN\",\"ETB\":\"ETB\",\"FJD\":\"FJD\",\"FKP\":\"FKP\",\"GEL\":\"GEL\",\"GGP\":\"GGP\",\"GHS\":\"GHS\",\"GIP\":\"GIP\",\"GMD\":\"GMD\",\"GNF\":\"GNF\",\"GTQ\":\"GTQ\",\"GYD\":\"GYD\",\"HNL\":\"HNL\",\"HRK\":\"HRK\",\"HTG\":\"HTG\",\"HUF\":\"HUF\",\"IDR\":\"IDR\",\"ILS\":\"ILS\",\"IMP\":\"IMP\",\"IQD\":\"IQD\",\"IRR\":\"IRR\",\"ISK\":\"ISK\",\"JEP\":\"JEP\",\"JMD\":\"JMD\",\"JOD\":\"JOD\",\"KES\":\"KES\",\"KGS\":\"KGS\",\"KHR\":\"KHR\",\"KMF\":\"KMF\",\"KPW\":\"KPW\",\"KWD\":\"KWD\",\"KYD\":\"KYD\",\"KZT\":\"KZT\",\"LAK\":\"LAK\",\"LBP\":\"LBP\",\"LKR\":\"LKR\",\"LRD\":\"LRD\",\"LSL\":\"LSL\",\"LYD\":\"LYD\",\"MAD\":\"MAD\",\"MDL\":\"MDL\",\"MGA\":\"MGA\",\"MKD\":\"MKD\",\"MMK\":\"MMK\",\"MNT\":\"MNT\",\"MOP\":\"MOP\",\"MRO\":\"MRO\",\"MUR\":\"MUR\",\"MVR\":\"MVR\",\"MWK\":\"MWK\",\"MYR\":\"MYR\",\"MZN\":\"MZN\",\"NAD\":\"NAD\",\"NGN\":\"NGN\",\"NIO\":\"NIO\",\"NPR\":\"NPR\",\"OMR\":\"OMR\",\"PAB\":\"PAB\",\"PEN\":\"PEN\",\"PGK\":\"PGK\",\"PHP\":\"PHP\",\"PKR\":\"PKR\",\"PLN\":\"PLN\",\"PYG\":\"PYG\",\"QAR\":\"QAR\",\"RON\":\"RON\",\"RSD\":\"RSD\",\"RWF\":\"RWF\",\"SAR\":\"SAR\",\"SBD\":\"SBD\",\"SCR\":\"SCR\",\"SDG\":\"SDG\",\"SHP\":\"SHP\",\"SLL\":\"SLL\",\"SOS\":\"SOS\",\"SRD\":\"SRD\",\"SSP\":\"SSP\",\"STD\":\"STD\",\"SVC\":\"SVC\",\"SYP\":\"SYP\",\"SZL\":\"SZL\",\"THB\":\"THB\",\"TJS\":\"TJS\",\"TMT\":\"TMT\",\"TND\":\"TND\",\"TOP\":\"TOP\",\"TTD\":\"TTD\",\"TWD\":\"TWD\",\"TZS\":\"TZS\",\"UAH\":\"UAH\",\"UGX\":\"UGX\",\"UYU\":\"UYU\",\"UZS\":\"UZS\",\"VEF\":\"VEF\",\"VND\":\"VND\",\"VUV\":\"VUV\",\"WST\":\"WST\",\"XAF\":\"XAF\",\"XAG\":\"XAG\",\"XAU\":\"XAU\",\"XCD\":\"XCD\",\"XDR\":\"XDR\",\"XOF\":\"XOF\",\"XPD\":\"XPD\",\"XPF\":\"XPF\",\"XPT\":\"XPT\",\"YER\":\"YER\",\"ZMW\":\"ZMW\",\"ZWL\":\"ZWL\"}\r\n\r\n', 0, '{\"endpoint\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.CoinbaseCommerce\"}}', NULL, '2019-09-14 13:14:22', '2022-10-29 07:29:48'),
(11, 0, 113, 'Paypal Express', 'PaypalSdk', 1, '{\"clientId\":{\"title\":\"Paypal Client ID\",\"global\":true,\"value\":\"------------\"},\"clientSecret\":{\"title\":\"Client Secret\",\"global\":true,\"value\":\"-----------\"}}', '{\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CZK\":\"CZK\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"HKD\":\"HKD\",\"HUF\":\"HUF\",\"INR\":\"INR\",\"ILS\":\"ILS\",\"JPY\":\"JPY\",\"MYR\":\"MYR\",\"MXN\":\"MXN\",\"TWD\":\"TWD\",\"NZD\":\"NZD\",\"NOK\":\"NOK\",\"PHP\":\"PHP\",\"PLN\":\"PLN\",\"GBP\":\"GBP\",\"RUB\":\"RUB\",\"SGD\":\"SGD\",\"SEK\":\"SEK\",\"CHF\":\"CHF\",\"THB\":\"THB\",\"USD\":\"$\"}', 0, NULL, NULL, '2019-09-14 13:14:22', '2021-05-20 23:01:08'),
(12, 0, 114, 'Stripe Checkout', 'StripeV3', 1, '{\"secret_key\":{\"title\":\"Secret Key\",\"global\":true,\"value\":\"sk_test_51M8Ks2CL65BWuH7eCBcWsLP2yPfWaLtfJVxG3zfii7cCWJE1izM4jkhucmBSm6izmVtSGZyp0JDYYCVmx9E4WmQY004gfnctzD\"},\"publishable_key\":{\"title\":\"PUBLISHABLE KEY\",\"global\":true,\"value\":\"pk_test_51M8Ks2CL65BWuH7eju6khGxJMpeeFuw2Rwrjr8UYCz6ZnQ3PiFxb1gVu1i1dBto9MQrnjkBimHkFJgNcqsrJHTak0010kCY41h\"},\"end_point\":{\"title\":\"End Point Secret\",\"global\":true,\"value\":\"abcd\"}}', '{\"USD\":\"USD\",\"AUD\":\"AUD\",\"BRL\":\"BRL\",\"CAD\":\"CAD\",\"CHF\":\"CHF\",\"DKK\":\"DKK\",\"EUR\":\"EUR\",\"GBP\":\"GBP\",\"HKD\":\"HKD\",\"INR\":\"INR\",\"JPY\":\"JPY\",\"MXN\":\"MXN\",\"MYR\":\"MYR\",\"NOK\":\"NOK\",\"NZD\":\"NZD\",\"PLN\":\"PLN\",\"SEK\":\"SEK\",\"SGD\":\"SGD\"}', 0, '{\"webhook\":{\"title\": \"Webhook Endpoint\",\"value\":\"ipn.StripeV3\"}}', NULL, '2019-09-14 13:14:22', '2022-12-18 08:28:03');

-- --------------------------------------------------------

--
-- Table structure for table `gateway_currencies`
--

CREATE TABLE `gateway_currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `symbol` varchar(40) DEFAULT NULL,
  `method_code` int(10) DEFAULT NULL,
  `gateway_alias` varchar(40) DEFAULT NULL,
  `min_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `max_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) NOT NULL DEFAULT 0.00,
  `fixed_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `image` varchar(255) DEFAULT NULL,
  `gateway_parameter` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gateway_currencies`
--

INSERT INTO `gateway_currencies` (`id`, `name`, `currency`, `symbol`, `method_code`, `gateway_alias`, `min_amount`, `max_amount`, `percent_charge`, `fixed_charge`, `rate`, `image`, `gateway_parameter`, `created_at`, `updated_at`) VALUES
(3, 'Paypal - USD', 'USD', '$', 101, 'Paypal', '10.00000000', '1000.00000000', '0.00', '0.00000000', '1.00000000', NULL, '{\"paypal_email\":\"sb-58ira22618401@business.example.com\"}', '2023-05-27 02:54:30', '2023-05-27 02:54:30');

-- --------------------------------------------------------

--
-- Table structure for table `general_settings`
--

CREATE TABLE `general_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_name` varchar(40) DEFAULT NULL,
  `cur_text` varchar(40) DEFAULT NULL COMMENT 'currency text',
  `cur_sym` varchar(40) DEFAULT NULL COMMENT 'currency symbol',
  `email_from` varchar(40) DEFAULT NULL,
  `email_template` text DEFAULT NULL,
  `sms_body` varchar(255) DEFAULT NULL,
  `sms_from` varchar(255) DEFAULT NULL,
  `base_color` varchar(40) DEFAULT NULL,
  `secondary_color` varchar(40) DEFAULT NULL,
  `mail_config` text DEFAULT NULL COMMENT 'email configuration',
  `sms_config` text DEFAULT NULL,
  `global_shortcodes` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0,
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email verification, 0 - dont check, 1 - check',
  `en` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'email notification, 0 - dont send, 1 - send',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'mobile verication, 0 - dont check, 1 - check',
  `sn` tinyint(1) NOT NULL DEFAULT 0 COMMENT 'sms notification, 0 - dont send, 1 - send',
  `force_ssl` tinyint(1) NOT NULL DEFAULT 0,
  `maintenance_mode` tinyint(1) NOT NULL DEFAULT 0,
  `secure_password` tinyint(1) NOT NULL DEFAULT 0,
  `agree` tinyint(1) NOT NULL DEFAULT 0,
  `registration` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Off	, 1: On',
  `active_template` varchar(40) DEFAULT NULL,
  `system_info` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `general_settings`
--

INSERT INTO `general_settings` (`id`, `site_name`, `cur_text`, `cur_sym`, `email_from`, `email_template`, `sms_body`, `sms_from`, `base_color`, `secondary_color`, `mail_config`, `sms_config`, `global_shortcodes`, `kv`, `ev`, `en`, `sv`, `sn`, `force_ssl`, `maintenance_mode`, `secure_password`, `agree`, `registration`, `active_template`, `system_info`, `created_at`, `updated_at`) VALUES
(1, 'MinStack', 'USD', '$', 'notify@wstacks.com', '<p>Hi {{fullname}} ({{username}}),&nbsp;</p><p>{{message}}</p>', 'Hi {{fullname}} ({{username}}), \r\n{{message}}', 'Minstack', '7d5fff', '060662', '{\"name\":\"php\"}', '{\"name\":\"messageBird\",\"clickatell\":{\"api_key\":\"----------------\"},\"infobip\":{\"username\":\"------------8888888\",\"password\":\"-----------------\"},\"message_bird\":{\"api_key\":\"-------------------\"},\"nexmo\":{\"api_key\":\"----------------------\",\"api_secret\":\"----------------------\"},\"sms_broadcast\":{\"username\":\"----------------------\",\"password\":\"-----------------------------\"},\"twilio\":{\"account_sid\":\"-----------------------\",\"auth_token\":\"---------------------------\",\"from\":\"----------------------\"},\"text_magic\":{\"username\":\"-----------------------\",\"apiv2_key\":\"-------------------------------\"},\"custom\":{\"method\":\"get\",\"url\":\"https:\\/\\/hostname\\/demo-api-v1\",\"headers\":{\"name\":[\"api_key\"],\"value\":[\"test_api 555\"]},\"body\":{\"name\":[\"from_number\"],\"value\":[\"5657545757\"]}}}', '{\n    \"site_name\":\"Name of your site\",\n    \"site_currency\":\"Currency of your site\",\n    \"currency_symbol\":\"Symbol of currency\"\n}', 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 'default', '[]', NULL, '2023-09-07 01:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `code` varchar(40) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `text_align` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: left to right text align, 1: right to left text align',
  `is_default` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: not default language, 1: default language',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`, `icon`, `text_align`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'English', 'en', '5f15968db08911595250317.png', 0, 1, '2020-07-06 03:47:55', '2022-09-29 10:36:14'),
(14, 'Spanish', 'es', NULL, 0, 0, '2023-02-15 11:06:57', '2023-02-15 11:06:57');

-- --------------------------------------------------------

--
-- Table structure for table `notification_logs`
--

CREATE TABLE `notification_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `sender` varchar(40) DEFAULT NULL,
  `sent_from` varchar(40) DEFAULT NULL,
  `sent_to` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `notification_type` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_logs`
--

INSERT INTO `notification_logs` (`id`, `user_id`, `sender`, `sent_from`, `sent_to`, `subject`, `message`, `notification_type`, `created_at`, `updated_at`) VALUES
(1, 0, 'smtp', 'info@example.com', 'riasadrion@gmail.com', 'SMTP Configuration Success', '<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">\r\n  <!--[if !mso]><!-->\r\n  <meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\r\n  <!--<![endif]-->\r\n  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n  <title></title>\r\n  <style type=\"text/css\">\r\n.ReadMsgBody { width: 100%; background-color: #ffffff; }\r\n.ExternalClass { width: 100%; background-color: #ffffff; }\r\n.ExternalClass, .ExternalClass p, .ExternalClass span, .ExternalClass font, .ExternalClass td, .ExternalClass div { line-height: 100%; }\r\nhtml { width: 100%; }\r\nbody { -webkit-text-size-adjust: none; -ms-text-size-adjust: none; margin: 0; padding: 0; }\r\ntable { border-spacing: 0; table-layout: fixed; margin: 0 auto;border-collapse: collapse; }\r\ntable table table { table-layout: auto; }\r\n.yshortcuts a { border-bottom: none !important; }\r\nimg:hover { opacity: 0.9 !important; }\r\na { color: #0087ff; text-decoration: none; }\r\n.textbutton a { font-family: \'open sans\', arial, sans-serif !important;}\r\n.btn-link a { color:#FFFFFF !important;}\r\n\r\n@media only screen and (max-width: 480px) {\r\nbody { width: auto !important; }\r\n*[class=\"table-inner\"] { width: 90% !important; text-align: center !important; }\r\n*[class=\"table-full\"] { width: 100% !important; text-align: center !important; }\r\n/* image */\r\nimg[class=\"img1\"] { width: 100% !important; height: auto !important; }\r\n}\r\n</style>\r\n\r\n\r\n\r\n  <table bgcolor=\"#414a51\" width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n    <tbody><tr>\r\n      <td height=\"50\"></td>\r\n    </tr>\r\n    <tr>\r\n      <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\">\r\n          <tbody><tr>\r\n            <td align=\"center\" width=\"600\">\r\n              <!--header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#0087ff\" style=\"border-top-left-radius:6px; border-top-right-radius:6px;text-align:center;vertical-align:top;font-size:0;\" align=\"center\">\r\n                    <table width=\"90%\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#FFFFFF; font-size:16px; font-weight: bold;\">System Mail</td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n              <!--end header-->\r\n              <table class=\"table-inner\" width=\"95%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                <tbody><tr>\r\n                  <td bgcolor=\"#FFFFFF\" align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"35\"></td>\r\n                      </tr>\r\n                      <!--logo-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"vertical-align:top;font-size:0;\">\r\n                          <a href=\"#\">\r\n                            <img style=\"display:block; line-height:0px; font-size:0px; border:0px;\" src=\"https://i.imgur.com/K2fIRda.png\" alt=\"img\">\r\n                          </a>\r\n                        </td>\r\n                      </tr>\r\n                      <!--end logo-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n                      <!--headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 22px;color:#414a51;font-weight: bold;\">Hello riasadrion (riasadrion@gmail.com)</td>\r\n                      </tr>\r\n                      <!--end headline-->\r\n                      <tr>\r\n                        <td align=\"center\" style=\"text-align:center;vertical-align:top;font-size:0;\">\r\n                          <table width=\"40\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">\r\n                            <tbody><tr>\r\n                              <td height=\"20\" style=\" border-bottom:3px solid #0087ff;\"></td>\r\n                            </tr>\r\n                          </tbody></table>\r\n                        </td>\r\n                      </tr>\r\n                      <tr>\r\n                        <td height=\"20\"></td>\r\n                      </tr>\r\n                      <!--content-->\r\n                      <tr>\r\n                        <td align=\"left\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#7f8c8d; font-size:16px; line-height: 28px;\">Your email notification setting is configured successfully for MinStack</td>\r\n                      </tr>\r\n                      <!--end content-->\r\n                      <tr>\r\n                        <td height=\"40\"></td>\r\n                      </tr>\r\n              \r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td height=\"45\" align=\"center\" bgcolor=\"#f4f4f4\" style=\"border-bottom-left-radius:6px;border-bottom-right-radius:6px;\">\r\n                    <table align=\"center\" width=\"90%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n                      <tbody><tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                      <!--preference-->\r\n                      <tr>\r\n                        <td class=\"preference-link\" align=\"center\" style=\"font-family: \'Open sans\', Arial, sans-serif; color:#95a5a6; font-size:14px;\">\r\n                          © 2022&nbsp;<a href=\"#\">MinStack</a>&nbsp;. All Rights Reserved. \r\n                        </td>\r\n                      </tr>\r\n                      <!--end preference-->\r\n                      <tr>\r\n                        <td height=\"10\"></td>\r\n                      </tr>\r\n                    </tbody></table>\r\n                  </td>\r\n                </tr>\r\n              </tbody></table>\r\n            </td>\r\n          </tr>\r\n        </tbody></table>\r\n      </td>\r\n    </tr>\r\n    <tr>\r\n      <td height=\"60\"></td>\r\n    </tr>\r\n  </tbody></table>', 'email', '2023-01-21 07:41:43', '2023-01-21 07:41:43'),
(2, 33, 'php', 'notify@wstacks.com', 'demouser@gmail.com', 'Please verify your email address', '<p>Hi @demouser (demouser),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;406871</span></font></div></div></p>', 'email', '2023-09-16 23:24:14', '2023-09-16 23:24:14'),
(3, 33, 'php', 'notify@wstacks.com', 'demouser@gmail.com', 'Please verify your email address', '<p>Hi @demouser (demouser),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;702068</span></font></div></div></p>', 'email', '2023-09-16 23:26:49', '2023-09-16 23:26:49'),
(4, 33, 'php', 'notify@wstacks.com', 'demouser@gmail.com', 'Please verify your email address', '<p>Hi @demouser (demouser),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;496358</span></font></div></div></p>', 'email', '2023-09-16 23:29:27', '2023-09-16 23:29:27'),
(5, 33, 'php', 'notify@wstacks.com', 'demouser@gmail.com', 'Please verify your email address', '<p>Hi @demouser (demouser),&nbsp;</p><p><br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;410633</span></font></div></div></p>', 'email', '2023-09-16 23:35:57', '2023-09-16 23:35:57');

-- --------------------------------------------------------

--
-- Table structure for table `notification_templates`
--

CREATE TABLE `notification_templates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `act` varchar(40) DEFAULT NULL,
  `name` varchar(40) DEFAULT NULL,
  `subj` varchar(255) DEFAULT NULL,
  `email_body` text DEFAULT NULL,
  `sms_body` text DEFAULT NULL,
  `shortcodes` text DEFAULT NULL,
  `email_status` tinyint(1) NOT NULL DEFAULT 1,
  `sms_status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `notification_templates`
--

INSERT INTO `notification_templates` (`id`, `act`, `name`, `subj`, `email_body`, `sms_body`, `shortcodes`, `email_status`, `sms_status`, `created_at`, `updated_at`) VALUES
(1, 'BAL_ADD', 'Balance - Added', 'Your Account has been Credited', '<div><div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been added to your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}&nbsp;</span></font><br></div><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin note:&nbsp;<span style=\"color: rgb(33, 37, 41); font-size: 12px; font-weight: 600; white-space: nowrap; text-align: var(--bs-body-text-align);\">{{remark}}</span></div>', '{{amount}} {{site_currency}} credited in your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin note is \"{{remark}}\"', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 0, '2021-11-03 12:00:00', '2022-09-21 13:04:13'),
(2, 'BAL_SUB', 'Balance - Subtracted', 'Your Account has been Debited', '<div style=\"font-family: Montserrat, sans-serif;\">{{amount}} {{site_currency}} has been subtracted from your account .</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Your Current Balance is :&nbsp;</span><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">{{post_balance}}&nbsp; {{site_currency}}</span></font><br><div><font style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></font></div><div>Admin Note: {{remark}}</div>', '{{amount}} {{site_currency}} debited from your account. Your Current Balance {{post_balance}} {{site_currency}} . Transaction: #{{trx}}. Admin Note is {{remark}}', '{\"trx\":\"Transaction number for the action\",\"amount\":\"Amount inserted by the admin\",\"remark\":\"Remark inserted by the admin\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:24:11'),
(3, 'DEPOSIT_COMPLETE', 'Deposit - Automated - Successful', 'Deposit Completed Successfully', '<div>Your deposit of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been completed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#000000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Received : {{method_amount}} {{method_currency}}<br></div><div>Paid via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit successfully by {{method_name}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:25:43'),
(4, 'DEPOSIT_APPROVE', 'Deposit - Manual - Approved', 'Your Deposit is Approved', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>is Approved .<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\"><span style=\"font-weight: bolder;\"><br></span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div>', 'Admin Approve Your {{amount}} {{site_currency}} payment request by {{method_name}} transaction : {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:26:07'),
(5, 'DEPOSIT_REJECT', 'Deposit - Manual - Rejected', 'Your Deposit Request is Rejected', '<div style=\"font-family: Montserrat, sans-serif;\">Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}} has been rejected</span>.<span style=\"font-weight: bolder;\"><br></span></div><div><br></div><div><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Received : {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Paid via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge: {{charge}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number was : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">if you have any queries, feel free to contact us.<br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><br><br></div><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">{{rejection_message}}</span><br>', 'Admin Rejected Your {{amount}} {{site_currency}} payment request by {{method_name}}\r\n\r\n{{rejection_message}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"rejection_message\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:45:27'),
(6, 'DEPOSIT_REQUEST', 'Deposit - Manual - Requested', 'Deposit Request Submitted Successfully', '<div>Your deposit request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp;is via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>submitted successfully<span style=\"font-weight: bolder;\">&nbsp;.<br></span></div><div><span style=\"font-weight: bolder;\"><br></span></div><div><span style=\"font-weight: bolder;\">Details of your Deposit :<br></span></div><div><br></div><div>Amount : {{amount}} {{site_currency}}</div><div>Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div><br></div><div>Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div>Payable : {{method_amount}} {{method_currency}}<br></div><div>Pay via :&nbsp; {{method_name}}</div><div><br></div><div>Transaction Number : {{trx}}</div><div><br></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', '{{amount}} {{site_currency}} Deposit requested by {{method_name}}. Charge: {{charge}} . Trx: {{trx}}', '{\"trx\":\"Transaction number for the deposit\",\"amount\":\"Amount inserted by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the deposit method\",\"method_currency\":\"Currency of the deposit method\",\"method_amount\":\"Amount after conversion between base currency and method currency\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-03 02:29:19'),
(7, 'PASS_RESET_CODE', 'Password - Reset - Code', 'Password Reset', '<div style=\"font-family: Montserrat, sans-serif;\">We have received a request to reset the password for your account on&nbsp;<span style=\"font-weight: bolder;\">{{time}} .<br></span></div><div style=\"font-family: Montserrat, sans-serif;\">Requested From IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>.</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><br style=\"font-family: Montserrat, sans-serif;\"><div style=\"font-family: Montserrat, sans-serif;\"><div>Your account recovery code is:&nbsp;&nbsp;&nbsp;<font size=\"6\"><span style=\"font-weight: bolder;\">{{code}}</span></font></div><div><br></div></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\" color=\"#CC0000\">If you do not wish to reset your password, please disregard this message.&nbsp;</font><br></div><div><font size=\"4\" color=\"#CC0000\"><br></font></div>', 'Your account recovery code is: {{code}}', '{\"code\":\"Verification code for password reset\",\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 0, '2021-11-03 12:00:00', '2022-03-20 20:47:05'),
(8, 'PASS_RESET_DONE', 'Password - Reset - Confirmation', 'You have reset your password', '<p style=\"font-family: Montserrat, sans-serif;\">You have successfully reset your password.</p><p style=\"font-family: Montserrat, sans-serif;\">You changed from&nbsp; IP:&nbsp;<span style=\"font-weight: bolder;\">{{ip}}</span>&nbsp;using&nbsp;<span style=\"font-weight: bolder;\">{{browser}}</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{operating_system}}&nbsp;</span>&nbsp;on&nbsp;<span style=\"font-weight: bolder;\">{{time}}</span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></p><p style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><font color=\"#ff0000\">If you did not change that, please contact us as soon as possible.</font></span></p>', 'Your password has been changed successfully', '{\"ip\":\"IP address of the user\",\"browser\":\"Browser of the user\",\"operating_system\":\"Operating system of the user\",\"time\":\"Time of the request\"}', 1, 1, '2021-11-03 12:00:00', '2022-04-05 03:46:35'),
(9, 'ADMIN_SUPPORT_REPLY', 'Support - Reply', 'Reply Support Ticket', '<div><p><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\">A member from our support team has replied to the following ticket:</span></span></p><p><span style=\"font-weight: bolder;\"><span data-mce-style=\"font-size: 11pt;\" style=\"font-size: 11pt;\"><span style=\"font-weight: bolder;\"><br></span></span></span></p><p><span style=\"font-weight: bolder;\">[Ticket#{{ticket_id}}] {{ticket_subject}}<br><br>Click here to reply:&nbsp; {{link}}</span></p><p>----------------------------------------------</p><p>Here is the reply :<br></p><p>{{reply}}<br></p></div><div><br style=\"font-family: Montserrat, sans-serif;\"></div>', 'Your Ticket#{{ticket_id}} :  {{ticket_subject}} has been replied.', '{\"ticket_id\":\"ID of the support ticket\",\"ticket_subject\":\"Subject  of the support ticket\",\"reply\":\"Reply made by the admin\",\"link\":\"URL to view the support ticket\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:47:51'),
(10, 'EVER_CODE', 'Verification - Email', 'Please verify your email address', '<br><div><div style=\"font-family: Montserrat, sans-serif;\">Thanks For joining us.<br></div><div style=\"font-family: Montserrat, sans-serif;\">Please use the below code to verify your email address.<br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Your email verification code is:<font size=\"6\"><span style=\"font-weight: bolder;\">&nbsp;{{code}}</span></font></div></div>', '---', '{\"code\":\"Email verification code\"}', 1, 0, '2021-11-03 12:00:00', '2022-04-03 02:32:07'),
(11, 'SVER_CODE', 'Verification - SMS', 'Verify Your Mobile Number', '---', 'Your phone verification code is: {{code}}', '{\"code\":\"SMS Verification Code\"}', 0, 1, '2021-11-03 12:00:00', '2022-03-20 19:24:37'),
(12, 'WITHDRAW_APPROVE', 'Withdraw - Approved', 'Withdraw Request has been Processed and your money is sent', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Processed Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Processed Payment :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div>', 'Admin Approve Your {{amount}} {{site_currency}} withdraw request by {{method_name}}. Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"admin_details\":\"Details provided by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:50:16'),
(13, 'WITHDRAW_REJECT', 'Withdraw - Rejected', 'Withdraw Request has been Rejected and your money is refunded to your account', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been Rejected.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You should get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">----</div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\"><br></font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"3\">{{amount}} {{currency}} has been&nbsp;<span style=\"font-weight: bolder;\">refunded&nbsp;</span>to your account and your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}}</span><span style=\"font-weight: bolder;\">&nbsp;{{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">-----</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\">Details of Rejection :</font></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"4\"><span style=\"font-weight: bolder;\">{{admin_details}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br><br><br></div><div></div><div></div>', 'Admin Rejected Your {{amount}} {{site_currency}} withdraw request. Your Main Balance {{post_balance}}  {{method_name}} , Transaction {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this action\",\"admin_details\":\"Rejection message by the admin\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-20 20:57:46'),
(14, 'WITHDRAW_REQUEST', 'Withdraw - Requested', 'Withdraw Request Submitted Successfully', '<div style=\"font-family: Montserrat, sans-serif;\">Your withdraw request of&nbsp;<span style=\"font-weight: bolder;\">{{amount}} {{site_currency}}</span>&nbsp; via&nbsp;&nbsp;<span style=\"font-weight: bolder;\">{{method_name}}&nbsp;</span>has been submitted Successfully.<span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\"><br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><span style=\"font-weight: bolder;\">Details of your withdraw:<br></span></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Amount : {{amount}} {{site_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">Charge:&nbsp;<font color=\"#FF0000\">{{charge}} {{site_currency}}</font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Conversion Rate : 1 {{site_currency}} = {{rate}} {{method_currency}}</div><div style=\"font-family: Montserrat, sans-serif;\">You will get: {{method_amount}} {{method_currency}}<br></div><div style=\"font-family: Montserrat, sans-serif;\">Via :&nbsp; {{method_name}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\">Transaction Number : {{trx}}</div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><font size=\"5\">Your current Balance is&nbsp;<span style=\"font-weight: bolder;\">{{post_balance}} {{site_currency}}</span></font></div><div style=\"font-family: Montserrat, sans-serif;\"><br></div><div style=\"font-family: Montserrat, sans-serif;\"><br><br><br></div>', '{{amount}} {{site_currency}} withdraw requested by {{method_name}}. You will get {{method_amount}} {{method_currency}} Trx: {{trx}}', '{\"trx\":\"Transaction number for the withdraw\",\"amount\":\"Amount requested by the user\",\"charge\":\"Gateway charge set by the admin\",\"rate\":\"Conversion rate between base currency and method currency\",\"method_name\":\"Name of the withdraw method\",\"method_currency\":\"Currency of the withdraw method\",\"method_amount\":\"Amount after conversion between base currency and method currency\",\"post_balance\":\"Balance of the user after fter this transaction\"}', 1, 1, '2021-11-03 12:00:00', '2022-03-21 04:39:03'),
(15, 'DEFAULT', 'Default Template', '{{subject}}', '{{message}}', '{{message}}', '{\"subject\":\"Subject\",\"message\":\"Message\"}', 1, 1, '2019-09-14 13:14:22', '2021-11-04 09:38:55');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(40) DEFAULT NULL,
  `slug` varchar(40) DEFAULT NULL,
  `tempname` varchar(40) DEFAULT NULL COMMENT 'template name',
  `secs` text DEFAULT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `name`, `slug`, `tempname`, `secs`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'HOME', '/', 'presets.default.', '[\"blog\",\"about\",\"counter\",\"faq\",\"feature\",\"service\",\"subscribe\"]', 1, '2020-07-11 06:23:58', '2022-09-27 12:45:30'),
(4, 'Blog', 'blog', 'presets.default.', NULL, 1, '2020-10-22 01:14:43', '2020-10-22 01:14:43'),
(5, 'Contact', 'contact', 'presets.default.', NULL, 1, '2020-10-22 01:14:53', '2020-10-22 01:14:53');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(40) DEFAULT NULL,
  `token` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('ronnie@gmail.com', '100375', '2020-07-07 05:44:47'),
('user@site.comfff', '988862', '2021-05-07 07:31:28'),
('mosta@gmail.com', '865544', '2021-06-10 09:21:05'),
('user@site.com', '532560', '2022-04-04 03:52:27');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(29, 'App\\Models\\User', 22, 'MyApp', '5da1bfd64a5d95722d5c085185f0787323270c5cf12d09c5a69e4f950f4d8420', '[\"*\"]', NULL, '2021-05-19 05:47:02', '2021-05-19 05:47:02'),
(46, 'App\\Models\\User', 25, 'auth_token', 'bc7288b4e2082a0475639d6e2f29483a35abd11f55110df12244d9142f7ca54a', '[\"*\"]', NULL, '2021-06-10 05:35:17', '2021-06-10 05:35:17'),
(47, 'App\\Models\\User', 25, 'auth_token', '2bcdbee9ab110af212b02516a602ba52cf27a6aa844901acbb2fbfc09c95bb34', '[\"*\"]', NULL, '2021-06-10 06:31:50', '2021-06-10 06:31:50'),
(51, 'App\\Models\\User', 26, 'auth_token', 'c792344d1730dde4e418f6380309b24767062dc5e9c6757fce88675f7bbff9f3', '[\"*\"]', NULL, '2021-06-10 08:38:29', '2021-06-10 08:38:29'),
(53, 'App\\Models\\User', 24, 'auth_token', '36c0eb2f6065deb315bd996e158aed1d6c06f4a04879317bcf1961ea786a675c', '[\"*\"]', '2021-06-10 13:04:13', '2021-06-10 09:36:52', '2021-06-10 13:04:13'),
(54, 'App\\Models\\User', 24, 'auth_token', 'ddcfe3a5d501093c86a0a376a125099517199ea17ee9d4d78be12e476e413b40', '[\"*\"]', '2021-06-10 10:05:35', '2021-06-10 10:05:22', '2021-06-10 10:05:35'),
(55, 'App\\Models\\User', 24, 'auth_token', 'ecf248b74ee8bff942c22b299ccb3afe840a589b7dbd62b9897cbe46ea6c8941', '[\"*\"]', NULL, '2021-06-10 11:56:06', '2021-06-10 11:56:06'),
(58, 'App\\Models\\User', 8, 'auth_token', 'e572eaf82d8c9849394bb7790486730ab529e6ab53d9e4abc14dd69bd70bbd3f', '[\"*\"]', NULL, '2022-03-22 10:47:56', '2022-03-22 10:47:56'),
(59, 'App\\Models\\User', 8, 'auth_token', '21b0d071e22f45a7520c36b825b4f2582037004ee019e67707a4c6cabcbc9375', '[\"*\"]', '2022-04-05 05:13:26', '2022-03-22 10:48:33', '2022-04-05 05:13:26'),
(60, 'App\\Models\\User', 31, 'auth_token', '29647be4a8b5510c717c50b8279d168717ebcc25b3d0155fcc840cd315527112', '[\"*\"]', NULL, '2022-03-22 11:22:57', '2022-03-22 11:22:57'),
(61, 'App\\Models\\User', 8, 'auth_token', '9b103d59a6f148c7153e4c411fac11bf46e8ebeb886835c967a3f3896476da29', '[\"*\"]', '2022-04-16 06:29:21', '2022-03-29 08:05:49', '2022-04-16 06:29:21');

-- --------------------------------------------------------

--
-- Table structure for table `plans`
--

CREATE TABLE `plans` (
  `id` int(11) NOT NULL,
  `name` varchar(40) NOT NULL,
  `price` decimal(28,8) NOT NULL,
  `content` text DEFAULT NULL,
  `type` int(11) NOT NULL COMMENT '0= month, 1= year',
  `month` varchar(40) DEFAULT NULL,
  `year` varchar(40) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `plans`
--

INSERT INTO `plans` (`id`, `name`, `price`, `content`, `type`, `month`, `year`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Premium', '125.00000000', '[\"Unlimited updates\",\"Custom designs & features\",\"Custom permissions\",\"Optimize hashtags\",\"Custom instructors\"]', 0, NULL, '366', 1, '2023-03-26 08:04:55', '2023-03-30 01:59:20'),
(2, 'Essentials', '89.00000000', '[\"Unlimited updates\",\"Custom permissions\",\"Custom instructors\",\"Optimize hashtags\",\"Custom instructors\"]', 1, '31', NULL, 1, '2023-03-26 08:07:20', '2023-04-17 01:31:56'),
(3, 'Standard', '35.00000000', '[\"Unlimited updates\",\"Custom permissions\",\"Custom designs & features\",\"Custom hashtags\",\"Custom instructors\"]', 1, '31', NULL, 1, '2023-03-26 08:08:24', '2023-09-16 03:11:04');

-- --------------------------------------------------------

--
-- Table structure for table `ptcs`
--

CREATE TABLE `ptcs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) DEFAULT NULL,
  `amount` decimal(18,8) NOT NULL,
  `duration` int(11) NOT NULL,
  `max_show` int(11) NOT NULL,
  `showed` int(11) NOT NULL,
  `ads_type` int(11) DEFAULT NULL COMMENT '1=>link|2=>image|3=>script',
  `ads_body` longtext DEFAULT NULL,
  `remain` int(11) NOT NULL COMMENT 'max_show-showed',
  `status` int(11) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ptcs`
--

INSERT INTO `ptcs` (`id`, `title`, `amount`, `duration`, `max_show`, `showed`, `ads_type`, `ads_body`, `remain`, `status`, `created_at`, `updated_at`) VALUES
(18, 'Toggole Blog 3', '0.50000000', 3, 30, 6, 1, 'https://toggl.com/blog/35-best-useless-websites-internet', 24, 1, '2022-11-07 03:15:19', '2022-11-16 08:54:28'),
(19, 'Toggole Blog2', '0.50000000', 3, 300, 6, 1, 'https://toggl.com/blog/35-best-useless-websites-internet', 294, 1, '2022-11-07 03:16:02', '2022-11-16 08:54:17'),
(20, 'Radio Garden2', '0.50000000', 3, 200, 9, 1, 'https://radio.garden/visit/barishal/egSDmbZ3', 191, 1, '2022-11-07 03:16:35', '2022-11-16 09:08:52'),
(21, 'Web8', '0.30000000', 3, 20, 6, 1, 'https://www.whatsmyip.org/random-website-machine/', 14, 1, '2022-11-07 03:17:23', '2022-11-16 08:53:22'),
(22, 'Web7', '0.50000000', 3, 60, 5, 1, 'https://www.whatsmyip.org/random-website-machine/', 55, 1, '2022-11-07 03:18:23', '2022-11-16 08:53:01'),
(23, 'Web6', '0.50000000', 3, 100, 11, 1, 'https://www.whatsmyip.org/random-website-machine/', 89, 1, '2022-11-07 03:19:04', '2022-11-17 08:34:09'),
(24, 'Radio Garden', '0.50000000', 3, 40, 5, 1, 'https://radio.garden/visit/barishal/egSDmbZ3', 35, 1, '2022-11-07 03:19:37', '2022-11-16 08:49:53'),
(25, 'Loream', '0.50000000', 3, 50, 7, 1, 'https://www.lipsum.com/', 43, 1, '2022-11-07 03:20:18', '2022-11-16 07:40:26'),
(26, 'ESPN', '0.50000000', 3, 20, 6, 1, 'https://www.espncricinfo.com/', 14, 1, '2022-11-07 03:20:51', '2022-11-16 03:42:27'),
(27, 'ICC3', '0.50000000', 3, 30, 5, 1, 'https://www.icc-cricket.com/homepage', 25, 1, '2022-11-07 03:21:20', '2022-11-16 03:43:39'),
(28, 'ICC2', '0.50000000', 3, 50, 5, 1, 'https://www.icc-cricket.com/homepage', 45, 1, '2022-11-07 03:22:00', '2022-11-16 07:15:35'),
(29, 'ICC', '0.50000000', 3, 50, 6, 1, 'https://www.icc-cricket.com/homepage', 44, 1, '2022-11-07 03:23:03', '2023-06-20 07:34:16'),
(30, 'Honda', '0.50000000', 3, 300, 0, 1, 'https://www.honda.com.bd/', 300, 1, '2022-11-14 04:19:38', '2022-11-16 07:24:46'),
(31, 'Geo user', '0.50000000', 3, 200, 0, 1, 'https://radio.garden/visit/barishal/egSDmbZ3', 200, 1, '2022-11-14 04:20:08', '2022-11-16 08:48:16'),
(32, 'Auto Draw', '0.50000000', 2, 100, 1, 1, 'https://www.autodraw.com/', 99, 1, '2022-11-14 04:20:30', '2022-11-20 04:17:08'),
(33, 'Toggle Blog', '0.50000000', 3, 300, 0, 1, 'https://toggl.com/blog/35-best-useless-websites-internet', 300, 1, '2022-11-14 04:20:54', '2022-11-16 08:43:44'),
(34, 'Web5', '0.50000000', 3, 50, 0, 1, 'https://www.icc-cricket.com/homepage', 50, 1, '2022-11-14 04:21:22', '2022-11-16 08:42:45'),
(35, 'Web2', '0.50000000', 3, 40, 0, 1, 'https://www.espncricinfo.com/', 40, 1, '2022-11-14 04:22:01', '2022-11-16 08:55:55'),
(36, 'Web4', '0.50000000', 3, 40, 0, 1, 'https://www.random-website.com/', 40, 1, '2022-11-14 04:22:41', '2022-11-16 08:39:14'),
(37, 'Web1', '0.50000000', 3, 200, 1, 1, 'https://www.icc-cricket.com/homepage', 199, 1, '2022-11-14 04:23:08', '2022-11-16 07:50:14');

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE `subscribers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `support_attachments`
--

CREATE TABLE `support_attachments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_message_id` int(10) UNSIGNED DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_attachments`
--

INSERT INTO `support_attachments` (`id`, `support_message_id`, `attachment`, `created_at`, `updated_at`) VALUES
(1, 6, '5ff1cd83c827a1609682307.jpg', '2021-01-03 07:58:27', '2021-01-03 07:58:27'),
(2, 8, '5ff1d3c9a3c591609683913.jpg', '2021-01-03 08:25:13', '2021-01-03 08:25:13'),
(3, 9, '5ff1d3d69ab511609683926.png', '2021-01-03 08:25:26', '2021-01-03 08:25:26'),
(4, 10, '5ff2a60b733881609737739.jpg', '2021-01-03 23:22:19', '2021-01-03 23:22:19'),
(5, 11, '5ff2a61b5e0241609737755.jpg', '2021-01-03 23:22:35', '2021-01-03 23:22:35'),
(6, 12, '5ff2a62da8a951609737773.jpg', '2021-01-03 23:22:53', '2021-01-03 23:22:53'),
(7, 21, '5ff2bbbb6897b1609743291.docx', '2021-01-04 00:54:51', '2021-01-04 00:54:51'),
(8, 35, '5ff2bea23c7991609744034.docx', '2021-01-04 01:07:14', '2021-01-04 01:07:14'),
(9, 35, '5ff2bea23d8fa1609744034.docx', '2021-01-04 01:07:14', '2021-01-04 01:07:14'),
(10, 38, '5ff2bfbf2f9481609744319.docx', '2021-01-04 01:11:59', '2021-01-04 01:11:59'),
(11, 43, '5ff2dac6e521a1609751238.docx', '2021-01-04 03:07:18', '2021-01-04 03:07:18'),
(14, 53, '6094f795dfa401620375445.png', '2021-05-07 07:47:25', '2021-05-07 07:47:25'),
(15, 54, '6094f830810e01620375600.png', '2021-05-07 07:50:00', '2021-05-07 07:50:00'),
(16, 58, '6098ce4aa0f8a1620627018.png', '2021-05-10 05:40:18', '2021-05-10 05:40:18'),
(17, 59, '6098ce5f55e341620627039.png', '2021-05-10 05:40:39', '2021-05-10 05:40:39'),
(18, 59, '6098ce5f5a8e61620627039.png', '2021-05-10 05:40:39', '2021-05-10 05:40:39'),
(20, 66, '60a638a1cc01f1621506209.docx', '2021-05-20 09:53:29', '2021-05-20 09:53:29'),
(21, 68, '60bb580fc47f71622890511.png', '2021-06-05 10:25:11', '2021-06-05 10:25:11'),
(22, 69, '60bb581a0ff221622890522.docx', '2021-06-05 10:25:22', '2021-06-05 10:25:22'),
(23, 100, '62383bec3d82d1647852524.png', '2022-03-21 02:48:44', '2022-03-21 02:48:44'),
(24, 107, '6239a78108aec1647945601.png', '2022-03-22 09:10:02', '2022-03-22 09:10:02'),
(25, 110, '6239ab121e9221647946514.jpeg', '2022-03-22 09:25:14', '2022-03-22 09:25:14'),
(26, 110, '6239ab12402461647946514.jpeg', '2022-03-22 09:25:14', '2022-03-22 09:25:14'),
(29, 119, '624938901eab21648965776.pdf', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(30, 119, '6249389030f681648965776.pdf', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(31, 119, '624938905867d1648965776.pdf', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(32, 119, '624938906b5621648965776.pdf', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(33, 119, '62493890778f91648965776.pdf', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(34, 121, '624a8a4eaa9911649052238.pdf', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(35, 121, '624a8a4eb21b21649052238.pdf', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(36, 121, '624a8a4eb7ff01649052238.pdf', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(37, 121, '624a8a4ebe4e91649052238.pdf', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(38, 121, '624a8a4ec435b1649052238.pdf', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(39, 122, '624bd7bd9f77b1649137597.pdf', '2022-04-05 04:16:37', '2022-04-05 04:16:37'),
(40, 123, '624ea914315121649322260.png', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(41, 123, '624ea9147c6e51649322260.png', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(42, 123, '624ea914851b41649322260.png', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(43, 123, '624ea914a995e1649322260.png', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(44, 123, '624ea914b3cfa1649322260.png', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(45, 136, '624eab9c85d3f1649322908.png', '2022-04-07 07:45:08', '2022-04-07 07:45:08');

-- --------------------------------------------------------

--
-- Table structure for table `support_messages`
--

CREATE TABLE `support_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `support_ticket_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `admin_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `message` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_messages`
--

INSERT INTO `support_messages` (`id`, `support_ticket_id`, `admin_id`, `message`, `created_at`, `updated_at`) VALUES
(1, 1, 0, 'sdfgsfdsdfg', '2021-01-03 06:14:26', '2021-01-03 06:14:26'),
(2, 1, 1, 'asdfasdf asdfasdf', '2021-01-03 06:16:15', '2021-01-03 06:16:15'),
(3, 1, 0, 'dsfgdfghdfg dgfhdf dgh', '2021-01-03 06:46:03', '2021-01-03 06:46:03'),
(4, 1, 0, 'sdf aesgsdfg', '2021-01-03 06:46:34', '2021-01-03 06:46:34'),
(5, 1, 1, 'asdfasdfattachment', '2021-01-03 07:58:23', '2021-01-03 07:58:23'),
(6, 1, 1, 'asdfasdfattachment', '2021-01-03 07:58:27', '2021-01-03 07:58:27'),
(7, 2, 0, 'sdfg', '2021-01-03 08:24:45', '2021-01-03 08:24:45'),
(8, 2, 0, 'asdfasdf', '2021-01-03 08:25:13', '2021-01-03 08:25:13'),
(9, 3, 0, 'ffddffdff', '2021-01-03 08:25:26', '2021-01-03 08:25:26'),
(10, 2, 1, 'ff', '2021-01-03 23:22:19', '2021-01-03 23:22:19'),
(11, 2, 1, 'fff', '2021-01-03 23:22:35', '2021-01-03 23:22:35'),
(12, 1, 1, 'ffff', '2021-01-03 23:22:53', '2021-01-03 23:22:53'),
(13, 4, 0, 'asdfasdf', '2021-01-04 00:27:08', '2021-01-04 00:27:08'),
(14, 5, 0, 'asdfasdf', '2021-01-04 00:27:51', '2021-01-04 00:27:51'),
(15, 6, 0, 'asdfasdf', '2021-01-04 00:28:04', '2021-01-04 00:28:04'),
(16, 7, 0, 'asdfasdf', '2021-01-04 00:29:37', '2021-01-04 00:29:37'),
(17, 8, 0, 'asdfasdf', '2021-01-04 00:30:23', '2021-01-04 00:30:23'),
(19, 10, 0, 'asdf', '2021-01-04 00:54:35', '2021-01-04 00:54:35'),
(20, 11, 0, 'asdf', '2021-01-04 00:54:41', '2021-01-04 00:54:41'),
(21, 12, 0, 'asdf', '2021-01-04 00:54:51', '2021-01-04 00:54:51'),
(22, 12, 0, 'asdf', '2021-01-04 01:01:07', '2021-01-04 01:01:07'),
(23, 12, 0, 'asdf', '2021-01-04 01:01:31', '2021-01-04 01:01:31'),
(24, 12, 0, 'sdfg', '2021-01-04 01:02:18', '2021-01-04 01:02:18'),
(25, 12, 0, 'asdfasdf', '2021-01-04 01:02:49', '2021-01-04 01:02:49'),
(26, 12, 0, 'asdfasdf', '2021-01-04 01:02:55', '2021-01-04 01:02:55'),
(27, 12, 0, 'asdf', '2021-01-04 01:03:24', '2021-01-04 01:03:24'),
(28, 12, 0, 'asdf', '2021-01-04 01:03:33', '2021-01-04 01:03:33'),
(29, 12, 0, 'asdf', '2021-01-04 01:03:41', '2021-01-04 01:03:41'),
(30, 12, 0, 'asdf', '2021-01-04 01:03:51', '2021-01-04 01:03:51'),
(31, 12, 0, 'asdf', '2021-01-04 01:04:09', '2021-01-04 01:04:09'),
(32, 12, 0, 'asdf', '2021-01-04 01:04:29', '2021-01-04 01:04:29'),
(33, 12, 0, 'asdf', '2021-01-04 01:04:34', '2021-01-04 01:04:34'),
(34, 12, 0, 'ghdgh', '2021-01-04 01:06:45', '2021-01-04 01:06:45'),
(35, 12, 0, 'asdfasd', '2021-01-04 01:07:14', '2021-01-04 01:07:14'),
(36, 11, 1, 'asdfasdf', '2021-01-04 01:09:58', '2021-01-04 01:09:58'),
(37, 11, 1, 'asdfasdf', '2021-01-04 01:10:13', '2021-01-04 01:10:13'),
(38, 12, 0, 'asdfsfg sdfgdsfg hdfghdfghdfghdfghdfghdfghdfgh', '2021-01-04 01:11:59', '2021-01-04 01:11:59'),
(39, 12, 1, 'dfghfgj', '2021-01-04 03:05:42', '2021-01-04 03:05:42'),
(40, 12, 1, 'asdf', '2021-01-04 03:06:01', '2021-01-04 03:06:01'),
(41, 12, 1, 'asdf', '2021-01-04 03:06:15', '2021-01-04 03:06:15'),
(42, 12, 1, 'asdf', '2021-01-04 03:06:24', '2021-01-04 03:06:24'),
(43, 12, 1, 'asdf', '2021-01-04 03:07:18', '2021-01-04 03:07:18'),
(44, 13, 0, 'sdfsadfsdfg', '2021-03-06 01:03:48', '2021-03-06 01:03:48'),
(45, 13, 1, 'dfasdfasdfasdf', '2021-03-06 01:03:59', '2021-03-06 01:03:59'),
(46, 14, 0, 'asdasdfasdf', '2021-03-15 04:30:17', '2021-03-15 04:30:17'),
(47, 17, 0, 'asdf', '2021-03-15 04:32:52', '2021-03-15 04:32:52'),
(48, 18, 0, 'asdfasdf', '2021-05-03 10:39:08', '2021-05-03 10:39:08'),
(49, 19, 0, 'sdfgsdfg', '2021-05-07 07:40:50', '2021-05-07 07:40:50'),
(50, 19, 0, 'adsfadsf', '2021-05-07 07:43:15', '2021-05-07 07:43:15'),
(53, 20, 0, 'asdf', '2021-05-07 07:47:25', '2021-05-07 07:47:25'),
(54, 20, 0, 'asdf', '2021-05-07 07:50:00', '2021-05-07 07:50:00'),
(55, 21, 0, 'asdfasdf', '2021-05-08 04:20:10', '2021-05-08 04:20:10'),
(56, 22, 0, 'sdfgsdfg', '2021-05-09 04:48:46', '2021-05-09 04:48:46'),
(57, 23, 0, 'dfgsdfgsdfg', '2021-05-09 04:52:37', '2021-05-09 04:52:37'),
(58, 24, 0, 'sdfgsdfgsfdg', '2021-05-10 05:40:18', '2021-05-10 05:40:18'),
(59, 24, 0, 'asdfasdf', '2021-05-10 05:40:39', '2021-05-10 05:40:39'),
(60, 25, 0, 'sdfgsdfg', '2021-05-10 05:44:39', '2021-05-10 05:44:39'),
(61, 25, 1, 'asdfasdf', '2021-05-12 04:34:37', '2021-05-12 04:34:37'),
(63, 26, 0, 'asdfgsadfgasdfasdf', '2021-05-18 05:13:17', '2021-05-18 05:13:17'),
(64, 26, 0, 'dfgsdfgsdfgsdfg', '2021-05-18 05:15:37', '2021-05-18 05:15:37'),
(65, 26, 1, 'asdfasdfasdf', '2021-05-18 05:19:15', '2021-05-18 05:19:15'),
(66, 24, 1, 'ZXCZXC', '2021-05-20 09:53:29', '2021-05-20 09:53:29'),
(67, 24, 0, 'gfsdfgsdfg', '2021-05-30 11:42:17', '2021-05-30 11:42:17'),
(68, 27, 0, 'sdfgsdfg', '2021-06-05 10:25:11', '2021-06-05 10:25:11'),
(69, 27, 0, 'sdfgsdfg', '2021-06-05 10:25:22', '2021-06-05 10:25:22'),
(70, 27, 1, 'asdfasdfasdf', '2021-06-05 13:18:55', '2021-06-05 13:18:55'),
(71, 21, 1, 'rftghdfghdfgh', '2021-06-05 13:28:57', '2021-06-05 13:28:57'),
(72, 21, 1, 'rftghdfghdfgh', '2021-06-05 13:29:15', '2021-06-05 13:29:15'),
(73, 28, 0, 'rgtsdfgsdfg', '2021-06-17 12:19:16', '2021-06-17 12:19:16'),
(74, 29, 0, 'asdfasdf', '2021-06-17 12:20:26', '2021-06-17 12:20:26'),
(75, 30, 0, 'asdfasdf', '2021-06-17 12:22:10', '2021-06-17 12:22:10'),
(76, 31, 0, 'Sed tenetur voluptat', '2022-02-23 00:57:45', '2022-02-23 00:57:45'),
(77, 32, 0, 'Sint doloremque aut', '2022-02-23 00:58:05', '2022-02-23 00:58:05'),
(78, 33, 0, 'Aperiam lorem cupidi', '2022-02-23 01:12:51', '2022-02-23 01:12:51'),
(79, 34, 0, 'Aperiam lorem cupidi', '2022-02-23 01:12:59', '2022-02-23 01:12:59'),
(80, 35, 0, 'Consectetur in qui', '2022-02-23 01:13:10', '2022-02-23 01:13:10'),
(81, 36, 0, 'Consectetur in qui', '2022-02-23 01:13:21', '2022-02-23 01:13:21'),
(82, 37, 0, 'Atque magnam exercit', '2022-02-23 01:13:33', '2022-02-23 01:13:33'),
(83, 38, 0, 'Quidem aut accusanti', '2022-02-23 01:15:29', '2022-02-23 01:15:29'),
(84, 39, 0, 'Possimus excepteur', '2022-02-23 01:16:40', '2022-02-23 01:16:40'),
(85, 40, 0, 'Ea molestiae aut eni', '2022-02-23 01:17:29', '2022-02-23 01:17:29'),
(86, 41, 0, 'In qui nulla ullamco', '2022-02-23 01:17:42', '2022-02-23 01:17:42'),
(87, 42, 0, 'Quia natus voluptati', '2022-02-23 01:19:12', '2022-02-23 01:19:12'),
(88, 43, 0, 'Quia natus voluptati', '2022-02-23 01:19:20', '2022-02-23 01:19:20'),
(89, 44, 0, 'Nostrud itaque reici', '2022-02-23 01:58:43', '2022-02-23 01:58:43'),
(90, 45, 0, 'sdfg', '2022-02-23 07:50:09', '2022-02-23 07:50:09'),
(91, 46, 0, 'sdfg', '2022-02-23 07:50:59', '2022-02-23 07:50:59'),
(92, 47, 0, 'Natus adipisicing qu', '2022-03-05 06:32:42', '2022-03-05 06:32:42'),
(94, 30, 0, 'ff', '2022-03-19 05:57:32', '2022-03-19 05:57:32'),
(95, 30, 0, '0000000000', '2022-03-19 06:01:04', '2022-03-19 06:01:04'),
(96, 30, 0, 'ggggg', '2022-03-19 06:01:21', '2022-03-19 06:01:21'),
(97, 30, 0, 'ff', '2022-03-19 06:01:54', '2022-03-19 06:01:54'),
(98, 30, 0, 'sdfsdf', '2022-03-19 06:02:50', '2022-03-19 06:02:50'),
(99, 30, 0, 'asdf', '2022-03-21 00:35:33', '2022-03-21 00:35:33'),
(100, 47, 1, 'asdfasdf', '2022-03-21 02:48:44', '2022-03-21 02:48:44'),
(101, 48, 0, 'Explicabo Dignissim', '2022-03-22 08:30:31', '2022-03-22 08:30:31'),
(102, 48, 0, 'asdfgsdfg', '2022-03-22 08:32:54', '2022-03-22 08:32:54'),
(103, 49, 0, 'Dignissimos eos et t', '2022-03-22 08:58:43', '2022-03-22 08:58:43'),
(104, 49, 0, 'asdfasdf', '2022-03-22 09:07:03', '2022-03-22 09:07:03'),
(105, 49, 1, 'fffffff', '2022-03-22 09:07:47', '2022-03-22 09:07:47'),
(107, 49, 0, 'sdrgsdfg', '2022-03-22 09:10:00', '2022-03-22 09:10:00'),
(108, 49, 1, 'sdfggggggggggggggggggggggggg  dddddddddddddd', '2022-03-22 09:17:28', '2022-03-22 09:17:28'),
(109, 49, 1, 'sdfgsfg', '2022-03-22 09:18:35', '2022-03-22 09:18:35'),
(110, 49, 1, 'asdfasdfadsf', '2022-03-22 09:25:14', '2022-03-22 09:25:14'),
(112, 49, 1, 'gg', '2022-03-30 09:42:35', '2022-03-30 09:42:35'),
(113, 49, 1, 'gg', '2022-03-30 09:43:24', '2022-03-30 09:43:24'),
(114, 49, 1, 'gg', '2022-03-30 09:44:19', '2022-03-30 09:44:19'),
(115, 49, 1, 'gg', '2022-03-30 09:50:10', '2022-03-30 09:50:10'),
(116, 49, 1, 'gg', '2022-03-30 09:50:30', '2022-03-30 09:50:30'),
(118, 50, 0, 'Quo tempor doloremqu', '2022-04-03 03:39:13', '2022-04-03 03:39:13'),
(119, 36, 1, 'ff', '2022-04-03 04:32:56', '2022-04-03 04:32:56'),
(120, 51, 0, 'In in totam nobis om', '2022-04-03 07:52:21', '2022-04-03 07:52:21'),
(121, 51, 1, 'h', '2022-04-04 04:33:58', '2022-04-04 04:33:58'),
(122, 51, 1, 'sdfg', '2022-04-05 04:16:37', '2022-04-05 04:16:37'),
(123, 51, 1, 'dfgsdfg sdfg sd', '2022-04-07 07:34:20', '2022-04-07 07:34:20'),
(124, 51, 1, 'sadfasdf asdfasdfasdf', '2022-04-07 07:34:31', '2022-04-07 07:34:31'),
(125, 49, 1, 'sdfg sfgsfg', '2022-04-07 07:35:03', '2022-04-07 07:35:03'),
(126, 51, 1, 'adsfasdf', '2022-04-07 07:37:11', '2022-04-07 07:37:11'),
(127, 51, 1, 'adsfasdf', '2022-04-07 07:37:48', '2022-04-07 07:37:48'),
(128, 51, 1, 'adsfasdf', '2022-04-07 07:37:58', '2022-04-07 07:37:58'),
(129, 51, 1, 'adsfasdf', '2022-04-07 07:38:07', '2022-04-07 07:38:07'),
(130, 51, 1, 'adsfasdf', '2022-04-07 07:38:36', '2022-04-07 07:38:36'),
(131, 51, 1, 'adsfasdf', '2022-04-07 07:38:43', '2022-04-07 07:38:43'),
(132, 51, 1, 'adsfasdf', '2022-04-07 07:38:55', '2022-04-07 07:38:55'),
(133, 51, 1, 'adsfasdf', '2022-04-07 07:40:28', '2022-04-07 07:40:28'),
(134, 51, 1, 'adsfasdf', '2022-04-07 07:40:45', '2022-04-07 07:40:45'),
(135, 51, 1, 'asdfsadfsdf', '2022-04-07 07:42:34', '2022-04-07 07:42:34'),
(136, 51, 1, 'j', '2022-04-07 07:45:08', '2022-04-07 07:45:08'),
(137, 52, 0, 'Quia lorem iusto in', '2022-04-09 02:12:51', '2022-04-09 02:12:51'),
(138, 52, 0, 'asdfasdf asdfasdf', '2022-04-09 02:12:57', '2022-04-09 02:12:57'),
(139, 52, 0, 'asdfadsf', '2022-04-09 02:13:26', '2022-04-09 02:13:26'),
(140, 52, 0, 'asdf', '2022-04-09 02:14:33', '2022-04-09 02:14:33'),
(141, 52, 1, 'dfsdfgsdfg', '2022-09-26 14:01:26', '2022-09-26 14:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `email` varchar(40) DEFAULT NULL,
  `ticket` varchar(40) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: Open, 1: Answered, 2: Replied, 3: Closed',
  `priority` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 = Low, 2 = medium, 3 = heigh',
  `last_reply` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `name`, `email`, `ticket`, `subject`, `status`, `priority`, `last_reply`, `created_at`, `updated_at`) VALUES
(28, 0, 'Marchant Marchant', 'marchant@gmail.com', '92776025', 'yturtyhd', 0, 2, '2021-06-17 18:19:16', '2021-06-17 12:19:16', '2021-06-17 12:19:16'),
(29, 8, 'Marchant Marchant', 'marchant@gmail.com', '08230823', 'asdfasdf', 3, 2, '2021-06-17 18:20:26', '2021-06-17 12:20:26', '2022-04-04 05:49:53'),
(30, 8, 'f33 h', 'user@site.com', '54825065', 'asdf', 3, 2, '2022-03-21 06:35:33', '2021-06-17 12:22:10', '2022-04-03 03:00:18'),
(31, 0, 'Stone Dennis', 'pybezeha@amimail.com', '57495475', 'Elit corporis est', 0, 2, '2022-02-23 06:57:45', '2022-02-23 00:57:45', '2022-02-23 00:57:45'),
(32, 0, 'Willow Nguyen', 'cupe@amimail.com', '29070859', 'Eveniet adipisicing', 0, 2, '2022-02-23 06:58:05', '2022-02-23 00:58:05', '2022-02-23 00:58:05'),
(33, 0, 'Cole Byers', 'nuhydej@amimail.com', '68231262', 'Perferendis qui dele', 0, 2, '2022-02-23 07:12:51', '2022-02-23 01:12:51', '2022-02-23 01:12:51'),
(34, 0, 'Cole Byers', 'nuhydej@amimail.com', '58246189', 'Perferendis qui dele', 0, 2, '2022-02-23 07:12:59', '2022-02-23 01:12:59', '2022-02-23 01:12:59'),
(35, 0, 'Keane Hunter', 'pafori@amimail.com', '80866392', 'Qui saepe harum quamQui saepe harum quamQui saepe harum quam', 0, 2, '2022-02-23 07:13:10', '2022-02-23 01:13:10', '2022-02-23 01:13:10'),
(36, 0, 'Keane Hunter', 'pafori@amimail.com', '13088897', 'Natus quidem laborum', 2, 2, '2022-04-03 10:32:56', '2022-02-23 01:13:21', '2022-04-03 04:32:56'),
(37, 0, 'India Morrow', 'dawilazajy@amimail.com', '82511865', 'Earum voluptates qui', 0, 2, '2022-02-23 07:13:33', '2022-02-23 01:13:33', '2022-02-23 01:13:33'),
(38, 0, 'Lareina Robles', 'kuwosejeji@amimail.com', '12583429', 'Dolor nobis placeat', 0, 2, '2022-02-23 07:15:29', '2022-02-23 01:15:29', '2022-02-23 01:15:29'),
(39, 0, 'Darryl Coffey', 'beseruko@amimail.com', '70052193', 'Quae dolor deserunt', 0, 2, '2022-02-23 07:16:40', '2022-02-23 01:16:40', '2022-02-23 01:16:40'),
(40, 0, 'Katelyn Hansen', 'mamyvyli@amimail.com', '18796027', 'Qui lorem voluptas e', 0, 2, '2022-02-23 07:17:29', '2022-02-23 01:17:29', '2022-02-23 01:17:29'),
(41, 0, 'Ursa Fulton', 'hejyl@amimail.com', '18352800', 'Expedita elit aut i', 0, 2, '2022-02-23 07:17:42', '2022-02-23 01:17:42', '2022-02-23 01:17:42'),
(42, 0, 'Rebekah Fulton', 'bicikocaza@amimail.com', '15754786', 'Illo sed dolor incid', 0, 2, '2022-02-23 07:19:12', '2022-02-23 01:19:12', '2022-02-23 01:19:12'),
(43, 0, 'Rebekah Fulton', 'bicikocaza@amimail.com', '95463552', 'Illo sed dolor incid', 0, 2, '2022-02-23 07:19:20', '2022-02-23 01:19:20', '2022-02-23 01:19:20'),
(44, 0, 'Jada Fry', 'nojomopa@amimail.com', '51547138', 'Sint ut natus accusa', 0, 2, '2022-02-23 07:58:43', '2022-02-23 01:58:43', '2022-02-23 01:58:43'),
(45, 0, 'sgd', 'sdfg', '76951166', 'dfg', 0, 2, '2022-02-23 13:50:09', '2022-02-23 07:50:09', '2022-02-23 07:50:09'),
(46, 0, 'sgd', 'sdfg', '70632904', 'dfg', 0, 2, '2022-02-23 13:50:59', '2022-02-23 07:50:59', '2022-02-23 07:50:59'),
(47, 0, 'Destiny Wise', 'jaqidisyb@amimail.com', '54666280', 'Qui saepe harum quam', 1, 2, '2022-03-21 08:48:44', '2022-03-05 06:32:41', '2022-03-21 02:48:44'),
(48, 30, 'Herrod Parrish', 'fevu@amimail.com', '581151', 'Optio esse veniam', 3, 2, '2022-03-22 14:32:54', '2022-03-22 08:30:31', '2022-03-22 08:32:58'),
(49, 30, 'Herrod Parrish', 'fevu@amimail.com', '403997', 'Vel ut qui tenetur f', 2, 3, '2022-04-07 13:35:03', '2022-03-22 08:58:43', '2022-04-07 07:35:03'),
(50, 0, 'Timon Kim', 'vozuxad@mailinator.com', '40031718', 'In molestiae delenit', 0, 2, '2022-04-03 09:39:13', '2022-04-03 03:39:13', '2022-04-03 03:39:13'),
(51, 0, 'Roth Mcneil', 'tavexora@mailinator.com', '36771383', 'Facilis dolore natus', 2, 2, '2022-04-07 13:45:08', '2022-04-03 07:52:21', '2022-04-07 07:45:08'),
(52, 0, 'Colin Mccray', 'cizepuda@amimail.com', '06772251', 'Sapiente sit consequ', 1, 2, '2022-09-26 20:01:26', '2022-04-09 02:12:51', '2022-09-26 14:01:26');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `post_balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx_type` varchar(40) DEFAULT NULL,
  `trx` varchar(40) DEFAULT NULL,
  `details` varchar(255) DEFAULT NULL,
  `remark` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `user_id`, `amount`, `charge`, `post_balance`, `trx_type`, `trx`, `details`, `remark`, `created_at`, `updated_at`) VALUES
(1, 29, '100.00000000', '2.00000000', '100.00000000', '+', 'AHROWMD1MXO6', 'Deposit Via Stripe Hosted - USD', 'deposit', NULL, NULL),
(2, 29, '100.00000000', '2.00000000', '200.00000000', '+', 'T29P6QSQTQU2', 'Deposit Via Stripe Hosted - USD', 'deposit', '2022-03-21 04:05:04', '2022-03-21 04:05:04'),
(3, 8, '19.54700000', '0.00000000', '14787.55755565', '+', 'DG7V5FHHV24Z', 'Qui enim nisi eos ra', 'balance_add', '2022-03-21 07:07:49', '2022-03-21 07:07:49'),
(4, 8, '10.00000000', '1.10000000', '14777.55755565', '-', 'H3SQMS7PW6FV', '8.90 USD Withdraw Via Cheyenne Justice', 'withdraw', '2022-03-24 04:47:11', '2022-03-24 04:47:11'),
(6, 8, '10.00000000', '0.00000000', '14817.55755565', '+', 'MM3HNXB4PMO6', '256', 'balance_add', '2022-03-30 10:02:06', '2022-03-30 10:02:06'),
(7, 8, '100.00000000', '3.00000000', '14717.55755565', '-', '63QSRS186WNB', '97.00 USD Withdraw Via Bank Transfer', 'withdraw', '2022-04-03 04:23:38', '2022-04-03 04:23:38'),
(8, 8, '100.00000000', '0.00000000', '14817.55755565', '+', '63QSRS186WNB', '100.00 USD Refunded from withdrawal rejection', 'withdraw_reject', '2022-04-03 04:25:53', '2022-04-03 04:25:53'),
(9, 8, '100.00000000', '3.00000000', '14717.55755565', '-', '9JO7WE2YMWJY', '97.00 USD Withdraw Via Bank Transfer', 'withdraw', '2022-04-04 05:37:37', '2022-04-04 05:37:37');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `firstname` varchar(40) DEFAULT NULL,
  `lastname` varchar(40) DEFAULT NULL,
  `username` varchar(40) NOT NULL,
  `email` varchar(40) NOT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `mobile` varchar(40) DEFAULT NULL,
  `ref_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `balance` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `password` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL COMMENT 'contains full address',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: banned, 1: active',
  `kyc_data` text DEFAULT NULL,
  `kv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: KYC Unverified, 2: KYC pending, 1: KYC verified',
  `ev` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: email unverified, 1: email verified',
  `sv` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: mobile unverified, 1: mobile verified',
  `reg_step` tinyint(1) NOT NULL DEFAULT 0,
  `ver_code` varchar(40) DEFAULT NULL COMMENT 'stores verification code',
  `ver_code_send_at` datetime DEFAULT NULL COMMENT 'verification send time',
  `ts` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0: 2fa off, 1: 2fa on',
  `tv` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0: 2fa unverified, 1: 2fa verified',
  `tsc` varchar(255) DEFAULT NULL,
  `ban_reason` varchar(255) DEFAULT NULL,
  `remember_token` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `lastname`, `username`, `email`, `country_code`, `mobile`, `ref_by`, `balance`, `password`, `image`, `address`, `status`, `kyc_data`, `kv`, `ev`, `sv`, `reg_step`, `ver_code`, `ver_code_send_at`, `ts`, `tv`, `tsc`, `ban_reason`, `remember_token`, `created_at`, `updated_at`) VALUES
(8, 'User', 'Hingle May', 'hinglemay', 'user@site.com', 'BD', '88000000000', 0, '14717.55755565', '$2y$10$5NWQqhzM650gX5BCTJ.ZbOZPuALekunwNvGexi7/mTGVaOW/LzlF6', '60ab4559872cb1621837145.png', '{\"country\":\"Bangladesh\",\"address\":\"London\",\"state\":\"London\",\"zip\":\"5874\",\"city\":\"London\"}', 1, NULL, 1, 1, 1, 1, '119199', '2022-04-03 10:49:17', 0, 1, NULL, NULL, 'AS1GDZhRGmj7tEy89L0PrWY039CAYXZ2Rq9gtSKServ5xBjXNBKhq2Tz3e0S', '2020-07-25 00:40:06', '2022-04-11 08:01:50'),
(9, 'User', 'Fring J', 'username2', 'user2@site.com', 'PK', '8805646546987', 0, '0.00000000', '$2y$10$kvu.xRlHv32YheJWV3NWneQR0vPIA5Eev01jUjQeieHQDJSE1XXs.', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Antigua and Barbuda\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, '217802', '2020-11-19 10:18:39', 0, 1, NULL, NULL, NULL, '2020-11-19 04:18:38', '2020-11-19 04:19:44'),
(11, 'user44', 'Poyos Harmanos', 'username3', 'user457@site.com', 'US', '65659854857', 0, '0.00000000', '$2y$10$UD7lj91bK2SK0CEqtIi/s.XZKh8Wm.ajz1DimEuoDBLiNAE29zY7a', NULL, '{\"address\":\"Address\",\"city\":\"FFF\",\"state\":\"7878\",\"zip\":\"5874\",\"country\":\"Algeria\"}', 1, NULL, 0, 1, 1, 0, '112922', '2020-11-23 12:45:44', 0, 1, NULL, NULL, NULL, '2020-11-23 06:45:43', '2021-01-04 00:03:31'),
(13, 'KB', 'Saul', 'testuser123', 'testuser123@gmail.com', 'LT', '1268654254541', 0, '1180.00000000', '$2y$10$0TizysQNL9Yw6DYOji5Eh.mrstho4NhuVam7ssaCYS0Y9JegnopZG', '1615803362_testuser123.jpg', '{\"address\":\"Dhaka\",\"city\":\"Dhaka\",\"state\":\"Dhaka\",\"zip\":\"1230\",\"country\":\"Lithuania\"}', 1, NULL, 0, 1, 1, 0, '950194', '2021-03-15 09:35:45', 0, 1, NULL, NULL, NULL, '2021-03-15 03:35:45', '2021-05-05 09:33:22'),
(17, 'Test', 'Jimmy Miguel', 'testuser55', 'user990@site.com', 'BD', '93654545453', 0, '0.00000000', '$2y$10$bV6Mi/8uv/MirSHWtn8qz.txLfzvSaovndD.GPCoCaHD8UK/bdJOi', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, '439780', '2021-04-17 07:17:26', 0, 1, NULL, NULL, NULL, '2021-04-17 01:17:26', '2021-05-02 05:37:53'),
(18, 'User', 'Kim Wexlar', 'username33', 'user99@site.com', 'AZ', '99496565654', 0, '0.00000000', '$2y$10$jbMEuGQ/U.gTPihO4jfBD.wnnWgZNyhj3n2VUkp0V2LOaGau6HbF6', NULL, '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Bangladesh\"}', 1, NULL, 0, 0, 1, 0, '404482', '2021-04-28 06:41:42', 0, 1, NULL, NULL, NULL, '2021-04-28 00:41:42', '2021-05-04 13:53:22'),
(19, 'Hamlin', 'Hamlin', 'username5', 'user5@site.com', 'AF', '9365465456454', 0, '0.00000000', '$2y$10$.tD1XpK.E4ubM4Pg3yEuYO3tzMasHqd2pzsRjm8nGYKhIwxTmNI/2', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Afghanistan\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2021-05-10 06:24:07', '2021-05-10 06:24:14'),
(20, 'tesos', 'tesos', 'username6', 'user6@site.com', 'AD', '936546334', 8, '10010.00000000', '$2y$10$0BuEBEfe82oTukY9BFrODeFP9d4sS7KJdoHBPk1oziRkKAC/D8VOi', NULL, '{\"country\":\"Andorra\",\"address\":\"Lakewood, CA 90805, Locker, TX 76801\",\"state\":\"California\",\"zip\":\"90805\",\"city\":\"Lakewood\"}', 1, NULL, 0, 1, 1, 1, NULL, NULL, 1, 1, 'FSLM3BZVLNPY7JYI', NULL, NULL, '2021-05-10 06:27:04', '2023-03-21 07:34:56'),
(22, 'John', 'Doe', 'testuser', 'test@mail.com', 'AU', '6165463548554', 0, '0.00000000', '$2y$10$OhSvy7ncR6dBuhTnUvmiXuJRjpLfjWtZdE2uYKx/P46lJoZ00omfC', NULL, '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Australia\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2021-05-19 05:47:02', '2022-04-04 05:16:38'),
(23, 'C.', 'Varga', 'testuser33', 'myname5587@myname5587.myname5587', 'AI', '1264123456789', 0, '0.00000000', '$2y$10$19byGz10jEXEQDxsoLTrMug4qYnuzT9O3S4.o0w8YN72mruuGh.8m', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Anguilla\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, '467842', '2021-06-09 12:15:34', 0, 1, NULL, NULL, NULL, '2021-06-09 06:15:33', '2021-06-09 06:15:34'),
(24, 'DCM', 'Wexlar', 'jcole5950', 'mosta@gmail.com', 'BD', '88001628071671', 0, '0.00000000', '$2y$10$hv5l/n1.Y2WcQGPM13NR5uuditJgwr89jHnZabxyz738pf5MFxc5i', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2021-06-10 05:31:54', '2021-06-10 12:39:55'),
(25, 'Chloe', 'Hoxel', 'moscingle', 'mostas@gmail.com', 'BD', '88001628071672', 0, '0.00000000', '$2y$10$6VyFIftVzo9o4Mx.pHRCQOTUgOdWMMbLUHYhNfjRdVHHmTHrjHn9a', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2021-06-10 05:35:17', '2021-06-10 05:35:17'),
(26, 'Ken', 'Wallace', 'moscingle3', 'mosta3@gmail.com', 'BD', '88001628071673', 0, '0.00000000', '$2y$10$zP92objty3B6R/k9A4FIs.vT4SUXQGDgFIIwCK//3dpnp0s6Xr/aW', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Bangladesh\",\"city\":\"\"}', 1, NULL, 0, 0, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2021-06-10 08:38:28', '2021-06-10 08:38:28'),
(27, 'Graciela A.', 'Romano\n', 'tes77788', 'testuser5588@gmail.com', 'AF', '59154685458', 0, '0.00000000', '$2y$10$bnERS5Za.TVGNxb89ttI2eIc10.kDEXK8hTkUS5Ob7sKpN7N8vRHa', NULL, '{\"address\":null,\"city\":null,\"state\":null,\"zip\":null,\"country\":\"Afghanistan\"}', 1, NULL, 0, 1, 1, 0, '994511', '2022-03-06 11:53:38', 1, 0, NULL, NULL, NULL, '2021-06-12 05:27:14', '2022-03-10 07:25:03'),
(28, 'Ken', 'Morales', 'fajavidi', 'gasaf@amimail.com', 'DZ', '213Accusamus at et rati', 0, '0.00000000', '$2y$10$LYPdpUJDnCfG7MXUF0ydaOX5ESI6dLrjlrnh9QJ0YgaJdRSPMs9HS', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Algeria\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, '210333', '2022-03-17 09:09:59', 0, 1, NULL, NULL, NULL, '2022-03-17 03:09:58', '2022-03-21 01:07:58'),
(29, 'Anthony ', 'J.', 'michbarry', 'fyjify@amimail.com', 'KN', '18695946542145', 0, '200.00000000', '$2y$10$5iSye35hvir6jdd1nMx5/elcysmkvfrTFCfK0MLV5nb9QsA2Q7ury', NULL, '{\"address\":\"\",\"state\":\"\",\"zip\":\"\",\"country\":\"Saint Kitts and Nevis\",\"city\":\"\"}', 1, NULL, 0, 1, 1, 0, NULL, NULL, 0, 1, NULL, NULL, NULL, '2022-03-21 02:41:54', '2022-09-20 10:01:31'),
(30, 'Pearl', 'Garrish', 'lalosalamanca', 'fevu@amimail.com', 'CO', '5736564684', 0, '0.00000000', '$2y$10$tw6Ppdztjt6WbFA61GYHAuvnUl4zI3j2jMcMGp8UVMzHF32ACWCjG', NULL, '{\"country\":\"Colombia\",\"address\":\"Vitae labore iure es\",\"state\":\"Sunt nisi et enim vo\",\"zip\":\"82702\",\"city\":\"In vel aspernatur si\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2022-03-22 07:53:20', '2022-03-22 08:09:45'),
(31, 'John', 'Havier', 'gusfring', 'user879@gmail.com', 'AM', '37458745455754', 0, '0.00000000', '$2y$10$M.ZMRFlWUCWXh3cb2htccuNxAG48bU6Q9PAqeHgXG4esiS82rWvM2', NULL, '{\"address\":null,\"city\":\"Dhaka\",\"state\":null,\"zip\":null,\"country\":\"Armenia\"}', 1, NULL, 1, 0, 1, 0, '285472', '2022-09-29 17:45:24', 0, 1, NULL, NULL, NULL, '2022-03-22 11:22:57', '2023-01-05 09:32:49'),
(32, 'tesos', 'tesos', 'testuser1', 'testuser1@gmail.com', 'AF', '934567898452', 0, '0.00000000', '$2y$10$PGHz5AGcAXPf2rSS1hD.su7SHL2.0ZP18ICA43OUhbceHm/s/reTK', NULL, '{\"country\":\"Afghanistan\",\"address\":\"Lakewood, CA 90805, Locker, TX 76801\",\"state\":\"California\",\"zip\":\"90805\",\"city\":\"Lakewood\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-03-22 04:09:55', '2023-03-22 04:10:43'),
(33, 'User', 'User', 'demouser', 'demouser@gmail.com', 'AF', NULL, 0, '0.00000000', '$2y$10$JqSM3d9y5pyCwLgfjHDRg.TWTNiwosqCaUMdDPhR3ygk6TupKG6bu', NULL, '{\"address\":\"UK\",\"state\":\"UK\",\"zip\":\"1200\",\"country\":\"Afghanistan\",\"city\":\"Dhaka\"}', 1, NULL, 1, 1, 1, 1, NULL, NULL, 0, 1, NULL, NULL, NULL, '2023-09-16 23:24:11', '2023-09-17 00:51:04');

-- --------------------------------------------------------

--
-- Table structure for table `user_logins`
--

CREATE TABLE `user_logins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_ip` varchar(40) DEFAULT NULL,
  `city` varchar(40) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `country_code` varchar(40) DEFAULT NULL,
  `longitude` varchar(40) DEFAULT NULL,
  `latitude` varchar(40) DEFAULT NULL,
  `browser` varchar(40) DEFAULT NULL,
  `os` varchar(40) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_logins`
--

INSERT INTO `user_logins` (`id`, `user_id`, `user_ip`, `city`, `country`, `country_code`, `longitude`, `latitude`, `browser`, `os`, `created_at`, `updated_at`) VALUES
(1, 32, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-03-22 04:09:56', '2023-03-22 04:09:56'),
(2, 33, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-09-16 23:24:11', '2023-09-16 23:24:11'),
(3, 33, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-09-16 23:47:53', '2023-09-16 23:47:53'),
(4, 33, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-09-17 00:50:23', '2023-09-17 00:50:23'),
(5, 33, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-09-17 00:50:42', '2023-09-17 00:50:42'),
(6, 33, '127.0.0.1', '', '', '', '', '', 'Chrome', 'Windows 10', '2023-09-17 02:44:55', '2023-09-17 02:44:55');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `method_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `currency` varchar(40) DEFAULT NULL,
  `rate` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `trx` varchar(40) DEFAULT NULL,
  `final_amount` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `after_charge` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `withdraw_information` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1=>success, 2=>pending, 3=>cancel,  ',
  `admin_feedback` text DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdrawals`
--

INSERT INTO `withdrawals` (`id`, `method_id`, `user_id`, `amount`, `currency`, `rate`, `charge`, `trx`, `final_amount`, `after_charge`, `withdraw_information`, `status`, `admin_feedback`, `created_at`, `updated_at`) VALUES
(1, 1, 8, '100.00000000', 'USD', '1.00000000', '3.00000000', '63QSRS186WNB', '97.00000000', '97.00000000', '[{\"name\":\"Bank Name\",\"type\":\"text\",\"value\":\"Hilary Irwin\"},{\"name\":\"Account Name\",\"type\":\"text\",\"value\":\"Mira Bishop\"},{\"name\":\"Account Number\",\"type\":\"text\",\"value\":\"384\"}]', 1, 'ffffff', '2022-03-01 04:23:33', '2022-04-03 04:25:53'),
(2, 1, 8, '10.00000000', 'USD', '1.00000000', '1.20000000', 'QNVJZSWATSH2', '8.80000000', '8.80000000', NULL, 1, NULL, '2022-04-03 06:38:22', '2022-04-03 06:38:22'),
(3, 1, 8, '100.00000000', 'USD', '1.00000000', '3.00000000', '9JO7WE2YMWJY', '97.00000000', '97.00000000', '[{\"name\":\"Bank Name\",\"type\":\"text\",\"value\":\"Yardley Castaneda\"},{\"name\":\"Account Name\",\"type\":\"text\",\"value\":\"Chelsea Collins\"},{\"name\":\"Account Number\",\"type\":\"text\",\"value\":\"969\"}]', 1, NULL, '2022-04-04 05:37:32', '2022-04-04 05:37:37'),
(4, 1, 8, '10.00000000', 'USD', '1.00000000', '1.20000000', 'B5B3RT3VN1XH', '8.80000000', '8.80000000', NULL, 0, NULL, '2022-04-05 05:13:26', '2022-04-05 05:13:26');

-- --------------------------------------------------------

--
-- Table structure for table `withdraw_methods`
--

CREATE TABLE `withdraw_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `form_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `name` varchar(40) DEFAULT NULL,
  `min_limit` decimal(28,8) DEFAULT 0.00000000,
  `max_limit` decimal(28,8) NOT NULL DEFAULT 0.00000000,
  `fixed_charge` decimal(28,8) DEFAULT 0.00000000,
  `rate` decimal(28,8) DEFAULT 0.00000000,
  `percent_charge` decimal(5,2) DEFAULT NULL,
  `currency` varchar(40) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraw_methods`
--

INSERT INTO `withdraw_methods` (`id`, `form_id`, `name`, `min_limit`, `max_limit`, `fixed_charge`, `rate`, `percent_charge`, `currency`, `description`, `status`, `created_at`, `updated_at`) VALUES
(1, 13, 'Tranfer from Bank', '1.00000000', '1000.00000000', '1.00000000', '1.00000000', '2.00', 'USD', '<p><span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Please Provide The information Below:</span></p>', 1, '2022-03-30 09:09:11', '2022-09-29 09:54:58'),
(2, 14, 'Mobile Banking', '1.00000000', '1000.00000000', '0.00000000', '1.00000000', '0.01', 'USD', '<span style=\"color: rgb(33, 37, 41); font-family: Montserrat, sans-serif;\">Please Provide The Information Below:</span><br>', 1, '2022-03-30 09:10:12', '2022-09-29 09:55:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`,`username`);

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `extensions`
--
ALTER TABLE `extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `frontends`
--
ALTER TABLE `frontends`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateways`
--
ALTER TABLE `gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `general_settings`
--
ALTER TABLE `general_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_logs`
--
ALTER TABLE `notification_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notification_templates`
--
ALTER TABLE `notification_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ptcs`
--
ALTER TABLE `ptcs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_attachments`
--
ALTER TABLE `support_attachments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_messages`
--
ALTER TABLE `support_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_logins`
--
ALTER TABLE `user_logins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `admin_password_resets`
--
ALTER TABLE `admin_password_resets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `extensions`
--
ALTER TABLE `extensions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `forms`
--
ALTER TABLE `forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `frontends`
--
ALTER TABLE `frontends`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `gateways`
--
ALTER TABLE `gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `gateway_currencies`
--
ALTER TABLE `gateway_currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `general_settings`
--
ALTER TABLE `general_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `notification_logs`
--
ALTER TABLE `notification_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `notification_templates`
--
ALTER TABLE `notification_templates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `plans`
--
ALTER TABLE `plans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ptcs`
--
ALTER TABLE `ptcs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `support_attachments`
--
ALTER TABLE `support_attachments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `support_messages`
--
ALTER TABLE `support_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=142;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `user_logins`
--
ALTER TABLE `user_logins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `withdraw_methods`
--
ALTER TABLE `withdraw_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
