-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 15, 2022 at 10:29 PM
-- Server version: 5.5.68-MariaDB
-- PHP Version: 7.4.32

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `orktdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verify_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` int(11) DEFAULT NULL,
  `two_fa_status` tinyint(4) NOT NULL DEFAULT '1',
  `two_fa` tinyint(4) NOT NULL DEFAULT '1',
  `two_fa_code` int(10) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `email_verify_token`, `phone`, `photo`, `status`, `password`, `remember_token`, `role`, `verify_code`, `two_fa_status`, `two_fa`, `two_fa_code`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'trendzhq.com@gmail.com', '', '+2348136332835', '18454587891642651833.jpg', 1, '$2y$10$l2PVvlPPrdkycfXUeF5E1u7UbouKZbbyWtFHa5p3oSmR9BXgooysm', '08q0F8HBRQ742siM41IJlYMtn4vkIHMLJ8n6yhf4BERs7fq8OoGW9YSHVY3z', 'super-admin', 726094, 1, 0, 410980, NULL, '2022-11-18 17:23:07'),
(2, 'John', 'john@mail.com', NULL, NULL, NULL, 1, '$2y$10$by0NiJcmt2lHhfAI4lHQbuRWgUsRJO2EpsGXKFmU0Vt/PwJDre5Hu', NULL, 'moderator', NULL, 1, 1, 0, '2022-01-17 22:36:49', '2022-01-19 05:48:28'),
(3, 'Miriam Mccoy', 'maccoy@mail.com', NULL, NULL, NULL, 1, '$2y$10$D0MH0g1qjTUoB824PeloK.XpjIAdJKZMbsqWZnHzLjFuvvQU8QMk.', NULL, 'moderator', NULL, 1, 1, 0, '2022-01-19 05:05:33', '2022-01-19 05:05:33'),
(4, 'henry', 'henry@mail.com', NULL, NULL, NULL, 1, '$2y$10$DM9XXJb7KgQHESmlWTx6y.AhBZukZjH0DcW6BgWjvSavVMxnIEHfq', NULL, 'Ticket Handler', NULL, 1, 1, 0, '2022-02-16 23:56:16', '2022-02-16 23:56:16'),
(5, 'Jammie', 'jammie@yopmail.com', NULL, NULL, NULL, 1, '$2y$10$ezfBOzm7CDjGMfdoLoZUIOdQOTYE.oNdonEMpU4H0iwuz7X4/t/ci', NULL, 'Test Role', NULL, 1, 1, 523756, '2022-09-05 09:04:36', '2022-09-18 07:54:14');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `category_id` int(191) NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `views` int(11) NOT NULL DEFAULT '0',
  `likes` int(11) NOT NULL DEFAULT '0',
  `type` varchar(6) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'admin',
  `user_id` int(11) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blogs`
--

INSERT INTO `blogs` (`id`, `category_id`, `title`, `slug`, `photo`, `description`, `views`, `likes`, `type`, `user_id`, `status`, `created_at`, `updated_at`) VALUES
(77, 1, 'asheer', 'asheer', '17715125181667763027.jpg', '<p>ggggaaaaaaaaaaaaaaaa</p>', 0, 0, 'user', 28, 2, '2022-11-06 19:30:27', '2022-11-06 19:30:27'),
(78, 1, 'ok', 'ok', '15873216511667763628.jpg', '<p>ggggaaaaaaaaaaaaaaaa</p>', 0, 0, 'user', 28, 2, '2022-11-06 19:40:28', '2022-11-06 19:40:28'),
(79, 9, 'ah', 'ah', '16479871441667806795.jpg', '<p>aaaaaaaaaaaaaaaa</p>', 0, 0, 'user', 28, 2, '2022-11-07 07:39:55', '2022-11-07 07:39:55');

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `name`, `slug`, `status`, `created_at`, `updated_at`) VALUES
(8, 'News', 'news', 1, NULL, NULL),
(9, 'Announces', 'announces', 1, NULL, NULL),
(10, 'Statistics', 'statistics', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `unique_key` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dial_code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `flag` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `unique_key`, `name`, `code`, `dial_code`, `currency_id`, `flag`, `created_at`, `updated_at`) VALUES
(2, 1, 'Ascension Island', 'AC', '+247', 4, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AC.svg', '2021-12-20 23:25:41', '2021-12-20 23:55:28'),
(3, 240, 'United States', 'US', '+1', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/US.svg', '2021-12-21 00:16:55', '2021-12-21 00:16:55'),
(4, 19, 'Bangladesh', 'BD', '+880', 6, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BD.svg', '2021-12-21 00:50:56', '2021-12-21 00:50:56'),
(5, 81, 'United Kingdom', 'GB', '+44', 5, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GB.svg', '2021-12-21 00:51:27', '2021-12-21 05:53:03'),
(6, 18, 'Belgium', 'BE', '+32', 4, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BE.svg', '2022-01-29 23:47:16', '2022-01-29 23:47:16'),
(7, 11, 'Austria', 'AT', '+43', 4, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AT.svg', '2022-02-06 05:55:48', '2022-02-06 05:55:48'),
(8, 0, 'Afghanistan', 'AF', '+93', 10, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AF.svg', '2022-03-13 04:04:03', '2022-03-13 04:04:03'),
(9, 2, 'Algeria', 'DZ', '+213', 4, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DZ.svg', '2022-03-13 04:04:18', '2022-03-13 04:04:18'),
(10, 5, 'Anguilla', 'AI', '+1264', 13, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AI.svg', '2022-03-13 04:04:30', '2022-03-13 04:04:30'),
(11, 24, 'Brazil', 'BR', '+55', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BR.svg', '2022-03-13 04:04:57', '2022-03-13 04:04:57'),
(12, 31, 'Canada', 'CA', '+1', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CA.svg', '2022-03-13 04:07:58', '2022-03-13 04:07:58'),
(13, 52, 'Egypt', 'EG', '+20', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EG.svg', '2022-03-13 04:08:13', '2022-03-13 04:08:13'),
(14, 3, 'Andorra', 'AD', '+376', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AD.svg', '2022-10-15 19:33:37', '2022-10-15 19:33:37'),
(15, 4, 'Angola', 'AO', '+244', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AO.svg', '2022-10-15 19:33:46', '2022-10-15 19:33:46'),
(16, 6, 'Antarctica', 'AQ', '+672', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AQ.svg', '2022-10-15 19:33:55', '2022-10-15 19:33:55'),
(17, 7, 'Argentina', 'AR', '+54', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AR.svg', '2022-10-15 19:34:00', '2022-10-15 19:34:00'),
(18, 8, 'Armenia', 'AM', '+374', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AM.svg', '2022-10-15 19:34:07', '2022-10-15 19:34:07'),
(19, 9, 'Aruba', 'AW', '+297', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AW.svg', '2022-10-15 19:34:08', '2022-10-15 19:34:08'),
(20, 10, 'Australia', 'AU', '+61', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AU.svg', '2022-10-15 19:34:12', '2022-10-15 19:34:12'),
(21, 12, 'Azerbaijan', 'AZ', '+994', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AZ.svg', '2022-10-15 19:34:20', '2022-10-15 19:34:20'),
(22, 13, 'Bahamas', 'BS', '+1242', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BS.svg', '2022-10-15 19:34:26', '2022-10-15 19:34:26'),
(23, 14, 'Bahrain', 'BH', '+973', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BH.svg', '2022-10-15 19:34:31', '2022-10-15 19:34:31'),
(24, 15, 'Bangladesh', 'BD', '+880', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BD.svg', '2022-10-15 19:34:34', '2022-10-15 19:34:34'),
(25, 16, 'Barbados', 'BB', '+1246', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BB.svg', '2022-10-15 19:34:37', '2022-10-15 19:34:37'),
(26, 17, 'Belarus', 'BY', '+375', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BY.svg', '2022-10-15 19:34:41', '2022-10-15 19:34:41'),
(27, 20, 'Benin', 'BJ', '+229', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BJ.svg', '2022-10-15 19:34:54', '2022-10-15 19:34:54'),
(28, 21, 'Bermuda', 'BM', '+1441', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BM.svg', '2022-10-15 19:34:58', '2022-10-15 19:34:58'),
(29, 22, 'Bhutan', 'BT', '+975', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BT.svg', '2022-10-15 19:35:01', '2022-10-15 19:35:01'),
(30, 23, 'Botswana', 'BW', '+267', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BW.svg', '2022-10-15 19:35:04', '2022-10-15 19:35:04'),
(31, 25, 'British Indian Ocean Territory', 'IO', '+246', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IO.svg', '2022-10-15 19:35:10', '2022-10-15 19:35:10'),
(32, 26, 'Bulgaria', 'BG', '+359', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BG.svg', '2022-10-15 19:35:14', '2022-10-15 19:35:14'),
(33, 27, 'Burkina Faso', 'BF', '+226', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BF.svg', '2022-10-15 19:35:17', '2022-10-15 19:35:17'),
(34, 28, 'Burundi', 'BI', '+257', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/BI.svg', '2022-10-15 19:35:21', '2022-10-15 19:35:21'),
(35, 29, 'Cambodia', 'KH', '+855', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KH.svg', '2022-10-15 19:35:25', '2022-10-15 19:35:25'),
(36, 30, 'Cameroon', 'CM', '+237', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CM.svg', '2022-10-15 19:35:49', '2022-10-15 19:35:49'),
(37, 32, 'Cape Verde', 'CV', '+238', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CV.svg', '2022-10-15 19:35:54', '2022-10-15 19:35:54'),
(38, 33, 'Cayman Islands', 'KY', '+ 345', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KY.svg', '2022-10-15 19:35:58', '2022-10-15 19:35:58'),
(39, 34, 'Central African Republic', 'CF', '+236', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CF.svg', '2022-10-15 19:36:02', '2022-10-15 19:36:02'),
(40, 35, 'Chad', 'TD', '+235', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TD.svg', '2022-10-15 19:36:05', '2022-10-15 19:36:05'),
(41, 36, 'Chile', 'CL', '+56', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CL.svg', '2022-10-15 19:36:09', '2022-10-15 19:36:09'),
(42, 37, 'China', 'CN', '+86', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CN.svg', '2022-10-15 19:36:12', '2022-10-15 19:36:12'),
(43, 38, 'Christmas Island', 'CX', '+61', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CX.svg', '2022-10-15 19:36:15', '2022-10-15 19:36:15'),
(44, 39, 'Cocos (Keeling) Islands', 'CC', '+61', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CC.svg', '2022-10-15 19:36:18', '2022-10-15 19:36:18'),
(45, 40, 'Colombia', 'CO', '+57', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CO.svg', '2022-10-15 19:36:21', '2022-10-15 19:36:21'),
(46, 41, 'Comoros', 'KM', '+269', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KM.svg', '2022-10-15 19:36:23', '2022-10-15 19:36:23'),
(47, 42, 'Cook Islands', 'CK', '+682', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CK.svg', '2022-10-15 19:36:26', '2022-10-15 19:36:26'),
(48, 43, 'Costa Rica', 'CR', '+506', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CR.svg', '2022-10-15 19:36:29', '2022-10-15 19:36:29'),
(49, 44, 'Croatia', 'HR', '+385', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HR.svg', '2022-10-15 19:36:32', '2022-10-15 19:36:32'),
(50, 45, 'Cuba', 'CU', '+53', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CU.svg', '2022-10-15 19:36:35', '2022-10-15 19:36:35'),
(51, 46, 'Cyprus', 'CY', '+357', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CY.svg', '2022-10-15 19:36:38', '2022-10-15 19:36:38'),
(52, 47, 'Denmark', 'DK', '+45', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DK.svg', '2022-10-15 19:36:40', '2022-10-15 19:36:40'),
(53, 48, 'Djibouti', 'DJ', '+253', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DJ.svg', '2022-10-15 19:36:43', '2022-10-15 19:36:43'),
(54, 49, 'Dominica', 'DM', '+1767', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DM.svg', '2022-10-15 19:36:46', '2022-10-15 19:36:46'),
(55, 50, 'Dominican Republic', 'DO', '+1849', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DO.svg', '2022-10-15 19:36:50', '2022-10-15 19:36:50'),
(56, 51, 'Ecuador', 'EC', '+593', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EC.svg', '2022-10-15 19:36:53', '2022-10-15 19:36:53'),
(57, 53, 'El Salvador', 'SV', '+503', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SV.svg', '2022-10-15 19:37:16', '2022-10-15 19:37:16'),
(58, 54, 'Equatorial Guinea', 'GQ', '+240', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GQ.svg', '2022-10-15 19:37:17', '2022-10-15 19:37:17'),
(59, 55, 'Eritrea', 'ER', '+291', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ER.svg', '2022-10-15 19:37:22', '2022-10-15 19:37:22'),
(60, 56, 'Estonia', 'EE', '+372', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/EE.svg', '2022-10-15 19:37:46', '2022-10-15 19:37:46'),
(61, 57, 'Ethiopia', 'ET', '+251', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ET.svg', '2022-10-15 19:37:49', '2022-10-15 19:37:49'),
(62, 58, 'Faroe Islands', 'FO', '+298', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FO.svg', '2022-10-15 19:37:52', '2022-10-15 19:37:52'),
(63, 59, 'Fiji', 'FJ', '+679', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FJ.svg', '2022-10-15 19:37:55', '2022-10-15 19:37:55'),
(64, 60, 'Finland', 'FI', '+358', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FI.svg', '2022-10-15 19:37:58', '2022-10-15 19:37:58'),
(65, 61, 'France', 'FR', '+33', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/FR.svg', '2022-10-15 19:38:00', '2022-10-15 19:38:00'),
(66, 62, 'French Guiana', 'GF', '+594', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GF.svg', '2022-10-15 19:38:03', '2022-10-15 19:38:03'),
(67, 63, 'French Polynesia', 'PF', '+689', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PF.svg', '2022-10-15 19:38:07', '2022-10-15 19:38:07'),
(68, 64, 'Gabon', 'GA', '+241', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GA.svg', '2022-10-15 19:38:10', '2022-10-15 19:38:10'),
(69, 65, 'Gambia', 'GM', '+220', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GM.svg', '2022-10-15 19:38:13', '2022-10-15 19:38:13'),
(70, 66, 'Georgia', 'GE', '+995', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GE.svg', '2022-10-15 19:38:15', '2022-10-15 19:38:15'),
(71, 67, 'Germany', 'DE', '+49', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/DE.svg', '2022-10-15 19:38:18', '2022-10-15 19:38:18'),
(72, 68, 'Ghana', 'GH', '+233', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GH.svg', '2022-10-15 19:38:21', '2022-10-15 19:38:21'),
(73, 69, 'Gibraltar', 'GI', '+350', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GI.svg', '2022-10-15 19:38:25', '2022-10-15 19:38:25'),
(74, 70, 'Greece', 'GR', '+30', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GR.svg', '2022-10-15 19:38:30', '2022-10-15 19:38:30'),
(75, 71, 'Greenland', 'GL', '+299', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GL.svg', '2022-10-15 19:38:33', '2022-10-15 19:38:33'),
(76, 72, 'Grenada', 'GD', '+1473', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GD.svg', '2022-10-15 19:38:35', '2022-10-15 19:38:35'),
(77, 73, 'Guadeloupe', 'GP', '+590', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GP.svg', '2022-10-15 19:38:38', '2022-10-15 19:38:38'),
(78, 74, 'Guam', 'GU', '+1671', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GU.svg', '2022-10-15 19:38:41', '2022-10-15 19:38:41'),
(79, 75, 'Guatemala', 'GT', '+502', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GT.svg', '2022-10-15 19:38:44', '2022-10-15 19:38:44'),
(80, 76, 'Guernsey', 'GG', '+44', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GG.svg', '2022-10-15 19:38:47', '2022-10-15 19:38:47'),
(81, 77, 'Guinea', 'GN', '+224', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GN.svg', '2022-10-15 19:38:51', '2022-10-15 19:38:51'),
(82, 78, 'Guinea-Bissau', 'GW', '+245', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GW.svg', '2022-10-15 19:38:55', '2022-10-15 19:38:55'),
(83, 79, 'Guyana', 'GY', '+595', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GY.svg', '2022-10-15 19:38:58', '2022-10-15 19:38:58'),
(84, 80, 'Haiti', 'HT', '+509', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HT.svg', '2022-10-15 19:39:19', '2022-10-15 19:39:19'),
(85, 82, 'Hungary', 'HU', '+36', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/HU.svg', '2022-10-15 19:39:25', '2022-10-15 19:39:25'),
(86, 83, 'Iceland', 'IS', '+354', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IS.svg', '2022-10-15 19:39:28', '2022-10-15 19:39:28'),
(87, 84, 'India', 'IN', '+91', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IN.svg', '2022-10-15 19:39:30', '2022-10-15 19:39:30'),
(88, 85, 'Indonesia', 'ID', '+62', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ID.svg', '2022-10-15 19:39:35', '2022-10-15 19:39:35'),
(89, 86, 'Iraq', 'IQ', '+964', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IQ.svg', '2022-10-15 19:39:39', '2022-10-15 19:39:39'),
(90, 87, 'Ireland', 'IE', '+353', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IE.svg', '2022-10-15 19:39:42', '2022-10-15 19:39:42'),
(91, 88, 'Isle of Man', 'IM', '+44', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IM.svg', '2022-10-15 19:39:44', '2022-10-15 19:39:44'),
(92, 89, 'Israel', 'IL', '+972', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IL.svg', '2022-10-15 19:39:48', '2022-10-15 19:39:48'),
(93, 90, 'Italy', 'IT', '+39', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/IT.svg', '2022-10-15 19:39:51', '2022-10-15 19:39:51'),
(94, 91, 'Jamaica', 'JM', '+1876', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JM.svg', '2022-10-15 19:40:03', '2022-10-15 19:40:03'),
(95, 92, 'Japan', 'JP', '+81', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JP.svg', '2022-10-15 19:40:03', '2022-10-15 19:40:03'),
(96, 93, 'Jersey', 'JE', '+44', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JE.svg', '2022-10-15 19:40:03', '2022-10-15 19:40:03'),
(97, 94, 'Jordan', 'JO', '+962', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/JO.svg', '2022-10-15 19:40:03', '2022-10-15 19:40:03'),
(98, 95, 'Kazakhstan', 'KZ', '+77', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KZ.svg', '2022-10-15 19:40:06', '2022-10-15 19:40:06'),
(99, 96, 'Kenya', 'KE', '+254', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KE.svg', '2022-10-15 19:40:10', '2022-10-15 19:40:10'),
(100, 97, 'Kiribati', 'KI', '+686', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KI.svg', '2022-10-15 19:40:12', '2022-10-15 19:40:12'),
(101, 98, 'Kuwait', 'KW', '+965', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KW.svg', '2022-10-15 19:40:16', '2022-10-15 19:40:16'),
(102, 99, 'Kyrgyzstan', 'KG', '+996', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/KG.svg', '2022-10-15 19:40:19', '2022-10-15 19:40:19'),
(103, 100, 'Laos', 'LA', '+856', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LA.svg', '2022-10-15 19:40:22', '2022-10-15 19:40:22'),
(104, 101, 'Latvia', 'LV', '+371', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LV.svg', '2022-10-15 19:40:25', '2022-10-15 19:40:25'),
(105, 102, 'Lebanon', 'LB', '+961', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LB.svg', '2022-10-15 19:40:28', '2022-10-15 19:40:28'),
(106, 103, 'Lesotho', 'LS', '+266', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LS.svg', '2022-10-15 19:40:31', '2022-10-15 19:40:31'),
(107, 104, 'Liberia', 'LR', '+231', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LR.svg', '2022-10-15 19:40:33', '2022-10-15 19:40:33'),
(108, 105, 'Liechtenstein', 'LI', '+423', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LI.svg', '2022-10-15 19:40:36', '2022-10-15 19:40:36'),
(109, 106, 'Lithuania', 'LT', '+370', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LT.svg', '2022-10-15 19:40:39', '2022-10-15 19:40:39'),
(110, 107, 'Luxembourg', 'LU', '+352', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LU.svg', '2022-10-15 19:40:43', '2022-10-15 19:40:43'),
(111, 108, 'Madagascar', 'MG', '+261', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MG.svg', '2022-10-15 19:40:48', '2022-10-15 19:40:48'),
(112, 109, 'Malawi', 'MW', '+265', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MW.svg', '2022-10-15 19:41:05', '2022-10-15 19:41:05'),
(113, 110, 'Malaysia', 'MY', '+60', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MY.svg', '2022-10-15 19:41:07', '2022-10-15 19:41:07'),
(114, 111, 'Maldives', 'MV', '+960', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MV.svg', '2022-10-15 19:41:10', '2022-10-15 19:41:10'),
(115, 112, 'Mali', 'ML', '+223', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ML.svg', '2022-10-15 19:41:13', '2022-10-15 19:41:13'),
(116, 113, 'Malta', 'MT', '+356', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MT.svg', '2022-10-15 19:41:16', '2022-10-15 19:41:16'),
(117, 114, 'Marshall Islands', 'MH', '+692', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MH.svg', '2022-10-15 19:41:19', '2022-10-15 19:41:19'),
(118, 115, 'Martinique', 'MQ', '+596', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MQ.svg', '2022-10-15 19:41:21', '2022-10-15 19:41:21'),
(119, 116, 'Mauritania', 'MR', '+222', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MR.svg', '2022-10-15 19:41:24', '2022-10-15 19:41:24'),
(120, 117, 'Mauritius', 'MU', '+230', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MU.svg', '2022-10-15 19:41:27', '2022-10-15 19:41:27'),
(121, 118, 'Mayotte', 'YT', '+262', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/YT.svg', '2022-10-15 19:41:30', '2022-10-15 19:41:30'),
(122, 119, 'Mexico', 'MX', '+52', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MX.svg', '2022-10-15 19:41:33', '2022-10-15 19:41:33'),
(123, 120, 'Moldova', 'MD', '+373', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MD.svg', '2022-10-15 19:41:35', '2022-10-15 19:41:35'),
(124, 121, 'Monaco', 'MC', '+377', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MC.svg', '2022-10-15 19:41:38', '2022-10-15 19:41:38'),
(125, 122, 'Mongolia', 'MN', '+976', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MN.svg', '2022-10-15 19:41:41', '2022-10-15 19:41:41'),
(126, 123, 'Montenegro', 'ME', '+382', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ME.svg', '2022-10-15 19:41:43', '2022-10-15 19:41:43'),
(127, 124, 'Montserrat', 'MS', '+1664', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MS.svg', '2022-10-15 19:41:46', '2022-10-15 19:41:46'),
(128, 125, 'Morocco', 'MA', '+212', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MA.svg', '2022-10-15 19:41:49', '2022-10-15 19:41:49'),
(129, 126, 'Mozambique', 'MZ', '+258', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MZ.svg', '2022-10-15 19:41:53', '2022-10-15 19:41:53'),
(130, 127, 'Namibia', 'NA', '+264', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NA.svg', '2022-10-15 19:41:56', '2022-10-15 19:41:56'),
(131, 128, 'Nauru', 'NR', '+674', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NR.svg', '2022-10-15 19:41:58', '2022-10-15 19:41:58'),
(132, 130, 'Netherlands', 'NL', '+31', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NL.svg', '2022-10-15 19:42:01', '2022-10-15 19:42:01'),
(133, 129, 'Nepal', 'NP', '+977', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NP.svg', '2022-10-15 19:42:05', '2022-10-15 19:42:05'),
(134, 131, 'New Caledonia', 'NC', '+687', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NC.svg', '2022-10-15 19:42:08', '2022-10-15 19:42:08'),
(135, 132, 'New Zealand', 'NZ', '+64', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NZ.svg', '2022-10-15 19:42:11', '2022-10-15 19:42:11'),
(136, 133, 'Nicaragua', 'NI', '+505', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NI.svg', '2022-10-15 19:42:14', '2022-10-15 19:42:14'),
(137, 134, 'Niger', 'NE', '+227', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NE.svg', '2022-10-15 19:42:16', '2022-10-15 19:42:16'),
(138, 135, 'Nigeria', 'NG', '+234', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NG.svg', '2022-10-15 19:42:19', '2022-10-15 19:42:19'),
(139, 136, 'Niue', 'NU', '+683', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NU.svg', '2022-10-15 19:42:22', '2022-10-15 19:42:22'),
(140, 137, 'Norfolk Island', 'NF', '+672', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NF.svg', '2022-10-15 19:42:25', '2022-10-15 19:42:25'),
(141, 138, 'Northern Mariana Islands', 'MP', '+1670', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/MP.svg', '2022-10-15 19:42:28', '2022-10-15 19:42:28'),
(142, 139, 'Norway', 'NO', '+47', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/NO.svg', '2022-10-15 19:42:30', '2022-10-15 19:42:30'),
(143, 140, 'Oman', 'OM', '+968', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/OM.svg', '2022-10-15 19:42:33', '2022-10-15 19:42:33'),
(144, 141, 'Pakistan', 'PK', '+92', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PK.svg', '2022-10-15 19:42:51', '2022-10-15 19:42:51'),
(145, 142, 'Palau', 'PW', '+680', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PW.svg', '2022-10-15 19:42:54', '2022-10-15 19:42:54'),
(146, 143, 'Panama', 'PA', '+507', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PA.svg', '2022-10-15 19:42:56', '2022-10-15 19:42:56'),
(147, 144, 'Papua New Guinea', 'PG', '+675', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PG.svg', '2022-10-15 19:42:58', '2022-10-15 19:42:58'),
(148, 145, 'Paraguay', 'PY', '+595', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PY.svg', '2022-10-15 19:43:01', '2022-10-15 19:43:01'),
(149, 146, 'Peru', 'PE', '+51', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PE.svg', '2022-10-15 19:43:04', '2022-10-15 19:43:04'),
(150, 147, 'Philippines', 'PH', '+63', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PH.svg', '2022-10-15 19:43:06', '2022-10-15 19:43:06'),
(151, 148, 'Poland', 'PL', '+48', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PL.svg', '2022-10-15 19:43:09', '2022-10-15 19:43:09'),
(152, 149, 'Portugal', 'PT', '+351', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PT.svg', '2022-10-15 19:43:12', '2022-10-15 19:43:12'),
(153, 150, 'Puerto Rico', 'PR', '+1939', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/PR.svg', '2022-10-15 19:43:16', '2022-10-15 19:43:16'),
(154, 151, 'Qatar', 'QA', '+974', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/QA.svg', '2022-10-15 19:43:19', '2022-10-15 19:43:19'),
(155, 152, 'Romania', 'RO', '+40', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RO.svg', '2022-10-15 19:43:22', '2022-10-15 19:43:22'),
(156, 153, 'Russia', 'RU', '+7', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RU.svg', '2022-10-15 19:43:25', '2022-10-15 19:43:25'),
(157, 154, 'Rwanda', 'RW', '+250', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RW.svg', '2022-10-15 19:43:29', '2022-10-15 19:43:29'),
(158, 155, 'Samoa', 'WS', '+685', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/WS.svg', '2022-10-15 19:43:32', '2022-10-15 19:43:32'),
(159, 156, 'San Marino', 'SM', '+378', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SM.svg', '2022-10-15 19:43:35', '2022-10-15 19:43:35'),
(160, 157, 'Saudi Arabia', 'SA', '+966', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SA.svg', '2022-10-15 19:43:38', '2022-10-15 19:43:38'),
(161, 158, 'Senegal', 'SN', '+221', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SN.svg', '2022-10-15 19:43:41', '2022-10-15 19:43:41'),
(162, 159, 'Serbia', 'RS', '+381', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/RS.svg', '2022-10-15 19:43:44', '2022-10-15 19:43:44'),
(163, 160, 'Seychelles', 'SC', '+248', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SC.svg', '2022-10-15 19:43:46', '2022-10-15 19:43:46'),
(164, 161, 'Sierra Leone', 'SL', '+232', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SL.svg', '2022-10-15 19:43:49', '2022-10-15 19:43:49'),
(165, 162, 'Singapore', 'SG', '+65', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SG.svg', '2022-10-15 19:43:52', '2022-10-15 19:43:52'),
(166, 163, 'Slovakia', 'SK', '+421', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SK.svg', '2022-10-15 19:43:55', '2022-10-15 19:43:55'),
(167, 164, 'Slovenia', 'SI', '+386', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SI.svg', '2022-10-15 19:43:58', '2022-10-15 19:43:58'),
(168, 165, 'Solomon Islands', 'SB', '+677', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SB.svg', '2022-10-15 19:44:02', '2022-10-15 19:44:02'),
(169, 166, 'Somalia', 'SO', '+252', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SO.svg', '2022-10-15 19:44:06', '2022-10-15 19:44:06'),
(170, 167, 'South Africa', 'ZA', '+27', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZA.svg', '2022-10-15 19:44:09', '2022-10-15 19:44:09'),
(171, 168, 'South Sudan', 'SS', '+211', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SS.svg', '2022-10-15 19:44:12', '2022-10-15 19:44:12'),
(172, 169, 'Spain', 'ES', '+34', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ES.svg', '2022-10-15 19:44:15', '2022-10-15 19:44:15'),
(173, 170, 'Sri Lanka', 'LK', '+94', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/LK.svg', '2022-10-15 19:44:18', '2022-10-15 19:44:18'),
(174, 171, 'Sudan', 'SD', '+249', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SD.svg', '2022-10-15 19:44:21', '2022-10-15 19:44:21'),
(175, 172, 'Suriname', 'SR', '+597', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SR.svg', '2022-10-15 19:44:25', '2022-10-15 19:44:25'),
(176, 173, 'Sweden', 'SE', '+46', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/SE.svg', '2022-10-15 19:44:28', '2022-10-15 19:44:28'),
(177, 174, 'Switzerland', 'CH', '+41', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/CH.svg', '2022-10-15 19:44:31', '2022-10-15 19:44:31'),
(178, 175, 'Taiwan', 'TW', '+886', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TW.svg', '2022-10-15 19:44:50', '2022-10-15 19:44:50'),
(179, 176, 'Tajikistan', 'TJ', '+992', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TJ.svg', '2022-10-15 19:44:53', '2022-10-15 19:44:53'),
(180, 177, 'Thailand', 'TH', '+66', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TH.svg', '2022-10-15 19:44:55', '2022-10-15 19:44:55'),
(181, 178, 'Timor-Leste', 'TL', '+670', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TL.svg', '2022-10-15 19:44:58', '2022-10-15 19:44:58'),
(182, 179, 'Togo', 'TG', '+228', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TG.svg', '2022-10-15 19:45:02', '2022-10-15 19:45:02'),
(183, 180, 'Tokelau', 'TK', '+690', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TK.svg', '2022-10-15 19:45:06', '2022-10-15 19:45:06'),
(184, 181, 'Tonga', 'TO', '+676', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TO.svg', '2022-10-15 19:45:08', '2022-10-15 19:45:08'),
(185, 182, 'Tunisia', 'TN', '+216', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TN.svg', '2022-10-15 19:45:11', '2022-10-15 19:45:11'),
(186, 183, 'Turkey', 'TR', '+90', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TR.svg', '2022-10-15 19:45:13', '2022-10-15 19:45:13'),
(187, 184, 'Turkmenistan', 'TM', '+993', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TM.svg', '2022-10-15 19:45:16', '2022-10-15 19:45:16'),
(188, 185, 'Tuvalu', 'TV', '+688', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/TV.svg', '2022-10-15 19:45:18', '2022-10-15 19:45:18'),
(189, 186, 'Uganda', 'UG', '+256', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UG.svg', '2022-10-15 19:45:22', '2022-10-15 19:45:22'),
(190, 187, 'Ukraine', 'UA', '+380', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UA.svg', '2022-10-15 19:45:25', '2022-10-15 19:45:25'),
(191, 188, 'United Arab Emirates', 'AE', '+971', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/AE.svg', '2022-10-15 19:45:27', '2022-10-15 19:45:27'),
(192, 189, 'United Kingdom', 'GB', '+44', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/GB.svg', '2022-10-15 19:45:30', '2022-10-15 19:45:30'),
(193, 190, 'United States', 'US', '+1', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/US.svg', '2022-10-15 19:45:33', '2022-10-15 19:45:33'),
(194, 191, 'Uruguay', 'UY', '+598', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UY.svg', '2022-10-15 19:45:39', '2022-10-15 19:45:39'),
(195, 192, 'Uzbekistan', 'UZ', '+998', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/UZ.svg', '2022-10-15 19:45:42', '2022-10-15 19:45:42'),
(196, 193, 'Vanuatu', 'VU', '+678', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VU.svg', '2022-10-15 19:45:44', '2022-10-15 19:45:44'),
(197, 194, 'Vietnam', 'VN', '+84', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/VN.svg', '2022-10-15 19:45:47', '2022-10-15 19:45:47'),
(198, 195, 'Yemen', 'YE', '+967', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/YE.svg', '2022-10-15 19:45:50', '2022-10-15 19:45:50'),
(199, 196, 'Zambia', 'ZM', '+260', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZM.svg', '2022-10-15 19:45:53', '2022-10-15 19:45:53'),
(200, 197, 'Zimbabwe', 'ZW', '+263', 1, 'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/ZW.svg', '2022-10-15 19:45:56', '2022-10-15 19:45:56');

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default` int(10) UNSIGNED NOT NULL DEFAULT '0' COMMENT '1 => default, 0 => not default',
  `symbol` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `curr_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(10) UNSIGNED NOT NULL COMMENT '1 => fiat, 2 => crypto',
  `status` int(10) UNSIGNED NOT NULL COMMENT '1 => active, 0 => inactive',
  `rate` decimal(20,10) UNSIGNED NOT NULL,
  `charges` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `icon`, `default`, `symbol`, `code`, `curr_name`, `type`, `status`, `rate`, `charges`, `created_at`, `updated_at`) VALUES
(1, NULL, 1, '$', 'USD', 'United State Dollar', 1, 1, '1.0000000000', NULL, '2021-12-20 04:12:58', '2022-11-02 19:52:14'),
(4, '11423484581667854955.JPG', 0, '€', 'EUR', 'European Currency', 1, 1, '0.9100000000', '{\"deposit_charge\":null,\"withdraw_charge\":null,\"withdraw_limit_min\":null,\"withdraw_limit_max\":null}', '2021-12-20 04:12:58', '2022-11-07 21:02:35'),
(5, NULL, 0, '£', 'GBP', 'Greate British Pound', 1, 1, '0.7376150000', NULL, '2021-12-21 00:45:51', '2022-02-16 03:02:35'),
(6, NULL, 0, '৳', 'BDT', 'Bangladeshi Taka', 1, 1, '85.9261900000', NULL, '2021-12-21 00:48:53', '2022-02-16 03:02:35'),
(9, '7758402541668636250.png', 0, '₿', 'BTC', 'Bitcoin', 2, 1, '20281.0226920000', '{\"deposit_charge\":\"0.001\",\"withdraw_charge\":\"0.1\",\"withdraw_limit_min\":\"0.2\",\"withdraw_limit_max\":\"0.9\"}', '2021-12-21 00:48:53', '2022-11-17 21:35:33'),
(10, NULL, 0, '₹', 'INR', 'Indian Rupee', 1, 1, '75.0096000000', NULL, '2022-01-26 02:28:23', '2022-02-16 03:02:35'),
(11, NULL, 0, '¥', 'JPY', 'Japanese Yen', 1, 1, '115.6425010000', NULL, '2022-01-26 02:30:04', '2022-02-16 03:02:35'),
(13, NULL, 0, '₦', 'NGN', 'Nigerian naira', 1, 1, '415.7594650000', NULL, '2022-02-06 05:41:35', '2022-02-16 03:02:35'),
(14, '1949630821648718180.png', 0, 'ETH', 'ETH', 'Ethereum', 2, 1, '1545.1462900000', '{\"deposit_charge\":\"1\",\"withdraw_charge\":\"1\",\"withdraw_limit_min\":\"0.00012547\",\"withdraw_limit_max\":\"0.00025547\"}', '2022-03-10 04:28:33', '2022-11-02 19:52:14'),
(15, '1659318651648717712.png', 0, 'Ł', 'LTC', 'Litecoin', 2, 1, '59.6015200000', '{\"deposit_charge\":\"1\",\"withdraw_charge\":\"1\",\"withdraw_limit_min\":\"1\",\"withdraw_limit_max\":\"1000\"}', '2022-03-31 02:56:14', '2022-11-02 19:52:14'),
(16, '19033477841648717786.png', 0, 'BnB', 'BNB', 'Binance Coin', 2, 1, '321.4325480000', '{\"deposit_charge\":\"1\",\"withdraw_charge\":\"1\",\"withdraw_limit_min\":\"1\",\"withdraw_limit_max\":\"1000\"}', '2022-03-31 03:09:46', '2022-11-02 19:52:14'),
(17, '3337608941667728793.JPG', 0, 'LTCT', 'BCH', 'Bitcoin Cash', 2, 1, '22.0000000000', '{\"deposit_charge\":\"1\",\"withdraw_charge\":\"2\",\"withdraw_limit_min\":\"0.5\",\"withdraw_limit_max\":\"1\"}', '2022-04-10 00:57:27', '2022-11-18 13:27:15'),
(18, '15011910761668036430.png', 0, 'FD', 'ZTC', 'my curency', 2, 1, '23.0000000000', '{\"deposit_charge\":\"1\",\"withdraw_charge\":\"1\",\"withdraw_limit_min\":\"1\",\"withdraw_limit_max\":\"1\"}', '2022-11-09 23:27:11', '2022-11-09 23:27:11');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `currency_id` int(11) NOT NULL,
  `wallet_adress` varchar(255) DEFAULT NULL,
  `charge` decimal(18,8) NOT NULL,
  `total_amount` decimal(18,8) NOT NULL,
  `tnx` varchar(255) NOT NULL,
  `coinpayment_tnx` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_addresses`
