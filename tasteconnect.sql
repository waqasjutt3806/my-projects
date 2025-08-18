-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 15, 2025 at 04:28 PM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tasteconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `security_question` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `security_answer` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `security_question`, `security_answer`, `created_at`) VALUES
(3, 'foodiehub@admin.com', '$2y$10$9GXO5K6gsjTTHNmI8X6viOxw2N7phSbtgymphVRiz8odbUozrLSWi', 'What is the name of your first pet?', '$2y$10$kheYGsO1aQdeNDFwrFoG2.OXfXKaPvIuc8kVklvw9WEUyS3l8McKG', '2025-06-01 13:00:10');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

DROP TABLE IF EXISTS `contact_messages`;
CREATE TABLE IF NOT EXISTS `contact_messages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subject` enum('general','order','delivery','feedback','partnership','other') COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `first_name`, `last_name`, `email`, `phone`, `subject`, `message`, `created_at`) VALUES
(4, 'Usama', 'Bashir', 'jubranyounas@gmail.com', '03196977218', 'general', 'sdfasdg', '2025-06-14 18:06:41');

-- --------------------------------------------------------

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE IF NOT EXISTS `menu_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` enum('Pizzas','Burgers','Sides','Drinks','Desserts','Salads','Appetizers','Soups','Sandwiches','Breakfast','Seafood','Vegetarian','Vegan','Kids Menu','Specials','Alcoholic Beverages','Coffee & Tea','Smoothies') COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu_items`
--

INSERT INTO `menu_items` (`id`, `vendor_id`, `name`, `category`, `description`, `price`, `image`, `created_at`) VALUES
(18, 7, 'test1', 'Sandwiches', 'test', 12.00, 'Uploads/menu_684d745b23fd28.84072053.png', '2025-06-14 13:08:43'),
(19, 7, 'test2', 'Breakfast', 'test', 15.00, 'Uploads/menu_684d7479298337.23880777.jpg', '2025-06-14 13:09:13'),
(20, 7, 'test2', 'Vegetarian', 'test', 15.00, 'Uploads/menu_684d74ab393d75.97177640.jpg', '2025-06-14 13:10:03'),
(21, 7, 'test4', 'Breakfast', 'test', 15.00, 'Uploads/menu_684d74b7865d41.55931109.jpg', '2025-06-14 13:10:15'),
(22, 7, 'test5', 'Sandwiches', 'test', 15.00, 'Uploads/menu_684d74cbc00e83.98719409.jpg', '2025-06-14 13:10:35'),
(23, 7, 'test6', 'Seafood', 'test', 15.00, 'Uploads/menu_684d74d9b44647.08841646.jpg', '2025-06-14 13:10:49'),
(24, 7, 'test7', 'Sandwiches', 'test', 15.00, 'Uploads/menu_684d74f950e638.69933362.png', '2025-06-14 13:11:21'),
(25, 7, 'test8', 'Sandwiches', 'test', 20.00, 'Uploads/menu_684d7503c66670.16580394.jpg', '2025-06-14 13:11:31'),
(26, 7, 'test9', 'Breakfast', 'test', 20.00, 'Uploads/menu_684d754984f314.43571563.jpg', '2025-06-14 13:12:41'),
(27, 7, 'test10', 'Sandwiches', 'test', 20.00, 'Uploads/menu_684d75565b55f6.38582960.jpg', '2025-06-14 13:12:54'),
(28, 9, 'new', 'Sandwiches', 'new', 22.00, 'Uploads/menu_684ec752362ec5.62865195.png', '2025-06-15 13:14:58'),
(29, 9, 'tester', 'Coffee & Tea', 'test', 12.00, 'Uploads/menu_684ec776577bc6.34638296.jpg', '2025-06-15 13:15:34'),
(30, 9, 'red', 'Breakfast', 'red', 22.00, 'Uploads/menu_684ec7a0501901.10045795.jpg', '2025-06-15 13:16:16'),
(31, 9, 'set', 'Breakfast', 'set', 12.00, 'Uploads/menu_684ec7ac2baa59.33106264.jpg', '2025-06-15 13:16:28'),
(32, 9, 'again', 'Breakfast', 'again', 22.00, 'Uploads/menu_684ec7beba8079.27212615.jpg', '2025-06-15 13:16:46'),
(33, 9, 'sdfsd', 'Sandwiches', 'sdfdasgf', 22.00, 'Uploads/menu_684ec7cd300801.10879568.jpg', '2025-06-15 13:17:01'),
(34, 9, 'sdfsdag', 'Vegetarian', 'sdfsdg', 12.00, 'Uploads/menu_684ec7d7b5fa45.25718707.jpg', '2025-06-15 13:17:11'),
(35, 9, 'vvvvvv', 'Sandwiches', 'vvvvvvvvvv', 25.00, 'Uploads/menu_684ec7e223c009.80250067.jpg', '2025-06-15 13:17:22'),
(36, 9, 'qqqqqqqqqqq', 'Sandwiches', 'qqqqqqqqqqqqq', 22.00, 'Uploads/menu_684ec7ed5506a8.41774623.jpg', '2025-06-15 13:17:33'),
(37, 9, 'zzzzzzzz', 'Seafood', 'zzzzzzzzzzzz', 44.00, 'Uploads/menu_684ec7fc1efe10.04938297.jpg', '2025-06-15 13:17:48'),
(38, 9, 'hhhhhhhhhh', 'Kids Menu', 'hhhhhhhhhh', 22.00, 'Uploads/menu_684ec81c208da7.90958233.jpg', '2025-06-15 13:18:20');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_type` enum('Order','Booking') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Order',
  `user_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `delivery_address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT '',
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT '',
  `order_date` datetime NOT NULL,
  `status` enum('Pending','Processing','Delivered','Cancelled') COLLATE utf8mb4_general_ci DEFAULT 'Pending',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `delivery_fee` decimal(10,2) DEFAULT '0.00',
  `discount_amount` decimal(10,2) DEFAULT '0.00',
  `subtotal` decimal(10,2) DEFAULT '0.00',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_type`, `user_id`, `vendor_id`, `total`, `delivery_address`, `payment_method`, `order_date`, `status`, `created_at`, `updated_at`, `delivery_fee`, `discount_amount`, `subtotal`) VALUES
(11, 'Order', 12, 7, 112.00, 'test', 'Cash on Delivery', '2025-06-14 13:15:18', 'Delivered', '2025-06-14 13:15:18', '2025-06-14 13:16:34', 100.00, 0.00, 12.00),
(12, 'Order', 12, 9, 39.60, 'test', 'Cash on Delivery', '2025-06-15 13:48:10', 'Pending', '2025-06-15 13:48:10', '2025-06-15 13:48:10', 0.00, 0.00, 39.60);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `booking_details` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  KEY `menu_item_id` (`menu_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `menu_item_id`, `quantity`, `price`, `subtotal`, `created_at`, `booking_details`) VALUES
(11, 11, 18, 1, 12.00, 12.00, '2025-06-14 13:15:18', NULL),
(12, 12, 28, 1, 19.80, 19.80, '2025-06-15 13:48:10', NULL),
(13, 12, 36, 1, 19.80, 19.80, '2025-06-15 13:48:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('paid','pending') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subscription_id` (`subscription_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `user_id`, `subscription_id`, `amount`, `status`, `created_at`) VALUES
(12, 12, 16, 1500.00, 'paid', '2025-06-14 18:19:42'),
(13, 12, 17, 222.00, 'paid', '2025-06-15 18:24:07'),
(14, 12, 14, 50.00, 'paid', '2025-06-15 18:30:04');

-- --------------------------------------------------------

--
-- Table structure for table `reservation_items`
--

DROP TABLE IF EXISTS `reservation_items`;
CREATE TABLE IF NOT EXISTS `reservation_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reservation_id` int NOT NULL,
  `menu_item_id` int NOT NULL,
  `quantity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_reservation_id` (`reservation_id`),
  KEY `fk_menu_item_id` (`menu_item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_items`
--

INSERT INTO `reservation_items` (`id`, `reservation_id`, `menu_item_id`, `quantity`) VALUES
(20, 15, 28, 3),
(21, 16, 28, 1);

-- --------------------------------------------------------

--
-- Table structure for table `reservation_slots`
--

DROP TABLE IF EXISTS `reservation_slots`;
CREATE TABLE IF NOT EXISTS `reservation_slots` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `slot_date` date NOT NULL,
  `slot_time` time NOT NULL,
  `capacity` int NOT NULL,
  `status` enum('available','fully_booked') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'available',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reservation_slots`
--

INSERT INTO `reservation_slots` (`id`, `vendor_id`, `slot_date`, `slot_time`, `capacity`, `status`, `created_at`, `updated_at`) VALUES
(16, 7, '2025-06-14', '18:20:00', 10, 'available', '2025-06-14 13:19:04', '2025-06-14 13:19:04'),
(17, 7, '2025-06-14', '18:23:00', 10, 'available', '2025-06-14 13:19:13', '2025-06-14 13:19:13'),
(18, 7, '2025-06-15', '18:25:00', 10, 'available', '2025-06-14 13:19:24', '2025-06-14 13:19:24'),
(19, 7, '2025-06-17', '18:22:00', 10, 'available', '2025-06-14 13:19:34', '2025-06-14 13:19:34'),
(20, 9, '2025-06-15', '18:59:00', 10, '', '2025-06-15 13:59:44', '2025-06-15 14:07:02'),
(21, 9, '2025-06-15', '19:01:00', 10, '', '2025-06-15 14:00:00', '2025-06-15 14:08:40'),
(22, 9, '2025-06-16', '19:00:00', 10, 'available', '2025-06-15 14:00:10', '2025-06-15 14:00:10'),
(23, 9, '2025-06-16', '19:01:00', 10, 'available', '2025-06-15 14:00:20', '2025-06-15 14:00:20');

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE IF NOT EXISTS `subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `per_head` tinyint(1) NOT NULL DEFAULT '0',
  `min_headcount` int DEFAULT NULL,
  `max_headcount` int DEFAULT NULL,
  `custom_plan` tinyint(1) NOT NULL DEFAULT '0',
  `custom_plan_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `dietary_preferences` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `delivery_frequency` enum('Daily','Weekly','Biweekly') COLLATE utf8mb4_general_ci NOT NULL,
  `description` text COLLATE utf8mb4_general_ci,
  `plan_type` enum('Basic','Standard','Premium') COLLATE utf8mb4_general_ci NOT NULL,
  `dish_limit` int NOT NULL,
  `meal_times` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `validity_period` int NOT NULL,
  `validity_unit` enum('Days','Weeks','Months') COLLATE utf8mb4_general_ci NOT NULL,
  `status` enum('active','inactive') COLLATE utf8mb4_general_ci DEFAULT 'active',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `discount_percentage` decimal(5,2) NOT NULL DEFAULT '0.00',
  `non_subscriber_delivery_fee` decimal(10,2) NOT NULL DEFAULT '250.00',
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscriptions`
--

INSERT INTO `subscriptions` (`id`, `vendor_id`, `per_head`, `min_headcount`, `max_headcount`, `custom_plan`, `custom_plan_name`, `dietary_preferences`, `delivery_frequency`, `description`, `plan_type`, `dish_limit`, `meal_times`, `price`, `validity_period`, `validity_unit`, `status`, `created_at`, `updated_at`, `discount_percentage`, `non_subscriber_delivery_fee`) VALUES
(14, 7, 1, 2, 4, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Basic', 2, 'Morning', 50.00, 15, 'Days', 'active', '2025-06-14 18:17:23', NULL, 10.00, 250.00),
(15, 7, 1, 3, 6, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Standard', 6, 'Morning,Afternoon', 99.99, 59, 'Days', 'active', '2025-06-14 18:17:54', NULL, 15.00, 250.00),
(16, 7, 1, 4, 10, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Premium', 10, 'Morning,Afternoon,Evening', 1500.00, 120, 'Days', 'active', '2025-06-14 18:18:38', NULL, 20.00, 250.00),
(17, 9, 1, 1, 3, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Basic', 3, 'Morning', 222.00, 30, 'Days', 'active', '2025-06-15 18:23:08', NULL, 10.00, 250.00),
(18, 9, 1, 2, 5, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Standard', 5, 'Morning,Afternoon,Evening', 222.00, 222, 'Days', 'active', '2025-06-15 18:23:34', NULL, 15.00, 250.00),
(19, 9, 1, 3, 6, 0, NULL, 'Vegetarian,Vegan,Halal,Gluten-Free', 'Daily', 'test', 'Premium', 5, 'Morning,Afternoon,Evening', 222.00, 222, 'Days', 'active', '2025-06-15 18:23:58', NULL, 20.00, 250.00);

-- --------------------------------------------------------

--
-- Table structure for table `subscription_reservations`
--

DROP TABLE IF EXISTS `subscription_reservations`;
CREATE TABLE IF NOT EXISTS `subscription_reservations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `vendor_id` int NOT NULL,
  `meal_time` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `reservation_date` date NOT NULL,
  `headcount` int NOT NULL DEFAULT '1',
  `status` enum('Pending','Confirmed','Cancelled') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Pending',
  `created_at` datetime NOT NULL,
  `slot_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_subscription_id` (`subscription_id`),
  KEY `fk_vendor_id` (`vendor_id`),
  KEY `fk_slot_id` (`slot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `subscription_reservations`
--

INSERT INTO `subscription_reservations` (`id`, `user_id`, `subscription_id`, `vendor_id`, `meal_time`, `reservation_date`, `headcount`, `status`, `created_at`, `slot_id`) VALUES
(15, 12, 17, 9, '18:59', '2025-06-15', 1, 'Pending', '2025-06-15 19:07:02', 20),
(16, 12, 17, 9, '19:01', '2025-06-15', 3, 'Pending', '2025-06-15 19:08:40', 21);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `remember_token` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `city` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `postal_code` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `location` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `profile_image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `cnic` char(13) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `email`, `phone`, `password`, `remember_token`, `address`, `city`, `postal_code`, `created_at`, `location`, `profile_image`, `cnic`) VALUES
(12, 'test', 'test', 'test@test.com', '03196977218', '$2y$10$AJIgMuNVxtyc/hstoQPOROKZaF.RzvdKgFb0nakjmVbw0RD94cROG', '0dbcd10fc9e498a07474ae0ebf0035fa', 'Pakistan Punjab, Sahiwal', 'Sahiwal', '57000', '2025-06-14 13:02:08', 'test', 'uploads/684d72d00c546_ai cody.png', '3650274038803');

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

DROP TABLE IF EXISTS `user_subscriptions`;
CREATE TABLE IF NOT EXISTS `user_subscriptions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `subscription_id` int NOT NULL,
  `start_date` datetime NOT NULL,
  `end_date` datetime NOT NULL,
  `status` enum('pending','active','cancelled') COLLATE utf8mb4_general_ci DEFAULT 'pending',
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `subscription_id` (`subscription_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_subscriptions`
--

INSERT INTO `user_subscriptions` (`id`, `user_id`, `subscription_id`, `start_date`, `end_date`, `status`, `created_at`, `updated_at`) VALUES
(18, 12, 17, '2025-06-15 18:24:07', '2025-07-15 18:24:07', 'active', '2025-06-15 18:24:07', NULL),
(19, 12, 14, '2025-06-15 18:30:04', '2025-06-30 18:30:04', 'active', '2025-06-15 18:30:04', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendors`
--

DROP TABLE IF EXISTS `vendors`;
CREATE TABLE IF NOT EXISTS `vendors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `restaurant_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `category` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  `contact_number` varchar(15) COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` enum('pending','active','rejected') COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'pending',
  `license` varchar(100) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendors`
--

INSERT INTO `vendors` (`id`, `restaurant_name`, `email`, `password`, `category`, `contact_number`, `created_at`, `status`, `license`) VALUES
(7, 'test', 'test@test.com', '$2y$10$Woj.6ciaR6stT8KDJqAUNu44C5QAF.C0.SRpzGthKwmGNcGQKEH.C', 'Pizza', '03196977218', '2025-06-14 13:02:41', 'active', '12345678'),
(9, 'spice villa', 'test2@test.com', '$2y$10$0R77usmtYcj8eVbD2FwTVew/a6/6SgX95rz5Y/S2KAojIfwZdSiCa', 'Sushi', '03196977218', '2025-06-15 13:14:11', 'active', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_images`
--

DROP TABLE IF EXISTS `vendor_images`;
CREATE TABLE IF NOT EXISTS `vendor_images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `image_path` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `vendor_id` (`vendor_id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_images`
--

INSERT INTO `vendor_images` (`id`, `vendor_id`, `image_path`, `uploaded_at`) VALUES
(9, 7, 'Uploads/vendor_7_684d72f1adae3.png', '2025-06-14 13:02:41'),
(10, 9, 'Uploads/vendor_9_684ec723a253a.png', '2025-06-15 13:14:11');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_schedules`
--

DROP TABLE IF EXISTS `vendor_schedules`;
CREATE TABLE IF NOT EXISTS `vendor_schedules` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vendor_id` int NOT NULL,
  `schedule_date` date NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_schedule` (`vendor_id`,`schedule_date`,`start_time`,`end_time`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `vendor_schedules`
--

INSERT INTO `vendor_schedules` (`id`, `vendor_id`, `schedule_date`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(10, 7, '2025-06-15', '10:00:00', '22:00:00', '2025-06-15 13:11:09', '2025-06-15 13:11:09'),
(11, 9, '2025-06-15', '10:00:00', '22:00:00', '2025-06-15 13:18:25', '2025-06-15 13:18:25');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `reservation_slots`
--
ALTER TABLE `reservation_slots`
  ADD CONSTRAINT `reservation_slots_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`vendor_id`) REFERENCES `vendors` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD CONSTRAINT `user_subscriptions_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `user_subscriptions_ibfk_2` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
