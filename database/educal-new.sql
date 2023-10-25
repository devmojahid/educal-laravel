-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Oct 17, 2023 at 08:04 AM
-- Server version: 10.5.19-MariaDB-cll-lve
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `u999768013_laravel_demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `assignments`
--

CREATE TABLE `assignments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `marks` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `course_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_categories`
--

CREATE TABLE `blog_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `blog_categories`
--

INSERT INTO `blog_categories` (`id`, `title`, `slug`, `description`, `image`, `svg`, `icon`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', 'This is uncategorized category', NULL, NULL, NULL, NULL, NULL, NULL, 'active', '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `blog_sub_categories`
--

CREATE TABLE `blog_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `blog_category_id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `blog_tags`
--

CREATE TABLE `blog_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `session_id` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `blog_id` bigint(20) UNSIGNED NOT NULL,
  `content` longtext NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('approved','pending','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commissions`
--

CREATE TABLE `commissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `percentage` decimal(10,2) NOT NULL DEFAULT 0.00,
  `amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `commission_percents`
--

CREATE TABLE `commission_percents` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `percent` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `commission_percents`
--

INSERT INTO `commission_percents` (`id`, `percent`, `created_at`, `updated_at`) VALUES
(1, 30, '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` enum('percentage','fixed') NOT NULL DEFAULT 'percentage',
  `ammount` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'active',
  `count` varchar(255) DEFAULT NULL,
  `expired_at` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `video_thumbnail` varchar(255) DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `discount_price` varchar(255) DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `duration_type` varchar(255) DEFAULT NULL,
  `type` enum('free','paid') NOT NULL DEFAULT 'free',
  `level` enum('beginner','intermediate','advanced') NOT NULL DEFAULT 'beginner',
  `requirements` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` enum('draft','approved','pending','rejected') NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcategory_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tag_id` bigint(20) UNSIGNED DEFAULT NULL,
  `language_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_categories`
--

CREATE TABLE `course_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `course_categories`
--

INSERT INTO `course_categories` (`id`, `title`, `slug`, `description`, `image`, `svg`, `icon`, `meta_title`, `meta_description`, `meta_keywords`, `status`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'Uncategorized', 'uncategorized', 'This is uncategorized category', NULL, NULL, NULL, NULL, NULL, NULL, 'active', NULL, '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `course_category_users`
--

CREATE TABLE `course_category_users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_category_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_languages`
--

CREATE TABLE `course_languages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_sub_categories`
--

CREATE TABLE `course_sub_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `course_category_id` bigint(20) UNSIGNED NOT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `course_tags`
--

CREATE TABLE `course_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `svg` longtext DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'inactive',
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `symbol` varchar(255) DEFAULT NULL,
  `exchange_rate` decimal(10,4) DEFAULT 1.0000,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `is_default` enum('yes','no') DEFAULT 'no',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `exchange_rate`, `status`, `is_default`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'US Dollar', '$', '1.0000', 'active', 'no', NULL, NULL),
(2, 'EUR', 'Euro', '€', '0.8400', 'active', 'no', NULL, NULL),
(3, 'INR', 'Indian Rupee', '₹', '75.0000', 'active', 'no', NULL, NULL),
(4, 'BDT', 'Bangladeshi Taka', '৳', '84.0000', 'active', 'no', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `curriculam`
--

CREATE TABLE `curriculam` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `curriculum` longtext DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `start_time` varchar(255) DEFAULT NULL,
  `end_time` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `sponsor_name` varchar(255) DEFAULT NULL,
  `sponsor_logo` varchar(255) DEFAULT NULL,
  `sponsor_website` varchar(255) DEFAULT NULL,
  `sponsor_email` varchar(255) DEFAULT NULL,
  `sponsor_phone` varchar(255) DEFAULT NULL,
  `sponsor_facebook` varchar(255) DEFAULT NULL,
  `sponsor_twitter` varchar(255) DEFAULT NULL,
  `sponsor_pinterest` varchar(255) DEFAULT NULL,
  `ticket_price` varchar(255) DEFAULT NULL,
  `ticket_discount_price` varchar(255) DEFAULT NULL,
  `speaker_name` varchar(255) DEFAULT NULL,
  `speaker_image` varchar(255) DEFAULT NULL,
  `speaker_designation` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
-- Table structure for table `lessons`
--

CREATE TABLE `lessons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `duration` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `video` varchar(255) DEFAULT NULL,
  `video_type` varchar(255) DEFAULT NULL,
  `video_id` varchar(255) DEFAULT NULL,
  `video_thumbnail` varchar(255) DEFAULT NULL,
  `video_url` varchar(255) DEFAULT NULL,
  `audio` varchar(255) DEFAULT NULL,
  `audio_type` varchar(255) DEFAULT NULL,
  `ppt` varchar(255) DEFAULT NULL,
  `ppt_type` varchar(255) DEFAULT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `pdf_type` varchar(255) DEFAULT NULL,
  `attachment` varchar(255) DEFAULT NULL,
  `visibility` varchar(255) DEFAULT NULL,
  `topic_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `sereal` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menuitems`
--

CREATE TABLE `menuitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `menu_id` bigint(20) UNSIGNED DEFAULT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `target` varchar(255) DEFAULT NULL,
  `icon_class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `menus`
--

CREATE TABLE `menus` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `content` longtext DEFAULT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2023_07_22_053534_create_blog_categories_table', 1),
(6, '2023_07_22_103150_create_blog_tags_table', 1),
(7, '2023_07_23_034550_create_blog_sub_categories_table', 1),
(8, '2023_07_23_054946_create_blogs_table', 1),
(9, '2023_07_25_030151_create_permission_tables', 1),
(10, '2023_08_02_065629_create_course_categories_table', 1),
(11, '2023_08_02_065644_create_course_sub_categories_table', 1),
(12, '2023_08_02_065655_create_course_tags_table', 1),
(13, '2023_08_12_043329_create_sidebar_infos_table', 1),
(14, '2023_08_14_031759_create_course_languages_table', 1),
(15, '2023_08_17_042114_create_courses_table', 1),
(16, '2023_08_17_042345_create_topics_table', 1),
(17, '2023_08_17_042650_create_curriculam_table', 1),
(18, '2023_08_17_042750_create_lessons_table', 1),
(19, '2023_08_17_042850_create_quizzes_table', 1),
(20, '2023_08_17_042950_create_quize_questions_table', 1),
(21, '2023_08_17_063405_create_resources_table', 1),
(22, '2023_08_17_070034_create_assignments_table', 1),
(23, '2023_08_21_053212_create_quize_question_options_table', 1),
(24, '2023_08_21_053213_create_quize_answers_table', 1),
(25, '2023_08_26_053152_create_carts_table', 1),
(26, '2023_08_26_102529_create_coupons_table', 1),
(27, '2023_08_28_081223_create_orders_table', 1),
(28, '2023_08_28_100949_create_order_items_table', 1),
(29, '2023_09_02_094620_create_system_settings_table', 1),
(30, '2023_09_07_083344_create_notifications_table', 1),
(31, '2023_09_11_104146_create_payouts_table', 1),
(32, '2023_09_12_043836_create_withdraws_table', 1),
(33, '2023_09_12_110535_create_events_table', 1),
(34, '2023_09_13_031007_create_ticket_orders_table', 1),
(35, '2023_09_13_041636_create_newsletters_table', 1),
(36, '2023_09_13_081534_create_jobs_table', 1),
(37, '2023_09_13_100840_create_menus_table', 1),
(38, '2023_09_13_100845_create_menuitems_table', 1),
(39, '2023_09_14_032444_create_pages_table', 1),
(40, '2023_09_15_084716_create_comments_table', 1),
(41, '2023_09_15_134714_create_reviews_table', 1),
(42, '2023_09_17_091652_create_course_category_users_table', 1),
(43, '2023_09_18_030245_create_commissions_table', 1),
(44, '2023_09_18_054129_create_commission_percents_table', 1),
(45, '2023_09_18_114939_create_currencies_table', 1),
(46, '2023_09_23_141346_create_user_orders_table', 1),
(47, '2023_09_26_050059_create_user_courses_table', 1),
(48, '2023_09_26_051403_create_user_orderitems_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 3),
(2, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `newsletters`
--

CREATE TABLE `newsletters` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` varchar(136) NOT NULL,
  `type` varchar(255) NOT NULL,
  `notifiable_type` varchar(255) NOT NULL,
  `notifiable_id` bigint(20) UNSIGNED NOT NULL,
  `data` text NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','canceled') DEFAULT 'pending',
  `payment_status` enum('pending','paid') DEFAULT 'pending',
  `payment_method` enum('cash_on_delivery','paypal','stripe','razorpay','mollie','manual_payment','paytm','amarpay') DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `price` varchar(255) DEFAULT NULL,
  `quantity` varchar(255) DEFAULT NULL,
  `total` varchar(255) DEFAULT NULL,
  `status` enum('enrolled','active','pending','complete','canceled') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `content` longtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `meta_title` varchar(255) DEFAULT NULL,
  `meta_description` longtext DEFAULT NULL,
  `meta_keywords` longtext DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
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
-- Table structure for table `payouts`
--

CREATE TABLE `payouts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_branch` varchar(255) DEFAULT NULL,
  `account_number` varchar(255) DEFAULT NULL,
  `routing_number` varchar(255) DEFAULT NULL,
  `swift_code` varchar(255) DEFAULT NULL,
  `bank_passcode` varchar(255) DEFAULT NULL,
  `account_holder_name` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `transaction_details` varchar(255) DEFAULT NULL,
  `transaction_proof` varchar(255) DEFAULT NULL,
  `fees` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected','paid','processing') NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'dashboard', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(2, 'blog-category-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(3, 'blog-category-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(4, 'blog-category-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(5, 'blog-category-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(6, 'blog-sub-category-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(7, 'blog-sub-category-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(8, 'blog-sub-category-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(9, 'blog-sub-category-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(10, 'blog-tag-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(11, 'blog-tag-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(12, 'blog-tag-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(13, 'blog-tag-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(14, 'blog-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(15, 'blog-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(16, 'blog-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(17, 'blog-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(18, 'blog-comment-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(19, 'blog-comment-approve', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(20, 'blog-comment-reject', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(21, 'blog-comment-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(22, 'course-category-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(23, 'course-category-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(24, 'course-category-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(25, 'course-category-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(26, 'course-sub-category-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(27, 'course-sub-category-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(28, 'course-sub-category-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(29, 'course-sub-category-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(30, 'course-tag-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(31, 'course-tag-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(32, 'course-tag-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(33, 'course-tag-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(34, 'course-language-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(35, 'course-language-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(36, 'course-language-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(37, 'course-language-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(38, 'course-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(39, 'course-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(40, 'course-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(41, 'course-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(42, 'course-approve', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(43, 'course-reject', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(44, 'course-pending', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(45, 'course-status', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(46, 'course-resourse-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(47, 'course-resourse-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(48, 'course-resourse-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(49, 'course-resourse-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(50, 'course-quiz-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(51, 'course-quiz-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(52, 'course-quiz-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(53, 'course-quiz-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(54, 'course-assignment-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(55, 'course-assignment-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(56, 'course-assignment-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(57, 'course-assignment-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(58, 'course-review-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(59, 'course-review-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(60, 'course-review-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(61, 'course-review-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(62, 'course-coupon-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(63, 'course-coupon-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(64, 'course-coupon-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(65, 'course-coupon-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(66, 'order-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(67, 'order-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(68, 'order-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(69, 'order-status-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(70, 'order-status-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(71, 'order-status-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(72, 'user-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(73, 'user-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(74, 'user-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(75, 'user-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(76, 'role-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(77, 'role-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(78, 'role-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(79, 'role-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(80, 'instructor-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(81, 'instructor-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(82, 'instructor-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(83, 'instructor-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(84, 'pending-instructor-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(85, 'pending-instructor-approve', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(86, 'pending-instructor-reject', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(87, 'pending-instructor-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(88, 'withdraw-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(89, 'withdraw-approve', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(90, 'withdraw-reject', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(91, 'withdraw-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(92, 'page-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(93, 'page-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(94, 'page-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(95, 'page-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(96, 'page-show', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(97, 'home-page', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(98, 'hero-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(99, 'category-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(100, 'banner-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(101, 'find-course-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(102, 'event-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(103, 'price-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(104, 'about-page', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(105, 'about-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(106, 'brand-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(107, 'testimonial-section', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(108, 'menu-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(109, 'menu-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(110, 'menu-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(111, 'menu-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(112, 'subscriber-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(113, 'subscriber-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(114, 'bulk-email-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(115, 'bulk-email-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(116, 'event-list', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(117, 'event-create', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(118, 'event-edit', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(119, 'event-delete', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(120, 'profile', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(121, 'update-admin-info', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(122, 'update-admin-password', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(123, 'general-setting', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(124, 'smtp-setting', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(125, 'sidebar-setting', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(126, 'payout-setting', 'web', '2023-10-12 04:51:38', '2023-10-12 04:51:38'),
(127, 'withdrow-create', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(128, 'clear-cache', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(129, 'language-change', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(130, 'currency-change', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(131, 'notification-show', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(132, 'commission-setting', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(133, 'payment-method-list', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quize_answers`
--

CREATE TABLE `quize_answers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `answer` text NOT NULL,
  `question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `option_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quize_questions`
--

CREATE TABLE `quize_questions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `question` longtext DEFAULT NULL,
  `options` longtext DEFAULT NULL,
  `answer` longtext DEFAULT NULL,
  `quiz_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quize_question_options`
--

CREATE TABLE `quize_question_options` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `option` text NOT NULL,
  `option_status` varchar(255) DEFAULT NULL,
  `question_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `quizzes`
--

CREATE TABLE `quizzes` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `quiz_type` varchar(255) DEFAULT NULL,
  `quiz_time` varchar(255) DEFAULT NULL,
  `quiz_duration` varchar(255) DEFAULT NULL,
  `quiz_status` varchar(255) DEFAULT NULL,
  `marks_per_question` varchar(255) DEFAULT NULL,
  `quiz_passing_marks` varchar(255) DEFAULT NULL,
  `quiz_certificate` varchar(255) DEFAULT NULL,
  `quiz_show_marks` varchar(255) DEFAULT NULL,
  `quiz_show_passed` varchar(255) DEFAULT NULL,
  `quiz_show_rank` varchar(255) DEFAULT NULL,
  `quiz_show_percentage` varchar(255) DEFAULT NULL,
  `quiz_show_time` varchar(255) DEFAULT NULL,
  `sereal` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `resources`
--

CREATE TABLE `resources` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `file` varchar(255) NOT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `body` longtext DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `status` enum('pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'admin', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39'),
(2, 'instructor', 'web', '2023-10-12 04:51:39', '2023-10-12 04:51:39');

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
(1, 1),
(1, 2),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(22, 2),
(23, 1),
(23, 2),
(24, 1),
(24, 2),
(25, 1),
(25, 2),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(28, 1),
(28, 2),
(29, 1),
(29, 2),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(32, 1),
(32, 2),
(33, 1),
(33, 2),
(34, 1),
(34, 2),
(35, 1),
(35, 2),
(36, 1),
(36, 2),
(37, 1),
(37, 2),
(38, 1),
(38, 2),
(39, 1),
(39, 2),
(40, 1),
(40, 2),
(41, 1),
(41, 2),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(46, 2),
(47, 1),
(47, 2),
(48, 1),
(48, 2),
(49, 1),
(49, 2),
(50, 1),
(50, 2),
(51, 1),
(51, 2),
(52, 1),
(52, 2),
(53, 1),
(53, 2),
(54, 1),
(54, 2),
(55, 1),
(55, 2),
(56, 1),
(56, 2),
(57, 1),
(57, 2),
(58, 1),
(58, 2),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(62, 2),
(63, 1),
(63, 2),
(64, 1),
(64, 2),
(65, 1),
(65, 2),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1),
(76, 1),
(77, 1),
(78, 1),
(79, 1),
(80, 1),
(81, 1),
(82, 1),
(83, 1),
(84, 1),
(85, 1),
(86, 1),
(87, 1),
(88, 1),
(88, 2),
(89, 1),
(90, 1),
(91, 1),
(92, 1),
(93, 1),
(94, 1),
(95, 1),
(96, 1),
(97, 1),
(98, 1),
(99, 1),
(100, 1),
(101, 1),
(102, 1),
(103, 1),
(104, 1),
(105, 1),
(106, 1),
(107, 1),
(108, 1),
(109, 1),
(110, 1),
(111, 1),
(112, 1),
(113, 1),
(114, 1),
(115, 1),
(116, 1),
(117, 1),
(118, 1),
(119, 1),
(120, 1),
(120, 2),
(121, 1),
(122, 1),
(123, 1),
(124, 1),
(125, 1),
(126, 1),
(126, 2),
(127, 1),
(127, 2),
(128, 1),
(129, 1),
(130, 1),
(131, 1),
(132, 1),
(133, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sidebar_infos`
--

CREATE TABLE `sidebar_infos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `search` enum('on','off') NOT NULL DEFAULT 'on',
  `category` enum('on','off') NOT NULL DEFAULT 'on',
  `tag` enum('on','off') NOT NULL DEFAULT 'on',
  `recent_post` enum('on','off') NOT NULL DEFAULT 'on',
  `popular_post` enum('on','off') NOT NULL DEFAULT 'off',
  `recent_comment` enum('on','off') NOT NULL DEFAULT 'off',
  `archives` enum('on','off') NOT NULL DEFAULT 'off',
  `banner` enum('on','off') NOT NULL DEFAULT 'on',
  `category_title` varchar(255) DEFAULT 'Category',
  `category_count` varchar(255) DEFAULT NULL,
  `tag_title` varchar(255) DEFAULT 'Tags',
  `tag_count` varchar(255) DEFAULT NULL,
  `recent_post_title` varchar(255) DEFAULT 'Recent posts',
  `recent_post_count` varchar(255) DEFAULT NULL,
  `popular_post_title` varchar(255) DEFAULT 'Populer posts',
  `popular_post_count` varchar(255) DEFAULT NULL,
  `recent_comment_title` varchar(255) DEFAULT 'Recent Comment',
  `recent_comment_count` varchar(255) DEFAULT NULL,
  `banner_title` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_link` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sidebar_infos`
--

INSERT INTO `sidebar_infos` (`id`, `search`, `category`, `tag`, `recent_post`, `popular_post`, `recent_comment`, `archives`, `banner`, `category_title`, `category_count`, `tag_title`, `tag_count`, `recent_post_title`, `recent_post_count`, `popular_post_title`, `popular_post_count`, `recent_comment_title`, `recent_comment_count`, `banner_title`, `banner_image`, `banner_link`, `created_at`, `updated_at`) VALUES
(1, 'on', 'on', 'on', 'on', 'off', 'off', 'off', 'on', 'Category', '5', 'Tag', '8', 'Recent Post', '5', 'Popular Post', '5', 'Recent Comment', '5', 'Banner', 'uploads/banner/banner.jpg', '#', '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` longtext DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'hero_sliders', '{\"hero_title\":\"<span>Access 2700+<\\/span>\\r\\n<span class=\\\"yellow-shape\\\">Online <\\/span> \\r\\nTutorial From Top Instructor.\",\"hero_discription\":\"Meet university, and cultural institutions, who\'ll share their experience.\",\"hero_button_text\":\"view all course\",\"hero_button_link\":\"https:\\/\\/educal.weblearnbd.net\\/course\",\"hero_shapes\":\"on\",\"hero_info_title\":\"Tomorrow is our\",\"hero_info_discription\":\"\\u201cWhen I Grow Up\\u201d Spirit Day!\",\"image1\":\"\\/uploads\\/hero\\/1694509538.jpg\",\"image2\":\"\\/uploads\\/hero\\/16945095472.jpg\"}', '2023-09-01 04:00:00', '2023-10-08 02:55:59'),
(2, 'home_categories', '{\"category_title\":\"Explore <br>Our <span class=\\\"yellow-bg\\\">Popular <img src=\\\"assets\\/img\\/shape\\/yellow-bg-2.png\\\" alt=\\\"\\\"> <\\/span>Courses\",\"categories\":[\"10\",\"4\",\"3\",\"2\",\"7\",\"8\",\"5\",\"6\",\"9\"]}', '2023-09-01 04:00:00', '2023-10-08 02:53:57'),
(3, 'banner', '{\"1\":{\"sub_title\":\"Free\",\"title\":\"Germany Foundation\",\"button_title\":\"View Courses\",\"button_url\":\"\\/courses\",\"side_image\":\"\\/uploads\\/banner\\/1695449876.png\",\"bg_image\":\"\\/uploads\\/banner\\/16954498762.jpg\",\"id\":550647},\"2\":{\"sub_title\":\"New\",\"title\":\"Online Courses\",\"button_title\":\"Find Out More\",\"button_url\":\"\\/course\",\"side_image\":\"\\/uploads\\/banner\\/1695449888.png\",\"bg_image\":\"\\/uploads\\/banner\\/16954498882.jpg\",\"id\":841086}}', '2023-09-01 04:00:00', '2023-10-08 04:16:44'),
(4, 'home_find_course', '{\"title\":\"Find the Right<br>Online <span class=\\\"yellow-bg yellow-bg-big\\\">Course<\\/span> for you\",\"categories\":[\"10\",\"3\",\"8\",\"6\"],\"courses\":[]}', '2023-09-01 04:00:00', '2023-10-08 04:23:57'),
(5, 'home_event', '{\"title\":\"Current <span class=\\\"yellow-bg yellow-bg-big\\\">Events<\\/span>\",\"description\":\"We found 13 events available for you.\"}', '2023-09-01 04:00:00', '2023-10-08 04:25:10'),
(6, 'home_price_plan', '{\n                    \"title\": \"price\",\n                    \"description\": \"Show\"\n                }', '2023-09-01 04:00:00', '2023-09-01 04:00:00'),
(7, 'about_about', '{\"title\":\"Achieve Your <br><span class=\\\"Yellow-Bg-Big\\\">Goals<\\/span> With Educal\",\"description\":\"Lost the plot bobby such a fibber bleeding bits and bobs don\'t get shirty with me bugger all mate chinwag super pukka william barney, horse play buggered.\",\"button_title\":\"apply now\",\"button_url\":\"\\/contact\",\"skillTitle\":[null,\"Upskill your organization.\",\"Access more then 100K online courses\",\"Learn the latest skills\"],\"image1\":\"\\/uploads\\/about\\/1696745394.jpg\"}', '2023-09-01 04:00:00', '2023-10-08 06:20:21'),
(8, 'brand', '[{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746071.png\",\"id\":791845},{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746076.png\",\"id\":931379},{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746083.png\",\"id\":861494},{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746089.png\",\"id\":856913},{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746095.png\",\"id\":323753},{\"url\":\"https:\\/\\/educal.weblearnbd.net\\/\",\"logo\":\"\\/uploads\\/brand\\/1696746108.png\",\"id\":985379}]', '2023-09-01 04:00:00', '2023-10-08 06:21:48'),
(9, 'about_banner', '[{\"sub_title\":\"Free\",\"title\":\"Germany Foundation\",\"button_title\":\"View Courses\",\"button_url\":\"\\/courses\",\"side_image\":\"\\/uploads\\/banner\\/1696746190.png\",\"bg_image\":\"\\/uploads\\/banner\\/16967461902.jpg\",\"id\":842069},{\"sub_title\":\"New\",\"title\":\"Online Courses\",\"button_title\":\"Find Out More\",\"button_url\":\"\\/course\",\"side_image\":\"\\/uploads\\/banner\\/1696746228.png\",\"bg_image\":\"\\/uploads\\/banner\\/16967462282.jpg\",\"id\":176304}]', '2023-09-01 04:00:00', '2023-10-08 06:23:48'),
(10, 'testimonial', '{\n                    [\n                        \n                        \"id\": 441532,\n                        \"title\": null,\n                        \"video\": null,\n                        \"videoTitle\": null,\n                        \"videoUrl\": null,\n                        \"testimonials\": []\n                        \n                    ]\n                }', '2023-09-01 04:00:00', '2023-09-01 04:00:00'),
(11, 'header', '{\"header_shape\":\"on\",\"header_categories\":[\"1\",\"2\",\"3\",\"4\"],\"header_logo\":\"\\/uploads\\/header\\/1695446936_logo.png\",\"header_favicon\":\"\\/uploads\\/header\\/1695446936_favicon.png\",\"header_title\":\"\",\"header_description\":\"\",\"header_cta_title\":\"\",\"header_cta_btn_text\":\"\",\"header_cta_btn_link\":\"\",\"header_main_desc\":\"\",\"header_copy_right\":\"\",\"header_facebook\":\"\",\"header_twitter\":\"\",\"header_pinterest\":\"\",\"header_office_address\":\"\",\"header_email_one\":\"\",\"header_email_two\":\"\",\"header_phone_one\":\"\",\"header_phone_two\":\"\"}', '2023-09-01 04:00:00', '2023-10-08 09:15:30'),
(12, 'footer', '{\"footer_shape\":\"off\",\"footer_categories\":[],\"footer_title\":\"\",\"footer_description\":\"\",\"footer_cta_title\":\"You can be your own Guiding star with our help\",\"footer_cta_btn_text\":\"Get Started\",\"footer_cta_btn_link\":\"\\/contact\",\"footer_main_desc\":\"Great lesson ideas and lesson plans for ESL teachers! Educators can customize lesson plans to best.\",\"footer_copy_right\":\"\\u00a9 2022 Educal, All Rights Reserved. Design By\",\"footer_main_logo\":\"\\/uploads\\/footer\\/1695446997_main_logo.png\",\"footer_facebook\":\"\",\"footer_twitter\":\"\",\"footer_pinterest\":\"\",\"footer_office_address\":\"\",\"footer_email_one\":\"\",\"footer_email_two\":\"\",\"footer_phone_one\":\"\",\"footer_phone_two\":\"\"}', '2023-09-01 04:00:00', '2023-10-09 05:47:13'),
(13, 'social', '{\"social_shape\":\"off\",\"social_categories\":[],\"social_title\":\"\",\"social_description\":\"\",\"social_cta_title\":\"\",\"social_cta_btn_text\":\"\",\"social_cta_btn_link\":\"\",\"social_main_desc\":\"\",\"social_copy_right\":\"\",\"social_facebook\":\"#\",\"social_twitter\":\"#\",\"social_pinterest\":\"#\",\"social_office_address\":\"\",\"social_email_one\":\"\",\"social_email_two\":\"\",\"social_phone_one\":\"\",\"social_phone_two\":\"\"}', '2023-09-01 04:00:00', '2023-10-09 05:46:53'),
(14, 'meta', '{\"meta_shape\":\"off\",\"meta_categories\":[],\"meta_title\":\"meta title\",\"meta_description\":\"meta desc\",\"meta_cta_title\":\"\",\"meta_cta_btn_text\":\"\",\"meta_cta_btn_link\":\"\",\"meta_main_desc\":\"\",\"meta_copy_right\":\"\",\"meta_facebook\":\"\",\"meta_twitter\":\"\",\"meta_pinterest\":\"\"}', '2023-09-01 04:00:00', '2023-10-01 04:00:00'),
(15, 'contact', '{\"contact_shape\":\"off\",\"contact_categories\":[],\"contact_title\":\"\",\"contact_description\":\"\",\"contact_cta_title\":\"\",\"contact_cta_btn_text\":\"\",\"contact_cta_btn_link\":\"\",\"contact_main_desc\":\"\",\"contact_copy_right\":\"\",\"contact_facebook\":\"\",\"contact_twitter\":\"\",\"contact_pinterest\":\"\",\"contact_office_address\":\"Maypole Crescent 70-80 Upper St Norwich NR2 1LT\",\"contact_email_one\":\"support@educal.com\",\"contact_email_two\":\"info@educal.com\",\"contact_phone_one\":\"+(426) 742 26 44\",\"contact_phone_two\":\"+(224) 762 442 32\"}', '2023-09-01 04:00:00', '2023-10-01 04:00:00'),
(19, 'home_counter', '{\"title\":\"We are <span class=\\\"yellow-bg yellow-bg-big\\\">Proud<\\/span>\",\"description\":\"You don\'t have to struggle alone, you\'ve got our assistance and help.\",\"counter\":{\"counter_icon\":[\"<svg viewBox=\\\"0 0 490.7 490.7\\\">\\r\\n                              <path class=\\\"st0\\\" d=\\\"m245.3 98c-39.7 0-72 32.3-72 72s32.3 72 72 72 72-32.3 72-72-32.3-72-72-72zm0 123.3c-28.3 0-51.4-23-51.4-51.4s23-51.4 51.4-51.4 51.4 23 51.4 51.4-23 51.4-51.4 51.4z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m389.3 180.3c-28.3 0-51.4 23-51.4 51.4s23 51.4 51.4 51.4c28.3 0 51.4-23 51.4-51.4s-23.1-51.4-51.4-51.4zm0 82.2c-17 0-30.8-13.9-30.8-30.8s13.9-30.8 30.8-30.8 30.8 13.9 30.8 30.8-13.9 30.8-30.8 30.8z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m102.9 180.3c-28.3 0-51.4 23-51.4 51.4s23 51.4 51.4 51.4 51.4-23 51.4-51.4-23-51.4-51.4-51.4zm0 82.2c-17 0-30.8-13.9-30.8-30.8s13.9-30.8 30.8-30.8 30.8 13.9 30.8 30.8-13.7 30.8-30.8 30.8z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m245.3 262.5c-73.7 0-133.6 59.9-133.6 133.6 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-62.3 50.7-113 113-113s113.1 50.7 113.1 113c0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-73.7-60-133.6-133.7-133.6z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m389.3 303.6c-17 0-33.5 4.6-47.9 13.4-4.8 3-6.4 9.2-3.5 14.2 3 4.8 9.2 6.4 14.2 3.5 11.2-6.8 24.1-10.4 37.3-10.4 39.7 0 72 32.3 72 72 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c-0.2-51.3-41.8-92.7-92.7-92.7z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m149.4 316.9c-14.5-8.7-30.9-13.3-47.9-13.3-51 0-92.5 41.5-92.5 92.5 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-39.7 32.3-72 72-72 13.2 0 26 3.6 37.2 10.4 4.8 3 11.2 1.4 14.2-3.5 2.9-4.9 1.2-11.1-3.6-14.1z\\\"><\\/path>\\r\\n                           <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                           <path class=\\\"st0\\\" d=\\\"M458.7,512h-384c-29.4,0-53.3-23.9-53.3-53.3V53.3C21.3,23.9,45.3,0,74.7,0H416c5.9,0,10.7,4.8,10.7,10.7v74.7  h32c5.9,0,10.7,4.8,10.7,10.7v405.3C469.3,507.2,464.6,512,458.7,512z M42.7,96v362.7c0,17.6,14.4,32,32,32H448v-384H74.7  C62.7,106.7,51.6,102.7,42.7,96L42.7,96z M74.7,21.3c-17.6,0-32,14.4-32,32s14.4,32,32,32h330.7v-64H74.7z\\\"><\\/path>\\r\\n                           <path class=\\\"st0\\\" d=\\\"M309.3,298.7c-2.8,0-5.5-1.1-7.6-3.1l-56.4-56.5l-56.4,56.4c-3.1,3.1-7.6,4-11.6,2.3c-4-1.6-6.6-5.5-6.6-9.8V96  c0-5.9,4.8-10.7,10.7-10.7S192,90.1,192,96v166.3l45.8-45.8c4.2-4.2,10.9-4.2,15.1,0l45.8,45.8V96c0-5.9,4.8-10.7,10.7-10.7  S320,90.1,320,96v192c0,4.3-2.6,8.2-6.6,9.9C312.1,298.4,310.7,298.7,309.3,298.7L309.3,298.7z\\\"><\\/path>\\r\\n                           <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                              <g id=\\\"Page-1\\\">\\r\\n                                 <g id=\\\"_x30_01---Degree\\\">\\r\\n                                    <path id=\\\"Shape\\\" class=\\\"st0\\\" d=\\\"M500.6,86.3L261.8,1c-3.8-1.3-7.9-1.3-11.7,0L11.3,86.3C4.5,88.7,0,95.2,0,102.4    s4.5,13.6,11.3,16.1L128,160.1v53.2c0,33.2,114.9,34.1,128,34.1s128-1,128-34.1v-53.2l25.6-9.1v19.6c0,9.4,7.6,17.1,17.1,17.1    h17.1c9.4,0,17.1-7.6,17.1-17.1V145c0-4-1-7.8-2.8-11.4l42.7-15.3c6.8-2.4,11.3-8.9,11.3-16.1S507.5,88.8,500.6,86.3L500.6,86.3z     M366.9,194.6c-32.5-14.8-101-15.4-110.9-15.4s-78.4,0.6-110.9,15.4v-74.3c5.1-6.6,45.4-17.8,110.9-17.8s105.8,11.2,110.9,17.8    V194.6z M256,230.4c-63.1,0-102.8-10.4-110.2-17.1c7.4-6.6,47.1-17.1,110.2-17.1s102.8,10.4,110.2,17.1    C358.8,220,319.1,230.4,256,230.4z M413.6,131.5L384,142v-22.5c0-33.2-114.9-34.1-128-34.1s-128,1-128,34.1V142L17.1,102.4    l239.1-85.3L426.7,78v43C421.3,123,416.7,126.6,413.6,131.5z M443.7,170.7h-17.1v-25.6c0-4.7,3.8-8.5,8.5-8.5s8.5,3.8,8.5,8.5    v25.6H443.7z M443.7,120.7V84.1l51.2,18.3L443.7,120.7z\\\"><\\/path>\\r\\n                                    <path id=\\\"Shape_1_\\\" class=\\\"st0\\\" d=\\\"M486.4,264.5c-0.5,0-1,0-1.5,0.1C409.2,276.4,332.6,282,256,281.5    c-76.6,0.5-153.2-5.2-228.9-16.9c-0.5-0.1-1-0.1-1.5-0.1c-6,0-25.6,6.8-25.6,93.9s19.6,93.9,25.6,93.9c0.5,0,1-0.1,1.5-0.2    c58.2-9.2,116.9-14.6,175.8-16l-16.7,40c-2.6,6.4-1,13.7,3.9,18.5s12.3,6.1,18.6,3.4l6.5-2.8l2.8,6.5c2.7,6.3,8.9,10.4,15.7,10.4    h0.2c6.9-0.1,13.1-4.3,15.6-10.6l14.8-35.5l14.8,35.3c2.6,6.5,8.8,10.7,15.7,10.8h0.3c6.8,0,12.9-4,15.6-10.2l2.9-6.5l6.4,2.8    c6.3,2.8,13.8,1.5,18.7-3.4c5-4.8,6.5-12.2,3.9-18.6L326.3,437c53.1,1.9,106,7,158.5,15.4c0.5,0.1,1,0.1,1.5,0.1    c6,0,25.6-6.8,25.6-93.9S492.4,264.5,486.4,264.5L486.4,264.5z M283.3,298.4c3.5,13,5.6,26.4,6.2,39.9c-19.3-9-42-6.9-59.4,5.5    c-0.4-15.3-2.4-30.6-5.9-45.5c10.3,0.2,20.9,0.3,31.8,0.3C265.3,298.7,274.4,298.6,283.3,298.4z M264.5,435.2    c-23.6,0-42.7-19.1-42.7-42.7s19.1-42.7,42.7-42.7s42.7,19.1,42.7,42.7S288.1,435.2,264.5,435.2z M25.6,285.9    c6.5,23.6,9.4,48.1,8.5,72.5c0.9,24.5-2,48.9-8.5,72.5c-6.5-23.6-9.4-48.1-8.5-72.5C16.2,333.9,19.1,309.5,25.6,285.9z     M42.8,432.4c4.7-13.5,8.4-36.2,8.4-74s-3.7-60.5-8.4-74c54.2,7.5,108.8,12,163.5,13.5c5.1,19.7,7.5,40.1,7,60.5    c0,1.2,0,2.4-0.1,3.6c-10.2,17-11.3,38-2.7,55.9l-0.4,0.9C154.2,420.2,98.3,424.7,42.8,432.4L42.8,432.4z M233.9,494.9l-6.2-14.3    c-1.9-4.3-6.9-6.3-11.2-4.4l-14.4,6.3l20-48c8.2,8.3,18.7,14.1,30.1,16.5L233.9,494.9z M312.6,476.2c-4.3-1.9-9.3,0.1-11.2,4.4    l-6.3,14.2L276.8,451c11.5-2.4,21.9-8.1,30.2-16.5l20,47.8L312.6,476.2z M484.7,434.8c-54.8-8.4-110.1-13.6-165.5-15.4l-0.6-1.5    c10.7-22.6,6.1-49.5-11.5-67.3c-0.1-17.7-2.1-35.3-6.1-52.6c61.5-1.4,122.9-6.7,183.7-16.1c4,6.7,10.2,33.3,10.2,76.4    S488.6,428,484.7,434.8L484.7,434.8z\\\"><\\/path>\\r\\n                                 <\\/g>\\r\\n                              <\\/g>\\r\\n                              <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                              <path class=\\\"st0\\\" d=\\\"M444.2,150.6c6.9-14.6,10.9-30.4,11.8-46.6c0.1-48.5-39.2-87.9-87.8-88c-28,0-54.4,13.3-71,35.9  C175.7,29.1,58.6,109.2,35.8,230.8s57.3,238.6,178.9,261.4c121.6,22.8,238.6-57.3,261.4-178.9c2.6-13.6,3.8-27.4,3.8-41.3  C480,228.9,467.6,186.7,444.2,150.6z M464,272c0,39.2-11.1,77.6-32.1,110.8c-7.1-34.3-20.4-42.5-36.7-48.8  c-5.3-1.6-10.3-4.4-14.4-8.1c-5.9-6.6-11-13.8-15.2-21.5c-11.4-18.8-25.5-42.1-57.7-58.2l-5.9-2.9c-40.4-20-54-26.8-34.8-84.2  c3.5-10.5,9.5-20.1,17.4-27.9c9.9,32.7,34,71.5,55,101.4c11,15.6,32.6,19.4,48.2,8.4c3.3-2.3,6.1-5.1,8.4-8.4  c14.7-20.6,28-42.3,39.7-64.7C454.4,199.5,464,235.4,464,272z M368,32c39.7,0,72,32.3,72,72c0,24.8-20.2,67.2-56.8,119.4  c-6,8.4-17.6,10.4-26,4.4c-1.7-1.2-3.2-2.7-4.4-4.4C316.2,171.2,296,128.8,296,104C296,64.3,328.3,32,368,32z M48,272  c0-45.4,14.9-89.6,42.4-125.7c12,7.9,65.3,45.5,53.6,86.2c-4.9,14.7-3.4,30.8,4.2,44.3c14.1,24.4,45,32.4,45.6,32.6  c0.3,0.1,26.5,9.1,31.4,27.2c2.7,9.9-1.5,21.5-12.6,34.5c-12.5,15.5-29.2,27.1-48,33.5c-14.5,5.6-27.3,10.6-33.5,33.7  C78.8,399,48,337.4,48,272z M256,480c-39.2,0-77.5-11.1-110.6-32c3.6-20.1,10.6-22.9,25.1-28.5c21.3-7.4,40.1-20.5,54.3-38  c14.8-17.3,20.1-33.8,15.9-49.2c-7.3-26.3-40.4-37.6-42.4-38.2c-0.2-0.1-25.5-6.6-36.3-25.2c-5.3-9.8-6.3-21.4-2.6-31.9  c14.3-50.1-42.1-92-58.8-103.1C140,89.4,196.6,64,256,64c10.9,0,21.7,0.9,32.5,2.6c-5.6,11.7-8.5,24.5-8.5,37.4  c0,3.2,0.3,6.4,0.7,9.5c-13.3,10.4-23.2,24.5-28.6,40.5c-23.6,70.6,1.4,83.1,42.9,103.6l5.8,2.9c28,14,40.3,34.3,51.1,52.2  c4.9,8.8,10.7,17.1,17.5,24.6c5.7,5.3,12.5,9.3,20,11.7c12.9,5,24.1,9.4,29.2,52.4C379.4,451,319.4,480,256,480z M368,152  c26.5,0,48-21.5,48-48s-21.5-48-48-48s-48,21.5-48,48C320,130.5,341.5,152,368,152z M368,72c17.7,0,32,14.3,32,32s-14.3,32-32,32  s-32-14.3-32-32S350.3,72,368,72z\\\"><\\/path>\\r\\n                              <\\/svg>\"],\"counter_amount\":[\"345421\",\"2485\",\"24085\",\"202\"],\"counter_desc\":[\"Students Enrolled\",\"Total Courses\",\"Online Learners\",\"Foreign Followers\"]},\"counter_icon\":[\"icon 1\",\"icon 2\"],\"counter_amount\":[\"amount 1\",\"amount 2\"],\"counter_desc\":[\"desc 1\",\"desc\"]}', '2023-09-25 03:28:48', '2023-10-08 06:07:33'),
(20, 'about_counter', '{\"title\":\"We are <span class=\\\"yellow-bg yellow-bg-big\\\">Proud<\\/span>\",\"description\":\"You don\'t have to struggle alone, you\'ve got our assistance and help.\",\"counter\":{\"counter_icon\":[\"<svg viewBox=\\\"0 0 490.7 490.7\\\">\\r\\n                              <path class=\\\"st0\\\" d=\\\"m245.3 98c-39.7 0-72 32.3-72 72s32.3 72 72 72 72-32.3 72-72-32.3-72-72-72zm0 123.3c-28.3 0-51.4-23-51.4-51.4s23-51.4 51.4-51.4 51.4 23 51.4 51.4-23 51.4-51.4 51.4z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m389.3 180.3c-28.3 0-51.4 23-51.4 51.4s23 51.4 51.4 51.4c28.3 0 51.4-23 51.4-51.4s-23.1-51.4-51.4-51.4zm0 82.2c-17 0-30.8-13.9-30.8-30.8s13.9-30.8 30.8-30.8 30.8 13.9 30.8 30.8-13.9 30.8-30.8 30.8z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m102.9 180.3c-28.3 0-51.4 23-51.4 51.4s23 51.4 51.4 51.4 51.4-23 51.4-51.4-23-51.4-51.4-51.4zm0 82.2c-17 0-30.8-13.9-30.8-30.8s13.9-30.8 30.8-30.8 30.8 13.9 30.8 30.8-13.7 30.8-30.8 30.8z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m245.3 262.5c-73.7 0-133.6 59.9-133.6 133.6 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-62.3 50.7-113 113-113s113.1 50.7 113.1 113c0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-73.7-60-133.6-133.7-133.6z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m389.3 303.6c-17 0-33.5 4.6-47.9 13.4-4.8 3-6.4 9.2-3.5 14.2 3 4.8 9.2 6.4 14.2 3.5 11.2-6.8 24.1-10.4 37.3-10.4 39.7 0 72 32.3 72 72 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c-0.2-51.3-41.8-92.7-92.7-92.7z\\\"><\\/path>\\r\\n                              <path class=\\\"st0\\\" d=\\\"m149.4 316.9c-14.5-8.7-30.9-13.3-47.9-13.3-51 0-92.5 41.5-92.5 92.5 0 5.7 4.6 10.3 10.3 10.3s10.3-4.6 10.3-10.3c0-39.7 32.3-72 72-72 13.2 0 26 3.6 37.2 10.4 4.8 3 11.2 1.4 14.2-3.5 2.9-4.9 1.2-11.1-3.6-14.1z\\\"><\\/path>\\r\\n                           <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                              <path class=\\\"st0\\\" d=\\\"M444.2,150.6c6.9-14.6,10.9-30.4,11.8-46.6c0.1-48.5-39.2-87.9-87.8-88c-28,0-54.4,13.3-71,35.9  C175.7,29.1,58.6,109.2,35.8,230.8s57.3,238.6,178.9,261.4c121.6,22.8,238.6-57.3,261.4-178.9c2.6-13.6,3.8-27.4,3.8-41.3  C480,228.9,467.6,186.7,444.2,150.6z M464,272c0,39.2-11.1,77.6-32.1,110.8c-7.1-34.3-20.4-42.5-36.7-48.8  c-5.3-1.6-10.3-4.4-14.4-8.1c-5.9-6.6-11-13.8-15.2-21.5c-11.4-18.8-25.5-42.1-57.7-58.2l-5.9-2.9c-40.4-20-54-26.8-34.8-84.2  c3.5-10.5,9.5-20.1,17.4-27.9c9.9,32.7,34,71.5,55,101.4c11,15.6,32.6,19.4,48.2,8.4c3.3-2.3,6.1-5.1,8.4-8.4  c14.7-20.6,28-42.3,39.7-64.7C454.4,199.5,464,235.4,464,272z M368,32c39.7,0,72,32.3,72,72c0,24.8-20.2,67.2-56.8,119.4  c-6,8.4-17.6,10.4-26,4.4c-1.7-1.2-3.2-2.7-4.4-4.4C316.2,171.2,296,128.8,296,104C296,64.3,328.3,32,368,32z M48,272  c0-45.4,14.9-89.6,42.4-125.7c12,7.9,65.3,45.5,53.6,86.2c-4.9,14.7-3.4,30.8,4.2,44.3c14.1,24.4,45,32.4,45.6,32.6  c0.3,0.1,26.5,9.1,31.4,27.2c2.7,9.9-1.5,21.5-12.6,34.5c-12.5,15.5-29.2,27.1-48,33.5c-14.5,5.6-27.3,10.6-33.5,33.7  C78.8,399,48,337.4,48,272z M256,480c-39.2,0-77.5-11.1-110.6-32c3.6-20.1,10.6-22.9,25.1-28.5c21.3-7.4,40.1-20.5,54.3-38  c14.8-17.3,20.1-33.8,15.9-49.2c-7.3-26.3-40.4-37.6-42.4-38.2c-0.2-0.1-25.5-6.6-36.3-25.2c-5.3-9.8-6.3-21.4-2.6-31.9  c14.3-50.1-42.1-92-58.8-103.1C140,89.4,196.6,64,256,64c10.9,0,21.7,0.9,32.5,2.6c-5.6,11.7-8.5,24.5-8.5,37.4  c0,3.2,0.3,6.4,0.7,9.5c-13.3,10.4-23.2,24.5-28.6,40.5c-23.6,70.6,1.4,83.1,42.9,103.6l5.8,2.9c28,14,40.3,34.3,51.1,52.2  c4.9,8.8,10.7,17.1,17.5,24.6c5.7,5.3,12.5,9.3,20,11.7c12.9,5,24.1,9.4,29.2,52.4C379.4,451,319.4,480,256,480z M368,152  c26.5,0,48-21.5,48-48s-21.5-48-48-48s-48,21.5-48,48C320,130.5,341.5,152,368,152z M368,72c17.7,0,32,14.3,32,32s-14.3,32-32,32  s-32-14.3-32-32S350.3,72,368,72z\\\"><\\/path>\\r\\n                              <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                              <g id=\\\"Page-1\\\">\\r\\n                                 <g id=\\\"_x30_01---Degree\\\">\\r\\n                                    <path id=\\\"Shape\\\" class=\\\"st0\\\" d=\\\"M500.6,86.3L261.8,1c-3.8-1.3-7.9-1.3-11.7,0L11.3,86.3C4.5,88.7,0,95.2,0,102.4    s4.5,13.6,11.3,16.1L128,160.1v53.2c0,33.2,114.9,34.1,128,34.1s128-1,128-34.1v-53.2l25.6-9.1v19.6c0,9.4,7.6,17.1,17.1,17.1    h17.1c9.4,0,17.1-7.6,17.1-17.1V145c0-4-1-7.8-2.8-11.4l42.7-15.3c6.8-2.4,11.3-8.9,11.3-16.1S507.5,88.8,500.6,86.3L500.6,86.3z     M366.9,194.6c-32.5-14.8-101-15.4-110.9-15.4s-78.4,0.6-110.9,15.4v-74.3c5.1-6.6,45.4-17.8,110.9-17.8s105.8,11.2,110.9,17.8    V194.6z M256,230.4c-63.1,0-102.8-10.4-110.2-17.1c7.4-6.6,47.1-17.1,110.2-17.1s102.8,10.4,110.2,17.1    C358.8,220,319.1,230.4,256,230.4z M413.6,131.5L384,142v-22.5c0-33.2-114.9-34.1-128-34.1s-128,1-128,34.1V142L17.1,102.4    l239.1-85.3L426.7,78v43C421.3,123,416.7,126.6,413.6,131.5z M443.7,170.7h-17.1v-25.6c0-4.7,3.8-8.5,8.5-8.5s8.5,3.8,8.5,8.5    v25.6H443.7z M443.7,120.7V84.1l51.2,18.3L443.7,120.7z\\\"><\\/path>\\r\\n                                    <path id=\\\"Shape_1_\\\" class=\\\"st0\\\" d=\\\"M486.4,264.5c-0.5,0-1,0-1.5,0.1C409.2,276.4,332.6,282,256,281.5    c-76.6,0.5-153.2-5.2-228.9-16.9c-0.5-0.1-1-0.1-1.5-0.1c-6,0-25.6,6.8-25.6,93.9s19.6,93.9,25.6,93.9c0.5,0,1-0.1,1.5-0.2    c58.2-9.2,116.9-14.6,175.8-16l-16.7,40c-2.6,6.4-1,13.7,3.9,18.5s12.3,6.1,18.6,3.4l6.5-2.8l2.8,6.5c2.7,6.3,8.9,10.4,15.7,10.4    h0.2c6.9-0.1,13.1-4.3,15.6-10.6l14.8-35.5l14.8,35.3c2.6,6.5,8.8,10.7,15.7,10.8h0.3c6.8,0,12.9-4,15.6-10.2l2.9-6.5l6.4,2.8    c6.3,2.8,13.8,1.5,18.7-3.4c5-4.8,6.5-12.2,3.9-18.6L326.3,437c53.1,1.9,106,7,158.5,15.4c0.5,0.1,1,0.1,1.5,0.1    c6,0,25.6-6.8,25.6-93.9S492.4,264.5,486.4,264.5L486.4,264.5z M283.3,298.4c3.5,13,5.6,26.4,6.2,39.9c-19.3-9-42-6.9-59.4,5.5    c-0.4-15.3-2.4-30.6-5.9-45.5c10.3,0.2,20.9,0.3,31.8,0.3C265.3,298.7,274.4,298.6,283.3,298.4z M264.5,435.2    c-23.6,0-42.7-19.1-42.7-42.7s19.1-42.7,42.7-42.7s42.7,19.1,42.7,42.7S288.1,435.2,264.5,435.2z M25.6,285.9    c6.5,23.6,9.4,48.1,8.5,72.5c0.9,24.5-2,48.9-8.5,72.5c-6.5-23.6-9.4-48.1-8.5-72.5C16.2,333.9,19.1,309.5,25.6,285.9z     M42.8,432.4c4.7-13.5,8.4-36.2,8.4-74s-3.7-60.5-8.4-74c54.2,7.5,108.8,12,163.5,13.5c5.1,19.7,7.5,40.1,7,60.5    c0,1.2,0,2.4-0.1,3.6c-10.2,17-11.3,38-2.7,55.9l-0.4,0.9C154.2,420.2,98.3,424.7,42.8,432.4L42.8,432.4z M233.9,494.9l-6.2-14.3    c-1.9-4.3-6.9-6.3-11.2-4.4l-14.4,6.3l20-48c8.2,8.3,18.7,14.1,30.1,16.5L233.9,494.9z M312.6,476.2c-4.3-1.9-9.3,0.1-11.2,4.4    l-6.3,14.2L276.8,451c11.5-2.4,21.9-8.1,30.2-16.5l20,47.8L312.6,476.2z M484.7,434.8c-54.8-8.4-110.1-13.6-165.5-15.4l-0.6-1.5    c10.7-22.6,6.1-49.5-11.5-67.3c-0.1-17.7-2.1-35.3-6.1-52.6c61.5-1.4,122.9-6.7,183.7-16.1c4,6.7,10.2,33.3,10.2,76.4    S488.6,428,484.7,434.8L484.7,434.8z\\\"><\\/path>\\r\\n                                 <\\/g>\\r\\n                              <\\/g>\\r\\n                              <\\/svg>\",\"<svg viewBox=\\\"0 0 512 512\\\">\\r\\n                           <path class=\\\"st0\\\" d=\\\"M458.7,512h-384c-29.4,0-53.3-23.9-53.3-53.3V53.3C21.3,23.9,45.3,0,74.7,0H416c5.9,0,10.7,4.8,10.7,10.7v74.7  h32c5.9,0,10.7,4.8,10.7,10.7v405.3C469.3,507.2,464.6,512,458.7,512z M42.7,96v362.7c0,17.6,14.4,32,32,32H448v-384H74.7  C62.7,106.7,51.6,102.7,42.7,96L42.7,96z M74.7,21.3c-17.6,0-32,14.4-32,32s14.4,32,32,32h330.7v-64H74.7z\\\"><\\/path>\\r\\n                           <path class=\\\"st0\\\" d=\\\"M309.3,298.7c-2.8,0-5.5-1.1-7.6-3.1l-56.4-56.5l-56.4,56.4c-3.1,3.1-7.6,4-11.6,2.3c-4-1.6-6.6-5.5-6.6-9.8V96  c0-5.9,4.8-10.7,10.7-10.7S192,90.1,192,96v166.3l45.8-45.8c4.2-4.2,10.9-4.2,15.1,0l45.8,45.8V96c0-5.9,4.8-10.7,10.7-10.7  S320,90.1,320,96v192c0,4.3-2.6,8.2-6.6,9.9C312.1,298.4,310.7,298.7,309.3,298.7L309.3,298.7z\\\"><\\/path>\\r\\n                           <\\/svg>\"],\"counter_amount\":[\"345421\",\"202\",\"24085\",\"2485\"],\"counter_desc\":[\"Students Enrolled\",\"Foreign Followers\",\"Online Learners\",\"Total Courses\"]}}', '2023-10-08 06:25:59', '2023-10-08 06:25:59'),
(21, 'about_why', '{\"sub_title\":\"Why Choses Me\",\"title\":\"Tools for <span class=\\\"yellow-bg yellow-bg-big\\\">Teachers<\\/span> and Learners\",\"description\":\"Oxford chimney pot Eaton faff about blower blatant brilliant, bubble and squeak he legged it Charles bonnet arse at public school bamboozled.\",\"why_button_1\":\"Join for Free\",\"why_button_url_1\":\"\\/about\",\"why_button_2\":\"Learn More\",\"why_button_url_2\":\"\\/about\",\"image1\":\"\\/uploads\\/about\\/1696746739.png\"}', '2023-10-08 06:32:19', '2023-10-08 06:32:19');

-- --------------------------------------------------------

--
-- Table structure for table `ticket_orders`
--

CREATE TABLE `ticket_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event_id` bigint(20) UNSIGNED DEFAULT NULL,
  `status` enum('pending','approved','canceled') DEFAULT 'pending',
  `total` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` longtext DEFAULT NULL,
  `sereal` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `usertype` enum('admin','user','instructor') NOT NULL DEFAULT 'user',
  `image` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `status` enum('active','inactive') NOT NULL DEFAULT 'active',
  `facebook` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `linkedin` varchar(255) DEFAULT NULL,
  `youtube` varchar(255) DEFAULT NULL,
  `vimeo` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `website` varchar(255) DEFAULT NULL,
  `bio` text DEFAULT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `experience` varchar(255) DEFAULT NULL,
  `cv` varchar(255) DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `email_verified_at`, `password`, `usertype`, `image`, `phone`, `country`, `address`, `city`, `postal_code`, `status`, `facebook`, `twitter`, `linkedin`, `youtube`, `vimeo`, `instagram`, `website`, `bio`, `designation`, `experience`, `cv`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Instuctor', ' ', 'teacher@gmail.com', NULL, '$2y$10$U59bHTw7QiAc53M2UCjUQeZHOTwQBw4/1NP/PWFNDgCmZs78Hu8vK', 'instructor', 'uploads/users/default.png', '123456789', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 'active', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://www.youtube.com/', 'https://vimeo.com/', 'https://www.instagram.com/', 'https://www.google.com/', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.', 'Web Developer', '5 Years', NULL, NULL, NULL, NULL),
(2, 'Student', ' ', 'student@gmail.com', NULL, '$2y$10$xvmEJc0s.NCvPFqmPPGp5ewd6TjbvwCYWv0LX6kFUDoL0sJdNrYEm', 'user', 'uploads/users/default.png', '123456789', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 'active', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://www.youtube.com/', 'https://vimeo.com/', 'https://www.instagram.com/', 'https://www.google.com/', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.', 'Web Developer', '5 Years', NULL, NULL, NULL, NULL),
(3, 'Admin', ' ', 'admin@gmail.com', NULL, '$2y$10$VJPCir0455T4OInORHHhRuM82P5PrmpHy9UJ9YfPyl6BDANp7PQ72', 'admin', 'uploads/users/default.png', '123456789', 'Bangladesh', 'Dhaka', 'Dhaka', '1200', 'active', 'https://www.facebook.com/', 'https://twitter.com/', 'https://www.linkedin.com/', 'https://www.youtube.com/', 'https://vimeo.com/', 'https://www.instagram.com/', 'https://www.google.com/', 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Quisquam, voluptatum.', 'Web Developer', '5 Years', NULL, NULL, '2023-10-12 04:51:39', '2023-10-12 04:51:39');

-- --------------------------------------------------------

--
-- Table structure for table `user_courses`
--

CREATE TABLE `user_courses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_orderitems`
--

CREATE TABLE `user_orderitems` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `course_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_orders`
--

CREATE TABLE `user_orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `withdraws`
--

CREATE TABLE `withdraws` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `amount` double(8,2) NOT NULL,
  `description` text DEFAULT NULL,
  `status` enum('processing','pending','approved','rejected') NOT NULL DEFAULT 'pending',
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `assignments`
--
ALTER TABLE `assignments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `assignments_course_id_foreign` (`course_id`),
  ADD KEY `assignments_user_id_foreign` (`user_id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blogs_slug_unique` (`slug`),
  ADD KEY `blogs_user_id_foreign` (`user_id`),
  ADD KEY `blogs_category_id_foreign` (`category_id`),
  ADD KEY `blogs_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `blogs_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `blog_categories`
--
ALTER TABLE `blog_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_categories_slug_unique` (`slug`);

--
-- Indexes for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_sub_categories_slug_unique` (`slug`),
  ADD KEY `blog_category_id` (`blog_category_id`);

--
-- Indexes for table `blog_tags`
--
ALTER TABLE `blog_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `blog_tags_slug_unique` (`slug`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `carts_user_id_foreign` (`user_id`),
  ADD KEY `carts_course_id_foreign` (`course_id`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `comments_user_id_foreign` (`user_id`),
  ADD KEY `comments_blog_id_foreign` (`blog_id`),
  ADD KEY `comments_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `commissions`
--
ALTER TABLE `commissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `commissions_user_id_foreign` (`user_id`),
  ADD KEY `commissions_course_id_foreign` (`course_id`);

--
-- Indexes for table `commission_percents`
--
ALTER TABLE `commission_percents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `coupons_code_unique` (`code`),
  ADD KEY `coupons_user_id_foreign` (`user_id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `courses_slug_unique` (`slug`),
  ADD KEY `courses_user_id_foreign` (`user_id`),
  ADD KEY `courses_category_id_foreign` (`category_id`),
  ADD KEY `courses_subcategory_id_foreign` (`subcategory_id`),
  ADD KEY `courses_tag_id_foreign` (`tag_id`),
  ADD KEY `courses_language_id_foreign` (`language_id`);

--
-- Indexes for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_categories_slug_unique` (`slug`),
  ADD KEY `course_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_category_users`
--
ALTER TABLE `course_category_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `course_category_users_course_category_id_foreign` (`course_category_id`),
  ADD KEY `course_category_users_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_languages`
--
ALTER TABLE `course_languages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_languages_slug_unique` (`slug`),
  ADD KEY `course_languages_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_sub_categories`
--
ALTER TABLE `course_sub_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_sub_categories_slug_unique` (`slug`),
  ADD KEY `course_sub_categories_course_category_id_foreign` (`course_category_id`),
  ADD KEY `course_sub_categories_user_id_foreign` (`user_id`);

--
-- Indexes for table `course_tags`
--
ALTER TABLE `course_tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `course_tags_slug_unique` (`slug`),
  ADD KEY `course_tags_user_id_foreign` (`user_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `curriculam`
--
ALTER TABLE `curriculam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `curriculam_course_id_foreign` (`course_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `events_user_id_foreign` (`user_id`);

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
-- Indexes for table `lessons`
--
ALTER TABLE `lessons`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lessons_slug_unique` (`slug`),
  ADD KEY `lessons_topic_id_foreign` (`topic_id`),
  ADD KEY `lessons_course_id_foreign` (`course_id`);

--
-- Indexes for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menuitems_slug_unique` (`slug`),
  ADD KEY `menuitems_menu_id_foreign` (`menu_id`),
  ADD KEY `menuitems_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `menus`
--
ALTER TABLE `menus`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `menus_slug_unique` (`slug`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `newsletters`
--
ALTER TABLE `newsletters`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `newsletters_email_unique` (`email`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `orders_order_number_unique` (`order_number`),
  ADD KEY `orders_user_id_foreign` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_course_id_foreign` (`course_id`),
  ADD KEY `order_items_order_id_foreign` (`order_id`),
  ADD KEY `order_items_user_id_foreign` (`user_id`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `pages_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `payouts`
--
ALTER TABLE `payouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payouts_user_id_foreign` (`user_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `quize_answers`
--
ALTER TABLE `quize_answers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quize_answers_question_id_foreign` (`question_id`),
  ADD KEY `quize_answers_option_id_foreign` (`option_id`);

--
-- Indexes for table `quize_questions`
--
ALTER TABLE `quize_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quize_questions_quiz_id_foreign` (`quiz_id`);

--
-- Indexes for table `quize_question_options`
--
ALTER TABLE `quize_question_options`
  ADD PRIMARY KEY (`id`),
  ADD KEY `quize_question_options_question_id_foreign` (`question_id`);

--
-- Indexes for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `quizzes_slug_unique` (`slug`),
  ADD KEY `quizzes_course_id_foreign` (`course_id`),
  ADD KEY `quizzes_user_id_foreign` (`user_id`);

--
-- Indexes for table `resources`
--
ALTER TABLE `resources`
  ADD PRIMARY KEY (`id`),
  ADD KEY `resources_course_id_foreign` (`course_id`),
  ADD KEY `resources_user_id_foreign` (`user_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reviews_user_id_foreign` (`user_id`),
  ADD KEY `reviews_course_id_foreign` (`course_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `sidebar_infos`
--
ALTER TABLE `sidebar_infos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `system_settings_key_unique` (`key`);

--
-- Indexes for table `ticket_orders`
--
ALTER TABLE `ticket_orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ticket_orders_order_number_unique` (`order_number`),
  ADD KEY `ticket_orders_user_id_foreign` (`user_id`),
  ADD KEY `ticket_orders_event_id_foreign` (`event_id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `topics_slug_unique` (`slug`),
  ADD KEY `topics_course_id_foreign` (`course_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_courses_user_id_foreign` (`user_id`),
  ADD KEY `user_courses_course_id_foreign` (`course_id`);

--
-- Indexes for table `user_orderitems`
--
ALTER TABLE `user_orderitems`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orderitems_user_id_foreign` (`user_id`),
  ADD KEY `user_orderitems_course_id_foreign` (`course_id`),
  ADD KEY `user_orderitems_order_id_foreign` (`order_id`);

--
-- Indexes for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_orders_user_id_foreign` (`user_id`),
  ADD KEY `user_orders_order_id_foreign` (`order_id`);

--
-- Indexes for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD PRIMARY KEY (`id`),
  ADD KEY `withdraws_user_id_foreign` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `assignments`
--
ALTER TABLE `assignments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_categories`
--
ALTER TABLE `blog_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `blog_tags`
--
ALTER TABLE `blog_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commissions`
--
ALTER TABLE `commissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `commission_percents`
--
ALTER TABLE `commission_percents`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_categories`
--
ALTER TABLE `course_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `course_category_users`
--
ALTER TABLE `course_category_users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_languages`
--
ALTER TABLE `course_languages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_sub_categories`
--
ALTER TABLE `course_sub_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `course_tags`
--
ALTER TABLE `course_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `curriculam`
--
ALTER TABLE `curriculam`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

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
-- AUTO_INCREMENT for table `lessons`
--
ALTER TABLE `lessons`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menuitems`
--
ALTER TABLE `menuitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `menus`
--
ALTER TABLE `menus`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `newsletters`
--
ALTER TABLE `newsletters`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payouts`
--
ALTER TABLE `payouts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=134;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quize_answers`
--
ALTER TABLE `quize_answers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quize_questions`
--
ALTER TABLE `quize_questions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quize_question_options`
--
ALTER TABLE `quize_question_options`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quizzes`
--
ALTER TABLE `quizzes`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `resources`
--
ALTER TABLE `resources`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sidebar_infos`
--
ALTER TABLE `sidebar_infos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `ticket_orders`
--
ALTER TABLE `ticket_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_courses`
--
ALTER TABLE `user_courses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_orderitems`
--
ALTER TABLE `user_orderitems`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_orders`
--
ALTER TABLE `user_orders`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `withdraws`
--
ALTER TABLE `withdraws`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `assignments`
--
ALTER TABLE `assignments`
  ADD CONSTRAINT `assignments_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `assignments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blogs`
--
ALTER TABLE `blogs`
  ADD CONSTRAINT `blogs_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `blog_sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `blog_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `blogs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `blog_sub_categories`
--
ALTER TABLE `blog_sub_categories`
  ADD CONSTRAINT `blog_sub_categories_blog_category_id_foreign` FOREIGN KEY (`blog_category_id`) REFERENCES `blog_categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `carts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_blog_id_foreign` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `comments` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `comments_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `commissions`
--
ALTER TABLE `commissions`
  ADD CONSTRAINT `commissions_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `commissions_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `coupons`
--
ALTER TABLE `coupons`
  ADD CONSTRAINT `coupons_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_language_id_foreign` FOREIGN KEY (`language_id`) REFERENCES `course_languages` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_subcategory_id_foreign` FOREIGN KEY (`subcategory_id`) REFERENCES `course_sub_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `course_tags` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_categories`
--
ALTER TABLE `course_categories`
  ADD CONSTRAINT `course_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_category_users`
--
ALTER TABLE `course_category_users`
  ADD CONSTRAINT `course_category_users_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_category_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_languages`
--
ALTER TABLE `course_languages`
  ADD CONSTRAINT `course_languages_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_sub_categories`
--
ALTER TABLE `course_sub_categories`
  ADD CONSTRAINT `course_sub_categories_course_category_id_foreign` FOREIGN KEY (`course_category_id`) REFERENCES `course_categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `course_sub_categories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `course_tags`
--
ALTER TABLE `course_tags`
  ADD CONSTRAINT `course_tags_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `curriculam`
--
ALTER TABLE `curriculam`
  ADD CONSTRAINT `curriculam_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `events_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `lessons`
--
ALTER TABLE `lessons`
  ADD CONSTRAINT `lessons_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `lessons_topic_id_foreign` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `menuitems`
--
ALTER TABLE `menuitems`
  ADD CONSTRAINT `menuitems_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `menuitems_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `menuitems` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payouts`
--
ALTER TABLE `payouts`
  ADD CONSTRAINT `payouts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quize_answers`
--
ALTER TABLE `quize_answers`
  ADD CONSTRAINT `quize_answers_option_id_foreign` FOREIGN KEY (`option_id`) REFERENCES `quize_question_options` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quize_answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quize_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quize_questions`
--
ALTER TABLE `quize_questions`
  ADD CONSTRAINT `quize_questions_quiz_id_foreign` FOREIGN KEY (`quiz_id`) REFERENCES `quizzes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quize_question_options`
--
ALTER TABLE `quize_question_options`
  ADD CONSTRAINT `quize_question_options_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `quize_questions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `quizzes`
--
ALTER TABLE `quizzes`
  ADD CONSTRAINT `quizzes_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `quizzes_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `resources`
--
ALTER TABLE `resources`
  ADD CONSTRAINT `resources_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resources_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `reviews_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `reviews_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `ticket_orders`
--
ALTER TABLE `ticket_orders`
  ADD CONSTRAINT `ticket_orders_event_id_foreign` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `ticket_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `topics`
--
ALTER TABLE `topics`
  ADD CONSTRAINT `topics_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_courses`
--
ALTER TABLE `user_courses`
  ADD CONSTRAINT `user_courses_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_courses_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_orderitems`
--
ALTER TABLE `user_orderitems`
  ADD CONSTRAINT `user_orderitems_course_id_foreign` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_orderitems_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `user_orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_orderitems_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_orders`
--
ALTER TABLE `user_orders`
  ADD CONSTRAINT `user_orders_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `withdraws`
--
ALTER TABLE `withdraws`
  ADD CONSTRAINT `withdraws_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