--

CREATE TABLE `deposit_addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `email_templates`
--

CREATE TABLE `email_templates` (
  `id` int(11) NOT NULL,
  `email_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_subject` mediumtext COLLATE utf8_unicode_ci,
  `email_body` longtext COLLATE utf8_unicode_ci,
  `sms` text COLLATE utf8_unicode_ci,
  `codes` text COLLATE utf8_unicode_ci,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `email_templates`
--

INSERT INTO `email_templates` (`id`, `email_type`, `email_subject`, `email_body`, `sms`, `codes`, `status`) VALUES
(12, 'add_balance', 'Balance added by system', '<p>Salute {name},\n</p>\n\n<p>A balance of {amount} {curr} has been added to your ({curr}) name by the system.\n</p>\n\n<p>\nTransaction details:\n</p>\n\n<ul><li>Amount  :  {amount} {curr}\n</li><li>Transaction ID : {trnx}</li></ul>\n\n<p>If you need more information about this transaction, kindly send an email to: angels@orkt.one</p>\n\n<p>Regards</p>', 'Hello {name},\r\n\r\nBalance added {amount} {curr} in your wallet ({curr}) from system successfully.\r\n\r\nTransaction details:\r\nAmount  :  {amount} {curr}\r\nTransaction ID : {trnx}\r\nNew balance : {after_balance}\r\nTime : {date_time}', '{\"amount\":\"payment amount\",\"trnx\":\"Transaction ID\",\"curr\":\"currency\",\"after_balance\":\"after geting payment remaining balance\",\"data_time\":\"date and time\"}', 1),
(13, 'subtract_balance', 'Balance subtracted by system', '<p>Salute {name},\n</p>\n\n<p>\nA balance of {amount} {curr} has been subtracted from your ({curr}) by the system.\n</p>\n\n<p>\nTransaction details:\n</p>\n\n<ul><li>Amount  :  {amount} {curr}\n</li><li>Transaction ID : {trnx}</li></ul>\n\n<p>If you need more information about this transaction, kindly reach us via support.</p>\n\n<p>Regards<br></p>', 'Hello {name},\r\n\r\nBalance subtracted {amount} {curr} from your wallet ({curr}) by system successfully.\r\n\r\nTransaction details:\r\nAmount  :  {amount} {curr}\r\nTransaction ID : {trnx}\r\nNew balance : {after_balance}\r\nTime : {date_time}', '{\"amount\":\"payment amount\",\"trnx\":\"Transaction ID\",\"curr\":\"currency\",\"after_balance\":\"after geting payment remaining balance\",\"data_time\":\"date and time\"}', 1),
(14, 'accept_withdraw', 'Withdraw request accepted', '<p>Hello <b>{name}</b>,\r\n</p><p>\r\nYour withdraw request <b>{amount} {curr}</b> is accepted.\r\n</p><p>\r\nWithdraw details:\r\n</p><ul><li>Amount  :  {amount} {curr}\r\n</li><li>Charge  : {charge} {curr}\r\n</li><li>Final Amount(after charge): {final_amount} {curr}\r\n</li><li>Transaction ID : {trnx}\r\n', 'Hello {name},\r\n\r\nYour withdraw request {amount} {curr} is accepted.\r\n\r\nWithdraw details:\r\nAmount  :  {amount} {curr}\r\nCharge  : {charge} {curr}\r\nFinal Amount(after charge): {final_amount} {curr}\r\nTransaction ID : {trnx}\r\n', '{\"amount\":\"payment amount\",\"trnx\":\"Transaction ID\",\"curr\":\"currency\",\"charge\":\"charge\",\"final_amount\":\"Final Amount afte charge\"}', 1),
(15, 'reject_withdraw', 'Withdraw request rejected', '<p>Hello {name},\n</p><p>\nYour withdraw request {amount} {curr} is rejected. The withdraw amount {amount} {curr} has been returned to your balance.</p><p>\nWithdraw details:\n</p><ul><li>Amount  :  {amount} {curr}\n</li><li>Transaction ID : {trnx}\n</li></ul><p><u>\nRejection reason </u>:\n</p><p>{reason}\n</p><p>\n\n</p>', 'Hello {name},\n\nYour withdraw request {amount} {curr} is rejected.\n\nWithdraw details:\nAmount  :  {amount} {curr}\nTransaction ID : {trnx}\n\nRejection reason :\n{reason}\n\n', '{\"amount\":\"payment amount\",\"trnx\":\"Transaction ID\",\"curr\":\"currency\",\"reason\":\"reject reason\"}', 1),
(21, 'trade_request', 'New trade request', '<p>Salute <b>{name}</b>,\n</p>\n\n<p>\nA buyer has indicated interest on your trade, kindly login now and complete trade.</p>\n\n<p>Trade details:\n</p>\n\n<ul><li><b>Amount</b> :  {amount} {curr}</li></ul>\n\n<ul><li><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</li></ul>\n\n<p>If you need more information about this transaction, kindly reach us via support.<br></p>\n\n<p>Regards</p>', 'Hello {name},\r\n\r\nYour have new trade request from {trader}.\r\nTrade details:\r\nAmount :  {amount} {curr}\r\nCrypto Amount :  {crypto_amount} {cryp_curr}\r\n', '{\"amount\":\"Fiat amount\",\"curr\":\"Fiat currency\",\"crypto_amount\":\" Fiat amount\",\"cryp_curr\":\"Crypto currency\",\"link\":\"Trade details URL\",\"trader\":\"Trader\"}', 1),
(22, 'trade_cancel', 'Cancel trade request', '<p>Hello <b>{name}</b>,\r\n</p>\r\n\r\n<p>\r\nTrade request has been canceled by <b>{trader}</b>.\r\n</p>\r\n\r\n<p>Trade details:\r\n</p>\r\n\r\n<p><b>Amount</b> :  {amount} {curr}\r\n</p>\r\n\r\n<p><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</p>\r\n\r\n<p>{crypto_amount} {cryp_curr} is now refunded to your {cryp_curr} balance.</p>\r\n\r\n<p>Trade code is : {trade_code}</p>\r\n\r\n<p>\r\n\r\n\r\n', 'Hello {name},\r\n\r\nTrade request has been canceled by {trader}.\r\nTrade details:\r\nAmount :  {amount} {curr}\r\nCrypto Amount :  {crypto_amount} {cryp_curr}\r\n\r\n{crypto_amount} {cryp_curr} is now refunded to your {cryp_curr} balance.\r\n\r\nTrade code is : {trade_code}\r\n', '{\"amount\":\"Fiat amount\",\"curr\":\"Fiat currency\",\"crypto_amount\":\" Fiat amount\",\"cryp_curr\":\"Crypto currency\",\"trade_code\":\"trade code\",\"trader\":\"Trader\"}', 1),
(23, 'trade_paid', 'Trade has been paid', '<p>Hello <b>{name}</b>,\n</p>\n\n<p>\nTrade has been paid by <b>{trader} at {date_time}</b>.\n</p>\n\n<p>Trade details:\n</p>\n\n<p><b>Amount</b> :  {amount} {curr}\n</p>\n\n<p><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</p>\n\n<p>Release the crypto to {trader}.</p>\n\n<p>Trade code is : {trade_code}</p>\n\n<p>\n\n\n', 'Hello {name},\n\nTrade has been paid by <b>{trader} at {date_time}.\nTrade details:\nAmount :  {amount} {curr}\nCrypto Amount :  {crypto_amount} {cryp_curr}\n\nRelease the crypto to {trader}.\n\nTrade code is : {trade_code}\n', '{\"amount\":\"Fiat amount\",\"curr\":\"Fiat currency\",\"crypto_amount\":\" Fiat amount\",\"cryp_curr\":\"Crypto currency\",\"trade_code\":\"trade code\",\"trader\":\"Trader\",\"date_time\":\"date and time\"}', 1),
(24, 'trade_completed', 'Trade has been completed', '<p>Hello <b>{name}</b>,\r\n</p>\r\n\r\n<p>\r\nTrade has been completed by <b>{trader} at {date_time}</b>.\r\n</p>\r\n\r\n<p>Trade details:\r\n</p>\r\n\r\n<p><b>Amount</b> :  {amount} {curr}\r\n</p>\r\n\r\n<p><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</p>\r\n\r\n<p>Crypto has been released to your {cryp_curr} balance</p>\r\n\r\n<p>Trade code is : {trade_code}</p>\r\n\r\n<p>\r\n\r\n\r\n', 'Hello {name},\r\n\r\nTrade has been completed by <b>{trader} at {date_time}.\r\nTrade details:\r\nAmount :  {amount} {curr}\r\nCrypto Amount :  {crypto_amount} {cryp_curr}\r\n\r\nCrypto has been released to your {cryp_curr} balance.\r\n\r\nTrade code is : {trade_code}\r\n', '{\"amount\":\"Fiat amount\",\"curr\":\"Fiat currency\",\"crypto_amount\":\" Crypto amount\",\"cryp_curr\":\"Crypto currency\",\"trade_code\":\"trade code\",\"trader\":\"Trader\",\"date_time\":\"date and time\"}', 1),
(25, 'deposit_completed', 'Deposit has been completed successfully', '<p>Hello <b>{name}</b>,\r\n</p>\r\n\r\n<p>\r\nYour deposit has been completed successfully</b>.\r\n</p>\r\n\r\n<p>Deposit details:\r\n</p>\r\n\r\n<p><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</p>\r\n<p><b>Charge</b> :  {charge} {cryp_curr}</p>\r\n<p><b>Transaction ID</b> :  {tnx} </p>\r\n<p><b>Coinpayment Transaction ID</b> :  {cp_tnx} </p>\r\n\r\n<p>\r\n\r\n\r\n', 'Hello {name},\r\n\r\nYour deposit has been completed successfully\r\n\r\nDeposit details:\r\n\r\nCrypto Amount :  {crypto_amount} {cryp_curr}\r\n\r\nCharge :  {charge} {cryp_curr}\r\n\r\nTransaction ID :  {tnx}\r\n\r\nCoinpayment Transaction ID :  {cp_tnx}\r\n\r\n', '{\"crypto_amount\":\" Fiat amount\",\"cryp_curr\":\"Crypto currency\",\"tnx\":\"Transaction ID\",\"cp_tnx\":\"Coinpayment Transaction ID\"}', 1),
(26, 'trade_refunded', 'Trade has been refunded', '<p>Hello <b>{name}</b>,\r\n</p>\r\n\r\n<p>\r\nTrade has been refunded by system</b>.\r\n</p>\r\n\r\n<p>Trade details:\r\n</p>\r\n<p><b>Crypto Amount</b> :  {crypto_amount} {cryp_curr}</p>\r\n\r\n<p>Crypto has been refunded to your {cryp_curr} balance</p>\r\n\r\n<p>Trade code is : {trade_code}</p>\r\n\r\n<p>\r\n\r\n\r\n', 'Hello {name},\r\n\r\nTrade has been refunded by system\r\nTrade details:\r\n\r\nCrypto Amount :  {crypto_amount} {cryp_curr}\r\n\r\nCrypto has been refunded to your {cryp_curr} balance.\r\n\r\nTrade code is : {trade_code}\r\n', '{\"crypto_amount\":\" Crypto amount\",\"cryp_curr\":\"Crypto currency\",\"trade_code\":\"trade code\"}', 1);

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `generalsettings`
--

CREATE TABLE `generalsettings` (
  `id` int(191) NOT NULL,
  `curr_code` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USD',
  `curr_sym` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '$',
  `header_logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `favicon` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `loader` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `smtp_host` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_port` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_user` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `smtp_pass` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mail_encryption` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_tawk` tinyint(4) NOT NULL DEFAULT '0',
  `tawk_id` varchar(222) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_verify` tinyint(4) DEFAULT '0',
  `is_cookie` tinyint(4) NOT NULL DEFAULT '0',
  `cookie_btn_text` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cookie_text` text COLLATE utf8mb4_unicode_ci,
  `is_maintenance` tinyint(4) DEFAULT '0',
  `maintenance` text COLLATE utf8mb4_unicode_ci,
  `registration` tinyint(1) NOT NULL DEFAULT '1',
  `kyc` tinyint(1) NOT NULL DEFAULT '1',
  `kyc_offer_limit` int(11) NOT NULL DEFAULT '0',
  `kyc_trade_limit` int(11) NOT NULL DEFAULT '0',
  `sms_notify` tinyint(1) NOT NULL DEFAULT '1',
  `email_notify` tinyint(1) NOT NULL DEFAULT '1',
  `allowed_email` text COLLATE utf8mb4_unicode_ci,
  `contact_no` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha` tinyint(1) NOT NULL DEFAULT '0',
  `recaptcha_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `recaptcha_secret` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fiat_access_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `crypto_access_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `api_settings` text COLLATE utf8mb4_unicode_ci,
  `cookie` text COLLATE utf8mb4_unicode_ci,
  `menu` text COLLATE utf8mb4_unicode_ci,
  `two_fa` int(11) NOT NULL,
  `trade_fee` decimal(5,2) NOT NULL DEFAULT '0.00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `generalsettings`
--

INSERT INTO `generalsettings` (`id`, `curr_code`, `curr_sym`, `header_logo`, `favicon`, `title`, `loader`, `smtp_host`, `mail_type`, `smtp_port`, `smtp_user`, `smtp_pass`, `mail_encryption`, `from_email`, `from_name`, `theme_color`, `is_tawk`, `tawk_id`, `is_verify`, `is_cookie`, `cookie_btn_text`, `cookie_text`, `is_maintenance`, `maintenance`, `registration`, `kyc`, `kyc_offer_limit`, `kyc_trade_limit`, `sms_notify`, `email_notify`, `allowed_email`, `contact_no`, `recaptcha`, `recaptcha_key`, `recaptcha_secret`, `fiat_access_key`, `crypto_access_key`, `api_settings`, `cookie`, `menu`, `two_fa`, `trade_fee`) VALUES
(1, 'USD', '$', '6828250221662306698.png', '7582586651662308179.png', 'Bitmall: Crypto Exchange Website', '1564224328loading3.gif', 'mail.orkt.one', 'smtp', '465', 'bot@orkt.one', '?2pb230yI', 'ssl', 'bot@orkt.one', 'Orkt', 'FFC107', 0, '6124fa49d6e7610a49b1c136/1fds73c17', 1, 0, 'cookie_btn_text', NULL, 0, 'Site Down', 1, 1, 2, 2, 1, 1, NULL, '+88000000000', 1, '6LcyQfUiAAAAAG7fFowM90ZGF7BkwCLq38_St_f3', '6LcyQfUiAAAAAHf33xonlQa2rFxpe02vMAsFkE_1', 'XR4QMYUX4fjQaLdhxJjNBBW72cZeVgy8', 'bbf6acc4733ca34071ba348d25bdb461', '{\"public_key\":\"ff615d014796ad3f89ea77116909fd3950013d1c77392339d0df418c64e6468e\",\"private_key\":\"867F6E405d0f745b8a13d5296442c6cac438048e58CAc91BC7E6Ae961DfD1FFD\",\"merchant_id\":\"df4d65139ffeaf22eab6346bb6eeac2e\"}', '{\"status\":\"1\",\"button_text\":\"Allow Cookie\",\"cookie_text\":\"Our site use cookies when you visit our website, including any other media form, mobile website, or mobile application related or connected to help customize the site and improve your experience.\"}', '{\"Home\":{\"title\":\"Home\",\"dropdown\":\"no\",\"href\":\"\\/\",\"target\":\"self\"},\"Offers\":{\"title\":\"Offers\",\"dropdown\":\"yes\",\"href\":\"\\/\",\"target\":\"self\"},\"Blogs\":{\"title\":\"Blogs\",\"dropdown\":\"no\",\"href\":\"\\/blogs\",\"target\":\"self\"},\"Contact\":{\"title\":\"Contact\",\"dropdown\":\"no\",\"href\":\"\\/contact\",\"target\":\"self\"}}', 1, '1.00');

-- --------------------------------------------------------

--
-- Table structure for table `kyc_forms`
--

CREATE TABLE `kyc_forms` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `type` tinyint(4) NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` int(11) NOT NULL COMMENT '1 = yes, 0 = no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `kyc_forms`
--

