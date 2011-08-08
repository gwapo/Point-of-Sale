-- phpMyAdmin SQL Dump
-- version 3.3.7deb5build0.10.10.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 25, 2011 at 04:48 PM
-- Server version: 5.1.49
-- PHP Version: 5.2.10-2ubuntu6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mypos_development`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE IF NOT EXISTS `accounts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_date` datetime DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `delivery_no` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `check_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bank_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Dumping data for table `accounts`
--


-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
CREATE TABLE IF NOT EXISTS `customers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `street_address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `state` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `first_name`, `last_name`, `phone_number`, `email`, `street_address`, `city`, `state`, `country`, `comments`, `created_at`, `updated_at`) VALUES
(1, 'johny', 'joe', NULL, NULL, NULL, NULL, NULL, 'PH', NULL, '2011-07-25 03:12:01', '2011-07-25 03:12:01'),
(2, 'jojo', 'd', NULL, NULL, NULL, NULL, NULL, 'PH', NULL, '2011-07-25 03:12:01', '2011-07-25 03:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `employees`
--

INSERT INTO `employees` (`id`, `first_name`, `middle_name`, `last_name`, `email`, `address`, `created_at`, `updated_at`) VALUES
(1, 'dennis', 'badong', 'carique', 'denniscarique@gmail.com', NULL, '2011-07-25 03:12:01', '2011-07-25 03:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `inventories`
--

DROP TABLE IF EXISTS `inventories`;
CREATE TABLE IF NOT EXISTS `inventories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `comment` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `quantity` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `index_inventories_on_item_id` (`item_id`),
  KEY `index_inventories_on_employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=10 ;

--
-- Dumping data for table `inventories`
--

INSERT INTO `inventories` (`id`, `item_id`, `employee_id`, `comment`, `quantity`, `created_at`, `updated_at`, `amount`) VALUES
(1, 1, 1, 'Add Item', '20', '2011-07-25 03:12:01', '2011-07-25 03:12:01', '10'),
(2, 1, 1, 'POS', '-5', '2011-07-25 03:12:02', '2011-07-25 03:12:02', '10'),
(5, 1, 1, 'REC', '2', '2011-07-25 03:33:56', '2011-07-25 03:33:56', '12'),
(6, 1, 1, 'REC', '1', '2011-07-25 03:34:51', '2011-07-25 03:34:51', '12'),
(7, 2, 1, 'Add Item', '0', '2011-07-25 03:36:46', '2011-07-25 03:36:46', '13'),
(8, 1, 1, 'REC', '1', '2011-07-25 03:39:44', '2011-07-25 03:39:44', '12'),
(9, 2, 1, 'REC', '1', '2011-07-25 03:39:44', '2011-07-25 03:39:44', '15');

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
CREATE TABLE IF NOT EXISTS `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `category` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `descriptions` text COLLATE utf8_unicode_ci,
  `cost_price` decimal(10,0) DEFAULT NULL,
  `unit_cost` decimal(10,0) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `reorder_level` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_items_on_supplier_id` (`supplier_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `name`, `category`, `supplier_id`, `descriptions`, `cost_price`, `unit_cost`, `quantity`, `created_at`, `updated_at`, `reorder_level`) VALUES
(1, 'Rails Book', 'Book', 1, '20 pieces of rails books from anthony', '10', '12', 19, '2011-07-25 03:12:01', '2011-07-25 03:39:44', 5),
(2, 'Ruby', 'Books', NULL, '', '13', '15', 1, '2011-07-25 03:36:46', '2011-07-25 03:39:44', 5);

-- --------------------------------------------------------

--
-- Table structure for table `receivings`
--

DROP TABLE IF EXISTS `receivings`;
CREATE TABLE IF NOT EXISTS `receivings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `comment` text COLLATE utf8_unicode_ci,
  `receive_type` tinyint(1) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=7 ;

--
-- Dumping data for table `receivings`
--

INSERT INTO `receivings` (`id`, `employee_id`, `supplier_id`, `comment`, `receive_type`, `created_at`, `updated_at`) VALUES
(4, 1, 1, '12', 1, '2011-07-25 03:33:56', '2011-07-25 03:33:56'),
(5, 1, 1, '', 1, '2011-07-25 03:34:51', '2011-07-25 03:34:51'),
(6, 1, 1, '', 1, '2011-07-25 03:39:44', '2011-07-25 03:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `receiving_items`
--

DROP TABLE IF EXISTS `receiving_items`;
CREATE TABLE IF NOT EXISTS `receiving_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `receiving_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `quantity` int(11) DEFAULT NULL,
  `cost_price` decimal(10,0) DEFAULT NULL,
  `unit_price` decimal(10,0) DEFAULT NULL,
  `discount` int(11) DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `receiving_items`
--

INSERT INTO `receiving_items` (`id`, `receiving_id`, `item_id`, `description`, `quantity`, `cost_price`, `unit_price`, `discount`, `created_at`, `updated_at`) VALUES
(4, 4, 1, NULL, 2, '10', '12', 0, '2011-07-25 03:33:56', '2011-07-25 03:33:56'),
(5, 5, 1, NULL, 1, '10', '12', 0, '2011-07-25 03:34:51', '2011-07-25 03:34:51'),
(6, 6, 1, NULL, 1, '10', '12', 0, '2011-07-25 03:39:44', '2011-07-25 03:39:44'),
(7, 6, 2, NULL, 1, '13', '15', NULL, '2011-07-25 03:39:44', '2011-07-25 03:39:44');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

DROP TABLE IF EXISTS `sales`;
CREATE TABLE IF NOT EXISTS `sales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `payment_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `sales_type` tinyint(1) DEFAULT '0',
  `order` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `index_sales_on_customer_id` (`customer_id`),
  KEY `index_sales_on_employee_id` (`employee_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`id`, `customer_id`, `employee_id`, `comments`, `payment_type`, `amount`, `created_at`, `updated_at`, `sales_type`, `order`) VALUES
(1, 1, 1, NULL, NULL, NULL, '2011-07-25 03:12:02', '2011-07-25 03:12:02', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `sale_items`
--

DROP TABLE IF EXISTS `sale_items`;
CREATE TABLE IF NOT EXISTS `sale_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  `quantity_purchased` decimal(10,0) DEFAULT NULL,
  `item_cost_price` decimal(10,0) DEFAULT NULL,
  `item_unit_price` decimal(10,0) DEFAULT NULL,
  `discount_percent` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sale_items_on_sale_id` (`sale_id`),
  KEY `index_sale_items_on_item_id` (`item_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `sale_items`
--

INSERT INTO `sale_items` (`id`, `sale_id`, `item_id`, `quantity_purchased`, `item_cost_price`, `item_unit_price`, `discount_percent`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '5', '10', '12', NULL, '2011-07-25 03:12:02', '2011-07-25 03:12:02');

-- --------------------------------------------------------

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE IF NOT EXISTS `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `schema_migrations`
--

INSERT INTO `schema_migrations` (`version`) VALUES
('20110708080805'),
('20110708082237'),
('20110708083012'),
('20110708084428'),
('20110708085855'),
('20110708092442'),
('20110712084028'),
('20110712144900'),
('20110712145921'),
('20110713055757'),
('20110713132630'),
('20110713144414'),
('20110715075827'),
('20110715080135'),
('20110719124955'),
('20110719160400'),
('20110719160401'),
('20110720035747');

-- --------------------------------------------------------

--
-- Table structure for table `store_configs`
--

DROP TABLE IF EXISTS `store_configs`;
CREATE TABLE IF NOT EXISTS `store_configs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `store_configs`
--

INSERT INTO `store_configs` (`id`, `company_name`, `email`, `fax`, `phone`, `website`, `address`, `created_at`, `updated_at`) VALUES
(1, 'Company_name', 'denniscarique@gmail.com', NULL, NULL, NULL, 'LA', '2011-07-25 03:12:01', '2011-07-25 03:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `middle_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone_number` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `company_name`, `first_name`, `middle_name`, `last_name`, `email`, `phone_number`, `address`, `comments`, `created_at`, `updated_at`) VALUES
(1, 'Anthony''s Books', 'anthony', 'b', 'canol', 'hay@gmail.com', NULL, NULL, NULL, '2011-07-25 03:12:01', '2011-07-25 03:12:01');