INSERT INTO `kyc_forms` (`id`, `type`, `label`, `name`, `required`, `created_at`, `updated_at`) VALUES
(1, 2, 'Profile Photo', 'profile_photo', 1, '2022-01-04 04:56:07', '2022-01-04 04:56:07'),
(2, 1, 'ID Type', 'nid', 1, '2022-01-04 04:54:19', '2022-11-05 17:52:59'),
(3, 2, 'ID Screenshot', 'nid_screenshot', 1, '2022-01-04 04:56:07', '2022-11-05 17:53:23'),
(4, 3, 'Description of address', 'description_of_address', 1, '2022-01-04 04:58:14', '2022-01-04 04:58:14');

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(191) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT '0',
  `language` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `code` varchar(10) NOT NULL,
  `file` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `is_default`, `language`, `code`, `file`) VALUES
(15, 0, 'Hindi', 'hn', 'hn.json'),
(16, 0, 'Bengali', 'bn', 'bn.json'),
(17, 0, 'Spanish', 'es', 'es.json'),
(18, 1, 'English', 'en', 'en.json');

-- --------------------------------------------------------

--
-- Table structure for table `login_logs`
--

CREATE TABLE `login_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `merchant_id` int(11) DEFAULT NULL,
  `ip` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Unknown',
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'Unknown',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `login_logs`
--

INSERT INTO `login_logs` (`id`, `user_id`, `merchant_id`, `ip`, `country`, `city`, `created_at`, `updated_at`) VALUES
(273, 2, NULL, '197.210.55.185', 'Nigeria', '', '2022-11-04 22:07:11', '2022-11-04 22:07:11'),
(274, 2, NULL, '197.210.55.185', 'Nigeria', '', '2022-11-04 22:07:13', '2022-11-04 22:07:13'),
(275, 2, NULL, '197.210.55.185', 'Nigeria', '', '2022-11-04 22:07:14', '2022-11-04 22:07:14'),
(276, 19, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-04 22:08:16', '2022-11-04 22:08:16'),
(277, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-04 22:35:13', '2022-11-04 22:35:13'),
(278, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(279, NULL, NULL, '197.210.78.14', 'Nigeria', '', '2022-11-05 06:33:59', '2022-11-05 06:33:59'),
(280, 26, NULL, '197.210.78.14', 'Nigeria', '', '2022-11-05 07:54:55', '2022-11-05 07:54:55'),
(281, 24, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 08:43:51', '2022-11-05 08:43:51'),
(282, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 08:48:18', '2022-11-05 08:48:18'),
(283, 27, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 08:51:09', '2022-11-05 08:51:09'),
(284, 27, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 08:52:23', '2022-11-05 08:52:23'),
(285, 27, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 10:09:57', '2022-11-05 10:09:57'),
(286, 25, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-05 13:39:00', '2022-11-05 13:39:00'),
(287, NULL, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-05 14:22:58', '2022-11-05 14:22:58'),
(288, 26, NULL, '197.210.84.81', 'Nigeria', 'Lagos', '2022-11-05 17:19:55', '2022-11-05 17:19:55'),
(289, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-05 17:43:01', '2022-11-05 17:43:01'),
(290, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-05 17:48:39', '2022-11-05 17:48:39'),
(291, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-05 17:53:37', '2022-11-05 17:53:37'),
(292, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:13:03', '2022-11-05 18:13:03'),
(293, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:11', '2022-11-05 18:14:11'),
(294, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:12', '2022-11-05 18:14:12'),
(295, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:16', '2022-11-05 18:14:16'),
(296, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:16', '2022-11-05 18:14:16'),
(297, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:16', '2022-11-05 18:14:16'),
(298, 29, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:14:17', '2022-11-05 18:14:17'),
(299, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:16:24', '2022-11-05 18:16:24'),
(300, 30, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:17:13', '2022-11-05 18:17:13'),
(301, 30, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:17:16', '2022-11-05 18:17:16'),
(302, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:22:33', '2022-11-05 18:22:33'),
(303, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:24:55', '2022-11-05 18:24:55'),
(304, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:25:13', '2022-11-05 18:25:13'),
(305, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:34:57', '2022-11-05 18:34:57'),
(306, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:36:51', '2022-11-05 18:36:51'),
(307, NULL, NULL, '197.210.54.86', 'Nigeria', '', '2022-11-05 18:39:44', '2022-11-05 18:39:44'),
(308, 27, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-05 19:42:59', '2022-11-05 19:42:59'),
(309, 26, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-05 22:28:18', '2022-11-05 22:28:18'),
(310, 29, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-05 23:49:17', '2022-11-05 23:49:17'),
(311, 30, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:14:39', '2022-11-06 00:14:39'),
(312, 31, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:19:05', '2022-11-06 00:19:05'),
(313, 33, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:21:57', '2022-11-06 00:21:57'),
(314, 34, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:28:28', '2022-11-06 00:28:28'),
(315, 35, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:31:43', '2022-11-06 00:31:43'),
(316, 36, NULL, '197.210.226.63', 'Nigeria', 'Lagos', '2022-11-06 00:33:44', '2022-11-06 00:33:44'),
(317, NULL, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(318, 37, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-07 09:24:21', '2022-11-07 09:24:21'),
(319, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-07 09:25:57', '2022-11-07 09:25:57'),
(320, 37, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-07 09:28:26', '2022-11-07 09:28:26'),
(321, 30, NULL, '197.210.78.56', 'Nigeria', '', '2022-11-07 14:31:14', '2022-11-07 14:31:14'),
(322, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-07 15:43:08', '2022-11-07 15:43:08'),
(323, NULL, NULL, '39.42.113.18', 'Pakistan', 'Lahore', '2022-11-08 05:47:32', '2022-11-08 05:47:32'),
(324, 38, NULL, '39.42.113.18', 'Pakistan', 'Lahore', '2022-11-08 05:48:45', '2022-11-08 05:48:45'),
(325, NULL, NULL, '58.65.153.184', 'Pakistan', 'Islamabad', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(326, NULL, NULL, '144.48.135.18', 'Pakistan', 'Multan', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(327, 40, NULL, '144.48.135.18', 'Pakistan', 'Multan', '2022-11-08 07:55:46', '2022-11-08 07:55:46'),
(328, 26, NULL, '197.210.55.144', 'Nigeria', '', '2022-11-08 10:40:29', '2022-11-08 10:40:29'),
(329, 27, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-08 22:39:29', '2022-11-08 22:39:29'),
(330, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-08 22:58:16', '2022-11-08 22:58:16'),
(331, 30, NULL, '104.28.252.35', 'United States', '', '2022-11-09 08:44:02', '2022-11-09 08:44:02'),
(332, 37, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-09 11:06:46', '2022-11-09 11:06:46'),
(333, 30, NULL, '39.41.30.138', 'Pakistan', 'Islamabad', '2022-11-09 12:03:54', '2022-11-09 12:03:54'),
(334, 28, NULL, '137.59.225.102', 'Pakistan', 'Faisalabad', '2022-11-09 14:03:52', '2022-11-09 14:03:52'),
(335, 30, NULL, '197.210.55.144', 'Nigeria', '', '2022-11-09 18:51:47', '2022-11-09 18:51:47'),
(336, NULL, NULL, '119.155.49.248', 'Pakistan', 'Lahore', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(337, 42, NULL, '119.155.49.248', 'Pakistan', 'Lahore', '2022-11-09 19:33:38', '2022-11-09 19:33:38'),
(338, 30, NULL, '39.44.25.186', 'Pakistan', 'Karachi', '2022-11-09 19:57:44', '2022-11-09 19:57:44'),
(339, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(340, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(341, NULL, NULL, '49.36.209.248', 'India', '', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(342, NULL, NULL, '49.36.80.116', 'India', 'Vadodara', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(343, NULL, NULL, '72.255.34.15', 'Pakistan', 'Gujranwala', '2022-11-10 06:36:38', '2022-11-10 06:36:38'),
(344, 47, NULL, '72.255.34.15', 'Pakistan', 'Gujranwala', '2022-11-10 06:38:23', '2022-11-10 06:38:23'),
(345, NULL, NULL, '27.7.245.199', 'India', 'Indore', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(346, NULL, NULL, '27.7.245.199', 'India', 'Indore', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(347, 49, NULL, '27.7.245.199', 'India', 'Indore', '2022-11-10 06:51:58', '2022-11-10 06:51:58'),
(348, 30, NULL, '197.210.55.144', 'Nigeria', '', '2022-11-10 12:42:10', '2022-11-10 12:42:10'),
(349, 24, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-10 22:28:17', '2022-11-10 22:28:17'),
(350, NULL, NULL, '197.210.70.163', 'Nigeria', 'Abuja', '2022-11-11 06:20:27', '2022-11-11 06:20:27'),
(351, 50, NULL, '102.91.4.101', 'Nigeria', '', '2022-11-11 06:22:07', '2022-11-11 06:22:07'),
(352, 30, NULL, '117.236.167.129', 'India', 'Bengaluru', '2022-11-11 13:37:05', '2022-11-11 13:37:05'),
(353, 30, NULL, '117.236.167.129', 'India', 'Bengaluru', '2022-11-11 13:37:06', '2022-11-11 13:37:06'),
(354, NULL, NULL, '39.50.110.201', 'Pakistan', 'Rawalpindi', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(355, 24, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-11 22:41:17', '2022-11-11 22:41:17'),
(356, 24, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-11 22:54:39', '2022-11-11 22:54:39'),
(357, NULL, NULL, '103.18.13.27', 'Pakistan', 'Karachi', '2022-11-11 23:02:55', '2022-11-11 23:02:55'),
(358, 30, NULL, '49.34.202.19', 'India', 'Ahmedabad', '2022-11-14 09:14:18', '2022-11-14 09:14:18'),
(359, 30, NULL, '49.34.202.19', 'India', 'Ahmedabad', '2022-11-14 09:14:19', '2022-11-14 09:14:19'),
(360, 30, NULL, '197.210.84.192', 'Nigeria', 'Lagos', '2022-11-16 10:40:40', '2022-11-16 10:40:40'),
(361, 30, NULL, '169.150.226.180', 'United States', '', '2022-11-21 23:46:46', '2022-11-21 23:46:46'),
(362, 30, NULL, '103.244.177.245', 'Pakistan', 'Karachi', '2022-11-22 17:12:27', '2022-11-22 17:12:27'),
(363, 30, NULL, '102.91.4.59', 'Nigeria', '', '2022-11-23 20:52:35', '2022-11-23 20:52:35'),
(364, 30, NULL, '49.42.69.7', 'India', '', '2022-11-24 11:01:24', '2022-11-24 11:01:24'),
(365, 30, NULL, '188.43.136.44', 'Russia', '', '2022-11-24 17:11:39', '2022-11-24 17:11:39'),
(366, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-24 20:11:04', '2022-11-24 20:11:04'),
(367, 30, NULL, '157.39.136.153', 'India', 'Ludhiana', '2022-11-24 20:40:40', '2022-11-24 20:40:40'),
(368, 30, NULL, '157.39.136.153', 'India', 'Ludhiana', '2022-11-24 20:40:40', '2022-11-24 20:40:40'),
(369, 30, NULL, '175.29.201.72', 'Bangladesh', '', '2022-11-24 20:50:49', '2022-11-24 20:50:49'),
(370, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-24 21:09:34', '2022-11-24 21:09:34'),
(371, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-24 21:45:46', '2022-11-24 21:45:46'),
(372, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-24 22:42:59', '2022-11-24 22:42:59'),
(373, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-25 04:48:41', '2022-11-25 04:48:41'),
(374, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-25 04:48:41', '2022-11-25 04:48:41'),
(375, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-25 05:11:28', '2022-11-25 05:11:28'),
(376, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-25 05:18:01', '2022-11-25 05:18:01'),
(377, 30, NULL, '49.43.42.184', 'India', '', '2022-11-25 09:39:37', '2022-11-25 09:39:37'),
(378, 30, NULL, '125.62.117.210', 'India', 'Bathinda', '2022-11-25 09:50:47', '2022-11-25 09:50:47'),
(379, 30, NULL, '49.43.42.184', 'India', '', '2022-11-25 09:55:16', '2022-11-25 09:55:16'),
(380, 30, NULL, '144.48.135.16', 'Pakistan', 'Multan', '2022-11-25 12:38:24', '2022-11-25 12:38:24'),
(381, 30, NULL, '188.43.235.177', 'Russia', '', '2022-11-26 11:40:54', '2022-11-26 11:40:54'),
(382, NULL, NULL, '103.153.38.46', 'Pakistan', 'Multan', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(383, 53, NULL, '110.38.242.210', 'Pakistan', '', '2022-12-04 07:39:45', '2022-12-04 07:39:45'),
(384, NULL, NULL, '110.38.242.173', 'Pakistan', '', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(385, NULL, NULL, '110.38.242.173', 'Pakistan', '', '2022-12-11 08:27:29', '2022-12-11 08:27:29'),
(386, NULL, NULL, '110.38.242.173', 'Pakistan', '', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(387, 53, NULL, '110.38.242.173', 'Pakistan', '', '2022-12-11 10:03:38', '2022-12-11 10:03:38'),
(388, 30, NULL, '111.119.183.7', 'Pakistan', 'Karachi', '2022-12-12 09:56:28', '2022-12-12 09:56:28'),
(389, 30, NULL, '188.43.235.177', 'Russia', '', '2022-12-12 09:59:23', '2022-12-12 09:59:23'),
(390, 30, NULL, '197.210.54.226', 'Nigeria', '', '2022-12-12 10:16:16', '2022-12-12 10:16:16'),
(391, 30, NULL, '27.57.171.207', 'India', 'Ahmedabad', '2022-12-12 10:25:35', '2022-12-12 10:25:35'),
(392, 30, NULL, '188.43.235.177', 'Russia', '', '2022-12-12 10:30:40', '2022-12-12 10:30:40'),
(393, 30, NULL, '102.134.114.161', 'Nigeria', 'Lagos', '2022-12-12 11:17:05', '2022-12-12 11:17:05'),
(394, 30, NULL, '103.96.221.164', 'India', 'Bhopal', '2022-12-12 11:27:41', '2022-12-12 11:27:41'),
(395, 30, NULL, '27.57.84.89', 'India', 'Noida', '2022-12-12 11:28:08', '2022-12-12 11:28:08'),
(396, 30, NULL, '103.82.99.28', 'India', '', '2022-12-12 11:33:44', '2022-12-12 11:33:44'),
(397, 30, NULL, '103.176.140.67', NULL, NULL, '2022-12-12 11:35:55', '2022-12-12 11:35:55'),
(398, 30, NULL, '110.39.144.86', 'Pakistan', 'Lahore', '2022-12-12 11:46:00', '2022-12-12 11:46:00'),
(399, 30, NULL, '77.68.4.119', 'United Kingdom', '', '2022-12-12 11:47:08', '2022-12-12 11:47:08'),
(400, 30, NULL, '202.47.46.159', 'Pakistan', 'Karachi', '2022-12-12 12:13:59', '2022-12-12 12:13:59'),
(401, 30, NULL, '188.43.235.177', 'Russia', '', '2022-12-12 16:20:45', '2022-12-12 16:20:45'),
(402, 30, NULL, '183.182.115.10', 'Laos', 'Vang Vieng', '2022-12-12 17:33:20', '2022-12-12 17:33:20'),
(403, 30, NULL, '183.182.115.10', 'Laos', 'Vang Vieng', '2022-12-12 17:54:51', '2022-12-12 17:54:51'),
(404, 30, NULL, '27.7.241.118', 'India', 'Indore', '2022-12-13 06:43:47', '2022-12-13 06:43:47'),
(405, 53, NULL, '103.153.38.46', 'Pakistan', 'Multan', '2022-12-13 06:57:06', '2022-12-13 06:57:06'),
(406, NULL, NULL, '49.43.40.30', 'India', '', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(407, NULL, NULL, '49.43.40.30', 'India', '', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(408, 30, NULL, '49.43.40.30', 'India', '', '2022-12-13 16:38:07', '2022-12-13 16:38:07'),
(409, 30, NULL, '103.1.103.177', 'India', 'Ahmedabad', '2022-12-14 05:26:13', '2022-12-14 05:26:13'),
(410, 30, NULL, '59.97.176.243', 'India', 'Siddhapur', '2022-12-14 07:33:24', '2022-12-14 07:33:24'),
(411, 58, NULL, '49.43.41.121', 'India', '', '2022-12-14 17:19:21', '2022-12-14 17:19:21'),
(412, 53, NULL, '110.38.242.80', 'Pakistan', '', '2022-12-14 21:26:29', '2022-12-14 21:26:29'),
(413, 30, NULL, '197.210.227.204', 'Nigeria', 'Lagos', '2022-12-14 22:29:13', '2022-12-14 22:29:13'),
(414, 58, NULL, '49.43.40.12', 'India', '', '2022-12-15 06:54:15', '2022-12-15 06:54:15');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2021_09_25_053316_create_admins_table', 2),
(6, '2021_12_19_042602_create_site_contents_table', 3),
(7, '2021_12_20_032716_create_currencies_table', 4),
(8, '2021_12_20_041453_create_wallets_table', 5),
(9, '2021_12_20_061743_create_charges_table', 6),
(10, '2021_12_21_041624_create_countries_table', 7),
(11, '2021_12_21_095225_create_transactions_table', 8),
(12, '2021_12_22_044221_create_request_money_table', 9),
(13, '2021_12_23_053336_create_exchange_money_table', 10),
(14, '2021_12_28_083959_create_modules_table', 11),
(15, '2021_12_29_035701_create_vouchers_table', 12),
(16, '2021_12_30_050418_create_withdraws_table', 13),
(17, '2021_12_30_111614_create_withdrawals_table', 14),
(18, '2022_01_02_102323_create_payments_table', 15),
(19, '2022_01_03_032851_create_invoices_table', 16),
(20, '2022_01_03_034414_create_inv_items_table', 17),
(21, '2022_01_04_092638_create_k_y_c_s_table', 18),
(22, '2022_01_04_103906_create_kyc_forms_table', 18),
(23, '2022_01_09_035144_create_escrows_table', 19),
(24, '2022_01_09_064757_create_disputes_table', 20),
(25, '2022_01_16_053729_create_api_creds_table', 21),
(26, '2022_01_16_060854_create_merchant_payments_table', 22),
(27, '2022_01_17_100203_create_permission_tables', 23),
(28, '2022_01_20_050330_create_sms_gateways_table', 24),
(29, '2022_01_30_031517_create_login_logs_table', 25),
(30, '2022_02_02_091116_create_support_tickets_table', 26),
(31, '2022_02_02_091130_create_ticket_messages_table', 26),
(32, '2022_03_09_081733_create_trade_durations_table', 27),
(33, '2022_03_09_094834_create_offers_table', 28),
(34, '2022_03_10_111742_create_trades_table', 29),
(35, '2022_03_28_054845_create_wallets_table', 30),
(36, '2022_03_28_114819_create_trade_chats_table', 31),
(37, '2022_03_31_031220_create_deposit_addresses_table', 32),
(38, '2022_04_04_045506_create_offer_limits_table', 33);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(3, 'App\\Models\\Admin', 2),
(3, 'App\\Models\\Admin', 3),
(4, 'App\\Models\\Admin', 4),
(5, 'App\\Models\\Admin', 5);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('buy','sell') COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `cryp_id` int(11) NOT NULL,
  `gateway_id` int(11) NOT NULL,
  `fiat_id` int(11) NOT NULL,
  `price_type` tinyint(4) NOT NULL COMMENT '1 = market price, 2 = fixed price',
  `fixed_rate` decimal(18,8) DEFAULT NULL,
  `margin` decimal(5,2) DEFAULT NULL,
  `neg_margin` tinyint(1) DEFAULT '0',
  `minimum` decimal(18,8) NOT NULL,
  `maximum` decimal(18,8) NOT NULL,
  `trade_duration` int(11) NOT NULL,
  `offer_terms` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_instructions` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `offer_id`, `type`, `user_id`, `cryp_id`, `gateway_id`, `fiat_id`, `price_type`, `fixed_rate`, `margin`, `neg_margin`, `minimum`, `maximum`, `trade_duration`, `offer_terms`, `trade_instructions`, `status`, `created_at`, `updated_at`) VALUES
(32, 'XEBYRTOQRRFD', 'sell', 24, 14, 2, 1, 1, NULL, '2.00', 0, '2.00000000', '5.00000000', 1, '22', '33', 1, '2022-11-05 08:47:10', '2022-11-05 08:47:10'),
(33, 'A5POJYUXXYO7', 'buy', 28, 9, 11, 1, 1, '5009.00000000', '45.00', 0, '300.00000000', '4500.00000000', 20, 'my terms', 'my instructions', 1, '2022-11-06 15:41:25', '2022-11-06 15:41:25'),
(34, 'WXKMTC2T2MIN', 'sell', 28, 14, 15, 1, 1, '2000.00000000', '5.00', 0, '200.00000000', '2000.00000000', 20, 'yes', 'yes', 1, '2022-11-06 16:51:15', '2022-11-06 16:51:15'),
(35, 'YLKAOYVWZERP', 'sell', 28, 15, 9, 1, 1, '2.00000000', '5.00', 0, '20.00000000', '100.00000000', 55, 'ttttt', 'aaasss', 1, '2022-11-07 09:27:42', '2022-11-07 09:27:42'),
(36, 'R2Q2KXYRB4EI', 'sell', 30, 9, 9, 10, 1, NULL, '0.00', 0, '1000.00000000', '2000.00000000', 1, 'fgdg', 'gdfgdf', 1, '2022-12-12 11:39:18', '2022-12-12 11:39:18');

-- --------------------------------------------------------

--
-- Table structure for table `offer_limits`
--

CREATE TABLE `offer_limits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `offer_limit` int(11) NOT NULL,
  `trade_complete` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `offer_limits`
--

INSERT INTO `offer_limits` (`id`, `offer_limit`, `trade_complete`, `created_at`, `updated_at`) VALUES
(1, 10000, 10000, '2022-04-03 23:13:38', '2022-04-03 23:25:06');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(191) NOT NULL,
  `title` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `slug`, `details`, `lang`) VALUES
(14, 'Announcement', 'announcement', '<p><span style=\"color:rgb(85,85,85);font-family:Macan, \'Helvetica Neue\', Helvetica, Arial, sans-serif;\">No current announcements at the moment.</span><br></p>', 'en'),
(15, 'ঘোষণা', 'ghoshna', '<p>২০১৬-১৮ সালের দিকে যুক্তরাষ্ট্রে আলোচিত এক নাম ছিলেন অটো ওয়ার্মবিয়ার। রোমাঞ্চের স্বাদ নিতে ২০১৬ সালকে স্বাগত জানাতে গিয়েছিলেন উত্তর কোরিয়া সফরে। কিন্তু সেটাই যে তার জীবনে কাল হয়ে দাঁড়াবে, তা কি কখনো ভাবতে পেরেছিলেন? উত্তর কোরিয়ার প্রোপাগান্ডা পোস্টার চুরির দায়ে তাকে গ্রেপ্তার করা হয়। তারপর অনেক জল ঘোলা হয়। যুক্তরাষ্ট্র-উত্তর কোরিয়া যুদ্ধ লেগে যাওয়ার মতো অবস্থা হয়। তাকে নিয়ে তৎকালীন মার্কিন প্রেসিডেন্ট ডোনাল্ড ট্রাম্প ও উত্তর কোরিয়ার শাসক কিম জং উন উভয়ই নিজেদের স্বার্থে রাজনীতি করেছেন। কিন্তু এতে প্রাণ হারিয়েছেন অটো। তার মৃত্যু নিয়ে ছিল বেশ জল্পনা-কল্পনা। অনুসন্ধানী সাংবাদিক ডগ বক ক্লার্ক ২০১৮ সালে পুরো ঘটনার এক চিত্র তুলে ধরেন। রোর বাংলার পাঠকদের জন্য তার সেই প্রতিবেদন বাংলায় তুলে ধরা হলো।</p>', 'bn');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(191) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `currency_id` varchar(191) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `slug`, `currency_id`, `status`) VALUES
(2, 'Mobile Money', 'mobile-money', '[\"1\",\"4\"]', 1),
(7, 'Mercadopago', 'mercadopago', '[\"1\"]', 1),
(8, 'Authorize.Net', 'authorizenet', '[\"1\",\"4\"]', 1),
(9, 'Razorpay', 'razorpay', '[\"10\"]', 1),
(11, 'Paytm', 'paytm', '[\"1\"]', 1),
(12, 'Paystack', 'paystack', '[\"1\",\"13\"]', 1),
(13, 'Instamojo', 'instamojo', '[\"1\",\"10\"]', 1),
(14, 'Stripe', 'stripe', '[\"1\",\"4\"]', 1),
(15, 'Paypal', 'paypal', '[\"1\",\"4\"]', 1),
(19, 'Wire Bank', 'wire-bank', '[\"1\",\"4\",\"6\"]', 1),
(21, 'Skrill', 'skrill', '[\"1\",\"6\"]', 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(209, 'dashboard info', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(211, 'transactions', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(212, 'manage user', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(213, 'edit user', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(214, 'update user', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(215, 'user balance modify', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(216, 'user login', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(217, 'user login logs', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(224, 'manage currency', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(225, 'add currency', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(226, 'edit currency', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(227, 'update currency', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(228, 'update currency api', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(232, 'manage country', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(233, 'add country', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(234, 'update country', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(254, 'manage role', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(255, 'create role', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(256, 'edit permissions', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(257, 'update permissions', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(258, 'manage staff', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(259, 'add staff', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(260, 'update staff', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(261, 'general setting', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(262, 'general settings update', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(263, 'general settings logo favicon', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(264, 'general settings status update', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(265, 'menu builder', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(266, 'maintainance', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(267, 'email templates', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(268, 'template edit', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(269, 'template update', 'admin', '2022-02-16 23:31:25', '2022-02-16 23:31:25'),
(270, 'email config', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(271, 'group email', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(272, 'sms gateways', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(273, 'sms gateway edit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(274, 'sms gateway update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(275, 'sms templates', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(276, 'sms template edit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(277, 'sms template update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(278, 'site contents', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(279, 'edit site contents', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(280, 'site content update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(281, 'site sub-content update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(282, 'section status update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(283, 'withdraw method', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(284, 'withdraw method search', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(285, 'withdraw method create', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(286, 'withdraw method edit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(287, 'withdraw method update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(288, 'pending withdraw', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(289, 'accepted withdraw', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(290, 'rejected withdraw', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(291, 'withdraw accept', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(292, 'withdraw reject', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(293, 'manage payment gateway', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(294, 'add payment gateway', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(295, 'store payment gateway', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(296, 'edit payment gateway', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(297, 'update payment gateway', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(298, 'manage deposit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(299, 'approve deposit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(300, 'reject deposit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(301, 'manage page', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(302, 'page create', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(303, 'page store', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(304, 'page edit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(305, 'page update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(306, 'page remove', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(307, 'manage cookie', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(308, 'update cookie', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(309, 'manage blog-category', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(310, 'store blog-category', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(311, 'update blog-category', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(312, 'manage blog', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(313, 'blog create', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(314, 'blog store', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(315, 'blog edit', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(316, 'blog update', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(317, 'blog destroy', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(318, 'manage language', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(319, 'manage ticket', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(320, 'reply ticket', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(321, 'seo settings', 'admin', '2022-02-16 23:31:26', '2022-02-16 23:31:26'),
(322, 'manage kyc', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(323, 'manage kyc form', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(324, 'kyc form add', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(325, 'kyc form update', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(326, 'kyc form delete', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(327, 'kyc info', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(328, 'kyc details', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(329, 'kyc approve', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(330, 'kyc reject', 'admin', '2022-04-04 00:17:20', '2022-04-04 00:17:20'),
(331, 'manage offer', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(332, 'offer status change', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(333, 'offer limit', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(334, 'offer limit add', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(335, 'offer limit update', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(336, 'offer limit remove', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(337, 'trade duration add', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(338, 'trade duration update', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(339, 'trade duration remove', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(340, 'manage trades', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(341, 'api settings', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45'),
(342, 'manage trade duration', 'admin', '2022-04-04 23:35:45', '2022-04-04 23:35:45');

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
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(31, 'App\\Models\\User', 12, '123', '840d9a1b85a758d25b8f443b11bdf30cc7255b15ddc34faa8ee85e6e16eb209e', '[\"*\"]', '2022-09-30 15:17:18', '2022-09-29 13:12:47', '2022-09-30 15:17:18'),
(34, 'App\\Models\\User', 1, '123', '148e24dca0edd536086b82834f6930d36e17d53bfe6369ecc497ab078438ed2f', '[\"*\"]', '2022-10-03 23:26:37', '2022-10-03 22:52:19', '2022-10-03 23:26:37'),
(143, 'App\\Models\\User', 21, '123', 'f10079da8da9dca461a23c07d5059c2a1365b942ccab16e829c977c2e557e4f0', '[\"*\"]', '2022-10-27 18:09:21', '2022-10-27 11:30:52', '2022-10-27 18:09:21'),
(182, 'App\\Models\\User', 4, '123', '79bcf8bd3aad817bdcdabd56eda7082211ee4c1f09e465c14eabbd4b76fe43d6', '[\"*\"]', '2022-11-04 22:07:46', '2022-11-04 13:04:03', '2022-11-04 22:07:46'),
(190, 'App\\Models\\User', 2, '123', '1bb4704b2e616e2a8ce33e669ce870eed74312cd8f5a8f45588d0fda096377d7', '[\"*\"]', '2022-11-04 22:07:18', '2022-11-04 22:07:14', '2022-11-04 22:07:18'),
(191, 'App\\Models\\User', 19, '123', '0546f3392f58e56c290bb8ad4a353ac5f4622d5d45137605026bd05f8a9aec9e', '[\"*\"]', '2022-11-04 22:08:19', '2022-11-04 22:08:16', '2022-11-04 22:08:19'),
(193, 'App\\Models\\User', 27, '123', '1b3ecca62e5587ac2b84a2c9edbf0974c74da72c1ccecc9fc61c815dff4d3ecd', '[\"*\"]', '2022-12-05 12:00:47', '2022-11-05 08:52:23', '2022-12-05 12:00:47'),
(194, 'App\\Models\\User', 25, '123', '8147ea4e3f885256662305111c65eb3df6eea99b073ee42bef6274b4039225dc', '[\"*\"]', '2022-11-05 17:39:14', '2022-11-05 13:39:00', '2022-11-05 17:39:14'),
(203, 'App\\Models\\User', 29, '123', '364a6a6f7b1a6e84ef3d648e353155c75038b2a0d762217052fd159199e5f9c4', '[\"*\"]', '2022-11-05 18:14:24', '2022-11-05 18:14:17', '2022-11-05 18:14:24'),
(210, 'App\\Models\\User', 28, '123', '6670518b15e70c2a209a23a1d2e89aacabaa45d948af57e440fa786b9a04861c', '[\"*\"]', '2022-11-09 11:02:23', '2022-11-07 15:43:08', '2022-11-09 11:02:23'),
(211, 'App\\Models\\User', 38, '123', '83591e1481e1e4cf8f57909ab91bbbcca7f9edbb51b7bdfd39df40433601e1fb', '[\"*\"]', '2022-11-08 05:49:52', '2022-11-08 05:48:45', '2022-11-08 05:49:52'),
(212, 'App\\Models\\User', 40, '123', 'ac235286ca383f5c09f89fa9534c523f2a2324c903c9ef0157f1cd2a4c736551', '[\"*\"]', '2022-11-08 07:58:41', '2022-11-08 07:55:46', '2022-11-08 07:58:41'),
(213, 'App\\Models\\User', 26, '123', '3aa0fcc0c89d0d94b32c12b787845e4e9a7fd61bdd3b3dc7f76311dde2ef2722', '[\"*\"]', '2022-11-08 17:03:50', '2022-11-08 10:40:29', '2022-11-08 17:03:50'),
(215, 'App\\Models\\User', 37, '123', 'e58d297b5ec7c550acf59ecf4a9b61815ff23b42d6822e5e4ca26ce2623064e6', '[\"*\"]', '2022-11-10 11:15:01', '2022-11-09 11:06:46', '2022-11-10 11:15:01'),
(218, 'App\\Models\\User', 42, '123', 'af679763cb0b47da1b24420f803a41e739bdb52fcc218bf93b0a67253280a467', '[\"*\"]', '2022-11-09 19:37:05', '2022-11-09 19:33:38', '2022-11-09 19:37:05'),
(220, 'App\\Models\\User', 47, '123', '9300285feea0b0a5d7b6d4bcc9bc8561b5c69509cbf1dd83e128072979959bb3', '[\"*\"]', '2022-11-10 06:52:25', '2022-11-10 06:38:23', '2022-11-10 06:52:25'),
(221, 'App\\Models\\User', 49, '123', 'add7792dba0c25da048d20777d5d42384bcac1cede9d32c7c2d47e83fc9cfa88', '[\"*\"]', '2022-11-10 06:55:00', '2022-11-10 06:51:58', '2022-11-10 06:55:00'),
(222, 'App\\Models\\User', 50, '123', '882f145157f0a0789ba3698fd52d28b5192f90ea0fc3ae937ad4b5c7ccc89d48', '[\"*\"]', '2022-11-11 06:24:01', '2022-11-11 06:22:07', '2022-11-11 06:24:01'),
(246, 'App\\Models\\User', 53, '123', '363a08960dd7f5424fcc681e088793652a6001670ce5e4119a01e8ed454e5b49', '[\"*\"]', '2022-12-14 22:14:42', '2022-12-14 21:26:29', '2022-12-14 22:14:42'),
(247, 'App\\Models\\User', 30, '123', '6d70697711c55e7842dbea2fcd4a73f2deb4f9ee66c2aa178d33e66d18f87b6e', '[\"*\"]', '2022-12-15 06:12:58', '2022-12-14 22:29:13', '2022-12-15 06:12:58'),
(248, 'App\\Models\\User', 58, '123', 'fa847addb59c8d2d239d5a5555aea7012d8b771dbb5cd6a8a71d8f8b7745d4ed', '[\"*\"]', '2022-12-15 10:06:44', '2022-12-15 06:54:15', '2022-12-15 10:06:44');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `offer_id` int(11) DEFAULT NULL,
  `reviewer_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `description` varchar(511) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`id`, `user_id`, `offer_id`, `reviewer_id`, `rating`, `description`, `created_at`, `updated_at`) VALUES
(6, 24, 29, 27, 5, 'Best review', '2022-11-05 08:58:29', '2022-11-05 08:58:29'),
(7, 24, 48, 28, 4, '123', '2022-11-06 09:43:55', '2022-11-06 09:43:55'),
(8, 24, 51, 28, 4, 'good trade', '2022-11-06 10:54:26', '2022-11-06 10:54:26'),
(9, 24, 59, 28, 4, 'hy', '2022-11-07 15:48:12', '2022-11-07 15:48:12');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'admin', '2022-01-17 04:25:50', '2022-01-17 04:25:50'),
(3, 'moderator', 'admin', '2022-01-17 05:23:47', '2022-01-17 05:23:47'),
(4, 'Ticket Handler', 'admin', '2022-02-16 23:55:38', '2022-02-16 23:55:38'),
(5, 'Test Role', 'admin', '2022-09-05 09:03:43', '2022-09-05 09:03:43');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(209, 1),
(209, 5),
(211, 1),
(211, 5),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(224, 1),
(224, 5),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(232, 1),
(233, 1),
(234, 1),
(254, 1),
(255, 1),
(256, 1),
(257, 1),
(258, 1),
(259, 1),
(260, 1),
(261, 1),
(262, 1),
(263, 1),
(264, 1),
(265, 1),
(266, 1),
(267, 1),
(268, 1),
(269, 1),
(270, 1),
(271, 1),
(272, 1),
(273, 1),
(274, 1),
(275, 1),
(276, 1),
(277, 1),
(278, 1),
(279, 1),
(280, 1),
(281, 1),
(282, 1),
(283, 1),
(284, 1),
(285, 1),
(286, 1),
(287, 1),
(288, 1),
(289, 1),
(290, 1),
(291, 1),
(292, 1),
(293, 1),
(294, 1),
(295, 1),
(296, 1),
(297, 1),
(298, 1),
(299, 1),
(300, 1),
(301, 1),
(302, 1),
(303, 1),
(304, 1),
(305, 1),
(306, 1),
(307, 1),
(308, 1),
(309, 1),
(310, 1),
(311, 1),
(312, 1),
(313, 1),
(314, 1),
(315, 1),
(316, 1),
(317, 1),
(318, 1),
(319, 1),
(319, 4),
(320, 1),
(320, 4),
(321, 1),
(322, 1),
(323, 1),
(324, 1),
(325, 1),
(326, 1),
(327, 1),
(327, 5),
(328, 1),
(328, 5),
(329, 1),
(329, 5),
(330, 1),
(330, 5),
(331, 1),
(332, 1),
(333, 1),
(334, 1),
(335, 1),
(336, 1),
(337, 1),
(338, 1),
(339, 1),
(340, 1),
(341, 1),
(342, 1);

-- --------------------------------------------------------

--
-- Table structure for table `seo_settings`
--

CREATE TABLE `seo_settings` (
  `id` bigint(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `meta_tag` text,
  `meta_description` text,
  `meta_image` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `seo_settings`
--

INSERT INTO `seo_settings` (`id`, `title`, `meta_tag`, `meta_description`, `meta_image`) VALUES
(1, 'Coin Genius', 'a,b,c,d,s,j', 'test description1', '16069484521639895038.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `site_contents`
--

CREATE TABLE `site_contents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `sub_content` longtext COLLATE utf8mb4_unicode_ci,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `site_contents`
--

INSERT INTO `site_contents` (`id`, `name`, `slug`, `content`, `sub_content`, `status`, `created_at`, `updated_at`) VALUES
(1, 'banner', 'banner', '{\"title\":\"Quick Exchange Now\",\"heading\":\"Fast, Secure Crypto Exchange Website\",\"sub_heading\":\"Looking to start making money in crypto? Start trading today on the best cryptocurrency app: Bitmall. Download the app today!\",\"payment_heading\":\"Exchange your crypto with top payment methods in Xchange\",\"image_size\":\"1320x880\",\"image\":\"20912852211647230678.png\"}', '[{\"title\":\"Apple Store\",\"image\":\"app-store.png\"},{\"title\":\"Play Store\",\"image\":\"google-play.png\"}]', 9, NULL, '2022-09-04 14:56:59'),
(2, 'Service', 'service', '{\"title\":\"Our Services\",\"heading\":\"The fastest way to exchange crypto\"}', '[{\"icon\":\"fas fa-university\",\"title\":\"Store Cryptocurrency\",\"details\":\"Whatever your choice of crypto: BTC, BCH, Ethereum, etc. We provide you with the most secured wallet to store your coins.\"},{\"icon\":\"fas fa-exchange-alt\",\"title\":\"Exchange for cash\",\"details\":\"Meet real buyers and negotiate with them at market price or at your own price, complete trade in seconds and get paid.\"},{\"icon\":\"fas fa-wallet\",\"title\":\"Withdraw any time\",\"details\":\"Withdraw your crypto into any of your wallet and get it in few minutes. Safe, fast and secure.\"}]', 1, NULL, '2022-09-04 13:50:18'),
(3, 'Offer', 'offer', '{\"title\":\"Crypto Exchange\",\"heading\":\"Buy And Sell Crypto Currency\"}', NULL, 1, NULL, '2022-03-15 04:20:27'),
(4, 'Feature', 'feature', '{\"heading\":\"Bank-level security - your money is in safe hands.\",\"feature_text\":\"We have securely exchanged the equivalent of over $1,000,000,000 USD\",\"btn_name\":\"Get Started\",\"btn_url\":\"\\/user\\/register\"}', '[{\"feature\":\"Hosted in the AWS cloud for security and continuity\"},{\"feature\":\"Segregated customer accounts held in Tier 1 international banks.\"},{\"feature\":\"Systematic procedures & checks.\"},{\"feature\":\"Thorough verification & authentication measures.\"}]', 1, NULL, '2022-09-04 14:18:19'),
(5, 'How', 'how', '{\"title\":\"Strategy\",\"heading\":\"How To Get Started\",\"sub_heading\":\"Here is how you can begin to make money on this crypto exchange website. Just follow the guide below.\"}', '[{\"icon\":\"fas fa-money-bill\",\"title\":\"Deposit Crypto\",\"details\":\"Fund your wallet with any of your desired coins you like to trade\"},{\"icon\":\"fas fa-gift\",\"title\":\"Create an offer\",\"details\":\"Create a \'sell\' offer so users can see and patronize you\"},{\"icon\":\"fas fa-hand-holding-usd\",\"title\":\"Get funded\",\"details\":\"Receive money via your desired fiat method and complete the trade\"}]', 1, NULL, '2022-09-04 16:09:39'),
(6, 'Testimonial', 'testimonial', '{\"title\":\"Testimonials\",\"heading\":\"What Clients Are Saying About Our Cryptocurrency Website\"}', '[{\"image_size\":\"120x120\",\"name\":\"Faiq Khazii\",\"quote\":\"Swift and easy process like brease, how I was able to deposit my coin, and in sold it without any hassles.\",\"image\":\"4512847501647237903.png\"},{\"image_size\":\"120x120\",\"name\":\"Charity Nwanze\",\"quote\":\"The transfer process was faster than I had thought. Moving my tokens from Bitmall was never difficult.\",\"image\":\"3588832131647237909.png\"},{\"image_size\":\"120x120\",\"name\":\"Fredreick Nuel\",\"quote\":\"The transfer was not too high for me, compared to other P2P platforms that I have used in the past.\",\"image\":\"19279767151647237914.png\"}]', 1, NULL, '2022-09-04 14:00:32'),
(7, 'FAQs\r\n', 'faq', '{\"title\":\"FAQs\",\"heading\":\"Frequently Asked Questions\",\"sub_heading\":\"Here you will find a guide on the most asked questions on our cryptocurrency website.\",\"btn_name\":\"More Questions\",\"btn_url\":\"\\/frequently-asked-questions\"}', '{\"0\":{\"question\":\"When I deposit a coin into my Bitmall wallet, will it reflect immediately?\",\"answer\":\"Yes. But this depends on the blockchain network you are sending from. You can alway confirm your deposit transactions on the network to know its status per time.\"},\"1\":{\"question\":\"What network is your BTC\\/Entheruem token on\",\"answer\":\"We are currently on the ERC20 network, and ensure to only send via this network, to avoid your coin getting lost.\"},\"2\":{\"question\":\"I having a dispute with my buyer\\/seller, what can I do?\",\"answer\":\"We advice that you settle your disturb amicably with your buyer or seller. Where admin is involved, we take a critical look at the case before and investigate thorough. In the end, our decision is final and by using this cryptocurrency website to agree to this. For dispute you can contact us via disputes@bitmall.live\"},\"3\":{\"question\":\"Where can I reach you where I have further issues?\",\"answer\":\"You can reach us via our support page, or send an email to support@bitmall.live\"},\"4\":{\"question\":\"Can I request for evidence of transfer when I don\'t get my crypto withdrawal in time.\",\"answer\":\"Yes. Just send us an email to support@bitmall.live and we will provide you with the blockchain report on your withdrawal transfer.\"},\"5\":{\"question\":\"Will I recognize a gain or loss when I sell my virtual currency for fiat?\",\"answer\":\"Yes. Your cryptocurrencies rely on the prevalent market interactions and where there are fluctuations, like it affects other wallets, you will see a rise or drop in your crypto to fiat value.\"},\"6\":{\"question\":\"Will I recognize a gain or loss when I sell my virtual currency for fiat?\",\"answer\":\"Yes. Your cryptocurrencies rely on the prevalent market interactions and where there are fluctuations, like it affects other wallets, you will see a rise or drop in your crypto to fiat value.\"},\"7\":{\"question\":\"Can I trust my transactions on your platform?\",\"answer\":\"Bitcoin is fully open-source and decentralized. All transactions and bitcoins issued into existence can be transparently consulted in real-time by anyone. All payments can be made without reliance on a third party and the whole system is protected by heavily peer-reviewed cryptographic algorithms like those used for online banking. By this, yes, our network remains secure and can be fully trusted.\"},\"8\":{\"question\":\"Can I get rich from using Bitmall?\",\"answer\":\"Bitmall is not an investment platform. You should never expect to get rich with Bitmall or any emerging technology. It is always important to be wary of anything that sounds too good to be true or disobeys basic economic rules. You can however make money from trading your crypto at favourable exchange rates that could accrue profits for you and with time make you some good money. You can choose to float your rate with the global market rate, or choose your own rate. It is advisavle to be competitive enough for buyers to patronize you quickly.\"},\"9\":{\"question\":\"What happens when my cryptos are lost?\",\"answer\":\"When a user loses his wallet, it has the effect of removing money out of circulation. Lost bitcoins still remain in the block chain just like any other bitcoins. However, lost bitcoins remain dormant forever because there is no way for anybody to find the private key(s) that would allow them to be spent again. We advice that you therefore keep your wallet login information secure and from any anyone or anything that could harm your account\"},\"10\":{\"question\":\"How safe is my crypto wallet?\",\"answer\":\"Your crypto wallet on Bitmall is safe. However, crypto-exchanges and wallets generally do not provide insurance and 100% security to be used to store money in the same way as a bank. Not surprisingly, as the value of a bitcoin has increased, so too has the number of viruses designed to steal bitcoin from wallets, as well as cyber attacks against exchanges. With this we advice that you keep your wallet details safe. Do not reveal your login details for any reason to anyone. Use only secure internet connections, use an anti-virus within a network that you don\'t trust. Be wary of any suspicious links to avoid clicking on phishing links.\"}}', 1, NULL, '2022-09-04 14:05:15'),
(9, 'Blog', 'blog', '{\"title\":\"Blog Posts\",\"heading\":\"Our Latest News & Tips\",\"sub_heading\":\"Need to catch on the latest information in the blockchain and cryptocurrency industry? Click to reach our latest blogs and find tips to make more money in crypto.\"}', NULL, 1, NULL, '2022-09-04 14:14:25'),
(10, 'Sponsors', 'sponsor', NULL, '[{\"image\":\"1193746791647325322.png\",\"image_size\":\"260x200\"},{\"image\":\"19030300861647325330.png\",\"image_size\":\"260x200\"},{\"image\":\"2445476081647325336.png\",\"image_size\":\"260x200\"},{\"image\":\"11698687611647325342.png\",\"image_size\":\"260x200\"},{\"image\":\"11805988381647325348.png\",\"image_size\":\"260x200\"},{\"image\":\"11518527741647325354.png\",\"image_size\":\"260x200\"},{\"image\":\"8344600131647325359.png\",\"image_size\":\"260x200\"},{\"image\":\"11540186991647325367.png\",\"image_size\":\"260x200\"}]', 1, NULL, '2022-03-15 00:22:51'),
(11, 'Social Links', 'social', NULL, '[{\"icon\":\"fab fa-facebook-f\",\"url\":\"https:\\/\\/facebook.com\"},{\"icon\":\"fab fa-twitter\",\"url\":\"https:\\/\\/twiiter.com\"},{\"icon\":\"fab fa-instagram\",\"url\":\"https:\\/\\/instagram.com\"},{\"icon\":\"fab fa-linkedin-in\",\"url\":\"https:\\/\\/linkedin.com\"},{\"icon\":\"fab fa-youtube\",\"url\":\"https:\\/\\/youtube.com\"}]', 9, NULL, '2022-02-13 02:49:01'),
(12, 'Policies And Terms', 'policies', NULL, '[{\"lang\":\"en\",\"title\":\"Privacy\",\"description\":\"<h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; padding: 0px; font-weight: 400; font-family: DauphinPlain; font-size: 24px; line-height: 24px; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><strong style=\\\"margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><br><\\/p>\"},{\"lang\":\"en\",\"title\":\"Terms and Condition\",\"description\":\"<h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\"},{\"lang\":\"en\",\"title\":\"Refund Policy\",\"description\":\"<h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p><h2 style=\\\"margin-right: 0px; margin-bottom: 10px; margin-left: 0px; font-weight: 400; line-height: 24px; font-size: 24px; padding: 0px; font-family: DauphinPlain; color: rgb(0, 0, 0);\\\">What is Lorem Ipsum?<\\/h2><p style=\\\"margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif;\\\"><span style=\\\"font-weight: bolder; margin: 0px; padding: 0px;\\\">Lorem Ipsum<\\/span>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<\\/p>\"},{\"lang\":\"bn\",\"title\":\"Privacy\",\"description\":\"<p style=\\\"-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 1.5; color: rgb(0, 0, 0); font-family: Inter, sans-serif; text-align: justify;\\\">\\u09aa\\u09cd\\u09b0\\u09be\\u099a\\u09c0\\u09a8 \\u0997\\u09cd\\u09b0\\u09bf\\u09b8\\u09c7\\u09b0 \\u09a8\\u09be\\u09ac\\u09bf\\u0995 \\u09ac\\u09be \\u099c\\u09c7\\u09b2\\u09c7\\u09b0\\u09be \\u0989\\u09a4\\u09cd\\u09a4\\u09be\\u09b2 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7 \\u09aa\\u09cd\\u09b0\\u099a\\u09a3\\u09cd\\u09a1 \\u099d\\u09dc \\u09ac\\u09be \\u09a2\\u09c7\\u0989\\u09df\\u09c7\\u09b0 \\u0995\\u09ac\\u09b2\\u09c7 \\u09aa\\u09dc\\u09b2\\u09c7 \\u0995\\u09b0\\u099c\\u09cb\\u09dc\\u09c7 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0-\\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u09c7\\u09b0 \\u09a8\\u09bf\\u0995\\u099f \\u09b8\\u09be\\u09b9\\u09be\\u09af\\u09cd\\u09af \\u09aa\\u09cd\\u09b0\\u09be\\u09b0\\u09cd\\u09a5\\u09a8\\u09be \\u0995\\u09b0\\u09a4\\u0964 \\u0995\\u09be\\u09b0\\u09a3, \\u0997\\u09cd\\u09b0\\u09bf\\u0995 \\u0989\\u09aa\\u0995\\u09a5\\u09be\\u09b0 \\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u099c\\u09be\\u09df\\u0997\\u09be\\u099c\\u09c1\\u09dc\\u09c7 \\u09a8\\u09bf\\u099c\\u09c7\\u0995\\u09c7 \\u09ac\\u09bf\\u09b8\\u09cd\\u09a4\\u09c0\\u09b0\\u09cd\\u09a3 \\u099c\\u09b2\\u09b0\\u09be\\u09b6\\u09bf\\u09b0 \\u09ae\\u09a4\\u09cb \\u099b\\u09dc\\u09bf\\u09df\\u09c7 \\u09b0\\u09c7\\u0996\\u09c7\\u099b\\u09c7\\u09a8 \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u0964 \\u09aa\\u09a6 \\u0993 \\u09ac\\u09bf\\u09b6\\u09bf\\u09b7\\u09cd\\u099f\\u09a4\\u09be \\u0985\\u09a8\\u09c1\\u09b8\\u09be\\u09b0\\u09c7, \\u09a6\\u09c7\\u09ac\\u09b0\\u09be\\u099c \\u099c\\u09bf\\u0989\\u09b8\\u09c7\\u09b0 \\u09aa\\u09b0\\u0987 \\u09a4\\u09be\\u09b0 \\u0985\\u09ac\\u09b8\\u09cd\\u09a5\\u09be\\u09a8\\u0964 \\u099c\\u09bf\\u0989\\u09b8 \\u09af\\u09c7\\u09ad\\u09be\\u09ac\\u09c7 \\u09b8\\u09cd\\u09ac\\u09b0\\u09cd\\u0997\\u09c7\\u09b0 \\u09af\\u09be\\u09ac\\u09a4\\u09c0\\u09df \\u099c\\u09bf\\u09a8\\u09bf\\u09b8 \\u09b8\\u09be\\u09ae\\u09b2\\u09be\\u09a8, \\u09b9\\u09c7\\u09a1\\u09bf\\u09b8 \\u09af\\u09c7\\u09ad\\u09be\\u09ac\\u09c7 \\u09aa\\u09be\\u09a4\\u09be\\u09b2\\u09aa\\u09c1\\u09b0\\u09c0\\u09b0 \\u0998\\u09c1\\u099f\\u0998\\u09c1\\u099f\\u09c7 \\u0985\\u09a8\\u09cd\\u09a7\\u0995\\u09be\\u09b0\\u09c7 \\u0997\\u09c1\\u09b0\\u09c1\\u09a6\\u09be\\u09df\\u09bf\\u09a4\\u09cd\\u09ac \\u09aa\\u09be\\u09b2\\u09a8 \\u0995\\u09b0\\u09c7 \\u0986\\u09b8\\u099b\\u09c7\\u09a8, \\u09a4\\u09c7\\u09ae\\u09a8\\u09bf \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7\\u09b0 \\u098f\\u0995\\u099a\\u09cd\\u099b\\u09a4\\u09cd\\u09b0 \\u0985\\u09a7\\u09bf\\u09aa\\u09a4\\u09bf \\u09b9\\u09bf\\u09b8\\u09c7\\u09ac\\u09c7 \\u0985\\u09a5\\u09c8 \\u099c\\u09b2\\u09c7\\u09b0 \\u09a2\\u09c7\\u0989 \\u09ad\\u09c7\\u0999\\u09c7 \\u09a8\\u09bf\\u099c\\u09c7\\u09b0 \\u09b0\\u09be\\u099c\\u09a4\\u09cd\\u09ac \\u0995\\u09be\\u09df\\u09c7\\u09ae \\u09b0\\u09be\\u0996\\u09c7\\u09a8 \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u0964 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be\\u09a6\\u09c7\\u09b0 \\u09ae\\u09a7\\u09cd\\u09af \\u09a4\\u09bf\\u09a8\\u09bf\\u0987 \\u09aa\\u09cd\\u09b0\\u09a5\\u09ae \\u0998\\u09cb\\u09dc\\u09be\\u0995\\u09c7 \\u09aa\\u09cb\\u09b7 \\u09ae\\u09be\\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09bf\\u09b2\\u09c7\\u09a8 \\u09ac\\u09b2\\u09c7 \\u09a4\\u09be\\u0995\\u09c7 \\u0998\\u09cb\\u09dc\\u09be\\u09b0 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09ac\\u09b2\\u09c7\\u0993 \\u09a1\\u09be\\u0995\\u09be \\u09b9\\u09df\\u0964<\\/p><p style=\\\"-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 1.5; color: rgb(0, 0, 0); font-family: Inter, sans-serif; text-align: justify;\\\">\\u098f\\u099b\\u09be\\u09dc\\u09be\\u0993 \\u0997\\u09cd\\u09b0\\u09bf\\u0995 \\u09aa\\u09c1\\u09b0\\u09be\\u09a3\\u09c7 \\u09a4\\u09bf\\u09a8\\u09bf \\u09ac\\u09a8\\u09cd\\u09af\\u09be, \\u0996\\u09b0\\u09be, \\u0993 \\u09ad\\u09c2\\u09ae\\u09bf\\u0995\\u09ae\\u09cd\\u09aa\\u09c7\\u09b0 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09b9\\u09bf\\u09b8\\u09c7\\u09ac\\u09c7\\u0993 \\u09b8\\u09c1\\u09aa\\u09b0\\u09bf\\u099a\\u09bf\\u09a4\\u0964 \\u099a\\u09cb\\u0996\\u09a7\\u09be\\u0981\\u09a7\\u09be\\u09a8\\u09cb \\u09b8\\u09c1\\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u098f\\u0995 \\u09b0\\u09be\\u099c\\u09aa\\u09cd\\u09b0\\u09be\\u09b8\\u09be\\u09a6\\u09c7 \\u09a4\\u09be\\u09b0 \\u09b0\\u09be\\u099c\\u0995\\u09c0\\u09df \\u09ac\\u09b8\\u09ac\\u09be\\u09b8, \\u09af\\u09be \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7\\u09b0 \\u09a8\\u09bf\\u099a\\u09c7 \\u0985\\u09ac\\u09b8\\u09cd\\u09a5\\u09bf\\u09a4\\u0964 \\u09aa\\u09cd\\u09b0\\u09be\\u09b8\\u09be\\u09a6\\u09c7\\u09b0 \\u09ac\\u09c3\\u09b9\\u09ce \\u098f\\u0995 \\u0986\\u09b8\\u09cd\\u09a4\\u09be\\u09ac\\u09b2\\u09c7 \\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a6\\u09be \\u09b0\\u0999\\u09c7\\u09b0 \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a4\\u09be\\u09ae\\u09be\\u099f\\u09c7 \\u0996\\u09c1\\u09b0 \\u09a8\\u09bf\\u09df\\u09c7 \\u09a0\\u09be\\u0981\\u0987 \\u09a6\\u09be\\u0981\\u09dc\\u09bf\\u09df\\u09c7 \\u09a5\\u09be\\u0995\\u09c7\\u0964 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0 \\u09a8\\u09bf\\u099c\\u09c7\\u09b0 \\u0995\\u09cd\\u09b0\\u09cb\\u09a7 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09c7\\u09b0 \\u09ae\\u09be\\u09a7\\u09cd\\u09af\\u09ae\\u09c7 \\u0985\\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u09b0\\u09c2\\u09aa \\u09a7\\u09be\\u09b0\\u09a3 \\u0995\\u09b0\\u09b2\\u09c7 \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a8\\u09bf\\u09df\\u09c7 \\u098f\\u0995 \\u09b8\\u09cb\\u09a8\\u09be\\u09b2\\u09bf \\u09b0\\u09a5 \\u09aa\\u09cd\\u09b0\\u09b8\\u09cd\\u09a4\\u09c1\\u09a4 \\u0995\\u09b0\\u09c7\\u09a8 \\u09a4\\u09bf\\u09a8\\u09bf\\u0964 \\u09ae\\u09be\\u099b\\u09c7\\u09b0 \\u09ae\\u09a4\\u09cb \\u09b2\\u09c7\\u099c\\u09ac\\u09bf\\u09b6\\u09bf\\u09b7\\u09cd\\u099f \\u098f\\u0995\\u099c\\u09cb\\u09dc\\u09be \\u0998\\u09cb\\u09dc\\u09be \\u09a4\\u09be\\u09b0 \\u09b0\\u09a5 \\u099f\\u09be\\u09a8\\u09be\\u09b0 \\u09a6\\u09be\\u09df\\u09bf\\u09a4\\u09cd\\u09ac \\u09aa\\u09be\\u09b2\\u09a8 \\u0995\\u09b0\\u09c7\\u0964 \\u09b9\\u09be\\u0993\\u09df\\u09be\\u09b0 \\u09ac\\u09c7\\u0997\\u09c7 \\u099b\\u09c1\\u099f\\u09c7 \\u099a\\u09b2\\u09be \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a6\\u09bf\\u09df\\u09c7 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u0995\\u09c7 \\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u0995\\u09b0\\u09be\\u09b0 \\u099a\\u09c7\\u09b7\\u09cd\\u099f\\u09be \\u0995\\u09b0\\u09c7\\u09a8 \\u09a4\\u09bf\\u09a8\\u09bf\\u0964 \\u09ab\\u09c1\\u09b2\\u09c7-\\u09ab\\u09c7\\u0981\\u09aa\\u09c7 \\u0993\\u09a0\\u09be \\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u099c\\u09b2\\u09b0\\u09be\\u09b6\\u09bf \\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u09b9\\u09df\\u09c7 \\u0997\\u09c7\\u09b2\\u09c7\\u0987 \\u099c\\u09b2\\u099c \\u09aa\\u09cd\\u09b0\\u09be\\u09a3\\u09c0\\u09b0\\u09be \\u09b0\\u09a5\\u09c7\\u09b0 \\u09aa\\u09c7\\u099b\\u09a8\\u09c7 \\u0996\\u09c1\\u09b6\\u09bf\\u09a4\\u09c7 \\u09a1\\u0997\\u09ae\\u0997 \\u09b9\\u09df\\u09c7 \\u09a8\\u09c7\\u099a\\u09c7-\\u0997\\u09c7\\u09df\\u09c7 \\u0986\\u09a8\\u09a8\\u09cd\\u09a6 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6 \\u0995\\u09b0\\u09c7\\u0964<\\/p><p style=\\\"-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 1.5; color: rgb(0, 0, 0); font-family: Inter, sans-serif; text-align: justify;\\\">\\u09aa\\u09cd\\u09b0\\u09be\\u099a\\u09c0\\u09a8 \\u0997\\u09cd\\u09b0\\u09bf\\u09b8\\u09c7\\u09b0 \\u09a8\\u09be\\u09ac\\u09bf\\u0995 \\u09ac\\u09be \\u099c\\u09c7\\u09b2\\u09c7\\u09b0\\u09be \\u0989\\u09a4\\u09cd\\u09a4\\u09be\\u09b2 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7 \\u09aa\\u09cd\\u09b0\\u099a\\u09a3\\u09cd\\u09a1 \\u099d\\u09dc \\u09ac\\u09be \\u09a2\\u09c7\\u0989\\u09df\\u09c7\\u09b0 \\u0995\\u09ac\\u09b2\\u09c7 \\u09aa\\u09dc\\u09b2\\u09c7 \\u0995\\u09b0\\u099c\\u09cb\\u09dc\\u09c7 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0-\\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u09c7\\u09b0 \\u09a8\\u09bf\\u0995\\u099f \\u09b8\\u09be\\u09b9\\u09be\\u09af\\u09cd\\u09af \\u09aa\\u09cd\\u09b0\\u09be\\u09b0\\u09cd\\u09a5\\u09a8\\u09be \\u0995\\u09b0\\u09a4\\u0964 \\u0995\\u09be\\u09b0\\u09a3, \\u0997\\u09cd\\u09b0\\u09bf\\u0995 \\u0989\\u09aa\\u0995\\u09a5\\u09be\\u09b0 \\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u099c\\u09be\\u09df\\u0997\\u09be\\u099c\\u09c1\\u09dc\\u09c7 \\u09a8\\u09bf\\u099c\\u09c7\\u0995\\u09c7 \\u09ac\\u09bf\\u09b8\\u09cd\\u09a4\\u09c0\\u09b0\\u09cd\\u09a3 \\u099c\\u09b2\\u09b0\\u09be\\u09b6\\u09bf\\u09b0 \\u09ae\\u09a4\\u09cb \\u099b\\u09dc\\u09bf\\u09df\\u09c7 \\u09b0\\u09c7\\u0996\\u09c7\\u099b\\u09c7\\u09a8 \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u0964 \\u09aa\\u09a6 \\u0993 \\u09ac\\u09bf\\u09b6\\u09bf\\u09b7\\u09cd\\u099f\\u09a4\\u09be \\u0985\\u09a8\\u09c1\\u09b8\\u09be\\u09b0\\u09c7, \\u09a6\\u09c7\\u09ac\\u09b0\\u09be\\u099c \\u099c\\u09bf\\u0989\\u09b8\\u09c7\\u09b0 \\u09aa\\u09b0\\u0987 \\u09a4\\u09be\\u09b0 \\u0985\\u09ac\\u09b8\\u09cd\\u09a5\\u09be\\u09a8\\u0964 \\u099c\\u09bf\\u0989\\u09b8 \\u09af\\u09c7\\u09ad\\u09be\\u09ac\\u09c7 \\u09b8\\u09cd\\u09ac\\u09b0\\u09cd\\u0997\\u09c7\\u09b0 \\u09af\\u09be\\u09ac\\u09a4\\u09c0\\u09df \\u099c\\u09bf\\u09a8\\u09bf\\u09b8 \\u09b8\\u09be\\u09ae\\u09b2\\u09be\\u09a8, \\u09b9\\u09c7\\u09a1\\u09bf\\u09b8 \\u09af\\u09c7\\u09ad\\u09be\\u09ac\\u09c7 \\u09aa\\u09be\\u09a4\\u09be\\u09b2\\u09aa\\u09c1\\u09b0\\u09c0\\u09b0 \\u0998\\u09c1\\u099f\\u0998\\u09c1\\u099f\\u09c7 \\u0985\\u09a8\\u09cd\\u09a7\\u0995\\u09be\\u09b0\\u09c7 \\u0997\\u09c1\\u09b0\\u09c1\\u09a6\\u09be\\u09df\\u09bf\\u09a4\\u09cd\\u09ac \\u09aa\\u09be\\u09b2\\u09a8 \\u0995\\u09b0\\u09c7 \\u0986\\u09b8\\u099b\\u09c7\\u09a8, \\u09a4\\u09c7\\u09ae\\u09a8\\u09bf \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7\\u09b0 \\u098f\\u0995\\u099a\\u09cd\\u099b\\u09a4\\u09cd\\u09b0 \\u0985\\u09a7\\u09bf\\u09aa\\u09a4\\u09bf \\u09b9\\u09bf\\u09b8\\u09c7\\u09ac\\u09c7 \\u0985\\u09a5\\u09c8 \\u099c\\u09b2\\u09c7\\u09b0 \\u09a2\\u09c7\\u0989 \\u09ad\\u09c7\\u0999\\u09c7 \\u09a8\\u09bf\\u099c\\u09c7\\u09b0 \\u09b0\\u09be\\u099c\\u09a4\\u09cd\\u09ac \\u0995\\u09be\\u09df\\u09c7\\u09ae \\u09b0\\u09be\\u0996\\u09c7\\u09a8 \\u09aa\\u09b8\\u09be\\u0987\\u09a1\\u09a8\\u0964 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be\\u09a6\\u09c7\\u09b0 \\u09ae\\u09a7\\u09cd\\u09af \\u09a4\\u09bf\\u09a8\\u09bf\\u0987 \\u09aa\\u09cd\\u09b0\\u09a5\\u09ae \\u0998\\u09cb\\u09dc\\u09be\\u0995\\u09c7 \\u09aa\\u09cb\\u09b7 \\u09ae\\u09be\\u09a8\\u09bf\\u09df\\u09c7\\u099b\\u09bf\\u09b2\\u09c7\\u09a8 \\u09ac\\u09b2\\u09c7 \\u09a4\\u09be\\u0995\\u09c7 \\u0998\\u09cb\\u09dc\\u09be\\u09b0 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09ac\\u09b2\\u09c7\\u0993 \\u09a1\\u09be\\u0995\\u09be \\u09b9\\u09df\\u0964<\\/p><p style=\\\"-webkit-tap-highlight-color: transparent; margin-right: 0px; margin-bottom: 1.5em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 18px; vertical-align: baseline; background-image: initial; background-position: 0px 0px; background-size: initial; background-repeat: initial; background-attachment: initial; background-origin: initial; background-clip: initial; line-height: 1.5; color: rgb(0, 0, 0); font-family: Inter, sans-serif; text-align: justify;\\\">\\u098f\\u099b\\u09be\\u09dc\\u09be\\u0993 \\u0997\\u09cd\\u09b0\\u09bf\\u0995 \\u09aa\\u09c1\\u09b0\\u09be\\u09a3\\u09c7 \\u09a4\\u09bf\\u09a8\\u09bf \\u09ac\\u09a8\\u09cd\\u09af\\u09be, \\u0996\\u09b0\\u09be, \\u0993 \\u09ad\\u09c2\\u09ae\\u09bf\\u0995\\u09ae\\u09cd\\u09aa\\u09c7\\u09b0 \\u09a6\\u09c7\\u09ac\\u09a4\\u09be \\u09b9\\u09bf\\u09b8\\u09c7\\u09ac\\u09c7\\u0993 \\u09b8\\u09c1\\u09aa\\u09b0\\u09bf\\u099a\\u09bf\\u09a4\\u0964 \\u099a\\u09cb\\u0996\\u09a7\\u09be\\u0981\\u09a7\\u09be\\u09a8\\u09cb \\u09b8\\u09c1\\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u098f\\u0995 \\u09b0\\u09be\\u099c\\u09aa\\u09cd\\u09b0\\u09be\\u09b8\\u09be\\u09a6\\u09c7 \\u09a4\\u09be\\u09b0 \\u09b0\\u09be\\u099c\\u0995\\u09c0\\u09df \\u09ac\\u09b8\\u09ac\\u09be\\u09b8, \\u09af\\u09be \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u09c7\\u09b0 \\u09a8\\u09bf\\u099a\\u09c7 \\u0985\\u09ac\\u09b8\\u09cd\\u09a5\\u09bf\\u09a4\\u0964 \\u09aa\\u09cd\\u09b0\\u09be\\u09b8\\u09be\\u09a6\\u09c7\\u09b0 \\u09ac\\u09c3\\u09b9\\u09ce \\u098f\\u0995 \\u0986\\u09b8\\u09cd\\u09a4\\u09be\\u09ac\\u09b2\\u09c7 \\u09a4\\u09be\\u09b0 \\u09b8\\u09be\\u09a6\\u09be \\u09b0\\u0999\\u09c7\\u09b0 \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a4\\u09be\\u09ae\\u09be\\u099f\\u09c7 \\u0996\\u09c1\\u09b0 \\u09a8\\u09bf\\u09df\\u09c7 \\u09a0\\u09be\\u0981\\u0987 \\u09a6\\u09be\\u0981\\u09dc\\u09bf\\u09df\\u09c7 \\u09a5\\u09be\\u0995\\u09c7\\u0964 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0 \\u09a8\\u09bf\\u099c\\u09c7\\u09b0 \\u0995\\u09cd\\u09b0\\u09cb\\u09a7 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6\\u09c7\\u09b0 \\u09ae\\u09be\\u09a7\\u09cd\\u09af\\u09ae\\u09c7 \\u0985\\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u09b0\\u09c2\\u09aa \\u09a7\\u09be\\u09b0\\u09a3 \\u0995\\u09b0\\u09b2\\u09c7 \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a8\\u09bf\\u09df\\u09c7 \\u098f\\u0995 \\u09b8\\u09cb\\u09a8\\u09be\\u09b2\\u09bf \\u09b0\\u09a5 \\u09aa\\u09cd\\u09b0\\u09b8\\u09cd\\u09a4\\u09c1\\u09a4 \\u0995\\u09b0\\u09c7\\u09a8 \\u09a4\\u09bf\\u09a8\\u09bf\\u0964 \\u09ae\\u09be\\u099b\\u09c7\\u09b0 \\u09ae\\u09a4\\u09cb \\u09b2\\u09c7\\u099c\\u09ac\\u09bf\\u09b6\\u09bf\\u09b7\\u09cd\\u099f \\u098f\\u0995\\u099c\\u09cb\\u09dc\\u09be \\u0998\\u09cb\\u09dc\\u09be \\u09a4\\u09be\\u09b0 \\u09b0\\u09a5 \\u099f\\u09be\\u09a8\\u09be\\u09b0 \\u09a6\\u09be\\u09df\\u09bf\\u09a4\\u09cd\\u09ac \\u09aa\\u09be\\u09b2\\u09a8 \\u0995\\u09b0\\u09c7\\u0964 \\u09b9\\u09be\\u0993\\u09df\\u09be\\u09b0 \\u09ac\\u09c7\\u0997\\u09c7 \\u099b\\u09c1\\u099f\\u09c7 \\u099a\\u09b2\\u09be \\u0998\\u09cb\\u09dc\\u09be\\u0997\\u09c1\\u09b2\\u09cb \\u09a6\\u09bf\\u09df\\u09c7 \\u09b8\\u09ae\\u09c1\\u09a6\\u09cd\\u09b0\\u0995\\u09c7 \\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u0995\\u09b0\\u09be\\u09b0 \\u099a\\u09c7\\u09b7\\u09cd\\u099f\\u09be \\u0995\\u09b0\\u09c7\\u09a8 \\u09a4\\u09bf\\u09a8\\u09bf\\u0964 \\u09ab\\u09c1\\u09b2\\u09c7-\\u09ab\\u09c7\\u0981\\u09aa\\u09c7 \\u0993\\u09a0\\u09be \\u09ac\\u09bf\\u09b6\\u09be\\u09b2 \\u099c\\u09b2\\u09b0\\u09be\\u09b6\\u09bf \\u09b6\\u09be\\u09a8\\u09cd\\u09a4 \\u09b9\\u09df\\u09c7 \\u0997\\u09c7\\u09b2\\u09c7\\u0987 \\u099c\\u09b2\\u099c \\u09aa\\u09cd\\u09b0\\u09be\\u09a3\\u09c0\\u09b0\\u09be \\u09b0\\u09a5\\u09c7\\u09b0 \\u09aa\\u09c7\\u099b\\u09a8\\u09c7 \\u0996\\u09c1\\u09b6\\u09bf\\u09a4\\u09c7 \\u09a1\\u0997\\u09ae\\u0997 \\u09b9\\u09df\\u09c7 \\u09a8\\u09c7\\u099a\\u09c7-\\u0997\\u09c7\\u09df\\u09c7 \\u0986\\u09a8\\u09a8\\u09cd\\u09a6 \\u09aa\\u09cd\\u09b0\\u0995\\u09be\\u09b6 \\u0995\\u09b0\\u09c7\\u0964<\\/p>\"}]', 9, NULL, '2022-02-13 03:52:41'),
(13, 'Contact Us', 'contact', '{\"title\":\"Contact Us\",\"heading\":\"Get In Touch\",\"sub_heading\":\"Reach out to us where you are not a regular user of the Bitmall website or any of our services. Where you are already a registered member, reach out to via our support channel in your dashboard.\",\"phone\":\"+1 (631) 593-5927\",\"email\":\"Support@bitmail.com\",\"address\":\"92 Windsor Road READING RG59 6XN\"}', NULL, 9, NULL, '2022-09-04 19:45:06'),
(18, 'Login Page', 'login', '{\"first_heading\":\"Sign in to Crypto Exchange\",\"first_sub_heading\":\"Sign in to your Crypto Exchange account to start accepting payments and sending money with people just like you\",\"second_heading\":\"Turn Your ideas into Reality\",\"second_sub_heading\":\"Change your lifestyle signing up here. Invest and easily earn money for much better life\",\"image\":\"8295419781647337392.png\"}', NULL, 9, NULL, '2022-03-15 04:07:04'),
(19, 'Register Page', 'register\r\n', '{\"first_heading\":\"Register in to Crypto Exchange\",\"first_sub_heading\":\"Register in to our Crypto Exchange account to start accepting payments and sending money with people just like you\",\"second_heading\":\"Turn Your ideas into Reality\",\"second_sub_heading\":\"Change your lifestyle signing up here. Invest and easily earn money for much better life\",\"image\":\"19136958911647338815.png\"}', NULL, 9, NULL, '2022-03-15 04:06:55');

-- --------------------------------------------------------

--
-- Table structure for table `sms_gateways`
--

CREATE TABLE `sms_gateways` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `config` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sms_gateways`
--

INSERT INTO `sms_gateways` (`id`, `name`, `config`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Twilio', '{\"sid\":\"AC6dbeb6e733b4d371b8e7e3b9623381f2\",\"token\":\"08eb5253768fab9484fad21290a24230\",\"from_number\":\"+17075498412\"}', 1, NULL, '2022-09-07 14:14:59'),
(2, 'Nexmo', '{\"api_key\":\"f0842415\",\"api_secret\":\"5FqSGPgFIKbf8nDr\"}', 0, NULL, '2022-09-06 22:11:15');

-- --------------------------------------------------------

--
-- Table structure for table `support_tickets`
--

CREATE TABLE `support_tickets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `guest_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `guest_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 = pending, 1 = replied. ',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `support_tickets`
--

INSERT INTO `support_tickets` (`id`, `user_id`, `guest_email`, `guest_name`, `ticket_num`, `subject`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'TKT57858177', 'Binance Wallet', 1, '2022-08-31 08:09:37', '2022-08-31 08:10:25'),
(25, 26, NULL, NULL, 'TKT76178760', 'Hi', 0, '2022-11-05 10:34:49', '2022-11-05 10:34:49'),
(26, 28, NULL, NULL, 'TKT40402300', 'hi', 0, '2022-11-06 19:52:59', '2022-11-06 19:52:59'),
(27, 28, NULL, NULL, 'TKT84887854', 'hi', 0, '2022-11-06 19:53:06', '2022-11-06 19:53:06'),
(28, 28, NULL, NULL, 'TKT91022548', 'hi', 0, '2022-11-06 20:05:59', '2022-11-06 20:05:59'),
(29, 28, NULL, NULL, 'TKT35880455', 'hi', 0, '2022-11-06 20:06:28', '2022-11-06 20:06:28'),
(30, 30, NULL, NULL, 'TKT84152293', 'test', 0, '2022-11-25 12:39:33', '2022-11-25 12:39:33');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_messages`
--

CREATE TABLE `ticket_messages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `ticket_id` int(11) NOT NULL,
  `ticket_num` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ticket_messages`
--

INSERT INTO `ticket_messages` (`id`, `ticket_id`, `ticket_num`, `user_id`, `admin_id`, `message`, `file`, `created_at`, `updated_at`) VALUES
(1, 1, 'TKT85099556', 13, NULL, 'asldnalskdasjdlaksjd', NULL, '2022-02-02 04:09:34', '2022-02-02 04:09:34'),
(2, 1, 'TKT85099556', 13, 1, 'Hello there', NULL, '2022-02-02 04:09:34', '2022-02-02 04:09:34'),
(3, 1, 'TKT85099556', 13, NULL, 'i need money', NULL, '2022-02-02 04:26:45', '2022-02-02 04:26:45'),
(5, 1, 'TKT85099556', 13, NULL, 'asdasdasd', NULL, '2022-02-02 04:38:05', '2022-02-02 04:38:05'),
(6, 1, 'TKT85099556', 13, NULL, 'asdasdasd', NULL, '2022-02-02 04:38:08', '2022-02-02 04:38:08'),
(7, 1, 'TKT85099556', 13, NULL, 'asdasd', NULL, '2022-02-02 04:38:12', '2022-02-02 04:38:12'),
(8, 1, 'TKT85099556', 13, NULL, 'asdasdasdasd', '13598470421643801342.jpg', '2022-02-02 05:29:02', '2022-02-02 05:29:02'),
(9, 1, 'TKT85099556', 13, NULL, 'pdf', '17062225081643801885.pdf', '2022-02-02 05:38:05', '2022-02-02 05:38:05'),
(24, 1, 'TKT85099556', 13, 1, 'ccc', '16638297981644308176.png', '2022-02-08 02:16:16', '2022-02-08 02:16:16'),
(25, 1, 'TKT85099556', 13, 1, 'asdasdasd', '20045371241644308378.png', '2022-02-08 02:19:38', '2022-02-08 02:19:38'),
(39, 1, 'TKT57858177', 1, 1, 'asdf', NULL, '2022-08-31 08:10:25', '2022-08-31 08:10:25'),
(42, 30, 'TKT84152293', 30, NULL, 'test', NULL, '2022-11-25 12:39:43', '2022-11-25 12:39:43');

-- --------------------------------------------------------

--
-- Table structure for table `trades`
--

CREATE TABLE `trades` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trade_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_type` enum('buy','sell') COLLATE utf8mb4_unicode_ci NOT NULL,
  `trade_duration` int(11) NOT NULL,
  `trade_fee` decimal(18,8) NOT NULL DEFAULT '0.00000000',
  `offer_id` int(11) NOT NULL,
  `offer_user_id` int(11) NOT NULL,
  `trader_id` int(11) NOT NULL,
  `crypto_id` int(11) NOT NULL,
  `fiat_id` int(11) NOT NULL,
  `crypto_amount` decimal(18,8) NOT NULL,
  `fiat_amount` decimal(18,8) NOT NULL,
  `rate` decimal(18,8) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => ''Escrowed'', 1 => ''Paid'', 2 => ''Cancel'',3 => ''completed/Release'', 4 => ''disputed , 5 => ''refunded''',
  `paid_date` datetime DEFAULT NULL,
  `released_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trades`
--

INSERT INTO `trades` (`id`, `trade_code`, `trade_type`, `trade_duration`, `trade_fee`, `offer_id`, `offer_user_id`, `trader_id`, `crypto_id`, `fiat_id`, `crypto_amount`, `fiat_amount`, `rate`, `status`, `paid_date`, `released_date`, `created_at`, `updated_at`) VALUES
(29, 'RJBXBGMEXEVO', 'buy', 25, '0.00000000', 32, 24, 27, 14, 1, '0.00253799', '4.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 08:51:40', '2022-11-05 08:51:40'),
(30, 'GT6N1DBYBBHG', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 13:39:49', '2022-11-05 13:39:49'),
(31, 'VYYEUG6YDIRI', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 13:41:55', '2022-11-05 13:41:55'),
(32, 'CCVNJNYOMF5R', 'buy', 1, '0.00000000', 32, 24, 27, 9, 2, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 14:51:15', '2022-11-05 14:51:15'),
(33, 'V2HPCOMXCHDJ', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 15:08:29', '2022-11-05 15:08:29'),
(34, 'TRK7KVH2KFA6', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 15:14:06', '2022-11-05 15:14:06'),
(35, '7FBZDLOPQBCI', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 15:19:48', '2022-11-05 15:19:48'),
(36, 'DWK6BPSR9ZJX', 'buy', 1, '0.00000000', 32, 24, 25, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 16:07:18', '2022-11-05 16:07:18'),
(37, 'XZWHNJU7UFZT', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 17:43:14', '2022-11-05 17:43:14'),
(38, 'UPRXIODMIOH2', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 17:43:45', '2022-11-05 17:43:45'),
(39, 'ZIS3VZRCEMGY', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 18:14:11', '2022-11-05 18:14:11'),
(40, 'WHFUIXGTEUGO', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:07:56', '2022-11-05 19:07:56'),
(41, 'MW6VBVENWZKR', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:08:56', '2022-11-05 19:08:56'),
(42, 'CAARKP2UZCFZ', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:09:13', '2022-11-05 19:09:13'),
(43, 'LJQUGRXMXYNH', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:10:06', '2022-11-05 19:10:06'),
(44, 'MNQ6INUEFWSE', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:10:45', '2022-11-05 19:10:45'),
(45, 'P2SCUE7Q3KEA', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:11:00', '2022-11-05 19:11:00'),
(46, 'V5HRPHR1II8Z', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-05 19:12:04', '2022-11-05 19:12:04'),
(47, '3F5KHKFJ1RVA', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 09:35:03', '2022-11-06 09:35:03'),
(48, '2YGMJRS6MTXV', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 09:41:30', '2022-11-06 09:41:30'),
(49, 'DTYBWUFHGOO1', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 09:56:18', '2022-11-06 09:56:18'),
(50, 'TBPANXQFZC01', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 10:51:54', '2022-11-06 10:51:54'),
(51, 'TWXF9AGULJ3W', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 10:53:41', '2022-11-06 10:53:41'),
(52, 'NQVXFEKJREDW', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 11:40:46', '2022-11-06 11:40:46'),
(53, '8PDFGBWIZK9S', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-06 11:54:51', '2022-11-06 11:54:51'),
(54, 'DZN0WEXOFKTZ', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 06:12:01', '2022-11-07 06:12:01'),
(55, '8V8G8LYDKPBJ', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 09:22:11', '2022-11-07 09:22:11'),
(56, 'NDQS5IUXEJYF', 'buy', 1, '0.00000000', 32, 24, 37, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 09:25:15', '2022-11-07 09:25:15'),
(57, 'UJWA64FCFMCN', 'buy', 1, '0.00000000', 32, 24, 37, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 10:21:25', '2022-11-07 10:21:25'),
(58, 'HIAPDS90WI8Y', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 15:43:35', '2022-11-07 15:43:35'),
(59, 'BHF17FNYRRDA', 'buy', 1, '0.00000000', 32, 24, 28, 14, 1, '0.00190349', '3.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-07 15:47:28', '2022-11-07 15:47:28'),
(60, 'SKUAKPC0UVTV', 'buy', 25, '0.00000000', 32, 24, 30, 14, 1, '0.00126900', '2.00000000', '1576.04921580', 0, NULL, NULL, '2022-11-10 12:43:48', '2022-11-10 12:43:48'),
(61, 'SRF5W2C7X5P2', 'buy', 25, '0.00000000', 32, 24, 30, 14, 1, '0.00126900', '2.00000000', '1576.04921580', 1, '2022-12-12 11:37:38', NULL, '2022-12-12 11:37:23', '2022-12-12 11:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `trade_chats`
--

CREATE TABLE `trade_chats` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trade_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `message` text COLLATE utf8mb4_unicode_ci,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_chats`
--

INSERT INTO `trade_chats` (`id`, `trade_id`, `user_id`, `admin_id`, `message`, `file`, `created_at`, `updated_at`) VALUES
(18, 29, 27, NULL, 'Hello world', NULL, '2022-11-05 08:54:20', '2022-11-05 08:54:20'),
(19, 36, 25, NULL, 'hi', NULL, '2022-11-05 16:07:31', '2022-11-05 16:07:31'),
(20, 36, 25, NULL, 'hi', NULL, '2022-11-05 16:17:16', '2022-11-05 16:17:16'),
(21, 36, 25, NULL, 'hi', NULL, '2022-11-05 16:19:48', '2022-11-05 16:19:48'),
(22, 36, 25, NULL, 'hi 2', NULL, '2022-11-05 16:54:04', '2022-11-05 16:54:04'),
(23, 36, 25, NULL, 'hello', NULL, '2022-11-05 16:56:43', '2022-11-05 16:56:43'),
(24, 36, 25, NULL, 'hy', NULL, '2022-11-05 16:57:22', '2022-11-05 16:57:22'),
(25, 36, 25, NULL, 'hi', NULL, '2022-11-05 16:58:09', '2022-11-05 16:58:09'),
(26, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:18', '2022-11-05 16:58:18'),
(27, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:19', '2022-11-05 16:58:19'),
(28, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:19', '2022-11-05 16:58:19'),
(29, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:19', '2022-11-05 16:58:19'),
(30, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:19', '2022-11-05 16:58:19'),
(31, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:19', '2022-11-05 16:58:19'),
(32, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:20', '2022-11-05 16:58:20'),
(33, 36, 25, NULL, 'sorry', NULL, '2022-11-05 16:58:20', '2022-11-05 16:58:20'),
(34, 36, 25, NULL, 'hi asma', NULL, '2022-11-05 17:07:17', '2022-11-05 17:07:17'),
(35, 36, 25, NULL, 'hi asma', NULL, '2022-11-05 17:07:24', '2022-11-05 17:07:24'),
(36, 36, 25, NULL, 'hi asma', NULL, '2022-11-05 17:07:36', '2022-11-05 17:07:36'),
(37, 38, 28, NULL, 'hi', NULL, '2022-11-05 17:43:58', '2022-11-05 17:43:58'),
(38, 38, 28, NULL, 'he', NULL, '2022-11-05 17:44:20', '2022-11-05 17:44:20'),
(39, 39, 28, NULL, 'hey', NULL, '2022-11-05 18:14:23', '2022-11-05 18:14:23'),
(40, 46, 28, NULL, 'hi', NULL, '2022-11-05 19:12:27', '2022-11-05 19:12:27'),
(41, 46, 28, NULL, 'hi tt', NULL, '2022-11-05 19:15:44', '2022-11-05 19:15:44'),
(42, 46, 28, NULL, 'hi tt', NULL, '2022-11-05 19:15:48', '2022-11-05 19:15:48'),
(43, 46, 28, NULL, 'hi tt', NULL, '2022-11-05 19:16:15', '2022-11-05 19:16:15'),
(44, 46, 28, NULL, '222', NULL, '2022-11-05 19:16:35', '2022-11-05 19:16:35'),
(45, 46, 28, NULL, '222gggg', NULL, '2022-11-05 19:16:44', '2022-11-05 19:16:44'),
(46, 46, 28, NULL, 'asheet', NULL, '2022-11-05 19:33:46', '2022-11-05 19:33:46'),
(47, 46, 28, NULL, 'asheet', NULL, '2022-11-05 19:33:54', '2022-11-05 19:33:54'),
(48, 47, 28, NULL, 'hi', NULL, '2022-11-06 09:35:44', '2022-11-06 09:35:44'),
(49, 47, 28, NULL, 'hi', NULL, '2022-11-06 09:38:18', '2022-11-06 09:38:18'),
(50, 47, 28, NULL, 'hi asheer', NULL, '2022-11-06 09:38:49', '2022-11-06 09:38:49'),
(51, 47, 28, NULL, 'hi asheer', NULL, '2022-11-06 09:39:22', '2022-11-06 09:39:22'),
(52, 47, 28, NULL, 'hi asheer', NULL, '2022-11-06 09:39:24', '2022-11-06 09:39:24'),
(53, 47, 28, NULL, 'hi asheer butt', NULL, '2022-11-06 09:39:39', '2022-11-06 09:39:39'),
(54, 49, 28, NULL, 'hi', NULL, '2022-11-06 09:59:04', '2022-11-06 09:59:04'),
(55, 49, 28, NULL, 'hello', NULL, '2022-11-06 10:06:04', '2022-11-06 10:06:04'),
(56, 49, 28, NULL, 'hello', NULL, '2022-11-06 10:06:20', '2022-11-06 10:06:20'),
(57, 49, 28, NULL, 'hello', NULL, '2022-11-06 10:06:22', '2022-11-06 10:06:22'),
(58, 49, 28, NULL, 'hello', NULL, '2022-11-06 10:07:33', '2022-11-06 10:07:33'),
(59, 50, 28, NULL, 'hey', NULL, '2022-11-06 10:52:16', '2022-11-06 10:52:16'),
(60, 50, 28, NULL, 'how are you', NULL, '2022-11-06 10:52:27', '2022-11-06 10:52:27'),
(61, 51, 28, NULL, 'hi give me payment details', NULL, '2022-11-06 10:54:00', '2022-11-06 10:54:00'),
(62, 57, 37, NULL, 'hi', NULL, '2022-11-07 10:21:55', '2022-11-07 10:21:55'),
(63, 57, 37, NULL, 'Aa', NULL, '2022-11-07 10:43:49', '2022-11-07 10:43:49'),
(64, 59, 28, NULL, 'hy', NULL, '2022-11-07 15:47:54', '2022-11-07 15:47:54'),
(65, 61, 30, NULL, 'I have paid the desired amount. Please check and let me know.', NULL, '2022-12-12 11:37:38', '2022-12-12 11:37:38');

-- --------------------------------------------------------

--
-- Table structure for table `trade_durations`
--

CREATE TABLE `trade_durations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `duration` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `trade_durations`
--

INSERT INTO `trade_durations` (`id`, `duration`, `created_at`, `updated_at`) VALUES
(1, 25, '2022-03-09 02:48:40', '2022-03-09 02:48:40'),
(2, 100, '2022-03-09 02:52:51', '2022-03-09 02:52:51'),
(3, 150, '2022-03-09 02:52:57', '2022-03-09 03:04:19'),
(4, 15, '2022-03-09 02:53:00', '2022-03-09 02:53:00'),
(5, 30, '2022-03-09 02:53:07', '2022-03-09 02:53:07'),
(7, 50, '2022-03-09 03:09:41', '2022-03-09 03:09:41');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trnx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `charge` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `amount` decimal(20,10) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `remark` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`id`, `trnx`, `user_id`, `charge`, `amount`, `currency_id`, `remark`, `type`, `details`, `created_at`, `updated_at`) VALUES
(39, 'OSY7NQDCCXRM', 27, '0.0000000000', '9.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-05 08:50:29', '2022-11-05 08:50:29'),
(40, 'U2CWEANDQRSF', 24, '0.0000000000', '9.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-05 08:50:44', '2022-11-05 08:50:44'),
(41, 'VX2VMMPBTFJY', 24, '0.0000000000', '0.0025379900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 08:51:40', '2022-11-05 08:51:40'),
(42, 'NYF7ZWHNQVQX', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 13:39:49', '2022-11-05 13:39:49'),
(43, 'SW8HSEBDFLOT', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 13:41:55', '2022-11-05 13:41:55'),
(44, 'GWMVGBIZA4P5', 24, '0.0000000000', '0.0019034900', 9, 'trading', '-', 'Holding balance for trading.', '2022-11-05 14:51:15', '2022-11-05 14:51:15'),
(45, 'I3ENMOMG3RDM', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 15:08:29', '2022-11-05 15:08:29'),
(46, 'AWVJYWCCTXDZ', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 15:14:06', '2022-11-05 15:14:06'),
(47, 'H2CLZMOVKQGJ', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 15:19:48', '2022-11-05 15:19:48'),
(48, 'CBVOKSXCOXOY', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 16:07:18', '2022-11-05 16:07:18'),
(49, 'D7LY9X2T8PTV', 26, '0.0000000000', '0.5000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:14:35', '2022-11-05 17:14:35'),
(50, 'IITMGF5EMXV2', 26, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:15:09', '2022-11-05 17:15:09'),
(51, 'YU80P3PDGZKO', 26, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:15:39', '2022-11-05 17:15:39'),
(52, 'QT6I00TB1IN2', 26, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:15:59', '2022-11-05 17:15:59'),
(53, 'BJGSCVSPJG9G', 26, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:16:03', '2022-11-05 17:16:03'),
(54, 'ST4X1LHXAYCT', 26, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:16:04', '2022-11-05 17:16:04'),
(55, 'ZKROTBI1UQLK', 26, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:16:25', '2022-11-05 17:16:25'),
(56, 'JENJI9CWXHAU', 26, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-05 17:16:42', '2022-11-05 17:16:42'),
(57, 'RCUOLHTANXNW', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 17:43:14', '2022-11-05 17:43:14'),
(58, '0J9DX8ZHJSUS', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 17:43:45', '2022-11-05 17:43:45'),
(59, 'OHDHHUXWRLY4', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 18:14:11', '2022-11-05 18:14:11'),
(60, 'YF4SMDE9QEYC', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:07:56', '2022-11-05 19:07:56'),
(61, 'YGMCQ7XORY40', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:08:56', '2022-11-05 19:08:56'),
(62, 'VXPUCRM7RFE4', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:09:13', '2022-11-05 19:09:13'),
(63, 'E4SUEBJQSOY7', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:10:06', '2022-11-05 19:10:06'),
(64, 'YXZCIXYWKLFP', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:10:45', '2022-11-05 19:10:45'),
(65, 'Q5IMDSSTBULG', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:11:00', '2022-11-05 19:11:00'),
(66, 'D2FRYKKTBIXD', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-05 19:12:04', '2022-11-05 19:12:04'),
(67, '3U68TIPO9IDX', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 09:35:03', '2022-11-06 09:35:03'),
(68, 'PSQP33RBES6G', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 09:41:30', '2022-11-06 09:41:30'),
(69, 'QVLZYHHURS79', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 09:56:18', '2022-11-06 09:56:18'),
(70, 'ZE5RPHSMCOOP', 36, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:46:12', '2022-11-06 10:46:12'),
(71, 'ZESKHWD8VBSY', 36, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:46:26', '2022-11-06 10:46:26'),
(72, 'XL6XD90LIQ5K', 36, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:46:40', '2022-11-06 10:46:40'),
(73, 'FJKISRJVV54F', 36, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:46:55', '2022-11-06 10:46:55'),
(74, 'BVE8YKL4OEBD', 36, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:47:12', '2022-11-06 10:47:12'),
(75, 'BJN5PNHA0K6J', 36, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:47:14', '2022-11-06 10:47:14'),
(76, 'GCXNJ0B6V9AU', 35, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:47:40', '2022-11-06 10:47:40'),
(77, 'MZTMWIPJ1FPF', 35, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:47:59', '2022-11-06 10:47:59'),
(78, 'QFHYL82L6UCL', 35, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:48:14', '2022-11-06 10:48:14'),
(79, 'SKOC2TC1UWVS', 35, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:48:32', '2022-11-06 10:48:32'),
(80, 'VJ75IBMVFSUE', 35, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:50:18', '2022-11-06 10:50:18'),
(81, 'YOS44YR8UHFQ', 34, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:50:54', '2022-11-06 10:50:54'),
(82, 'BDZMFOXBR4EL', 34, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:50:55', '2022-11-06 10:50:55'),
(83, 'NHHUQDSOHQPD', 34, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:51:09', '2022-11-06 10:51:09'),
(84, '15QWPH71UION', 34, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:51:23', '2022-11-06 10:51:23'),
(85, 'J6UOC7EFAJXX', 34, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:51:39', '2022-11-06 10:51:39'),
(86, 'BRKBCZEGTHY2', 34, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 10:51:53', '2022-11-06 10:51:53'),
(87, 'ZW9XZEMOGQ1N', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 10:51:55', '2022-11-06 10:51:55'),
(88, '2AA1TI0850QD', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 10:53:41', '2022-11-06 10:53:41'),
(89, 'MHKTHRRZ42UK', 34, '0.0000000000', '1.0000000000', 9, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-06 11:03:26', '2022-11-06 11:03:26'),
(90, 'UMDEDXTVBYKS', 33, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:04:08', '2022-11-06 11:04:08'),
(91, '05SVKA2BAW87', 33, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:21', '2022-11-06 11:05:21'),
(92, '94BJKKXG1AV9', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:36', '2022-11-06 11:05:36'),
(93, 'NW9FMX9WTCBQ', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:40', '2022-11-06 11:05:40'),
(94, 'CYX8O1SFZMTO', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:50', '2022-11-06 11:05:50'),
(95, 'CXW5VRSEH3ZC', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:55', '2022-11-06 11:05:55'),
(96, 'IEQMCLAA4ESK', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:05:58', '2022-11-06 11:05:58'),
(97, 'JKYBG8ASRHYM', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:06:05', '2022-11-06 11:06:05'),
(98, 'X9BUDXMLQEFB', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:06:08', '2022-11-06 11:06:08'),
(99, 'YUFLKHQ1JMR5', 33, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:06:12', '2022-11-06 11:06:12'),
(100, 'HUHIKITXRNDY', 33, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:06:17', '2022-11-06 11:06:17'),
(101, 'T0BWC3DCCYLM', 33, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:06:18', '2022-11-06 11:06:18'),
(102, 'IU2XHC4KOVL6', 33, '0.0000000000', '1.0000000000', 16, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-06 11:07:19', '2022-11-06 11:07:19'),
(103, 'A3O9UHKFAPNA', 33, '0.0000000000', '7.0000000000', 15, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-06 11:07:59', '2022-11-06 11:07:59'),
(104, 'WOIZOHHHJPR9', 33, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:08:17', '2022-11-06 11:08:17'),
(105, '0D7ZLIM440HX', 31, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:12:26', '2022-11-06 11:12:26'),
(106, 'I692XFAXOT7N', 31, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:12:43', '2022-11-06 11:12:43'),
(107, '6MT6IVM4RL0H', 31, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:13:08', '2022-11-06 11:13:08'),
(108, 'KQN7FOPIBSU0', 31, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:13:23', '2022-11-06 11:13:23'),
(109, 'BEQKRQ8R2IFX', 31, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:13:38', '2022-11-06 11:13:38'),
(110, 'CXMUSA98UI1T', 30, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:15:00', '2022-11-06 11:15:00'),
(111, '3FXBNKSUKPBW', 30, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:15:39', '2022-11-06 11:15:39'),
(112, 'GYRW00C4VR7R', 30, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:15:56', '2022-11-06 11:15:56'),
(113, 'EPAY1OMG1M67', 30, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:18:01', '2022-11-06 11:18:01'),
(114, 'SDL5MHN96LVS', 30, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:18:16', '2022-11-06 11:18:16'),
(115, 'E0GUG4KPOSIE', 29, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:18:45', '2022-11-06 11:18:45'),
(116, '7F2EFBR9VQWV', 29, '0.0000000000', '1.0000000000', 14, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:18:57', '2022-11-06 11:18:57'),
(117, '9TETS627Y4AX', 29, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:19:10', '2022-11-06 11:19:10'),
(118, 'XGTY6TROEJAM', 29, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:19:23', '2022-11-06 11:19:23'),
(119, 'CG0MOEPHAKWE', 29, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-06 11:19:36', '2022-11-06 11:19:36'),
(120, 'L0EUGEW1XJUA', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 11:40:46', '2022-11-06 11:40:46'),
(121, 'ZRUNL7PIDITW', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-06 11:54:51', '2022-11-06 11:54:51'),
(122, 'ADJHCXMPQRGQ', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 06:12:01', '2022-11-07 06:12:01'),
(123, 'EACGAOUJ9EHG', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 09:22:11', '2022-11-07 09:22:11'),
(124, 'LXBF1KULAH90', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 09:25:15', '2022-11-07 09:25:15'),
(125, 'XFNXPEXTINF8', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 10:21:25', '2022-11-07 10:21:25'),
(126, 'ALRYTBFHJOOZ', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 15:43:35', '2022-11-07 15:43:35'),
(127, 'YTQXVOB3PLGW', 24, '0.0000000000', '0.0019034900', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-07 15:47:28', '2022-11-07 15:47:28'),
(128, '7U9ZMMPBFQ5U', 27, '0.0000000000', '2.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:42:17', '2022-11-08 22:42:17'),
(129, 'GVZICY8RYU4I', 27, '0.0000000000', '0.0050000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:46:12', '2022-11-08 22:46:12'),
(130, 'JOUMWIS8QBQZ', 27, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:47:29', '2022-11-08 22:47:29'),
(131, 'HMKL6Z02SIHC', 27, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:49:03', '2022-11-08 22:49:03'),
(132, 'FLWBCERA8FDP', 27, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:49:53', '2022-11-08 22:49:53'),
(133, 'UVLYZRUI7X3U', 27, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:50:43', '2022-11-08 22:50:43'),
(134, 'ZU4E9HCJ4P7A', 27, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:52:31', '2022-11-08 22:52:31'),
(135, 'PLOXP2118K5Z', 27, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:53:58', '2022-11-08 22:53:58'),
(136, 'HPF1AIFMJ7OO', 27, '0.0000000000', '1.0000000000', 15, 'add_balance', '+', 'Balance added by system', '2022-11-08 22:56:27', '2022-11-08 22:56:27'),
(137, 'DWASCFYQTKSZ', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:02:50', '2022-11-08 23:02:50'),
(138, '4PA9LHXEEMBW', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:09:20', '2022-11-08 23:09:20'),
(139, 'R9P4LLASSEK7', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:14:08', '2022-11-08 23:14:08'),
(140, '9YMDJ0LSABTH', 41, '0.0000000000', '1.0000000000', 9, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:18:33', '2022-11-08 23:18:33'),
(141, 'QA3IPZJ7LP94', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:19:37', '2022-11-08 23:19:37'),
(142, 'ZSDUGX5CANM2', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:20:19', '2022-11-08 23:20:19'),
(143, 'FA4I3XF09LIQ', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:21:03', '2022-11-08 23:21:03'),
(144, 'OZUWA5VG4YN7', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:24:46', '2022-11-08 23:24:46'),
(145, 'CGFVMUKUXWED', 41, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:46:56', '2022-11-08 23:46:56'),
(146, 'GUI5VHR1LKGW', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:47:17', '2022-11-08 23:47:17'),
(147, 'OZBIBKRPSXTK', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:48:20', '2022-11-08 23:48:20'),
(148, '1PELTC59ZFD1', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:49:28', '2022-11-08 23:49:28'),
(149, 'T2VMEOUJ9VXQ', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:50:12', '2022-11-08 23:50:12'),
(150, 'DALZ3YP2DSZ1', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:50:56', '2022-11-08 23:50:56'),
(151, 'R46SUJJIHFBE', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:52:59', '2022-11-08 23:52:59'),
(152, 'XBV2F34OZAA9', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:54:58', '2022-11-08 23:54:58'),
(153, 'HCTTJOFE4IKE', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:56:09', '2022-11-08 23:56:09'),
(154, '2IXIERJLBP4Y', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:56:43', '2022-11-08 23:56:43'),
(155, 'EDWPPXFMYNRS', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:58:40', '2022-11-08 23:58:40'),
(156, 'ACIYWACZKNCY', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-08 23:59:27', '2022-11-08 23:59:27'),
(157, 'UUY9ZXIJ5VVL', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-09 00:00:20', '2022-11-09 00:00:20'),
(158, 'W7UPWYAIPMJ3', 24, '0.0000000000', '0.0012690000', 14, 'trading', '-', 'Holding balance for trading.', '2022-11-10 12:43:48', '2022-11-10 12:43:48'),
(159, 'SFFECV5LARYC', 27, '0.0000000000', '10.0000000000', 17, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-16 11:55:51', '2022-11-16 11:55:51'),
(160, 'GJAD2QE4NGC2', 27, '0.0000000000', '9.0000000000', 16, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-16 11:58:24', '2022-11-16 11:58:24'),
(161, 'FRDY7ARWJLLR', 27, '0.0000000000', '8.0000000000', 16, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-16 11:58:36', '2022-11-16 11:58:36'),
(162, 'DXXOJH9VD11H', 27, '0.0000000000', '8.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-16 11:59:58', '2022-11-16 11:59:58'),
(163, '11EIRHXRY7Y2', 27, '0.0000000000', '8.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-16 12:00:04', '2022-11-16 12:00:04'),
(164, 'KONMLIXRIH2R', 27, '0.0000000000', '8.0000000000', 16, 'subtract_balance', '-', 'Balance subtracted by system', '2022-11-16 12:00:35', '2022-11-16 12:00:35'),
(165, 'VWNC8NM1J46F', 27, '0.0000000000', '1.0000000000', 17, 'add_balance', '+', 'Balance added by system', '2022-11-16 12:01:33', '2022-11-16 12:01:33'),
(166, 'XWVW0NDPTPON', 27, '0.0000000000', '1.0000000000', 16, 'add_balance', '+', 'Balance added by system', '2022-11-16 12:02:32', '2022-11-16 12:02:32'),
(167, 'KTIWQSIPW5MK', 24, '0.0000000000', '0.0012690000', 14, 'trading', '-', 'Holding balance for trading.', '2022-12-12 11:37:23', '2022-12-12 11:37:23');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci,
  `zip` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `balance` decimal(20,10) NOT NULL DEFAULT '0.0000000000',
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `email_verified` tinyint(1) DEFAULT '0',
  `phone_verified` tinyint(4) NOT NULL DEFAULT '0',
  `verification_link` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verify_code` int(11) DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kyc_status` tinyint(1) DEFAULT '0',
  `kyc_info` text COLLATE utf8mb4_unicode_ci,
  `kyc_reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `two_fa_status` tinyint(1) NOT NULL DEFAULT '0',
  `two_fa` tinyint(1) NOT NULL DEFAULT '0',
  `two_fa_code` int(10) DEFAULT NULL,
  `device_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `best_seller` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `photo`, `phone`, `country`, `city`, `address`, `zip`, `balance`, `status`, `email_verified`, `phone_verified`, `verification_link`, `verify_code`, `password`, `remember_token`, `kyc_status`, `kyc_info`, `kyc_reject_reason`, `two_fa_status`, `two_fa`, `two_fa_code`, `device_token`, `best_seller`, `created_at`, `updated_at`) VALUES
(24, 'Zubair', 'zubair.nortac@gmail.com', '15077860101668207369.png', '+923242524337', 'Pakistan', NULL, 'test address', NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$BM9muhTvH4dn63nIMGiKmu/7rdnR6ykWNhbQe6CvUhYbvQUf8eJja', NULL, 1, '{\"nid\":\"2332332\",\"image\":{\"profile_photo\":\"8957635641667637929.png\",\"nid_screenshot\":\"\"},\"details\":{\"description_of_address\":\"dfggdgfdg\"}}', NULL, 0, 0, NULL, NULL, 0, '2022-11-04 22:35:13', '2022-11-11 22:56:09'),
(25, 'Adam', 'user@yopmail.com', NULL, '92123123123', 'Algeria', NULL, NULL, NULL, '0.0000000000', 0, 0, 0, NULL, 930818, '$2y$10$X2FeUvD4e1StYKOuQC2.8eMvafHaozuUNIsRBqShQEqF4fvx3V5Ee', NULL, 0, '{\"image\":{\"nid_screenshot\":\"5910345401667656021.jpg\"},\"details\":{\"description_of_address\":\"123\"},\"nid\":\"123\"}', NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 1, '2022-11-04 22:38:19', '2022-11-06 11:23:13'),
(26, 'James Nwabueze', 'trendzhq.com@gmail.com', '9958410851667691733.jpg', '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, 472600, '$2y$10$KRUZB4IP9ATGObTpFUz6puXqARs4za0zyFhm2STaA23bo0508GXpy', NULL, 1, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"9958410851667691733.jpg\",\"nid_screenshot\":\"3500007861667691733.JPG\"},\"details\":{\"description_of_address\":\"House 2, Off Road 69B, Gwarinpa Housing Estate, Abuja\"}}', 'Images not clear', 0, 0, NULL, '32423423423423423423sdfasfsdf', 1, '2022-11-05 06:33:58', '2022-11-06 11:22:32'),
(27, 'cache', 'xubayr.ali@gmail.com', '19028320281667677457.png', '+923242524337', 'Pakistan', NULL, 'test', NULL, '0.0000000000', 1, 1, 0, NULL, 393136, '$2y$10$oGQId746R0XW9kkCZydF5OqA4sX9Si.iVM0YV2Qgy9hglTmo9vJTC', NULL, 0, '{\"nid\":\"876768\",\"image\":{\"profile_photo\":\"19028320281667677457.png\",\"nid_screenshot\":\"2184573581667677457.jpg\"},\"details\":{\"description_of_address\":\"hello world\"}}', NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-05 08:48:17', '2022-12-12 23:25:39'),
(28, 'asheerrr', 'iamasheer007@gmail.com', NULL, '+9230800100360', 'Belgium', NULL, NULL, NULL, '0.0000000000', 0, 1, 0, NULL, NULL, '$2y$10$BTu1wMh6xlI.lcTMhi7RJ.l6z.b3GQUfmrs1BAqj0eFFDg/e5Gxny', NULL, 0, '{\"image\":{\"nid_screenshot\":\"13436165491667991055.jpg\"},\"details\":{\"description_of_address\":\"hi\"},\"nid\":\"1\"}', NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-05 14:22:57', '2022-11-10 22:36:03'),
(29, 'Grace Adjei', 'vaught.app@gmail.com', '13301709471667693094.JPG', '+2348153612215', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$ZeCtzqHAvjytOIQqg5xWQuLIPN25PW7xYjSZwBOqo8ptV6.L81Faa', NULL, 2, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"13301709471667693094.JPG\",\"nid_screenshot\":\"19788920881667693094.jpg\"},\"details\":{\"description_of_address\":\"House 2, Off Road 69B, Gwarinpa Housing Estate, Abuja\"}}', NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 1, '2022-11-05 18:13:02', '2022-11-06 11:21:06'),
(30, 'Amit Kumar', '8rg.biz@gmail.com', '5554416051667693879.JPG', '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$FTV/H69j7wxYUgzvdEy1fu5j6Pjeb8JSbo2yFKxpwymEpGRNKIltC', NULL, 2, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"5554416051667693879.JPG\",\"nid_screenshot\":\"11325775291667693879.jpg\"},\"details\":{\"description_of_address\":\"Abuja, Nigeria.\"}}', NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 1, '2022-11-05 18:16:23', '2022-11-06 11:22:58'),
(31, 'Patrick Barkley', 'kuhort.app@gmail.com', '3660974351667694082.JPG', '+2348153612215', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$UfjWpxK/OTxfdvxcOXwU7Oto4ASG6onkUmqQau38i4U6E/VTSrlW6', NULL, 2, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"3660974351667694082.JPG\",\"nid_screenshot\":\"9720805441667694082.JPG\"},\"details\":{\"description_of_address\":\"Patrck\"}}', NULL, 0, 0, NULL, NULL, 1, '2022-11-05 18:22:32', '2022-11-06 11:21:30'),
(32, 'Jude Ifeanyi', 'v.aught.app@gmail.com', NULL, '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 0, 0, 0, NULL, 218034, '$2y$10$0bljLgAy.8XpMs03og/ueulL5jylA6.pBeB3qeS1H79Qd9xkpCAW2', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-05 18:24:54', '2022-11-16 12:26:55'),
(33, 'Jude Ifeanyi', 'va.ught.app@gmail.com', '15186438281667694461.JPG', '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$o8RUFj7oUdjjwA1BatYBN.WMjZw2mw0QZzy9sFPiOoH5DKf2r/Wya', NULL, 0, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"15186438281667694461.JPG\",\"nid_screenshot\":\"11607761001667694461.JPG\"},\"details\":{\"description_of_address\":\"Abuja\"}}', NULL, 0, 0, NULL, NULL, 1, '2022-11-05 18:25:12', '2022-11-06 11:22:06'),
(34, 'Saquon Mahomes', 'k.uhort.app@gmail.com', '21058414001667694605.JPG', '+2348153612215', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$OsQKz97YR437gmDhQsCoeuAL0Fhneb2DPpKpk/74815v5shpTLQKq', NULL, 0, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"21058414001667694605.JPG\",\"nid_screenshot\":\"17675512781667694605.JPG\"},\"details\":{\"description_of_address\":\"Abuja\"}}', NULL, 0, 0, NULL, NULL, 0, '2022-11-05 18:34:56', '2022-11-06 11:03:42'),
(35, 'Vivian Adams', 'dubaihq.shop@gmail.com', '3549316061667694784.JPG', '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, 753592, '$2y$10$tbRfVPVNHkWXYCtJCr8Jp.gVCPNd3S3qFbazsJkT7YLGaOSEOzjGS', NULL, 2, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"3549316061667694784.JPG\",\"nid_screenshot\":\"8832919051667694784.JPG\"},\"details\":{\"description_of_address\":\"Abuja\"}}', NULL, 0, 0, NULL, NULL, 1, '2022-11-05 18:36:50', '2022-11-06 11:22:22'),
(36, 'Vladimir Golubovych', 'dubai.hq.shop@gmail.com', '11130651381667694978.JPG', '+2348136332835', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$5pOmhojfsQvJs6haBcSo9u8uV6wc.VS4xckyZy6WOe5wpsGcMs7mm', NULL, 2, '{\"nid\":\"International Passport\",\"image\":{\"profile_photo\":\"11130651381667694978.JPG\",\"nid_screenshot\":\"10312141041667694978.JPG\"},\"details\":{\"description_of_address\":\"Abuja\"}}', NULL, 0, 0, NULL, NULL, 1, '2022-11-05 18:39:43', '2022-11-06 11:22:41'),
(37, 'asheerr', 'thenameisasheer@gmail.com', NULL, '+923080010360', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$/ZBCUjkE5QK7RrjHCFC8UOwLvwfC1Bw/X6zt.XAb4iT3DqEtiCGpq', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-06 12:48:40', '2022-11-10 22:35:13'),
(38, 'Azeem', 'mazeemrehan@gmail.com', NULL, '+923004103160', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 807027, '$2y$10$PYZOJUOnJlFI/KIK8VKQSuZGL2XVfNkWJVPa.QvC3CVwH6cXima8m', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-08 05:47:31', '2022-11-08 05:48:45'),
(39, 'Huzaifa Shah', 'huzaifashah5001@gmail.com', NULL, '+923313409955', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 973651, '$2y$10$xl9W7sruNNTs14UIAp87e.Qm/X.Hn2ceLQuar5gE/ox8uLtXhvCP6', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-08 06:25:00', '2022-11-08 06:27:26'),
(40, 'Hamza', 'hamzasabir8486@gmail.com', NULL, '+923024047554', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 770049, '$2y$10$RjeXklWkGDDIv27jG2sUTuw9MmwnuAkHU2ExCKNdsfH3QqGCWINVK', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-08 07:53:23', '2022-11-08 07:55:46'),
(41, 'Zubair', 'zubair.nortac+1@gmail.com', NULL, '+923242524337', 'Pakistan', NULL, 'dfgfdgdfgdsfg', NULL, '0.0000000000', 1, 0, 0, NULL, 626041, '$2y$10$iRLOuMbV.XFgL24O8895QenzpZ/rd5Oda6CzcwN9BQRbkqU6gWz6O', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-08 22:58:15', '2022-11-09 00:00:58'),
(42, 'haroon', 'zaraak237@gmail.com', NULL, '+923360417436', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 138879, '$2y$10$SAqOfIbwQIj4HJs4Na5rN.x7u5Ifwk9NF9AG7QDv0BXrHVv2QXIcO', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-09 19:27:41', '2022-11-09 19:33:38'),
(43, 'Jared Figueroa', 'ciwi@mailinator.com', NULL, '+356+1 (153) 756-5898', 'Malta', NULL, 'Eaque est quod earum', NULL, '0.0000000000', 1, 0, 0, NULL, 316540, '$2y$10$7E2FskzlSFhoj6XUq3dT2ec8Kn4w8EHhjoiCqz.JTetNmUy13w9Zu', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-09 22:56:22', '2022-11-09 22:56:23'),
(44, 'Ria Haney', 'fydovy@mailinator.com', NULL, '+674+1 (888) 287-9309', 'Nauru', NULL, 'Tenetur distinctio', NULL, '0.0000000000', 1, 0, 0, NULL, 428403, '$2y$10$HTcAKPhIN0FwkLinQU5UmOCPyeRYeeruXvVde2/bry844uN9cDQym', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-09 23:20:41', '2022-11-09 23:20:42'),
(45, 'Piyush', 'mohitbhatnagar9198@gmail.com', NULL, '+916394240282', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 674340, '$2y$10$RgCefdg17EQhmjknO9pnoekgVNu5Tb8mbbMcaec7kUXssu9N2vx3i', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-10 02:25:37', '2022-11-10 02:25:38'),
(46, 'dummy', 'dummy@gmail.com', NULL, '+919537477723', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 697746, '$2y$10$HsNARBvFeF.sgoV0mewB2ObbhPlx8frFPAkNpTa.JUpXlJQ/wKJ.W', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-10 04:57:14', '2022-11-10 04:57:15'),
(47, 'kashan', 'kashan.badar@catalyic.com', NULL, '+923335656569', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 526747, '$2y$10$E5WrFdm4Fn8Jwxya/lG6t.YL/ul3GOzo88XhXnfC8PJRDFdVkLrIC', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-10 06:36:37', '2022-11-10 06:38:23'),
(48, 'dev', 'dev9.mxpwertz@gmail.com', NULL, 'null9131163452', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 787267, '$2y$10$j1ZcmUNof2aD.WRS4skIC.j93y..cd/68s3FsHgceoC5Q8m0JVVWK', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-10 06:41:26', '2022-11-10 06:41:27'),
(49, 'dev', 'dev9.mxpertz@gmail.com', NULL, 'null9131163452', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 430674, '$2y$10$T994YOZtnguv/wUNG6hP.up47bm5lm9SmOeIiPPjlkQs6ogbbtZKO', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-10 06:49:20', '2022-11-10 06:51:58'),
(50, 'lat', 'lat@gmail.com', NULL, 'null07032502258', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 771939, '$2y$10$ddqlwEKONROq.hNdbZIITevR93RRL4Q.xMTJm3LN.g6O2Rp1LM40C', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-11 06:20:27', '2022-11-11 06:22:07'),
(51, 'Laiba', 'laiba.stars@gmail.com', NULL, '+923056601194', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 985877, '$2y$10$6CA1.jxn5Za2sbpy9IYTM.4txyT6nNjq6kHYVMw/lnUilvQzGQ6aC', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-11 16:25:34', '2022-11-11 16:26:58'),
(52, 'Zubair33', 'zubair.nortac+33@gmail.com', '8701648511668207774.png', '+923242524337', 'Pakistan', NULL, 'pakistan karachi', NULL, '0.0000000000', 1, 1, 0, NULL, NULL, '$2y$10$rZSdgJgnvJ.33NP5a.FsvuhuiSnKsPMfgXnecCceeNDi18mA8FYkG', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-11-11 23:02:55', '2022-11-11 23:04:59'),
(53, 'Shahzaib', 'shahzaibabid919293@gmail.com', '7950558081669807382.png', '+92+923116484462', 'Pakistan', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 274721, '$2y$10$ivGoypHle8wa0R3ABOCHXOeG45kSAoVL.Iyi57agGGp4aRkY9wh12', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-11-30 11:23:02', '2022-12-04 07:39:45'),
(54, 'Shahzaib', 'shahzaibabid9192913@gmail.com', '19633605921670746267.jpg', '923000000000', 'Pakistan', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 917129, '$2y$10$mMFdAb2iKAJV/sSC8wtZ/e22MnYGGFHCSsrT2AiTt7Wfg0FxogAZC', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-12-11 08:11:07', '2022-12-11 08:11:09'),
(55, 'Shahzaib', 'shahzaibabid929394@gmail.com', '13662833261670747248.jpg', '+923000000000', 'Pakistan', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 791275, '$2y$10$H8A.JLhHmj7uC/acki0Tf.8hDFVm3Lw2HW7mre2UtJjZHbh/C0Bgq', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-12-11 08:27:29', '2022-12-11 08:27:29'),
(56, 'Shahzaib', 'shahzaibabid929395@gmail.com', '14321967411670747309.jpg', '+923116484462', 'Pakistan', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 978556, '$2y$10$YFyvToHh35hn8g62FqIAAu4YDj9ZEwMNeuoZ4VaPZlwTGZrwrmnWC', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-12-11 08:28:29', '2022-12-11 08:28:30'),
(57, 'Adam', 'test@yopmail.com', '5790510321670945784.png', '92123123123', 'Algeria', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 509779, '$2y$10$SXXizUlSR8S9prVBV5Ls1eK2vBd11F.R00fnqQvE8r7ouqAu8hyEy', NULL, 0, NULL, NULL, 0, 0, NULL, NULL, 0, '2022-12-13 15:36:25', '2022-12-13 15:36:26'),
(58, 'test', 'test@test.con', '13900291211670949109.png', '+918827725150', 'Belgium', NULL, NULL, NULL, '0.0000000000', 1, 0, 0, NULL, 898699, '$2y$10$eK.XJqF4PdNtpq6cwFhrxu02Sm7Uy1YDQ8iGxsExhoBx7viYrs82m', NULL, 0, NULL, NULL, 0, 0, NULL, '32423423423423423423sdfasfsdf', 0, '2022-12-13 16:31:49', '2022-12-14 17:19:21');

-- --------------------------------------------------------

--
-- Table structure for table `wallets`
--

CREATE TABLE `wallets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `crypto_id` int(11) NOT NULL,
  `balance` decimal(28,8) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `wallets`
--

INSERT INTO `wallets` (`id`, `user_id`, `crypto_id`, `balance`, `created_at`, `updated_at`) VALUES
(116, 24, 9, '0.00000000', '2022-11-04 22:35:14', '2022-11-04 22:35:14'),
(117, 24, 14, '8.93781931', '2022-11-04 22:35:14', '2022-12-12 11:37:23'),
(118, 24, 15, '0.00000000', '2022-11-04 22:35:14', '2022-11-04 22:35:14'),
(119, 24, 16, '0.00000000', '2022-11-04 22:35:14', '2022-11-04 22:35:14'),
(120, 24, 17, '0.00000000', '2022-11-04 22:35:14', '2022-11-04 22:35:14'),
(121, 25, 9, '0.00000000', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(122, 25, 14, '0.00000000', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(123, 25, 15, '0.00000000', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(124, 25, 16, '0.00000000', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(125, 25, 17, '0.00000000', '2022-11-04 22:38:20', '2022-11-04 22:38:20'),
(126, 26, 9, '0.50000000', '2022-11-05 06:34:02', '2022-11-05 17:14:35'),
(127, 26, 14, '1.00000000', '2022-11-05 06:34:02', '2022-11-05 17:15:09'),
(128, 26, 15, '1.00000000', '2022-11-05 06:34:02', '2022-11-05 17:15:39'),
(129, 26, 16, '4.00000000', '2022-11-05 06:34:02', '2022-11-05 17:16:25'),
(130, 26, 17, '1.00000000', '2022-11-05 06:34:02', '2022-11-05 17:16:42'),
(131, 27, 9, '4.00500000', '2022-11-05 08:48:21', '2022-11-08 22:49:03'),
(132, 27, 14, '9.00000000', '2022-11-05 08:48:21', '2022-11-05 08:50:29'),
(133, 27, 15, '5.00000000', '2022-11-05 08:48:21', '2022-11-08 22:56:27'),
(134, 27, 16, '1.00000000', '2022-11-05 08:48:21', '2022-11-16 12:02:32'),
(135, 27, 17, '1.00000000', '2022-11-05 08:48:21', '2022-11-16 12:01:33'),
(136, 28, 9, '0.00000000', '2022-11-05 14:23:01', '2022-11-05 14:23:01'),
(137, 28, 14, '0.00000000', '2022-11-05 14:23:01', '2022-11-05 14:23:01'),
(138, 28, 15, '0.00000000', '2022-11-05 14:23:01', '2022-11-05 14:23:01'),
(139, 28, 16, '0.00000000', '2022-11-05 14:23:01', '2022-11-05 14:23:01'),
(140, 28, 17, '0.00000000', '2022-11-05 14:23:01', '2022-11-05 14:23:01'),
(141, 29, 9, '1.00000000', '2022-11-05 18:13:06', '2022-11-06 11:18:45'),
(142, 29, 14, '1.00000000', '2022-11-05 18:13:06', '2022-11-06 11:18:57'),
(143, 29, 15, '1.00000000', '2022-11-05 18:13:06', '2022-11-06 11:19:10'),
(144, 29, 16, '1.00000000', '2022-11-05 18:13:06', '2022-11-06 11:19:23'),
(145, 29, 17, '1.00000000', '2022-11-05 18:13:06', '2022-11-06 11:19:36'),
(146, 30, 9, '1.00000000', '2022-11-05 18:16:27', '2022-11-06 11:15:00'),
(147, 30, 14, '1.00000000', '2022-11-05 18:16:27', '2022-11-06 11:15:39'),
(148, 30, 15, '1.00000000', '2022-11-05 18:16:27', '2022-11-06 11:15:56'),
(149, 30, 16, '1.00000000', '2022-11-05 18:16:27', '2022-11-06 11:18:01'),
(150, 30, 17, '1.00000000', '2022-11-05 18:16:27', '2022-11-06 11:18:16'),
(151, 31, 9, '1.00000000', '2022-11-05 18:22:34', '2022-11-06 11:12:25'),
(152, 31, 14, '1.00000000', '2022-11-05 18:22:34', '2022-11-06 11:12:43'),
(153, 31, 15, '1.00000000', '2022-11-05 18:22:34', '2022-11-06 11:13:08'),
(154, 31, 16, '1.00000000', '2022-11-05 18:22:34', '2022-11-06 11:13:23'),
(155, 31, 17, '1.00000000', '2022-11-05 18:22:34', '2022-11-06 11:13:38'),
(156, 32, 9, '0.00000000', '2022-11-05 18:24:57', '2022-11-05 18:24:57'),
(157, 32, 14, '0.00000000', '2022-11-05 18:24:57', '2022-11-05 18:24:57'),
(158, 32, 15, '0.00000000', '2022-11-05 18:24:57', '2022-11-05 18:24:57'),
(159, 32, 16, '0.00000000', '2022-11-05 18:24:57', '2022-11-05 18:24:57'),
(160, 32, 17, '0.00000000', '2022-11-05 18:24:57', '2022-11-05 18:24:57'),
(161, 33, 9, '1.00000000', '2022-11-05 18:25:15', '2022-11-06 11:04:08'),
(162, 33, 14, '1.00000000', '2022-11-05 18:25:15', '2022-11-06 11:05:20'),
(163, 33, 15, '1.00000000', '2022-11-05 18:25:15', '2022-11-06 11:07:59'),
(164, 33, 16, '1.00000000', '2022-11-05 18:25:15', '2022-11-06 11:07:19'),
(165, 33, 17, '1.00000000', '2022-11-05 18:25:15', '2022-11-06 11:08:17'),
(166, 34, 9, '1.00000000', '2022-11-05 18:35:00', '2022-11-06 11:03:26'),
(167, 34, 14, '1.00000000', '2022-11-05 18:35:00', '2022-11-06 10:51:09'),
(168, 34, 15, '1.00000000', '2022-11-05 18:35:00', '2022-11-06 10:51:23'),
(169, 34, 16, '1.00000000', '2022-11-05 18:35:00', '2022-11-06 10:51:39'),
(170, 34, 17, '1.00000000', '2022-11-05 18:35:00', '2022-11-06 10:51:53'),
(171, 35, 9, '1.00000000', '2022-11-05 18:36:54', '2022-11-06 10:47:40'),
(172, 35, 14, '1.00000000', '2022-11-05 18:36:54', '2022-11-06 10:47:58'),
(173, 35, 15, '1.00000000', '2022-11-05 18:36:54', '2022-11-06 10:48:14'),
(174, 35, 16, '1.00000000', '2022-11-05 18:36:54', '2022-11-06 10:48:32'),
(175, 35, 17, '1.00000000', '2022-11-05 18:36:54', '2022-11-06 10:50:18'),
(176, 36, 9, '1.00000000', '2022-11-05 18:39:47', '2022-11-06 10:46:12'),
(177, 36, 14, '1.00000000', '2022-11-05 18:39:47', '2022-11-06 10:46:26'),
(178, 36, 15, '1.00000000', '2022-11-05 18:39:47', '2022-11-06 10:46:40'),
(179, 36, 16, '1.00000000', '2022-11-05 18:39:47', '2022-11-06 10:46:55'),
(180, 36, 17, '2.00000000', '2022-11-05 18:39:47', '2022-11-06 10:47:14'),
(181, 37, 9, '0.00000000', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(182, 37, 14, '0.00000000', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(183, 37, 15, '0.00000000', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(184, 37, 16, '0.00000000', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(185, 37, 17, '0.00000000', '2022-11-06 12:48:41', '2022-11-06 12:48:41'),
(186, 38, 9, '0.00000000', '2022-11-08 05:47:32', '2022-11-08 05:47:32'),
(187, 38, 14, '0.00000000', '2022-11-08 05:47:33', '2022-11-08 05:47:33'),
(188, 38, 15, '0.00000000', '2022-11-08 05:47:33', '2022-11-08 05:47:33'),
(189, 38, 16, '0.00000000', '2022-11-08 05:47:33', '2022-11-08 05:47:33'),
(190, 38, 17, '0.00000000', '2022-11-08 05:47:33', '2022-11-08 05:47:33'),
(191, 39, 9, '0.00000000', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(192, 39, 14, '0.00000000', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(193, 39, 15, '0.00000000', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(194, 39, 16, '0.00000000', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(195, 39, 17, '0.00000000', '2022-11-08 06:25:01', '2022-11-08 06:25:01'),
(196, 40, 9, '0.00000000', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(197, 40, 14, '0.00000000', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(198, 40, 15, '0.00000000', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(199, 40, 16, '0.00000000', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(200, 40, 17, '0.00000000', '2022-11-08 07:53:24', '2022-11-08 07:53:24'),
(201, 41, 9, '1.00000000', '2022-11-08 22:58:16', '2022-11-08 23:18:33'),
(202, 41, 14, '0.00000000', '2022-11-08 22:58:16', '2022-11-08 22:58:16'),
(203, 41, 15, '0.00000000', '2022-11-08 22:58:16', '2022-11-08 22:58:16'),
(204, 41, 16, '1.00000000', '2022-11-08 22:58:16', '2022-11-08 23:46:56'),
(205, 41, 17, '0.00000000', '2022-11-08 22:58:16', '2022-11-08 22:58:16'),
(206, 42, 9, '0.00000000', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(207, 42, 14, '0.00000000', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(208, 42, 15, '0.00000000', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(209, 42, 16, '0.00000000', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(210, 42, 17, '0.00000000', '2022-11-09 19:27:42', '2022-11-09 19:27:42'),
(211, 43, 9, '0.00000000', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(212, 43, 14, '0.00000000', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(213, 43, 15, '0.00000000', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(214, 43, 16, '0.00000000', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(215, 43, 17, '0.00000000', '2022-11-09 22:56:23', '2022-11-09 22:56:23'),
(216, 44, 9, '0.00000000', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(217, 44, 14, '0.00000000', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(218, 44, 15, '0.00000000', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(219, 44, 16, '0.00000000', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(220, 44, 17, '0.00000000', '2022-11-09 23:20:42', '2022-11-09 23:20:42'),
(221, 45, 9, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(222, 45, 14, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(223, 45, 15, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(224, 45, 16, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(225, 45, 17, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(226, 45, 18, '0.00000000', '2022-11-10 02:25:38', '2022-11-10 02:25:38'),
(227, 46, 9, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(228, 46, 14, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(229, 46, 15, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(230, 46, 16, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(231, 46, 17, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(232, 46, 18, '0.00000000', '2022-11-10 04:57:15', '2022-11-10 04:57:15'),
(233, 47, 9, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(234, 47, 14, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(235, 47, 15, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(236, 47, 16, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(237, 47, 17, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(238, 47, 18, '0.00000000', '2022-11-10 06:36:39', '2022-11-10 06:36:39'),
(239, 48, 9, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(240, 48, 14, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(241, 48, 15, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(242, 48, 16, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(243, 48, 17, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(244, 48, 18, '0.00000000', '2022-11-10 06:41:27', '2022-11-10 06:41:27'),
(245, 49, 9, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(246, 49, 14, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(247, 49, 15, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(248, 49, 16, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(249, 49, 17, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(250, 49, 18, '0.00000000', '2022-11-10 06:49:21', '2022-11-10 06:49:21'),
(251, 30, 18, '0.00000000', '2022-11-10 12:42:10', '2022-11-10 12:42:10'),
(252, 24, 18, '0.00000000', '2022-11-10 22:28:17', '2022-11-10 22:28:17'),
(253, 50, 9, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(254, 50, 14, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(255, 50, 15, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(256, 50, 16, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(257, 50, 17, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(258, 50, 18, '0.00000000', '2022-11-11 06:20:28', '2022-11-11 06:20:28'),
(259, 51, 9, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(260, 51, 14, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(261, 51, 15, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(262, 51, 16, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(263, 51, 17, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(264, 51, 18, '0.00000000', '2022-11-11 16:25:35', '2022-11-11 16:25:35'),
(265, 52, 9, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(266, 52, 14, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(267, 52, 15, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(268, 52, 16, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(269, 52, 17, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(270, 52, 18, '0.00000000', '2022-11-11 23:02:56', '2022-11-11 23:02:56'),
(271, 53, 9, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(272, 53, 14, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(273, 53, 15, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(274, 53, 16, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(275, 53, 17, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(276, 53, 18, '0.00000000', '2022-11-30 11:23:03', '2022-11-30 11:23:03'),
(277, 54, 9, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(278, 54, 14, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(279, 54, 15, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(280, 54, 16, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(281, 54, 17, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(282, 54, 18, '0.00000000', '2022-12-11 08:11:09', '2022-12-11 08:11:09'),
(283, 55, 9, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(284, 55, 14, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(285, 55, 15, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(286, 55, 16, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(287, 55, 17, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(288, 55, 18, '0.00000000', '2022-12-11 08:27:30', '2022-12-11 08:27:30'),
(289, 56, 9, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(290, 56, 14, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(291, 56, 15, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(292, 56, 16, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(293, 56, 17, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(294, 56, 18, '0.00000000', '2022-12-11 08:28:30', '2022-12-11 08:28:30'),
(295, 57, 9, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(296, 57, 14, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(297, 57, 15, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(298, 57, 16, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(299, 57, 17, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(300, 57, 18, '0.00000000', '2022-12-13 15:36:26', '2022-12-13 15:36:26'),
(301, 58, 9, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(302, 58, 14, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(303, 58, 15, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(304, 58, 16, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(305, 58, 17, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50'),
(306, 58, 18, '0.00000000', '2022-12-13 16:31:50', '2022-12-13 16:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `trx` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `amount` decimal(20,10) NOT NULL,
  `charge` decimal(20,10) NOT NULL,
  `total_amount` decimal(20,10) NOT NULL,
  `wallet_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_id` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 => pending, 1 => accepted, 2 => rejected\r\n',
  `reject_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `currency_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `withdraw_instruction` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_amount` decimal(20,10) NOT NULL,
  `max_amount` decimal(20,10) NOT NULL,
  `fixed_charge` decimal(20,10) NOT NULL,
  `percent_charge` decimal(5,2) NOT NULL,
  `user_data` text COLLATE utf8mb4_unicode_ci,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `withdraws`
--

INSERT INTO `withdraws` (`id`, `currency_id`, `name`, `withdraw_instruction`, `min_amount`, `max_amount`, `fixed_charge`, `percent_charge`, `user_data`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 'demo - BDT', '<p>vvvvvv</p>', '10.0000000000', '1000.0000000000', '2.0000000000', '4.00', NULL, 1, '2021-12-29 23:53:46', '2021-12-30 00:49:58'),
(2, 4, 'demo - euro', '<p>vvvvvv</p>', '10.0000000000', '1000.0000000000', '2.0000000000', '4.00', NULL, 1, '2021-12-29 23:53:46', '2021-12-30 00:49:58'),
(3, 4, 'demo - euro2', '<p>Please Provide your account no. your bank branch and your bank name to get withdraw perfectly.</p>', '10.0000000000', '2000.0000000000', '1.0000000000', '4.00', NULL, 1, '2021-12-29 23:53:46', '2021-12-30 05:01:20'),
(4, 9, 'demo - btc', '<p>vvvvvv</p>', '0.0021000000', '1.0000000000', '1.0000000000', '4.00', NULL, 1, '2021-12-29 23:53:46', '2021-12-30 00:49:58');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit_addresses`
--
ALTER TABLE `deposit_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `generalsettings`
--
ALTER TABLE `generalsettings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kyc_forms`
--
ALTER TABLE `kyc_forms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `login_logs`
--
ALTER TABLE `login_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offer_limits`
--
ALTER TABLE `offer_limits`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`(191),`tokenable_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `seo_settings`
--
ALTER TABLE `seo_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `site_contents`
--
ALTER TABLE `site_contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `support_tickets`
--
ALTER TABLE `support_tickets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trades`
--
ALTER TABLE `trades`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_chats`
--
ALTER TABLE `trade_chats`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trade_durations`
--
ALTER TABLE `trade_durations`
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
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `wallets`
--
ALTER TABLE `wallets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=201;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_addresses`
--
ALTER TABLE `deposit_addresses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `generalsettings`
--
ALTER TABLE `generalsettings`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `kyc_forms`
--
ALTER TABLE `kyc_forms`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `login_logs`
--
ALTER TABLE `login_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=415;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `offer_limits`
--
ALTER TABLE `offer_limits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(191) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=343;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `seo_settings`
--
ALTER TABLE `seo_settings`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `site_contents`
--
ALTER TABLE `site_contents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `sms_gateways`
--
ALTER TABLE `sms_gateways`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `support_tickets`
--
ALTER TABLE `support_tickets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `ticket_messages`
--
ALTER TABLE `ticket_messages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `trades`
--
ALTER TABLE `trades`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `trade_chats`
--
ALTER TABLE `trade_chats`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT for table `trade_durations`
--
ALTER TABLE `trade_durations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=59;

--
-- AUTO_INCREMENT for table `wallets`
--
ALTER TABLE `wallets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=307;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
