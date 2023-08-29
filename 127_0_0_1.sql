-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 29, 2023 at 11:43 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `aftersale`
--
CREATE DATABASE IF NOT EXISTS `aftersale` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `aftersale`;

-- --------------------------------------------------------

--
-- Table structure for table `banks`
--

CREATE TABLE `banks` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `bank_ownername` varchar(255) DEFAULT NULL,
  `bank_name` varchar(255) DEFAULT NULL,
  `bank_number` varchar(255) DEFAULT NULL,
  `bank_expiredate` datetime DEFAULT NULL,
  `bank_cvv` smallint(6) DEFAULT NULL,
  `bank_swift` varchar(255) DEFAULT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banks`
--

INSERT INTO `banks` (`id`, `user_id`, `bank_ownername`, `bank_name`, `bank_number`, `bank_expiredate`, `bank_cvv`, `bank_swift`, `rec_state`) VALUES
(2, 2, 'ali', 'ziraat', 'TR 101001010011', NULL, 333, NULL, 0),
(3, 5, 'hftdyht', 'hfgdghf', '564654', NULL, 564, NULL, 0),
(4, 2, 'errere', 'aaaaaaa', '43543', '1970-01-01 00:07:15', 32767, '345543', 0),
(5, 2, 'qqqqqqqqqq', 'aaaaaa', '787', '1970-01-01 00:14:38', 87, '878', 1),
(6, 2, 'gh', 'hgf', '1221122121212112', NULL, NULL, NULL, 1),
(7, 2, 'yu', 'uyıu', '1221212121212121', NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(255) NOT NULL,
  `category_configs` varchar(255) DEFAULT '{"icon":"", "isProtected":""}',
  `category_priority` tinyint(4) DEFAULT 99,
  `rec_state` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `language_id`, `parent_id`, `category_name`, `category_configs`, `category_priority`, `rec_state`) VALUES
(8, 0, 0, 'expenses_types', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(10, 0, 0, 'expenses_category', '{\"icon\":\"767\"}', 99, 1),
(12, 0, 10, 'gas bill', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(14, 2, 10, 'elektirkf', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(16, 0, 10, 'water bill', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(20, 0, 10, 'asdasd', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(21, 0, 0, 'inspect_rate', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(22, 0, 21, 'cleaning', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(23, 0, 21, 'boya', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(25, 0, 21, 'furniture', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1),
(26, 0, 10, 'neflix', '{\"icon\":\"\",\"isProtected\":\"\"}', 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_value` text DEFAULT NULL,
  `stat_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `configs`
--

INSERT INTO `configs` (`id`, `config_key`, `config_value`, `stat_updated`) VALUES
(1, 'TRY_USD', '0.52', '2022-12-23 07:42:21'),
(2, 'EUR_USD', '4', '2022-12-23 07:42:21'),
(3, 'GBP_USD', '8', '2022-12-23 07:49:09');

-- --------------------------------------------------------

--
-- Table structure for table `contents`
--

CREATE TABLE `contents` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `language_id` tinyint(4) NOT NULL DEFAULT 1,
  `content_title` varchar(255) NOT NULL,
  `content_desc` text DEFAULT NULL,
  `features_ids` varchar(255) DEFAULT NULL,
  `content_search_pool` text DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `stat_created` datetime NOT NULL,
  `stat_updated` datetime NOT NULL,
  `stat_views` int(11) DEFAULT 0,
  `stat_shares` int(11) DEFAULT 0,
  `rec_state` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contents`
--

INSERT INTO `contents` (`id`, `user_id`, `language_id`, `content_title`, `content_desc`, `features_ids`, `content_search_pool`, `seo_keywords`, `stat_created`, `stat_updated`, `stat_views`, `stat_shares`, `rec_state`) VALUES
(1, NULL, 2, '', '<p>werwerewrwerw</p>\n', NULL, NULL, NULL, '0000-00-00 00:00:00', '2023-07-31 09:23:05', 0, 0, 0),
(2, 3, 1, 'ttretretr', 'ttrtr', NULL, NULL, NULL, '2023-08-07 09:26:15', '2023-08-07 09:26:15', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `deposit`
--

CREATE TABLE `deposit` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` decimal(10,0) NOT NULL,
  `stat_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE `docs` (
  `id` int(11) NOT NULL,
  `tar_id` int(11) NOT NULL COMMENT 'proj|prop id',
  `tar_tbl` tinyint(4) NOT NULL COMMENT '1=prop, 2=proj',
  `doc_name` varchar(255) NOT NULL,
  `doc_desc` varchar(255) DEFAULT NULL,
  `doc_allowed_roles` varchar(255) DEFAULT 'admin.callcenter,admin.portfolio,admin.supervisor',
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `expense_type` tinyint(4) NOT NULL COMMENT '1=outgoıng\r\n2=income',
  `expense_amount` int(11) NOT NULL,
  `expense_currency` tinyint(4) DEFAULT 3 COMMENT '4=GBP, 1=EUR, 2=USD, 3=TRY 	',
  `expense_description` varchar(255) DEFAULT NULL,
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `user_id`, `owner_id`, `category_id`, `expense_type`, `expense_amount`, `expense_currency`, `expense_description`, `stat_created`, `rec_state`) VALUES
(49, 2, 8, 12, 1, 564, 1, 'ghjf', '2023-08-23 14:10:56', 1),
(75, 2, 10, 16, 1, 65, 2, 'hyfhgfh', '2023-08-24 11:57:36', 1),
(76, 2, 12, 16, 2, 1211, 1, 'hftshgf', '2023-08-24 12:54:43', 1),
(78, 2, 10, 14, 1, 34, 4, 'fghgj', '2023-08-28 08:34:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inspects`
--

CREATE TABLE `inspects` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL COMMENT 'inspector',
  `service_id` int(11) NOT NULL,
  `inspect_desc` text DEFAULT NULL,
  `inspect_rate` text NOT NULL DEFAULT '{"window":false,"clean":false,"furniture":false}',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inspects`
--

INSERT INTO `inspects` (`id`, `user_id`, `service_id`, `inspect_desc`, `inspect_rate`, `stat_created`, `rec_state`) VALUES
(12, 2, 273, 'tt', '{\"window\":0,\"clean\":0,\"furniture\":1}', '2023-08-18 11:52:01', 1),
(80, 2, 12, NULL, '\"add_client\"', '2023-08-29 07:26:51', 1),
(81, 2, 4, 'fdggfd', '{\"cleaning\":true,\"furniture\":true}', '2023-08-29 08:19:53', 1),
(82, 2, 5, 'etrgrd', '', '2023-08-29 08:21:47', 1),
(83, 2, 4, 'fgtfgfgfgfggfg', '', '2023-08-29 08:23:31', 1),
(84, 2, 0, NULL, '', '2023-08-29 08:23:44', 1),
(85, 2, 0, NULL, '', '2023-08-29 08:25:54', 1),
(86, 2, 0, NULL, '', '2023-08-29 08:37:06', 1);

-- --------------------------------------------------------

--
-- Table structure for table `inspect_specs`
--

CREATE TABLE `inspect_specs` (
  `id` int(11) NOT NULL,
  `inspect_id` int(11) NOT NULL,
  `spec_name` varchar(255) NOT NULL,
  `spec_value` varchar(255) DEFAULT NULL,
  `spec_configs` varchar(255) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inspect_specs`
--

INSERT INTO `inspect_specs` (`id`, `inspect_id`, `spec_name`, `spec_value`, `spec_configs`) VALUES
(1, 2, 'boya', 'it is okay', '');

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `log_url` varchar(255) NOT NULL COMMENT 'Ex: ["","","","","http//:localhost/ptpms/admin/offices/save/7","Offices","save","7"]',
  `log_changes` mediumtext DEFAULT NULL COMMENT 'Ex: [{"before":null}, {"after":"new val"}]',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=unread, 2=read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`id`, `user_id`, `log_url`, `log_changes`, `stat_created`, `rec_state`) VALUES
(3513, 1, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Osama Kassar\",\"user_role\":\"admin.root\"}]', '2023-04-18 09:39:50', 1),
(3514, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-04-28 09:40:55', 1),
(3515, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-04-28 12:42:22', 1),
(3516, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"5\",\"category_name\":\"5555\",\"id\":-1}]', '2023-04-28 12:43:32', 1),
(3517, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-05-26 13:14:02', 1),
(3518, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-05-26 14:17:02', 1),
(3519, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-05-26 14:53:59', 1),
(3520, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-13 08:29:36', 1),
(3521, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-13 09:09:13', 1),
(3522, 1, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Osama Kassar\",\"user_role\":\"admin.root\"}]', '2023-07-13 09:10:13', 1),
(3523, 1, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Osama Kassar\",\"user_role\":\"admin.root\"}]', '2023-07-13 10:14:06', 1),
(3524, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-13 12:21:21', 1),
(3525, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-13 12:21:22', 1),
(3526, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/cake_ready_setup/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-13 12:21:23', 1),
(3527, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 09:21:45', 1),
(3528, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/contents/save/-1\",\"Contents\",\"save_new\",\"-1\"]', '[{\"content_desc\":\"<p>werwerewrwerw</p>\n\",\"language_id\":\"2\",\"content_istranslated\":1,\"id\":-1}]', '2023-07-31 09:23:05', 1),
(3529, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 09:51:42', 1),
(3530, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 11:27:06', 1),
(3531, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 11:30:30', 1),
(3532, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 12:05:10', 1),
(3533, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/2\",\"Users\",\"update\",\"2\"]', '[{\"user_configs\":\"\"\"\"}, {\"user_configs\":\"\"\"\"}]', '2023-07-31 12:05:42', 1),
(3534, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"Admin\",\"user_role\":\"admin.root\"}]', '2023-07-31 12:23:40', 1),
(3535, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":null,\"user_role\":\"admin.root\"}]', '2023-07-31 12:55:45', 1),
(3536, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":null,\"user_role\":\"admin.root\"}]', '2023-07-31 12:55:50', 1),
(3537, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-07-31 14:08:47', 1),
(3538, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-07-31 14:17:25', 1),
(3539, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"aa\",\"email\":\"c@gmail.com\",\"password\":\"123123\",\"user_role\":\"admin.root\",\"id\":-1}]', '2023-07-31 14:25:15', 1),
(3540, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-07-31 14:28:14', 1),
(3541, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-01 07:22:47', 1),
(3542, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-01 07:25:51', 1),
(3543, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-01 11:31:36', 1),
(3544, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"rent\",\"language_id\":\"2\",\"id\":-1}]', '2023-08-01 11:54:04', 1),
(3546, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-03 06:40:58', 1),
(3547, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-03 09:07:40', 1),
(3548, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/ddd\",\"Services\",\"update\",\"ddd\"]', '[{\"service_desc\":\"\",\"user_id\":\"\",\"service_configs\":\"\",\"id\":\"\"}, {\"service_desc\":\"hbnfghghg\",\"user_id\":\"2\",\"service_configs\":\"\",\"id\":\"ddd\"}]', '2023-08-03 10:24:00', 1),
(3549, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/ddd\",\"Services\",\"update\",\"ddd\"]', '[{\"service_desc\":\"\",\"user_id\":\"\",\"service_configs\":\"\",\"id\":\"\"}, {\"service_desc\":\"hbnfghghg\",\"user_id\":\"2\",\"service_configs\":\"\",\"id\":\"ddd\"}]', '2023-08-03 10:24:01', 1),
(3550, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/ddd\",\"Services\",\"update\",\"ddd\"]', '[{\"tenant_id\":\"\",\"service_desc\":\"\",\"property_id\":\"\",\"user_id\":\"\",\"service_configs\":\"\",\"id\":\"\"}, {\"tenant_id\":\"6\",\"service_desc\":\"hbnfghghg\",\"property_id\":\"2\",\"user_id\":\"2\",\"service_configs\":\"\",\"id\":\"ddd\"}]', '2023-08-03 10:24:13', 1),
(3551, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"id\":3,\"service_configs\":\"{\"icon\":\"\",\"isProtected\":\"\"}\"}, {\"id\":\"3\",\"service_configs\":\"\"}]', '2023-08-03 11:52:53', 1),
(3552, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"id\":3,\"service_configs\":\"{\"icon\":\"\",\"isProtected\":\"\"}\"}, {\"id\":\"3\",\"service_configs\":\"\"}]', '2023-08-03 11:52:59', 1),
(3553, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"user_id\":\"4\",\"tenant_id\":\"5\",\"property_id\":\"3\",\"service_desc\":\"fgdvfdg\",\"id\":-1}]', '2023-08-03 12:44:20', 1),
(3554, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"user_id\":\"45\",\"tenant_id\":\"4\",\"service_desc\":\"gdrhtfhghdgf\",\"property_id\":\"4\",\"id\":-1}]', '2023-08-03 12:44:48', 1),
(3555, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"user_id\":\"4\",\"tenant_id\":\"3\",\"service_desc\":\"3\",\"stat_expiredate\":\"3\",\"property_id\":\"33\",\"stat_created\":\"3\",\"id\":-1}]', '2023-08-03 12:45:11', 1),
(3556, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"user_id\":\"4\",\"tenant_id\":\"3\",\"service_desc\":\"3\",\"stat_expiredate\":\"3\",\"property_id\":\"33\",\"stat_created\":\"3\",\"id\":-1}]', '2023-08-03 12:48:08', 1),
(3557, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"user_id\":\"3\",\"tenant_id\":\"5\",\"id\":-1}]', '2023-08-03 13:40:18', 1),
(3559, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"user_id\":\"5\",\"expense_amount\":\"123\",\"stat_created\":\"232323\",\"services_id\":\"2323\",\"rec_state\":\"3232\",\"expense_configs\":\"3\",\"id\":-1}]', '2023-08-03 14:40:00', 1),
(3560, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-04 06:54:44', 1),
(3561, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"long term rent\",\"package_desc\":\"ghhh\",\"package_price\":\"11\",\"package_period\":\"2\",\"id\":-1}]', '2023-08-04 07:21:32', 1),
(3562, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"short term\",\"package_desc\":\"rererret\",\"package_period\":\"4\",\"package_price\":\"22\",\"id\":-1}]', '2023-08-04 07:25:03', 1),
(3563, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/1\",\"Packages\",\"update\",\"1\"]', '[{\"package_name\":\"long term rent\"}, {\"package_name\":\"longgggggg term rent\"}]', '2023-08-04 07:26:09', 1),
(3564, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"short term\",\"package_desc\":\"ttytyt\",\"package_price\":\"11\",\"id\":-1}]', '2023-08-04 07:48:06', 1),
(3565, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/-1\",\"Banks\",\"save_new\",\"-1\"]', '[{\"user_id\":\"2\",\"bank_ownername\":\"cetin\",\"bank_number\":\"TR 101001010011\",\"bank_name\":\"ziraat\",\"bank_cvv\":\"333\",\"id\":-1}]', '2023-08-04 07:58:56', 1),
(3566, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/messages/save/-1\",\"Messages\",\"save_new\",\"-1\"]', '[{\"message_text\":\"545344\",\"parent_id\":0,\"sender\":\"\"}]', '2023-08-04 08:47:55', 1),
(3567, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"expenses_types\",\"id\":-1}]', '2023-08-04 12:43:07', 1),
(3568, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"packages_types\",\"id\":-1}]', '2023-08-04 12:43:35', 1),
(3569, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-07 07:16:50', 1),
(3570, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"ali ayse\",\"email\":\"aa@gmail.com\",\"password\":\"12345\",\"user_configs\":{\"address\":\"r4aetrg\"},\"user_role\":\"admin.root\",\"id\":-1}]', '2023-08-07 07:36:17', 1),
(3571, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"id\":-1}]', '2023-08-07 08:21:41', 1),
(3572, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"service_price\":0,\"service_tax\":0,\"service_desc\":null}, {\"service_price\":\"3\",\"service_tax\":\"4\",\"service_desc\":\"t4e453564\"}]', '2023-08-07 09:39:50', 1),
(3573, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"property_id\":0,\"service_price\":3,\"service_tax\":4}, {\"property_id\":\"5\",\"service_price\":\"6\",\"service_tax\":\"6\"}]', '2023-08-07 09:47:06', 1),
(3574, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"54\",\"services_id\":\"5\",\"expense_configs\":\"5hnghjkm\",\"id\":-1}]', '2023-08-07 10:18:57', 1),
(3575, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"56\",\"services_id\":\"65\",\"expense_configs\":\"ytuj\",\"id\":-1}]', '2023-08-07 10:20:51', 1),
(3576, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"6776\",\"services_id\":\"76\",\"expense_configs\":\"67567e6cjhg ömjkö\",\"id\":-1}]', '2023-08-07 10:47:05', 1),
(3577, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"3343\",\"expense_configs\":\"4434gthg\",\"services_id\":\"2\",\"id\":-1}]', '2023-08-07 13:31:57', 1),
(3578, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"\",\"user_role\":\"admin.root\"}]', '2023-08-08 06:31:13', 1),
(3579, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"3\",\"package_desc\":\"rggt\",\"package_currency\":\"4\",\"package_price\":\"11\",\"package_period\":\"4\",\"id\":-1}]', '2023-08-08 07:49:14', 1),
(3580, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/2\",\"Banks\",\"update\",\"2\"]', '[{\"bank_ownername\":\"cetin\"}, {\"bank_ownername\":\"ali\"}]', '2023-08-08 08:13:38', 1),
(3581, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/8\",\"Expenses\",\"update\",\"8\"]', '[{\"expense_type\":1}, {\"expense_type\":\"2\"}]', '2023-08-08 13:16:02', 1),
(3582, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/5\",\"Packages\",\"update\",\"5\"]', '[{\"package_name\":\"3\"}, {\"package_name\":\"4\"}]', '2023-08-08 13:16:30', 1),
(3583, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"6776\",\"expense_currency\":\"1\",\"expense_configs\":\"678675865\",\"services_id\":\"786\",\"id\":-1}]', '2023-08-08 13:31:35', 1),
(3584, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/9\",\"Expenses\",\"update\",\"9\"]', '[{\"expense_type\":0,\"expense_amount\":3343,\"services_id\":2}, {\"expense_type\":\"1\",\"expense_amount\":\"7688765876\",\"services_id\":\"87\"}]', '2023-08-08 13:31:43', 1),
(3585, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-09 06:33:43', 1),
(3586, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-09 09:58:16', 1),
(3587, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-10 06:52:21', 1),
(3588, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"54\",\"expense_currency\":\"2\",\"expense_configs\":\"tygjhgjhh\",\"id\":-1}]', '2023-08-10 14:57:08', 1),
(3589, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"67\",\"expense_configs\":\"rt45\",\"expense_currency\":\"2\",\"services_id\":\"5\",\"id\":-1}]', '2023-08-10 14:58:55', 1),
(3590, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/12\",\"Expenses\",\"update\",\"12\"]', '[{\"expense_amount\":67}, {\"expense_amount\":\"6756\"}]', '2023-08-10 15:01:02', 1),
(3591, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"67\",\"expense_currency\":\"3\",\"id\":-1}]', '2023-08-10 15:01:51', 1),
(3592, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_configs\":\"ytt\",\"expense_currency\":\"3\",\"id\":-1}]', '2023-08-10 15:05:51', 1),
(3593, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"8787\",\"expense_configs\":\"8768\",\"expense_currency\":\"4\",\"id\":-1}]', '2023-08-10 15:06:57', 1),
(3594, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"service_vat\":0}, {\"service_vat\":\"4\"}]', '2023-08-10 15:09:23', 1),
(3595, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-11 06:41:02', 1),
(3596, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/10\",\"Expenses\",\"update\",\"10\"]', '[{\"expense_currency\":1}, {\"expense_currency\":\"2\"}]', '2023-08-11 08:34:07', 1),
(3597, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"88\",\"expense_configs\":\"88l\",\"expense_currency\":\"1\",\"services_id\":\"87\",\"id\":-1}]', '2023-08-11 08:34:25', 1),
(3598, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"543543\",\"expense_configs\":\"rerte\",\"expense_currency\":\"4\",\"services_id\":\"1\",\"id\":-1}]', '2023-08-11 09:02:37', 1),
(3599, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-11 09:05:50', 1),
(3600, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"id\":-1}]', '2023-08-11 09:31:01', 1),
(3601, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"77\",\"expense_configs\":\"767uy\",\"expense_type\":\"2\",\"id\":-1}]', '2023-08-11 09:58:51', 1),
(3602, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"776\",\"expense_currency\":\"4\",\"expense_configs\":\"jhghj\",\"id\":-1}]', '2023-08-11 10:08:25', 1),
(3603, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"765675\",\"expense_configs\":\"657yut\",\"expense_currency\":\"4\",\"id\":-1}]', '2023-08-11 10:10:48', 1),
(3604, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"76\",\"expense_configs\":\"ıu\",\"expense_currency\":\"1\",\"services_id\":\"6\",\"id\":-1}]', '2023-08-11 10:14:04', 1),
(3605, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"language_id\":\"2\",\"category_configs\":{\"icon\":\"767\"},\"id\":-1}]', '2023-08-11 10:19:06', 1),
(3606, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"language_id\":\"2\",\"category_configs\":{\"icon\":\"767\"},\"id\":-1}]', '2023-08-11 10:19:13', 1),
(3607, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"service_vat\":4}, {\"service_vat\":\"5555\"}]', '2023-08-11 10:49:53', 1),
(3608, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/2\",\"Services\",\"update\",\"2\"]', '[{\"service_contract_period\":32}, {\"service_contract_period\":\"3245554\"}]', '2023-08-11 10:50:02', 1),
(3609, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/2\",\"Services\",\"update\",\"2\"]', '[{\"service_price\":32}, {\"service_price\":\"5\"}]', '2023-08-11 10:50:20', 1),
(3610, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/3\",\"Services\",\"update\",\"3\"]', '[{\"service_vat\":127}, {\"service_vat\":\"14\"}]', '2023-08-11 10:50:33', 1),
(3611, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-11 11:40:51', 1),
(3612, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-11 11:40:52', 1),
(3613, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uıkkl\",\"service_price\":\"8767688\",\"service_vat\":\"7887\",\"service_tax\":\"8787\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-11 12:24:52', 1),
(3614, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uıkkl\",\"service_price\":\"8767688\",\"service_vat\":\"7887\",\"service_tax\":\"8787\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-11 12:24:53', 1),
(3615, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uıkkl\",\"service_price\":\"8767688\",\"service_vat\":\"7887\",\"service_tax\":\"8787\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-11 12:24:59', 1),
(3616, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uıkkl\",\"service_price\":\"8767688\",\"service_vat\":\"7887\",\"service_tax\":\"8787\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-11 12:24:59', 1),
(3617, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"yt\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:06', 1),
(3618, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"yt\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:07', 1),
(3619, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:13', 1),
(3620, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:14', 1),
(3621, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:14', 1),
(3622, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:14', 1),
(3623, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:14', 1),
(3624, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:14', 1),
(3625, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:15', 1),
(3626, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:15', 1),
(3627, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"tryytr\",\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"654\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-11 12:28:15', 1),
(3628, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uı\",\"service_vat\":\"7\",\"service_contract_period\":\"67\",\"service_price\":\"7676\",\"service_tax\":\"67\",\"id\":-1}]', '2023-08-11 12:29:04', 1),
(3629, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"uı\",\"service_vat\":\"7\",\"service_contract_period\":\"67\",\"service_price\":\"7676\",\"service_tax\":\"67\",\"id\":-1}]', '2023-08-11 12:29:05', 1),
(3630, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"4\",\"package_currency\":\"2\",\"package_price\":\"656\",\"package_period\":\"45\",\"id\":-1}]', '2023-08-11 13:11:17', 1),
(3631, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/6\",\"Packages\",\"update\",\"6\"]', '[{\"package_currency\":2}, {\"package_currency\":\"3\"}]', '2023-08-11 13:11:26', 1),
(3632, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"fdf\",\"service_price\":\"3\",\"service_tax\":\"43\",\"service_vat\":\"43\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-11 13:38:31', 1),
(3633, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:01', 1),
(3634, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:04', 1),
(3635, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:04', 1),
(3636, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:04', 1),
(3637, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:05', 1),
(3638, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:05', 1),
(3639, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:05', 1),
(3640, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:26', 1),
(3641, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:27', 1),
(3642, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:27', 1),
(3643, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"3\",\"service_price\":\"4\",\"service_tax\":\"4\",\"service_vat\":\"4\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-11 13:39:27', 1),
(3644, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:42', 1),
(3645, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:43', 1),
(3646, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:43', 1),
(3647, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:43', 1),
(3648, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:43', 1),
(3649, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:47', 1),
(3650, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:47', 1),
(3651, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:48', 1),
(3652, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:48', 1),
(3653, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"service_desc\":\"t\",\"service_price\":\"3\",\"service_tax\":\"3\",\"service_vat\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-11 13:40:48', 1),
(3654, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-14 06:38:35', 1),
(3655, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/6\",\"Packages\",\"update\",\"6\"]', '[{\"package_desc\":null}, {\"package_desc\":\"tyrty\"}]', '2023-08-14 07:20:06', 1),
(3656, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/6\",\"Packages\",\"update\",\"6\"]', '[{\"package_cpi\":null}, {\"package_cpi\":\"3\"}]', '2023-08-14 07:20:13', 1),
(3657, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"6\",\"service_id\":\"6\",\"id\":-1}]', '2023-08-14 08:08:14', 1),
(3658, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"5\",\"service_id\":\"6\",\"id\":-1}]', '2023-08-14 08:12:30', 1),
(3659, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"5\",\"service_id\":\"5\",\"id\":-1}]', '2023-08-14 08:16:32', 1),
(3660, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"8\",\"service_id\":\"89\",\"id\":-1}]', '2023-08-14 08:20:28', 1),
(3661, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"oıp\",\"package_desc\":\"uıkgı\",\"package_currency\":\"4\",\"package_price\":\"876\",\"package_period\":\"778\",\"package_cpi\":\"878\",\"id\":-1}]', '2023-08-14 08:45:21', 1),
(3662, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"4\",\"tenant_id\":\"5\",\"service_desc\":\"545t4\",\"service_price\":\"656\",\"service_vat\":\"5646\",\"service_contract_period\":\"5465\",\"service_tax\":\"565\",\"id\":-1}]', '2023-08-14 08:58:05', 1),
(3663, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"4\",\"tenant_id\":\"5\",\"service_desc\":\"545t4\",\"service_price\":\"656\",\"service_vat\":\"5646\",\"service_contract_period\":\"5465\",\"service_tax\":\"565\",\"id\":-1}]', '2023-08-14 08:58:05', 1),
(3664, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"4\",\"tenant_id\":\"5\",\"service_desc\":\"545t4\",\"service_price\":\"656\",\"service_vat\":\"32\",\"service_contract_period\":\"5465\",\"service_tax\":\"565\",\"id\":-1}]', '2023-08-14 08:58:10', 1),
(3665, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"4\",\"tenant_id\":\"5\",\"service_desc\":\"545t4\",\"service_price\":\"656\",\"service_vat\":\"32\",\"service_contract_period\":\"5465\",\"service_tax\":\"565\",\"id\":-1}]', '2023-08-14 08:58:10', 1),
(3666, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"4\",\"tenant_id\":\"5\",\"service_desc\":\"545t4\",\"service_price\":\"656\",\"service_vat\":\"32\",\"service_contract_period\":\"5465\",\"service_tax\":\"565\",\"id\":-1}]', '2023-08-14 08:58:11', 1),
(3667, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:01:08', 1),
(3668, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:01:09', 1),
(3669, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:03:31', 1),
(3670, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:10:16', 1),
(3671, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:06', 1),
(3672, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:07', 1),
(3673, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:09', 1),
(3674, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:09', 1),
(3675, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:11', 1),
(3676, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:11:12', 1),
(3677, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:14:27', 1),
(3678, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:14:27', 1),
(3679, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:14:27', 1),
(3680, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:14:28', 1),
(3681, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:14:29', 1),
(3682, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:15:14', 1),
(3683, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:15:14', 1),
(3684, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:16:16', 1),
(3685, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:16:17', 1),
(3686, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-14 09:16:17', 1),
(3687, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_role\":\"user.tenant\",\"user_fullname\":\"a\",\"password\":\"jhjyhhj\",\"user_configs\":{\"mobile\":\"776\",\"address\":\"ukuk\"},\"email\":\"aaj@gmail.com\",\"id\":-1}]', '2023-08-14 09:45:16', 1),
(3688, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"ahmet\",\"email\":\"bj@gmail.com\",\"password\":\"13454\",\"user_configs\":{\"mobile\":\"4655576\",\"address\":\"juyujıtu\"},\"user_role\":\"user.landlord\",\"id\":-1}]', '2023-08-14 09:46:37', 1),
(3689, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"jkhjhk\",\"email\":\"aaa@gmail.com\",\"password\":\"gfdgfd\",\"user_configs\":{\"mobile\":\"546657654\",\"address\":\"ghfjghhgf\"},\"user_role\":\"user.tenant\",\"id\":-1}]', '2023-08-14 10:01:50', 1),
(3690, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"tretre\",\"service_price\":\"546654\",\"service_vat\":\"67576\",\"service_contract_period\":\"565657\",\"service_tax\":\"6565\",\"id\":-1}]', '2023-08-14 10:02:18', 1),
(3691, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"tretre\",\"service_price\":\"546654\",\"service_vat\":\"67576\",\"service_contract_period\":\"565657\",\"service_tax\":\"6565\",\"id\":-1}]', '2023-08-14 10:02:18', 1),
(3692, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"tretre\",\"service_price\":\"546654\",\"service_vat\":\"67576\",\"service_contract_period\":\"565657\",\"service_tax\":\"6565\",\"id\":-1}]', '2023-08-14 10:02:19', 1),
(3693, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"tretre\",\"service_price\":\"546654\",\"service_vat\":\"67576\",\"service_contract_period\":\"565657\",\"service_tax\":\"6565\",\"id\":-1}]', '2023-08-14 10:02:36', 1),
(3694, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"7\",\"service_desc\":\"78\",\"service_vat\":\"7887\",\"service_price\":\"78\",\"service_tax\":\"8\",\"service_contract_period\":\"78\",\"id\":-1}]', '2023-08-14 10:03:34', 1),
(3695, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jkjk\",\"service_vat\":\"888\",\"service_contract_period\":\"878\",\"service_price\":\"8778\",\"service_tax\":\"878\",\"id\":-1}]', '2023-08-14 10:11:07', 1),
(3696, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jkjk\",\"service_vat\":\"888\",\"service_contract_period\":\"878\",\"service_price\":\"8778\",\"service_tax\":\"878\",\"id\":-1}]', '2023-08-14 10:11:08', 1),
(3697, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jkjk\",\"service_vat\":\"888\",\"service_contract_period\":\"878\",\"service_price\":\"8778\",\"service_tax\":\"878\",\"id\":-1}]', '2023-08-14 10:11:34', 1),
(3698, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jkjk\",\"service_vat\":\"888\",\"service_contract_period\":\"878\",\"service_price\":\"8778\",\"service_tax\":\"878\",\"id\":-1}]', '2023-08-14 10:12:06', 1),
(3699, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jkjk\",\"service_vat\":\"888\",\"service_contract_period\":\"878\",\"service_price\":\"8778\",\"service_tax\":\"878\",\"id\":-1}]', '2023-08-14 10:12:41', 1),
(3700, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"kjj\",\"service_vat\":\"98799\",\"service_price\":\"89898\",\"service_tax\":\"98989\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-14 10:13:02', 1),
(3701, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"service_desc\":\"htgrhgf\",\"service_price\":\"657\",\"service_vat\":\"657\",\"service_contract_period\":\"576\",\"service_tax\":\"567\",\"id\":-1}]', '2023-08-14 10:14:11', 1),
(3702, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"service_desc\":\"jhgjk\",\"service_price\":\"567765\",\"service_vat\":\"56776567\",\"service_contract_period\":\"765765\",\"service_tax\":\"765675\",\"id\":-1}]', '2023-08-14 10:17:19', 1),
(3703, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"uıog\",\"service_vat\":\"98\",\"service_contract_period\":\"98\",\"service_tax\":\"89\",\"service_price\":\"98\",\"id\":-1}]', '2023-08-14 10:24:21', 1),
(3704, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"service_desc\":\"oık\",\"service_price\":\"76\",\"service_vat\":\"76\",\"service_tax\":\"76\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-14 11:06:34', 1),
(3705, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"gerfdgfv\",\"service_price\":\"4343\",\"service_vat\":\"43\",\"service_tax\":\"3443\",\"service_contract_period\":\"34\",\"id\":-1}]', '2023-08-14 12:53:33', 1),
(3706, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"gg\",\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"44\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-14 12:54:15', 1),
(3707, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"gg\",\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"44\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-14 12:56:32', 1),
(3708, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jk\",\"tenant_id\":\"11\",\"service_price\":\"76\",\"service_vat\":\"76\",\"service_tax\":\"67\",\"service_contract_period\":\"76\",\"id\":-1}]', '2023-08-14 14:05:31', 1),
(3709, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"13\",\"service_price\":\"65\",\"service_vat\":\"6565\",\"service_tax\":\"6565\",\"service_contract_period\":\"65\",\"id\":-1}]', '2023-08-14 14:50:50', 1),
(3710, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"54\",\"service_price\":\"54\",\"service_vat\":\"54\",\"service_tax\":\"54\",\"service_contract_period\":\"45\",\"id\":-1}]', '2023-08-14 14:51:06', 1);
INSERT INTO `logs` (`id`, `user_id`, `log_url`, `log_changes`, `stat_created`, `rec_state`) VALUES
(3711, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-15 06:55:56', 1),
(3712, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"hg\",\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 07:38:11', 1),
(3713, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"fg\",\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 07:38:34', 1),
(3714, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"hghg\",\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 07:56:58', 1),
(3715, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"asd\",\"package_id\":1,\"insurance\":true,\"id\":-1}]', '2023-08-15 08:27:45', 1),
(3716, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"asd\",\"package_id\":1,\"insurance\":true,\"service_price\":\"12\",\"service_vat\":\"1\",\"service_tax\":\"2\",\"service_contract_period\":\"123\",\"id\":-1}]', '2023-08-15 08:28:38', 1),
(3717, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"asda\",\"package_id\":1,\"id\":-1}]', '2023-08-15 08:29:01', 1),
(3718, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"asdas\",\"package_id\":1,\"insurance\":true,\"id\":-1}]', '2023-08-15 08:30:01', 1),
(3719, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"asd\",\"package_id\":1,\"insurance\":true,\"id\":-1}]', '2023-08-15 08:30:22', 1),
(3720, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"asda\",\"package_id\":1,\"insurance\":true,\"id\":-1}]', '2023-08-15 08:34:16', 1),
(3721, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"asdasd\",\"package_id\":1,\"eartquik\":true,\"insurance\":true,\"id\":-1}]', '2023-08-15 08:34:38', 1),
(3722, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"gfg\",\"tenant_id\":\"11\",\"package_id\":2,\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"434\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 08:35:59', 1),
(3723, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"ui\",\"insurance\":true,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"6\",\"id\":-1}]', '2023-08-15 08:36:33', 1),
(3724, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"insurance\":false,\"eartquik\":false,\"package_id\":1,\"owner_id\":\"10\",\"tenant_id\":\"7\",\"id\":-1}]', '2023-08-15 08:43:36', 1),
(3725, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"id\":-1}]', '2023-08-15 08:43:43', 1),
(3726, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"insurance\":true,\"id\":-1}]', '2023-08-15 08:46:19', 1),
(3727, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"gg\",\"package_id\":1,\"id\":-1}]', '2023-08-15 08:53:31', 1),
(3728, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"55\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 08:53:52', 1),
(3729, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"55\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"insurance\":true,\"id\":-1}]', '2023-08-15 08:54:05', 1),
(3730, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"gfhh\",\"package_id\":1,\"service_price\":\"56\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 08:56:49', 1),
(3731, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"6\",\"package_id\":2,\"service_price\":\"6\",\"service_vat\":\"6\",\"service_tax\":\"6\",\"service_contract_period\":\"6\",\"id\":-1}]', '2023-08-15 08:57:16', 1),
(3732, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"9\",\"package_id\":2,\"insurance\":true,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 09:00:08', 1),
(3733, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"kjl\",\"insurance\":true,\"package_id\":2,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 09:11:56', 1),
(3734, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"kjh\",\"package_id\":2,\"insurance\":true,\"service_price\":\"78\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-15 09:12:26', 1),
(3735, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"id\":-1}]', '2023-08-15 09:13:01', 1),
(3736, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:13:09', 1),
(3737, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"id\":-1}]', '2023-08-15 09:13:14', 1),
(3738, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"package_id\":1,\"id\":-1}]', '2023-08-15 09:13:56', 1),
(3739, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"insurance\":true,\"id\":-1}]', '2023-08-15 09:14:02', 1),
(3740, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"eartquik\":true,\"id\":-1}]', '2023-08-15 09:14:09', 1),
(3741, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":1,\"id\":-1}]', '2023-08-15 09:15:19', 1),
(3742, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 09:15:57', 1),
(3743, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"insurance\":true,\"id\":-1}]', '2023-08-15 09:16:03', 1),
(3744, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"service_desc\":\"9\",\"tenant_id\":\"7\",\"id\":-1}]', '2023-08-15 09:24:28', 1),
(3745, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"insurance\":true,\"eartquik\":true,\"id\":-1}]', '2023-08-15 09:26:03', 1),
(3746, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"insurance\":false,\"eartquik\":true,\"id\":-1}]', '2023-08-15 09:26:07', 1),
(3747, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"id\":-1}]', '2023-08-15 09:26:41', 1),
(3748, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:26:45', 1),
(3749, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:27:11', 1),
(3750, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":2,\"insurance\":true,\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 09:27:27', 1),
(3751, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"service_desc\":\"o\",\"tenant_id\":\"11\",\"package_id\":2,\"service_price\":\"0\",\"service_vat\":\"0\",\"service_tax\":\"0\",\"service_contract_period\":\"0\",\"id\":-1}]', '2023-08-15 09:28:02', 1),
(3752, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"service_desc\":\"o\",\"tenant_id\":\"11\",\"package_id\":2,\"service_price\":\"0\",\"service_vat\":\"0\",\"service_tax\":\"0\",\"service_contract_period\":\"0\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:28:11', 1),
(3753, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"lk\",\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:29:03', 1),
(3754, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"ı\",\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:30:34', 1),
(3755, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"insurance\":true,\"id\":-1}]', '2023-08-15 09:34:15', 1),
(3756, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"insurance\":true,\"eartquik\":true,\"id\":-1}]', '2023-08-15 09:34:20', 1),
(3757, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ytyt\",\"package_id\":1,\"service_price\":\"6\",\"service_vat\":\"6\",\"service_tax\":\"6\",\"service_contract_period\":\"6\",\"id\":-1}]', '2023-08-15 09:42:12', 1),
(3758, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ytyt\",\"package_id\":1,\"service_price\":\"6\",\"service_vat\":\"6\",\"service_tax\":\"6\",\"service_contract_period\":\"6\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:42:20', 1),
(3759, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":1,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 09:45:40', 1),
(3760, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":1,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 09:45:50', 1),
(3761, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":1,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 09:45:52', 1),
(3762, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":1,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 09:45:53', 1),
(3763, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 09:46:04', 1),
(3764, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:46:10', 1),
(3765, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:46:21', 1),
(3766, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ghgh\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:46:29', 1),
(3767, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":1,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-15 09:52:07', 1),
(3768, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":1,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:52:15', 1),
(3769, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":1,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:52:29', 1),
(3770, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":1,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:52:58', 1),
(3771, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":2,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"insurance\":true,\"id\":-1}]', '2023-08-15 09:53:02', 1),
(3772, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"767\",\"package_id\":2,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"insurance\":true,\"eartquik\":true,\"id\":-1}]', '2023-08-15 09:53:07', 1),
(3773, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"5665\",\"package_id\":1,\"id\":-1}]', '2023-08-15 09:57:02', 1),
(3774, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"5665\",\"package_id\":1,\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 09:57:05', 1),
(3775, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"lkj\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 09:57:44', 1),
(3776, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"lkj\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 09:57:50', 1),
(3777, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"7\",\"package_id\":2,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-15 09:59:12', 1),
(3778, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"7\",\"package_id\":2,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 09:59:21', 1),
(3779, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"ılk\",\"package_id\":2,\"service_price\":\"8\",\"service_vat\":\"8\",\"service_tax\":\"8\",\"service_contract_period\":\"8\",\"id\":-1}]', '2023-08-15 10:00:04', 1),
(3780, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 10:00:08', 1),
(3781, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 10:00:17', 1),
(3782, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 10:00:23', 1),
(3783, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":1,\"id\":-1}]', '2023-08-15 10:00:34', 1),
(3784, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"oı\",\"package_id\":1,\"service_price\":\"8\",\"service_vat\":\"8\",\"service_tax\":\"8\",\"service_contract_period\":\"8\",\"id\":-1}]', '2023-08-15 10:01:32', 1),
(3785, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"k\",\"package_id\":2,\"id\":-1}]', '2023-08-15 10:03:23', 1),
(3786, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"fireinsurance\":true,\"owner_id\":\"8\",\"tenant_id\":\"11\",\"id\":-1}]', '2023-08-15 10:03:40', 1),
(3787, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"fireinsurance\":false,\"owner_id\":\"8\",\"tenant_id\":\"11\",\"package_id\":2,\"id\":-1}]', '2023-08-15 10:03:47', 1),
(3788, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"fireinsurance\":true,\"owner_id\":\"8\",\"tenant_id\":\"11\",\"package_id\":2,\"id\":-1}]', '2023-08-15 10:03:51', 1),
(3789, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"7\",\"service_desc\":\"pğo\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 10:10:31', 1),
(3790, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"1\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 10:11:10', 1),
(3791, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"erert\",\"package_id\":1,\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 10:11:37', 1),
(3792, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"service_desc\":\"tr\",\"tenant_id\":\"11\",\"owner_id\":\"10\",\"package_id\":1,\"service_price\":\"3\",\"service_vat\":\"3\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 10:12:01', 1),
(3793, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"lk\",\"tenant_id\":\"11\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 10:12:35', 1),
(3794, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"ghg\",\"package_id\":2,\"service_price\":\"3\",\"service_vat\":\"7\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 10:14:01', 1),
(3795, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"pop\",\"package_id\":2,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 10:14:55', 1),
(3796, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"pop\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 10:15:06', 1),
(3797, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"jkkj\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"7\",\"service_tax\":\"3\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 10:16:52', 1),
(3798, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ıop\",\"package_id\":2,\"service_price\":\"9\",\"service_vat\":\"98\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"id\":-1}]', '2023-08-15 10:17:28', 1),
(3799, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"oı\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"5\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 10:21:23', 1),
(3800, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"oı\",\"package_id\":1,\"service_price\":\"9\",\"service_vat\":\"5\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 10:21:32', 1),
(3801, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"qq\",\"package_id\":2,\"service_price\":\"9\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 10:24:31', 1),
(3802, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"t\",\"package_id\":2,\"service_price\":\"64565\",\"service_vat\":\"654\",\"service_tax\":\"4\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-15 10:25:01', 1),
(3803, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"yy\",\"service_price\":\"9\",\"service_vat\":\"3\",\"service_tax\":\"654\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-15 10:25:22', 1),
(3804, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"11\",\"owner_id\":\"12\",\"service_desc\":\"uıu\",\"package_id\":2,\"service_price\":\"7\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-15 10:26:32', 1),
(3805, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 10:27:08', 1),
(3806, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 10:27:12', 1),
(3807, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"service_price\":\"8\",\"service_vat\":\"8\",\"service_tax\":\"8\",\"service_contract_period\":\"8\",\"package_id\":1,\"service_desc\":\"kj\",\"owner_id\":\"10\",\"tenant_id\":\"7\",\"id\":-1}]', '2023-08-15 10:27:26', 1),
(3808, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"t\",\"package_id\":2,\"service_price\":\"5\",\"service_vat\":\"7\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 10:29:09', 1),
(3809, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"aa\",\"package_id\":1,\"service_price\":\"3\",\"service_vat\":\"3\",\"service_tax\":\"3\",\"service_contract_period\":\"34\",\"id\":-1}]', '2023-08-15 10:31:49', 1),
(3810, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-15 11:36:19', 1),
(3811, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"ffsd\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 11:40:50', 1),
(3812, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"kj\",\"package_id\":2,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 11:41:40', 1),
(3813, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"13\",\"service_desc\":\"3\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 11:41:59', 1),
(3814, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"h\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 11:46:59', 1),
(3815, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"uıu\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 12:04:04', 1),
(3816, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"13\",\"service_desc\":\"jhg\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 12:04:44', 1),
(3817, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"owner_id\":\"10\",\"service_desc\":\"op\",\"tenant_id\":\"11\",\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 12:05:05', 1),
(3818, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"oş\",\"package_id\":1,\"service_price\":\"3\",\"service_vat\":\"3\",\"service_tax\":\"3\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-15 12:23:02', 1),
(3819, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"1\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 12:25:40', 1),
(3820, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"u\",\"package_id\":1,\"service_price\":\"5\",\"service_vat\":\"3\",\"service_tax\":\"654\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 12:26:43', 1),
(3821, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"asd\",\"package_id\":1,\"service_price\":\"3\",\"service_vat\":\"7\",\"service_tax\":\"5\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 12:27:28', 1),
(3822, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_desc\":\"rererret\",\"package_currency\":\"1\",\"id\":-1}]', '2023-08-15 12:28:59', 1),
(3823, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"a\",\"package_desc\":\"fgfh\",\"package_price\":\"45\",\"package_currency\":\"4\",\"package_period\":\"4\",\"id\":-1}]', '2023-08-15 12:35:40', 1),
(3824, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"ghf\",\"package_desc\":\"g\",\"package_price\":\"4\",\"package_cpi\":\"4\",\"package_currency\":\"1\",\"package_period\":\"4\",\"id\":-1}]', '2023-08-15 12:36:04', 1),
(3825, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"e\",\"package_desc\":\"e\",\"package_price\":\"23\",\"package_cpi\":\"2\",\"package_currency\":\"1\",\"package_period\":\"22\",\"id\":-1}]', '2023-08-15 12:36:39', 1),
(3826, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"7\",\"service_desc\":\"tr\",\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 13:09:05', 1),
(3827, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"şl\",\"package_id\":1,\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 13:23:04', 1),
(3828, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"t\",\"fireinsurance\":true,\"package_id\":2,\"service_price\":\"1\",\"service_vat\":\"3\",\"service_tax\":\"4\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-15 13:23:26', 1),
(3829, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"service_desc\":\"4343\",\"tenant_id\":\"11\",\"package_id\":1,\"service_price\":\"122\",\"service_vat\":\"5\",\"service_tax\":\"11\",\"service_contract_period\":\"878\",\"id\":-1}]', '2023-08-15 13:25:23', 1),
(3830, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"13\",\"service_desc\":\"jjjjj\",\"package_id\":1,\"fireinsurance\":true,\"service_price\":\"22\",\"service_vat\":\"55\",\"service_tax\":\"5555\",\"service_contract_period\":\"55\",\"id\":-1}]', '2023-08-15 13:27:37', 1),
(3831, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 13:28:03', 1),
(3832, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"asdasd\",\"package_id\":2,\"fireinsurance\":true,\"eartquik\":true,\"service_price\":\"123123\",\"service_vat\":\"123123\",\"service_tax\":\"12312\",\"service_contract_period\":\"2134\",\"id\":-1}]', '2023-08-15 13:29:02', 1),
(3833, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"package_id\":1,\"fireinsurance\":true,\"id\":-1}]', '2023-08-15 13:30:26', 1),
(3834, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"7\",\"owner_id\":\"12\",\"service_desc\":\"lşk\",\"package_id\":1,\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 13:49:13', 1),
(3835, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":2,\"earthquake\":true,\"id\":-1}]', '2023-08-15 13:49:20', 1),
(3836, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":3,\"owner_id\":\"8\",\"service_desc\":\"ıkuıuok\",\"tenant_id\":\"11\",\"service_price\":\"34\",\"service_vat\":\"343\",\"service_tax\":\"4334\",\"service_contract_period\":\"4334\",\"id\":-1}]', '2023-08-15 13:51:38', 1),
(3837, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"45\",\"package_id\":1,\"undefined\":true,\"id\":-1}]', '2023-08-15 13:52:49', 1),
(3838, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"fd\",\"package_id\":1,\"undefined\":true,\"id\":-1}]', '2023-08-15 13:55:55', 1),
(3839, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"fd\",\"package_id\":2,\"undefined\":true,\"id\":-1}]', '2023-08-15 13:56:06', 1),
(3840, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"fd7u6\",\"package_id\":2,\"undefined\":true,\"service_price\":\"4\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-15 13:56:19', 1),
(3841, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"tyrht\",\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-15 14:51:47', 1),
(3842, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"tyrht\",\"service_price\":\"1\",\"service_vat\":\"1\",\"service_tax\":\"1\",\"service_contract_period\":\"1\",\"servicePackage\":[{\"package_id\":true}],\"id\":-1}]', '2023-08-15 14:51:56', 1),
(3843, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 14:52:35', 1),
(3844, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-15 14:52:42', 1),
(3845, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-15 14:52:58', 1),
(3846, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-15 14:53:10', 1),
(3847, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-15 14:53:13', 1),
(3848, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"ıuı\",\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-15 14:53:52', 1),
(3849, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"trr\",\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-15 14:57:04', 1),
(3850, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-16 06:57:54', 1),
(3851, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"şlş\",\"service_price\":\"4\",\"service_vat\":\"1\",\"service_tax\":\"7\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-16 07:21:39', 1),
(3852, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"şlş\",\"service_price\":\"4\",\"service_vat\":\"1\",\"service_tax\":\"7\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-16 07:21:45', 1),
(3853, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"şlş\",\"service_price\":\"4\",\"service_vat\":\"1\",\"service_tax\":\"7\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-16 07:22:15', 1),
(3854, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"şlş\",\"service_price\":\"4\",\"service_vat\":\"1\",\"service_tax\":\"7\",\"service_contract_period\":\"1\",\"id\":-1}]', '2023-08-16 07:23:15', 1),
(3855, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"lk\",\"service_price\":\"9\",\"service_vat\":\"9\",\"service_tax\":\"9\",\"service_contract_period\":\"9\",\"servicePackage\":{\"0\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-16 07:25:48', 1),
(3856, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"090\",\"id\":-1}]', '2023-08-16 07:31:22', 1),
(3857, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"13\",\"service_desc\":\"090\",\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-16 07:32:04', 1),
(3858, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"hh\",\"id\":-1}]', '2023-08-16 07:40:36', 1),
(3859, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"hh\",\"id\":-1}]', '2023-08-16 07:40:55', 1),
(3860, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"66\",\"servicePackage\":{\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-16 07:42:42', 1),
(3861, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"uııu\",\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"service_price\":\"7\",\"service_vat\":\"4\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-16 07:44:30', 1),
(3862, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"556\",\"servicePackage\":{\"1\":{\"package_id\":true},\"2\":{\"package_id\":true}},\"id\":-1}]', '2023-08-16 07:54:19', 1),
(3863, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"tenant_id\":\"11\",\"service_desc\":\"hgh\",\"id\":-1}]', '2023-08-16 07:57:36', 1),
(3864, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/-1\",\"Banks\",\"save_new\",\"-1\"]', '[{\"bank_ownername\":\"errere\",\"bank_name\":\"rere\",\"bank_expiredate\":\"435\",\"bank_number\":\"43543\",\"bank_cvv\":\"345435\",\"bank_swift\":\"345543\",\"id\":-1}]', '2023-08-16 09:10:36', 1),
(3865, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/4\",\"Banks\",\"update\",\"4\"]', '[{\"bank_name\":\"rere\"}, {\"bank_name\":\"aaaaaaa\"}]', '2023-08-16 09:10:58', 1),
(3866, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-16 09:25:42', 1),
(3867, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"service_desc\":\"24\",\"service_price\":\"3\",\"service_vat\":\"3\",\"service_tax\":\"3\",\"service_contract_period\":\"3\",\"id\":-1}]', '2023-08-16 09:33:29', 1),
(3868, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-16 12:27:29', 1),
(3869, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/7\",\"Expenses\",\"update\",\"7\"]', '[{\"expense_amount\":56}, {\"expense_amount\":\"78\"}]', '2023-08-16 12:47:26', 1),
(3870, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-17 07:07:03', 1),
(3871, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-17 07:54:53', 1),
(3872, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"ggg\",\"service_tax\":\"44\",\"service_contract_period\":\"4334\",\"service_vat\":\"4\",\"id\":-1}]', '2023-08-17 07:59:45', 1),
(3873, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"tt\",\"service_tax\":\"5\",\"service_vat\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-17 08:02:41', 1),
(3874, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"uyjghj\",\"service_vat\":\"7\",\"service_tax\":\"788\",\"service_contract_period\":\"777\",\"id\":-1}]', '2023-08-17 08:45:42', 1),
(3875, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"12\",\"id\":-1}]', '2023-08-17 08:46:29', 1),
(3876, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"56\",\"expense_configs\":\"65\",\"expense_currency\":\"1\",\"services_id\":\"65\",\"id\":-1}]', '2023-08-17 14:01:54', 1),
(3877, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"54\",\"service_tax\":\"5\",\"service_vat\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-17 14:07:35', 1),
(3878, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"54\",\"service_tax\":\"5\",\"service_vat\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-17 14:08:10', 1),
(3879, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"54\",\"service_tax\":\"5\",\"service_vat\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-17 14:09:21', 1);
INSERT INTO `logs` (`id`, `user_id`, `log_url`, `log_changes`, `stat_created`, `rec_state`) VALUES
(3880, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"6565\",\"service_vat\":\"5\",\"service_tax\":\"55\",\"service_contract_period\":\"564\",\"id\":-1}]', '2023-08-17 14:09:45', 1),
(3881, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/8\",\"Packages\",\"update\",\"8\"]', '[{\"package_price\":null}, {\"package_price\":\"898\"}]', '2023-08-17 14:50:40', 1),
(3882, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"67\",\"expense_currency\":\"1\",\"expense_configs\":\"4434gthg\",\"services_id\":\"65\",\"id\":-1}]', '2023-08-17 14:51:21', 1),
(3883, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-18 07:11:32', 1),
(3884, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/24\",\"Expenses\",\"update\",\"24\"]', '[{\"expense_currency\":1}, {\"expense_currency\":\"2\"}]', '2023-08-18 07:55:59', 1),
(3885, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"expense_amount\":\"5\",\"expense_configs\":\"5tythg\",\"expense_currency\":\"1\",\"services_id\":\"56\",\"id\":-1}]', '2023-08-18 07:56:18', 1),
(3886, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"54\",\"expense_configs\":\"htghg\",\"expense_type\":\"1\",\"expense_currency\":\"1\",\"services_id\":\"54\",\"id\":-1}]', '2023-08-18 07:56:53', 1),
(3887, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/26\",\"Expenses\",\"update\",\"26\"]', '[{\"expense_configs\":\"htghg\"}, {\"expense_configs\":\"aqqqqqqqq\"}]', '2023-08-18 07:59:34', 1),
(3888, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/26\",\"Expenses\",\"update\",\"26\"]', '[{\"expense_amount\":54}, {\"expense_amount\":\"5476\"}]', '2023-08-18 07:59:42', 1),
(3889, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"gf\",\"service_vat\":\"4\",\"service_contract_period\":\"4\",\"service_tax\":\"4\",\"id\":-1}]', '2023-08-18 08:20:04', 1),
(3890, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"dfawdgfh\",\"service_vat\":\"45\",\"service_contract_period\":\"45\",\"id\":-1}]', '2023-08-18 08:22:00', 1),
(3891, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"dfawdgfh\",\"service_vat\":\"45\",\"service_contract_period\":\"45\",\"service_tax\":\"54\",\"id\":-1}]', '2023-08-18 08:22:03', 1),
(3892, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"jkhbhj\",\"service_vat\":\"677\",\"service_tax\":\"576\",\"service_contract_period\":\"576\",\"id\":-1}]', '2023-08-18 08:22:56', 1),
(3893, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 08:23:02', 1),
(3894, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"43\",\"service_vat\":\"434\",\"service_contract_period\":\"43\",\"service_tax\":\"34\",\"id\":-1}]', '2023-08-18 09:15:17', 1),
(3895, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"11\",\"service_desc\":\"43\",\"service_vat\":\"434\",\"service_contract_period\":\"43\",\"service_tax\":\"34\",\"id\":-1}]', '2023-08-18 09:15:19', 1),
(3896, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"trtyr\",\"service_vat\":\"45\",\"service_contract_period\":\"45\",\"service_tax\":\"45\",\"id\":-1}]', '2023-08-18 09:15:37', 1),
(3897, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"T\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"4\",\"id\":-1}]', '2023-08-18 10:51:17', 1),
(3898, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"expense_amount\":\"09\",\"expense_configs\":\"0*ppoş\",\"expense_currency\":\"1\",\"services_id\":\"879\",\"id\":-1}]', '2023-08-18 11:40:14', 1),
(3899, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"7\",\"service_desc\":\"hjk\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-18 11:40:55', 1),
(3900, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"jhk\",\"package_desc\":\"kjj\",\"package_currency\":\"1\",\"package_price\":\"7\",\"package_period\":\"7867\",\"id\":-1}]', '2023-08-18 11:41:18', 1),
(3901, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/-1\",\"Banks\",\"save_new\",\"-1\"]', '[{\"bank_ownername\":\"uııkuı\",\"bank_name\":\"ıuu\",\"bank_number\":\"787\",\"bank_expiredate\":\"878\",\"bank_swift\":\"878\",\"bank_cvv\":\"87\",\"id\":-1}]', '2023-08-18 11:41:49', 1),
(3902, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"78\",\"service_vat\":\"7\",\"service_tax\":\"7\",\"service_contract_period\":\"7\",\"id\":-1}]', '2023-08-18 11:42:32', 1),
(3903, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"hgj\",\"service_vat\":\"67\",\"service_tax\":\"65\",\"service_contract_period\":\"65\",\"id\":-1}]', '2023-08-18 11:43:08', 1),
(3904, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/3\",\"Packages\",\"update\",\"3\"]', '[{\"package_desc\":\"tyrty\"}, {\"package_desc\":\"qqqqqqqqq\"}]', '2023-08-18 11:44:14', 1),
(3905, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/5\",\"Banks\",\"update\",\"5\"]', '[{\"bank_ownername\":\"uııkuı\"}, {\"bank_ownername\":\"qqqqqqqqqq\"}]', '2023-08-18 11:44:23', 1),
(3906, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"7\",\"service_id\":\"6\",\"id\":-1}]', '2023-08-18 11:46:41', 1),
(3907, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"7\",\"service_id\":\"7\",\"id\":-1}]', '2023-08-18 11:47:26', 1),
(3908, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"7\",\"service_id\":\"7\",\"id\":-1}]', '2023-08-18 11:47:42', 1),
(3909, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"6\",\"service_id\":\"6\",\"id\":-1}]', '2023-08-18 11:48:09', 1),
(3910, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"6\",\"service_id\":\"6\",\"id\":-1}]', '2023-08-18 11:50:38', 1),
(3911, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"4\",\"service_id\":\"4\",\"id\":-1}]', '2023-08-18 11:51:19', 1),
(3912, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"5\",\"service_id\":\"5\",\"inspect_desc\":\"tt\",\"id\":-1}]', '2023-08-18 11:52:01', 1),
(3913, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"5\",\"service_id\":\"5\",\"inspect_desc\":\"ghg\",\"id\":-1}]', '2023-08-18 11:52:12', 1),
(3914, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:00:56', 1),
(3915, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:00:58', 1),
(3916, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:00:59', 1),
(3917, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:01:06', 1),
(3918, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:01:10', 1),
(3919, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:01:17', 1),
(3920, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:02:07', 1),
(3921, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:03:17', 1),
(3922, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:03:18', 1),
(3923, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:06:04', 1),
(3924, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:09:52', 1),
(3925, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:13:08', 1),
(3926, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:13:09', 1),
(3927, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:13:10', 1),
(3928, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:13:10', 1),
(3929, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:13:40', 1),
(3930, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-18 12:14:31', 1),
(3931, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"56\",\"expense_currency\":\"2\",\"expense_configs\":\"hdfgh\",\"services_id\":\"304\",\"id\":-1}]', '2023-08-18 14:02:14', 1),
(3932, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"11\",\"owner_id\":\"8\",\"service_desc\":\"thfghg\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-18 15:02:12', 1),
(3933, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:43', 1),
(3934, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:44', 1),
(3935, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:45', 1),
(3936, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:45', 1),
(3937, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"10\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:45', 1),
(3938, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"8\",\"service_desc\":\"tr\",\"service_vat\":\"434\",\"service_contract_period\":\"4\",\"service_tax\":\"4334\",\"id\":-1}]', '2023-08-18 15:15:51', 1),
(3939, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"tenant_id\":\"13\",\"owner_id\":\"8\",\"service_desc\":\"gh\",\"service_vat\":\"5\",\"service_tax\":\"5\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-18 15:16:03', 1),
(3940, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-21 06:56:15', 1),
(3941, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"54\",\"expense_currency\":\"4\",\"expense_configs\":\"ngfb\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-21 07:52:02', 1),
(3942, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"owner_id\":10,\"expense_amount\":23}, {\"owner_id\":\"8\",\"expense_amount\":\"34243243342\"}]', '2023-08-21 07:52:21', 1),
(3943, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"56\",\"expense_type\":\"1\",\"expense_currency\":\"3\",\"expense_configs\":\"ty\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-21 08:52:51', 1),
(3944, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"56\",\"service_vat\":\"65\",\"service_tax\":\"65\",\"service_contract_period\":\"5\",\"id\":-1}]', '2023-08-21 09:05:19', 1),
(3945, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_desc\":\"dgxfjhnhg fsdvfdlçkgfdlsaşmkv vdfsşlikgfdsşlkgdfgfdlş gfdfgfşldkkfhşlgdi\",\"service_vat\":\"54\",\"service_tax\":\"45\",\"service_contract_period\":\"50\",\"id\":-1}]', '2023-08-21 13:47:17', 1),
(3946, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"789\",\"expense_currency\":\"4\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-21 15:18:33', 1),
(3947, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-22 06:40:08', 1),
(3948, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"45\",\"expense_currency\":\"4\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-22 06:41:58', 1),
(3949, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/35\",\"Expenses\",\"update\",\"35\"]', '[{\"user_fullname\":\"osama\",\"id\":14}, {\"user_fullname\":\"\",\"id\":\"35\"}]', '2023-08-22 06:43:48', 1),
(3950, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/35\",\"Expenses\",\"update\",\"35\"]', '[{\"expense_amount\":45,\"owner\":\"object\",\"owner_id\":10}, {\"expense_amount\":\"4598\",\"owner\":\"object\",\"owner_id\":\"10\"}]', '2023-08-22 06:43:48', 1),
(3951, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/35\",\"Expenses\",\"update\",\"35\"]', '[{\"user_fullname\":\"osama\",\"id\":15}, {\"user_fullname\":\"\",\"id\":\"35\"}]', '2023-08-22 06:43:59', 1),
(3952, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/35\",\"Expenses\",\"update\",\"35\"]', '[{\"owner_id\":14,\"expense_amount\":4598,\"owner\":\"object\"}, {\"owner_id\":\"8\",\"expense_amount\":\"1231212121\",\"owner\":\"object\"}]', '2023-08-22 06:43:59', 1),
(3953, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"user_fullname\":\"www\",\"id\":16}, {\"user_fullname\":\"\",\"id\":\"33\"}]', '2023-08-22 06:44:11', 1),
(3954, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"owner_id\":8,\"expense_amount\":56,\"owner\":\"object\"}, {\"owner_id\":\"12\",\"expense_amount\":\"567\",\"owner\":\"object\"}]', '2023-08-22 06:44:11', 1),
(3955, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"user_fullname\":\"www\",\"id\":17}, {\"user_fullname\":\"\",\"id\":\"33\"}]', '2023-08-22 06:44:23', 1),
(3956, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"owner_id\":16,\"expense_amount\":567,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"expense_amount\":\"5677777\",\"owner\":\"object\"}]', '2023-08-22 06:44:23', 1),
(3957, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"user_fullname\":\"www\",\"id\":18}, {\"user_fullname\":\"\",\"id\":\"33\"}]', '2023-08-22 06:44:32', 1),
(3958, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"owner_id\":17,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"owner\":\"object\"}]', '2023-08-22 06:44:32', 1),
(3959, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"user_fullname\":\"www\",\"id\":19}, {\"user_fullname\":\"\",\"id\":\"33\"}]', '2023-08-22 06:45:36', 1),
(3960, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/33\",\"Expenses\",\"update\",\"33\"]', '[{\"owner_id\":18,\"expense_amount\":5677777,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"expense_amount\":\"567777789888\",\"owner\":\"object\"}]', '2023-08-22 06:45:36', 1),
(3961, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/30\",\"Expenses\",\"update\",\"30\"]', '[{\"user_fullname\":\"ahmet\",\"id\":20}, {\"user_fullname\":\"\",\"id\":\"30\"}]', '2023-08-22 06:45:51', 1),
(3962, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/30\",\"Expenses\",\"update\",\"30\"]', '[{\"owner_id\":12,\"expense_amount\":32,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"expense_amount\":\"121212121\",\"owner\":\"object\"}]', '2023-08-22 06:45:51', 1),
(3963, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-22 07:07:50', 1),
(3964, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-22 07:07:51', 1),
(3965, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"expense_amount\":\"65\",\"expense_currency\":\"4\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-22 08:22:03', 1),
(3966, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/38\",\"Expenses\",\"update\",\"38\"]', '[{\"user_fullname\":\"www\",\"id\":21}, {\"user_fullname\":\"\",\"id\":\"38\"}]', '2023-08-22 08:25:07', 1),
(3967, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/38\",\"Expenses\",\"update\",\"38\"]', '[{\"expense_amount\":65,\"owner\":\"object\",\"owner_id\":8}, {\"expense_amount\":\"1111111111111111111111\",\"owner\":\"object\",\"owner_id\":\"8\"}]', '2023-08-22 08:25:07', 1),
(3968, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/38\",\"Expenses\",\"update\",\"38\"]', '[{\"user_fullname\":\"www\",\"id\":22}, {\"user_fullname\":\"\",\"id\":\"38\"}]', '2023-08-22 08:25:19', 1),
(3969, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/38\",\"Expenses\",\"update\",\"38\"]', '[{\"owner_id\":21,\"expense_amount\":2147483647,\"owner\":\"object\"}, {\"owner_id\":\"12\",\"expense_amount\":\"1111111111111111111111111\",\"owner\":\"object\"}]', '2023-08-22 08:25:19', 1),
(3970, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"43\",\"expense_currency\":\"1\",\"owner_id\":\"12\",\"id\":-1}]', '2023-08-22 08:37:25', 1),
(3971, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":null}, {\"owner\":\"object\"}]', '2023-08-22 08:48:59', 1),
(3972, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"owner_id\":\"12\",\"expense_amount\":\"12\",\"expense_currency\":\"3\",\"id\":-1}]', '2023-08-22 08:51:30', 1),
(3973, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"user_fullname\":\"ahmet\",\"id\":23}, {\"user_fullname\":\"\",\"id\":\"40\"}]', '2023-08-22 08:52:53', 1),
(3974, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"owner\":\"object\",\"owner_id\":12}, {\"owner\":\"object\",\"owner_id\":\"12\"}]', '2023-08-22 08:52:53', 1),
(3975, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"owner_id\":23,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"owner\":\"object\"}]', '2023-08-22 08:55:35', 1),
(3976, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"expense_amount\":12,\"owner\":\"object\"}, {\"expense_amount\":\"1211111111\",\"owner\":\"object\"}]', '2023-08-22 08:56:06', 1),
(3977, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"owner_id\":8,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"owner\":\"object\"}]', '2023-08-22 08:56:38', 1),
(3978, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"expense_amount\":1211111111,\"owner\":\"object\"}, {\"expense_amount\":\"1\",\"owner\":\"object\"}]', '2023-08-22 08:58:26', 1),
(3979, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"expense_amount\":43,\"owner\":\"object\"}, {\"expense_amount\":\"2\",\"owner\":\"object\"}]', '2023-08-22 08:58:34', 1),
(3980, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"expense_amount\":789,\"owner\":\"object\"}, {\"expense_amount\":\"3\",\"owner\":\"object\"}]', '2023-08-22 08:58:39', 1),
(3981, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"expense_amount\":2147483647,\"owner\":\"object\"}, {\"expense_amount\":\"43\",\"owner\":\"object\"}]', '2023-08-22 08:58:49', 1),
(3982, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"expense_amount\":2,\"owner\":\"object\"}, {\"expense_amount\":\"267\",\"owner\":\"object\"}]', '2023-08-22 09:00:15', 1),
(3983, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"expense_amount\":3,\"owner\":\"object\"}, {\"expense_amount\":\"36\",\"owner\":\"object\"}]', '2023-08-22 09:00:24', 1),
(3984, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"expense_amount\":1,\"owner\":\"object\"}, {\"expense_amount\":\"16\",\"owner\":\"object\"}]', '2023-08-22 09:00:31', 1),
(3985, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/8\",\"Packages\",\"update\",\"8\"]', '[{\"package_currency\":3}, {\"package_currency\":\"1\"}]', '2023-08-22 09:09:26', 1),
(3986, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/8\",\"Packages\",\"update\",\"8\"]', '[{\"package_currency\":1}, {\"package_currency\":\"2\"}]', '2023-08-22 09:35:15', 1),
(3987, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/5\",\"Packages\",\"update\",\"5\"]', '[{\"package_price\":30}, {\"package_price\":\"300\"}]', '2023-08-22 09:38:50', 1),
(3988, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/5\",\"Banks\",\"update\",\"5\"]', '[{\"bank_name\":\"ıuu\"}, {\"bank_name\":\"aaaaaa\"}]', '2023-08-22 09:39:19', 1),
(3989, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/-1\",\"Banks\",\"save_new\",\"-1\"]', '[{\"bank_ownername\":\"gh\",\"bank_name\":\"hgf\",\"bank_number\":\"1221122121212112\",\"id\":-1}]', '2023-08-22 09:41:01', 1),
(3990, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 11:40:50', 1),
(3991, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"expense_type\":1,\"owner\":\"object\"}, {\"expense_type\":\"2\",\"owner\":\"object\"}]', '2023-08-22 11:48:54', 1),
(3992, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 12:16:56', 1),
(3993, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 12:17:01', 1),
(3994, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 12:17:13', 1),
(3995, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"657\",\"expense_currency\":\"1\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-22 12:54:54', 1),
(3996, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"expense_amount\":\"56\",\"expense_currency\":\"1\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-22 12:55:15', 1),
(3997, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"879\",\"expense_currency\":\"4\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-22 12:57:28', 1),
(3998, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"78\",\"expense_type\":\"2\",\"expense_currency\":\"1\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-22 12:58:21', 1),
(3999, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"9090\",\"expense_currency\":\"1\",\"owner_id\":\"12\",\"id\":-1}]', '2023-08-22 13:01:25', 1),
(4000, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 13:01:51', 1),
(4001, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 13:01:57', 1),
(4002, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 13:02:08', 1),
(4003, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"owner_id\":10,\"owner\":\"object\"}, {\"owner_id\":\"8\",\"owner\":\"object\"}]', '2023-08-22 13:02:42', 1),
(4004, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"expense_currency\":3,\"owner\":\"object\"}, {\"expense_currency\":\"2\",\"owner\":\"object\"}]', '2023-08-22 13:02:47', 1),
(4005, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"expense_amount\":43,\"owner\":\"object\"}, {\"expense_amount\":\"430909\",\"owner\":\"object\"}]', '2023-08-22 13:02:52', 1),
(4006, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-22 13:02:58', 1),
(4007, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/40\",\"Expenses\",\"update\",\"40\"]', '[{\"expense_description\":\"gfd\",\"owner\":\"object\"}, {\"expense_description\":\"aaaaaaaaaaaaaaa\",\"owner\":\"object\"}]', '2023-08-22 13:04:31', 1),
(4008, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"7676\",\"expense_type\":\"2\",\"expense_currency\":\"1\",\"expense_description\":\"hgjkhkjhkl\",\"category_id\":\"5\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-22 13:04:47', 1),
(4009, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/39\",\"Expenses\",\"update\",\"39\"]', '[{\"expense_description\":\"gf\",\"owner\":\"object\"}, {\"expense_description\":\"gf6786787989\",\"owner\":\"object\"}]', '2023-08-22 13:11:41', 1),
(4010, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"category_id\":null,\"owner\":\"object\"}, {\"category_id\":\"8\",\"owner\":\"object\"}]', '2023-08-22 13:11:45', 1),
(4011, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/46\",\"Expenses\",\"update\",\"46\"]', '[{\"category_id\":5,\"owner\":\"object\"}, {\"category_id\":\"8\",\"owner\":\"object\"}]', '2023-08-22 14:50:59', 1),
(4012, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/34\",\"Expenses\",\"update\",\"34\"]', '[{\"expense_description\":\"gfd\",\"owner\":\"object\"}, {\"expense_description\":\"gfdoıoı\",\"owner\":\"object\"}]', '2023-08-22 14:53:42', 1),
(4013, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-23 07:02:56', 1),
(4014, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/31\",\"Expenses\",\"update\",\"31\"]', '[{\"expense_amount\":430909,\"owner\":\"object\"}, {\"expense_amount\":\"43\",\"owner\":\"object\"}]', '2023-08-23 07:04:23', 1),
(4015, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/7\",\"Packages\",\"update\",\"7\"]', '[{\"package_name\":\"fire insurance\"}, {\"package_name\":\"Leasing Exclusive PM\"}]', '2023-08-23 09:19:25', 1),
(4016, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"spec_house_paintt\":true,\"spec_house_paint\":\"nmöm\",\"id\":-1}]', '2023-08-23 12:31:34', 1),
(4017, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"10\",\"category_name\":\"gas bill\",\"id\":-1}]', '2023-08-23 13:22:30', 1),
(4018, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"elctrıc\",\"id\":-1}]', '2023-08-23 13:24:57', 1),
(4019, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"10\",\"category_name\":\"elektirkf\",\"language_id\":\"2\",\"id\":-1}]', '2023-08-23 14:02:12', 1),
(4020, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"14\",\"id\":-1}]', '2023-08-23 14:03:41', 1),
(4021, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"65\",\"expense_currency\":\"4\",\"expense_description\":\"jhjjh\",\"category_id\":\"12\",\"id\":-1}]', '2023-08-23 14:09:42', 1),
(4022, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"12\",\"category_name\":\"water bill\",\"id\":-1}]', '2023-08-23 14:10:04', 1),
(4023, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"10\",\"category_name\":\"water bill\",\"id\":-1}]', '2023-08-23 14:10:41', 1),
(4024, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"category_id\":\"12\",\"expense_amount\":\"564\",\"expense_currency\":\"1\",\"expense_description\":\"ghjf\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-23 14:10:56', 1),
(4025, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"expense_currency\":\"1\",\"category_id\":\"16\",\"expense_amount\":\"65\",\"expense_description\":\"tyjjy\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-23 14:11:08', 1),
(4026, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"category_id\":16,\"owner\":\"object\"}, {\"category_id\":\"14\",\"owner\":\"object\"}]', '2023-08-23 14:11:26', 1),
(4027, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/49\",\"Expenses\",\"update\",\"49\"]', '[{\"owner_id\":10,\"owner\":\"object\"}, {\"owner_id\":\"8\",\"owner\":\"object\"}]', '2023-08-23 14:14:38', 1),
(4028, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/5\",\"Packages\",\"update\",\"5\"]', '[{\"package_desc\":\"fgfdhgh\"}, {\"package_desc\":\"aaaaaaa\"}]', '2023-08-23 14:20:43', 1),
(4029, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/6\",\"Packages\",\"update\",\"6\"]', '[{\"package_desc\":\"ttytyt\"}, {\"package_desc\":\"aaaaaaaaa\"}]', '2023-08-23 14:20:50', 1),
(4030, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"paınt\",\"language_id\":\"2\",\"id\":-1}]', '2023-08-23 15:00:40', 1),
(4031, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"yhtr5thrnr\",\"id\":-1}]', '2023-08-23 15:02:34', 1),
(4032, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"aasdasd\",\"language_id\":\"1\",\"id\":-1}]', '2023-08-23 15:05:46', 1),
(4033, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"asdasd\",\"parent_id\":10,\"id\":-1}]', '2023-08-23 15:07:57', 1),
(4034, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-24 07:21:57', 1),
(4035, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_type\":2,\"owner\":\"object\"}, {\"expense_type\":\"1\",\"owner\":\"object\"}]', '2023-08-24 08:32:06', 1),
(4036, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_type\":1,\"owner\":\"object\"}, {\"expense_type\":\"2\",\"owner\":\"object\"}]', '2023-08-24 08:32:11', 1),
(4037, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_amount\":65,\"owner\":\"object\"}, {\"expense_amount\":\"11\",\"owner\":\"object\"}]', '2023-08-24 08:32:18', 1),
(4038, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_currency\":1,\"owner\":\"object\"}, {\"expense_currency\":\"3\",\"owner\":\"object\"}]', '2023-08-24 08:32:23', 1),
(4039, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_description\":\"tyjjy\",\"owner\":\"object\"}, {\"expense_description\":\"a\",\"owner\":\"object\"}]', '2023-08-24 08:32:30', 1),
(4040, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner_id\":10,\"owner\":\"object\"}, {\"owner_id\":\"8\",\"owner\":\"object\"}]', '2023-08-24 08:32:38', 1),
(4041, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner_id\":8,\"owner\":\"object\"}, {\"owner_id\":\"10\",\"owner\":\"object\"}]', '2023-08-24 08:32:41', 1),
(4042, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:32:46', 1),
(4043, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:32:52', 1),
(4044, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/49\",\"Expenses\",\"update\",\"49\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:32:59', 1),
(4045, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:33:07', 1),
(4046, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/49\",\"Expenses\",\"update\",\"49\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:35:38', 1),
(4047, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:35:51', 1),
(4048, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:36:21', 1),
(4049, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-24 08:36:22', 1),
(4050, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_description\":\"a\",\"owner\":\"object\"}, {\"expense_description\":\"aaaa\",\"owner\":\"object\"}]', '2023-08-24 08:41:33', 1),
(4051, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_amount\":11,\"owner\":\"object\"}, {\"expense_amount\":\"111111\",\"owner\":\"object\"}]', '2023-08-24 08:41:46', 1),
(4052, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner_id\":10,\"owner\":\"object\"}, {\"owner_id\":\"8\",\"owner\":\"object\"}]', '2023-08-24 08:42:00', 1),
(4053, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"expense_type\":2,\"owner\":\"object\"}, {\"expense_type\":\"1\",\"owner\":\"object\"}]', '2023-08-24 08:42:08', 1),
(4054, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:42:25', 1),
(4055, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"111\",\"expense_currency\":\"1\",\"expense_description\":\"fdggfhh\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 08:44:23', 1),
(4056, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\",\"category\":null}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 08:46:33', 1),
(4057, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"778\",\"expense_type\":\"1\",\"expense_currency\":\"1\",\"expense_description\":\"kjhu\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 08:46:44', 1),
(4058, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:47:56', 1),
(4059, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:48:10', 1),
(4060, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"5646\",\"expense_description\":\"nhgh\",\"owner_id\":\"10\",\"expense_currency\":\"4\",\"id\":-1}]', '2023-08-24 08:48:31', 1),
(4061, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\",\"category\":null}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 08:50:30', 1),
(4062, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:51:19', 1),
(4063, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/54\",\"Expenses\",\"update\",\"54\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:52:40', 1),
(4064, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\"}, {\"owner\":\"object\"}]', '2023-08-24 08:54:51', 1),
(4065, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 09:01:03', 1),
(4066, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_desc\":\"bhj\",\"package_name\":\"tyyt\",\"id\":-1}]', '2023-08-24 09:05:25', 1),
(4067, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/7\",\"Packages\",\"update\",\"7\"]', '[{\"package_cpi\":3}, {\"package_cpi\":\"4\"}]', '2023-08-24 09:05:35', 1),
(4068, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/banks/save/-1\",\"Banks\",\"save_new\",\"-1\"]', '[{\"bank_ownername\":\"yu\",\"bank_name\":\"uyıu\",\"bank_number\":\"1221212121212121\",\"id\":-1}]', '2023-08-24 09:05:57', 1),
(4069, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"jhh\",\"id\":-1}]', '2023-08-24 09:08:01', 1),
(4070, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 09:08:56', 1),
(4071, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/-1\",\"Packages\",\"save_new\",\"-1\"]', '[{\"package_name\":\"ghg\",\"package_desc\":\"gh\",\"id\":-1}]', '2023-08-24 09:09:51', 1),
(4072, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/packages/save/15\",\"Packages\",\"update\",\"15\"]', '[{\"package_name\":\"ghg\"}, {\"package_name\":\"aa\"}]', '2023-08-24 09:09:55', 1),
(4073, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"765\",\"expense_currency\":\"4\",\"expense_description\":\"jhg\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 09:14:23', 1),
(4074, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"package_id\":\"5\",\"tenant_id\":\"13\",\"id\":-1}]', '2023-08-24 09:15:29', 1),
(4075, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"65\",\"expense_currency\":\"3\",\"expense_description\":\"hj\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-24 09:23:29', 1),
(4076, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-24 09:24:00', 1),
(4077, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"54\",\"expense_currency\":\"1\",\"expense_description\":\"gf\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-24 09:25:26', 1),
(4078, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"55\",\"expense_currency\":\"1\",\"expense_description\":\"hgg\",\"owner_id\":\"8\",\"id\":-1}]', '2023-08-24 09:27:02', 1),
(4079, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"fgfg\",\"password\":\"gf\",\"user_configs\":{\"mobile\":\"54\"},\"email\":\"abc@gmail.com\",\"user_role\":\"user.tenant\",\"id\":-1}]', '2023-08-24 09:31:20', 1),
(4080, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\",\"category\":\"object\"}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 09:34:29', 1),
(4081, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\",\"category\":\"object\"}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 09:34:34', 1),
(4082, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"owner\":\"object\",\"category\":\"object\"}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 09:35:09', 1),
(4083, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"5\",\"expense_currency\":\"4\",\"expense_description\":\"gf\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-24 09:36:42', 1),
(4084, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"id\":-1}]', '2023-08-24 09:41:21', 1),
(4085, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"8\",\"tenant_id\":\"7\",\"service_vat\":\"65\",\"service_tax\":\"65\",\"package_id\":\"6\",\"id\":-1}]', '2023-08-24 09:44:06', 1),
(4086, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"owner_id\":8,\"tenant_id\":7,\"service_desc\":null,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"owner_id\":\"10\",\"tenant_id\":\"13\",\"service_desc\":\"dsf sdf ds fds fsdf sd\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 10:35:31', 1),
(4087, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 10:36:37', 1);
INSERT INTO `logs` (`id`, `user_id`, `log_url`, `log_changes`, `stat_created`, `rec_state`) VALUES
(4088, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/61\",\"Expenses\",\"update\",\"61\"]', '[{\"owner\":null,\"category\":null}, {\"owner\":\"\",\"category\":\"\"}]', '2023-08-24 10:41:01', 1),
(4089, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/61\",\"Expenses\",\"update\",\"61\"]', '[{\"owner\":null,\"category\":null}, {\"owner\":\"\",\"category\":\"\"}]', '2023-08-24 10:41:14', 1),
(4090, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/59\",\"Expenses\",\"update\",\"59\"]', '[{\"owner\":\"object\",\"category\":\"object\"}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 10:57:49', 1),
(4091, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_amount\":\"76\",\"expense_type\":\"2\",\"id\":-1}]', '2023-08-24 10:58:42', 1),
(4092, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"package_id\":6,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package_id\":\"5\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 10:58:53', 1),
(4093, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"package_id\":5,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package_id\":\"6\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 10:59:01', 1),
(4094, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/59\",\"Expenses\",\"update\",\"59\"]', '[{\"owner\":\"object\",\"category\":\"object\"}, {\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 11:00:05', 1),
(4095, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"2\",\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:00:40', 1),
(4096, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/59\",\"Expenses\",\"update\",\"59\"]', '[{\"category_id\":16,\"owner\":\"object\",\"category\":\"object\"}, {\"category_id\":\"elektirkf\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 11:00:46', 1),
(4097, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/63\",\"Expenses\",\"update\",\"63\"]', '[{\"owner\":null,\"category\":null}, {\"owner\":\"\",\"category\":\"\"}]', '2023-08-24 11:01:19', 1),
(4098, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_currency\":\"2\",\"id\":-1}]', '2023-08-24 11:01:26', 1),
(4099, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/50\",\"Expenses\",\"update\",\"50\"]', '[{\"category_id\":14,\"owner\":\"object\",\"category\":\"object\"}, {\"category_id\":\"elektirkf\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 11:02:29', 1),
(4100, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:02:45', 1),
(4101, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"service_tax\":65,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_tax\":\"1111\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 11:04:27', 1),
(4102, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"package_id\":6,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package_id\":\"5\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 11:04:37', 1),
(4103, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"service_tax\":127,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_tax\":\"11\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 11:04:46', 1),
(4104, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"tyhhyy\",\"email\":\"nalan@gmail.com\",\"password\":\"32542546 \",\"user_configs\":{\"mobile\":\"53454356454\"},\"user_role\":\"user.landlord\",\"id\":-1}]', '2023-08-24 11:12:46', 1),
(4105, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"hgnjhg\",\"email\":\"kkkkk@gmail.com\",\"password\":\"rertetr\",\"user_configs\":{\"mobile\":\"44398\"},\"user_role\":\"user.landlord\",\"id\":-1}]', '2023-08-24 11:14:30', 1),
(4106, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"ali\",\"email\":\"sahad@gmail.com\",\"password\":\"*945856*4\",\"user_configs\":{\"mobile\":\"4530095\",\"address\":\"ghrtdfspoşkhgof\"},\"user_role\":\"user.landlord\",\"id\":-1}]', '2023-08-24 11:16:27', 1),
(4107, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:23:20', 1),
(4108, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:34:01', 1),
(4109, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"add_client\",\"id\":-1}]', '2023-08-24 11:35:04', 1),
(4110, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:43:36', 1),
(4111, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"5rr55fdfd\",\"email\":\"cetin@gmail.com\",\"password\":\"5434\",\"user_configs\":{\"mobile\":\"5345435454\"},\"user_role\":\"user.tenant\",\"id\":-1}]', '2023-08-24 11:51:20', 1),
(4112, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:52:42', 1),
(4113, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"gas bill\",\"id\":-1}]', '2023-08-24 11:52:54', 1),
(4114, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"add_client\",\"expense_type\":\"1\",\"id\":-1}]', '2023-08-24 11:53:24', 1),
(4115, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"12\",\"id\":-1}]', '2023-08-24 11:56:11', 1),
(4116, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"category_id\":\"12\",\"id\":-1}]', '2023-08-24 11:56:37', 1),
(4117, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"65\",\"expense_currency\":\"2\",\"expense_description\":\"hyfhgfh\",\"category_id\":\"14\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-24 11:57:36', 1),
(4118, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"65\",\"expense_currency\":\"1\",\"expense_description\":\"hftshgf\",\"owner_id\":\"10\",\"category_id\":\"12\",\"id\":-1}]', '2023-08-24 12:54:43', 1),
(4119, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"54\",\"expense_currency\":\"1\",\"expense_description\":\"grdfgf\",\"owner_id\":\"8\",\"category_id\":\"add_client\",\"id\":-1}]', '2023-08-24 12:54:53', 1),
(4120, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"category_id\":12,\"owner\":\"object\",\"category\":\"object\"}, {\"category_id\":\"14\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-24 12:57:00', 1),
(4121, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/328\",\"Services\",\"update\",\"328\"]', '[{\"package_id\":5,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package_id\":\"7\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 12:57:43', 1),
(4122, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"service_desc\":\"ffgfdg\",\"tenant_id\":\"11\",\"service_vat\":\"34\",\"service_tax\":\"34\",\"service_contract_period\":\"43\",\"package_id\":\"6\",\"id\":-1}]', '2023-08-24 12:58:03', 1),
(4123, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"inspect_rate\",\"id\":-1}]', '2023-08-24 13:34:34', 1),
(4124, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"cleaning\",\"parent_id\":\"21\",\"id\":-1}]', '2023-08-24 13:34:52', 1),
(4125, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"boya\",\"parent_id\":\"21\",\"id\":-1}]', '2023-08-24 13:35:03', 1),
(4126, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"furniture\",\"parent_id\":\"22\",\"id\":-1}]', '2023-08-24 13:35:10', 1),
(4127, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"parent_id\":\"21\",\"category_name\":\"furniture\",\"id\":-1}]', '2023-08-24 13:35:38', 1),
(4128, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/users/save/-1\",\"Users\",\"save_new\",\"-1\"]', '[{\"user_fullname\":\"retgdfgrd\",\"email\":\"kkaa@gmail.com\",\"user_role\":\"user.tenant\",\"password\":\"7657676\",\"id\":-1}]', '2023-08-24 14:39:26', 1),
(4129, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/329\",\"Services\",\"update\",\"329\"]', '[{\"service_vat\":34,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_vat\":\"24\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-24 14:40:12', 1),
(4130, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-25 06:45:22', 1),
(4131, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-25 07:29:24', 1),
(4132, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_vat\":\"11\",\"service_tax\":\"11\",\"service_desc\":\"services\",\"service_contract_period\":\"34\",\"package_id\":\"5\",\"property_id\":\"4\",\"id\":-1}]', '2023-08-25 08:24:15', 1),
(4133, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:24:38', 1),
(4134, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:24:56', 1),
(4135, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:25:05', 1),
(4136, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package_id\":5,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package_id\":\"6\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:25:12', 1),
(4137, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"owner_id\":10,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"owner_id\":\"8\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:25:17', 1),
(4138, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"service_contract_period\":34,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_contract_period\":\"444\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:25:22', 1),
(4139, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"service_contract_period\":444,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_contract_period\":\"44400\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:26:20', 1),
(4140, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-25 08:26:21', 1),
(4141, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"service_contract_period\":32767,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_contract_period\":\"22222\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:26:45', 1),
(4142, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:26:52', 1),
(4143, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:26:57', 1),
(4144, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:27:41', 1),
(4145, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:28:28', 1),
(4146, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:28:47', 1),
(4147, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:29:19', 1),
(4148, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:29:32', 1),
(4149, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 08:29:51', 1),
(4150, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_currency\":1,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_currency\":\"3\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-25 08:31:08', 1),
(4151, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_currency\":3,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_currency\":\"1\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-25 08:31:14', 1),
(4152, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_currency\":1,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_currency\":\"4\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-25 08:31:20', 1),
(4153, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"option1\":true,\"option2\":false,\"option3\":true,\"user_id\":\"5\",\"service_id\":\"4\",\"inspect_desc\":\"ajkasj kjdslşkd\",\"id\":-1}]', '2023-08-25 08:38:37', 1),
(4154, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"window\":\"1\",\"id\":-1}]', '2023-08-25 08:57:38', 1),
(4155, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"window\":\"1\",\"furniture\":\"1\",\"id\":-1}]', '2023-08-25 09:20:50', 1),
(4156, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"furniture\":\"1\",\"id\":-1}]', '2023-08-25 09:22:45', 1),
(4157, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"furniture\":\"1\",\"id\":-1}]', '2023-08-25 09:23:44', 1),
(4158, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"clean\":\"1\",\"id\":-1}]', '2023-08-25 09:23:59', 1),
(4159, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"clean\":\"1\",\"furniture\":\"1\",\"id\":-1}]', '2023-08-25 09:24:11', 1),
(4160, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"furniture\":\"1\",\"id\":-1}]', '2023-08-25 09:28:05', 1),
(4161, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"furniture\":\"1\",\"clean\":\"1\",\"id\":-1}]', '2023-08-25 09:28:38', 1),
(4162, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"service_id\":\"1\",\"user_id\":\"1\",\"inspect_desc\":\"asdsa\",\"inspect_rate\":{\"22\":true},\"id\":-1}]', '2023-08-25 11:31:07', 1),
(4163, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"22\":true,\"23\":true},\"service_id\":\"1\",\"id\":-1}]', '2023-08-25 11:32:39', 1),
(4164, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"id\":-1}]', '2023-08-25 11:32:40', 1),
(4165, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"service_id\":\"1\",\"inspect_rate\":{\"22\":true},\"id\":-1}]', '2023-08-25 11:35:07', 1),
(4166, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"service_id\":\"1\",\"user_id\":\"1\",\"inspect_desc\":\"1\",\"inspect_rate\":{\"22\":true,\"23\":true},\"id\":-1}]', '2023-08-25 11:36:02', 1),
(4167, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"8\",\"service_id\":\"8\",\"inspect_desc\":\"oilk.\",\"inspect_rate\":{\"undefined\":true},\"id\":-1}]', '2023-08-25 11:48:29', 1),
(4168, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"7\",\"service_id\":\"7\",\"inspect_desc\":\"jhk\",\"inspect_rate\":{\"undefined\":true},\"id\":-1}]', '2023-08-25 11:48:49', 1),
(4169, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"service_id\":\"6\",\"user_id\":\"6\",\"inspect_desc\":\"jh\",\"id\":-1}]', '2023-08-25 11:52:34', 1),
(4170, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-25 11:52:50', 1),
(4171, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-25 12:03:17', 1),
(4172, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/75\",\"Expenses\",\"update\",\"75\"]', '[{\"category_id\":14,\"owner\":\"object\",\"category\":\"object\"}, {\"category_id\":\"16\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-25 12:32:28', 1),
(4173, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"category_id\":14,\"owner\":\"object\",\"category\":\"object\"}, {\"category_id\":\"16\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-25 12:32:49', 1),
(4174, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/51\",\"Inspects\",\"update\",\"51\"]', '[{\"inspect_rate\":\"{\"cleaning\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-25 12:50:08', 1),
(4175, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/50\",\"Inspects\",\"update\",\"50\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-25 12:50:41', 1),
(4176, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:04:23', 1),
(4177, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:04:41', 1),
(4178, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:04:56', 1),
(4179, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"service_vat\":11,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_vat\":\"1133\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:05:13', 1),
(4180, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"service_tax\":11,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_tax\":\"1122222222222222\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:05:23', 1),
(4181, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/329\",\"Services\",\"update\",\"329\"]', '[{\"service_vat\":24,\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"service_vat\":\"33\",\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:05:43', 1),
(4182, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/330\",\"Services\",\"update\",\"330\"]', '[{\"package\":null,\"owner\":null,\"tenant\":null,\"user\":null}, {\"package\":\"object\",\"owner\":\"object\",\"tenant\":\"object\",\"user\":\"object\"}]', '2023-08-25 14:05:59', 1),
(4183, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"user_id\":\"2\",\"inspect_desc\":\"dfg\",\"service_id\":\"3\",\"id\":-1}]', '2023-08-25 14:08:40', 1),
(4184, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"4\",\"service_id\":\"4\",\"inspect_desc\":\"4rgf\",\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-25 14:09:22', 1),
(4185, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-25 14:09:30', 1),
(4186, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"furniture\":true,\"cleaning\":true,\"boya\":true},\"id\":-1}]', '2023-08-25 14:11:08', 1),
(4187, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-28 07:15:43', 1),
(4188, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"6\",\"service_id\":\"6\",\"inspect_desc\":\"hoııuploşış\",\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:20:38', 1),
(4189, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":\"1\",\"furniture\":\"1\"},\"id\":-1}]', '2023-08-28 07:30:26', 1),
(4190, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:39:12', 1),
(4191, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:40:28', 1),
(4192, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:41:52', 1),
(4193, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"boya\":false},\"id\":-1}]', '2023-08-28 07:42:07', 1),
(4194, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":false,\"furniture\":true,\"boya\":true},\"id\":-1}]', '2023-08-28 07:42:32', 1),
(4195, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 07:47:06', 1),
(4196, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:47:32', 1),
(4197, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:57:43', 1),
(4198, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"boya\":true,\"cleaning\":true},\"id\":-1}]', '2023-08-28 07:57:59', 1),
(4199, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 07:58:59', 1),
(4200, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 07:59:23', 1),
(4201, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 08:07:47', 1),
(4202, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"furniture\":false,\"cleaning\":true},\"id\":-1}]', '2023-08-28 08:07:54', 1),
(4203, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 08:15:39', 1),
(4204, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":false},\"id\":-1}]', '2023-08-28 08:29:00', 1),
(4205, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_amount\":65,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_amount\":\"12\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-28 08:33:42', 1),
(4206, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_amount\":12,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_amount\":\"1211\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-28 08:33:48', 1),
(4207, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_type\":1,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_type\":\"2\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-28 08:33:55', 1),
(4208, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"owner_id\":10,\"owner\":\"object\",\"category\":\"object\"}, {\"owner_id\":\"12\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-28 08:34:00', 1),
(4209, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/76\",\"Expenses\",\"update\",\"76\"]', '[{\"expense_currency\":4,\"owner\":\"object\",\"category\":\"object\"}, {\"expense_currency\":\"1\",\"owner\":\"object\",\"category\":\"object\"}]', '2023-08-28 08:34:08', 1),
(4210, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/expenses/save/-1\",\"Expenses\",\"save_new\",\"-1\"]', '[{\"expense_type\":\"1\",\"expense_amount\":\"34\",\"expense_currency\":\"4\",\"expense_description\":\"fghgj\",\"category_id\":\"14\",\"owner_id\":\"10\",\"id\":-1}]', '2023-08-28 08:34:21', 1),
(4211, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":false},\"id\":-1}]', '2023-08-28 09:20:06', 1),
(4212, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 09:25:42', 1),
(4213, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"boya\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 09:25:57', 1),
(4214, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"boya\":true},\"id\":-1}]', '2023-08-28 09:26:22', 1),
(4215, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/74\",\"Inspects\",\"update\",\"74\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:31:08', 1),
(4216, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/73\",\"Inspects\",\"update\",\"73\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":false}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:31:48', 1),
(4217, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/52\",\"Inspects\",\"update\",\"52\"]', '[{\"inspect_rate\":\"{\"cleaning\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:31:52', 1),
(4218, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/76\",\"Inspects\",\"update\",\"76\"]', '[{\"inspect_rate\":\"{\"boya\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:32:57', 1),
(4219, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"2\",\"service_id\":\"3\",\"inspect_desc\":\"ıt is okay\",\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-28 09:38:36', 1),
(4220, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/77\",\"Inspects\",\"update\",\"77\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:38:53', 1),
(4221, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"2\",\"service_id\":\"3\",\"inspect_desc\":\"fdsgfdgfd\",\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 09:41:08', 1),
(4222, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/78\",\"Inspects\",\"update\",\"78\"]', '[{\"inspect_rate\":\"{\"cleaning\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-28 09:41:15', 1),
(4223, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/services/save/-1\",\"Services\",\"save_new\",\"-1\"]', '[{\"owner_id\":\"10\",\"tenant_id\":\"11\",\"service_desc\":\"dgfgffggf\",\"service_vat\":\"4\",\"service_tax\":\"4\",\"service_contract_period\":\"50\",\"property_id\":\"4\",\"package_id\":\"5\",\"id\":-1}]', '2023-08-28 10:33:57', 1),
(4224, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true},\"id\":-1}]', '2023-08-28 12:53:48', 1),
(4225, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-28 14:15:44', 1),
(4226, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/login\",\"Users\",\"login\",\"\"]', '[{\"user_fullname\":\"rtergre\",\"user_role\":\"admin.root\"}]', '2023-08-29 06:33:52', 1),
(4227, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":\"add_client\",\"id\":-1}]', '2023-08-29 07:26:51', 1),
(4228, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/categories/save/-1\",\"Categories\",\"save_new\",\"-1\"]', '[{\"category_priority\":99,\"category_name\":\"neflix\",\"parent_id\":10,\"id\":-1}]', '2023-08-29 08:18:44', 1),
(4229, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/80\",\"Inspects\",\"update\",\"80\"]', '[{\"service_id\":0}, {\"service_id\":\"12\"}]', '2023-08-29 08:19:38', 1),
(4230, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"2\",\"service_id\":\"4\",\"inspect_desc\":\"fdggfd\",\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-29 08:19:53', 1),
(4231, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"user_id\":\"6\",\"service_id\":\"5\",\"inspect_desc\":\"etrgrd\",\"inspect_rate\":{\"furniture\":true,\"cleaning\":true},\"id\":-1}]', '2023-08-29 08:21:47', 1),
(4232, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/82\",\"Inspects\",\"update\",\"82\"]', '[{\"inspect_rate\":\"{\"furniture\":true,\"cleaning\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-29 08:22:25', 1),
(4233, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true,\"boya\":true},\"user_id\":\"2\",\"service_id\":\"4\",\"inspect_desc\":\"fgtfgfgfgfggfg\",\"id\":-1}]', '2023-08-29 08:23:31', 1),
(4234, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":false,\"boya\":true},\"id\":-1}]', '2023-08-29 08:23:44', 1),
(4235, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/84\",\"Inspects\",\"update\",\"84\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":false,\"boya\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-29 08:25:22', 1),
(4236, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-29 08:25:54', 1),
(4237, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/85\",\"Inspects\",\"update\",\"85\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-29 08:26:02', 1),
(4238, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/83\",\"Inspects\",\"update\",\"83\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true,\"boya\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-29 08:27:45', 1),
(4239, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/-1\",\"Inspects\",\"save_new\",\"-1\"]', '[{\"inspect_rate\":{\"cleaning\":true,\"furniture\":true},\"id\":-1}]', '2023-08-29 08:37:06', 1),
(4240, 2, '[\"\",\"\",\"\",\"\",\"http//:localhost/aftersale/admin/inspects/save/86\",\"Inspects\",\"update\",\"86\"]', '[{\"inspect_rate\":\"{\"cleaning\":true,\"furniture\":true}\"}, {\"inspect_rate\":\"object\"}]', '2023-08-29 08:39:50', 1);

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_to` varchar(255) DEFAULT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_text` text NOT NULL,
  `message_priority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=normal, 2=warning, 3=urgent',
  `stat_created` datetime DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=new, 2=read 	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`id`, `user_id`, `message_to`, `message_subject`, `message_text`, `message_priority`, `stat_created`, `rec_state`) VALUES
(1, 6, '2', 'hello ', 'how ARE YOUU', 1, '2023-08-04 11:12:48', 1),
(2, 4, '5', '454', '545344', 1, '2023-08-04 08:47:55', 1),
(3, 3, '3', 'fghbh', 'hggh', 1, '2023-08-07 15:07:21', 1);

-- --------------------------------------------------------

--
-- Table structure for table `packages`
--

CREATE TABLE `packages` (
  `id` int(11) NOT NULL,
  `package_name` varchar(255) NOT NULL,
  `package_desc` text DEFAULT NULL,
  `package_cpi` tinyint(4) DEFAULT NULL COMMENT 'consumer price index \r\npecentage',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `stat_updated` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packages`
--

INSERT INTO `packages` (`id`, `package_name`, `package_desc`, `package_cpi`, `stat_created`, `stat_updated`, `rec_state`) VALUES
(5, 'long term', 'aaaaaaa', 12, '2023-08-07 00:00:00', '2023-08-07 00:00:00', 2),
(6, 'short term', 'aaaaaaaaa', 44, '2023-08-07 00:00:00', '2023-08-07 00:00:00', 1),
(7, 'Leasing Exclusive PM', 'qqqqqqqqq', 4, '2023-08-11 13:11:17', '0000-00-00 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `owner_id` int(11) NOT NULL,
  `tenant_id` int(11) DEFAULT NULL,
  `property_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL,
  `service_vat` tinyint(4) NOT NULL COMMENT 'percentage',
  `service_tax` tinyint(4) NOT NULL COMMENT 'percentage',
  `service_price` int(11) NOT NULL,
  `service_currency` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1234',
  `service_contract_period` smallint(6) NOT NULL COMMENT 'days number',
  `service_desc` text DEFAULT NULL,
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `user_id`, `owner_id`, `tenant_id`, `property_id`, `package_id`, `service_vat`, `service_tax`, `service_price`, `service_currency`, `service_contract_period`, `service_desc`, `stat_created`, `rec_state`) VALUES
(273, 2, 12, 11, 135, 5, 45, 54, 40, 1, 45, 'dfawdgfh', '2023-08-18 08:22:03', 1),
(320, 2, 10, 11, 136, 6, 65, 65, 50, 2, 5, '56', '2023-08-21 09:05:19', 1),
(323, 2, 8, 7, 137, 7, 54, 45, 88, 4, 50, 'dgxfjhnhg fsdvfdlçkgfdlsaşmkv vdfsşlikgfdsşlkgdfgfdlş gfdfgfşldkkfhşlgdi', '2023-08-21 13:47:17', 1),
(327, 2, 0, 13, 138, 5, 0, 0, 0, 1, 0, NULL, '2023-08-24 09:15:29', 1),
(328, 2, 10, 13, 139, 7, 65, 11, 0, 1, 0, 'dsf sdf ds fds fsdf sd', '2023-08-24 09:44:06', 1),
(329, 2, 10, 11, 148, 6, 33, 34, 0, 1, 43, 'ffgfdg', '2023-08-24 12:58:03', 1),
(332, 2, 10, 11, 150, 5, 4, 4, 0, 1, 50, 'dgfgffggf', '2023-08-28 10:33:57', 1);

-- --------------------------------------------------------

--
-- Table structure for table `specs`
--

CREATE TABLE `specs` (
  `id` int(11) NOT NULL,
  `language_id` tinyint(4) DEFAULT 1,
  `content_id` int(11) DEFAULT NULL,
  `spec_name` varchar(255) NOT NULL,
  `spec_value` varchar(255) DEFAULT NULL,
  `spec_type` varchar(255) DEFAULT NULL COMMENT '3+1 | 2+1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tenants`
--

CREATE TABLE `tenants` (
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_fullname` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `mobile` varchar(255) NOT NULL,
  `user_role` varchar(255) NOT NULL,
  `user_token` varchar(255) DEFAULT NULL,
  `user_configs` varchar(255) NOT NULL DEFAULT '{"mobile":"", "address":""}',
  `stat_lastlogin` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `stat_created` datetime NOT NULL,
  `stat_logins` int(11) NOT NULL DEFAULT 0,
  `stat_ip` varchar(255) DEFAULT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password`, `user_fullname`, `address`, `mobile`, `user_role`, `user_token`, `user_configs`, `stat_lastlogin`, `stat_created`, `stat_logins`, `stat_ip`, `rec_state`) VALUES
(2, 'admin@gmail.com', '$2y$10$iLiy64VgN.bXPhnXY.HhPe7FZ8nO9akhwLhgWNTYm2T4zbmWjSwKu', 'rtergre', 'grgrgr', '8568879', 'admin.root', '', '\"\\\"\\\"\"', '2023-08-29 06:33:52', '2022-04-10 12:46:57', 56, '127.0.0.1', 1),
(5, 'b@gmail.com', '$2y$10$iLiy64VgN.bXPhnXY.HhPe7FZ8nO9akhwLhgWNTYm2T4zbmWjSwKu', '65456', 'hcfgjk', 'jghghj', '', 'hjuhjkk', '{\"mobile\":\"\", \"address\":\"\"}', '2023-08-08 16:53:29', '2023-07-31 16:15:02', 765, 'yut675765765765765', 0),
(6, 'c@gmail.com', '$2y$10$6ziRDLgIGXK4Q8MEw6o4Qem/tIqJBMaUK1tM8Dq.CewZa/0Msbcie', 'aa', 'mah', '5643635465', 'admin.root', NULL, 'null', '2023-08-08 16:58:00', '2023-07-31 14:25:15', 543665, '765765', 0),
(7, 'a@gmail.com', '$2y$10$6ziRDLgIGXK4Q8MEw6o4Qem/tIqJBMaUK1tM8Dq.CewZa/0Msbcie', 'aa', 'mah', '654654', 'user.tenant', NULL, '{\"mobile\":\"\", \"address\":\"\"}', '2023-08-08 16:58:02', '2023-08-01 10:27:24', 6546565, '756765', 0),
(8, 'n@gmail.com', '$2y$10$6ziRDLgIGXK4Q8MEw6o4Qem/tIqJBMaUK1tM8Dq.CewZa/0Msbcie', 'www', 'mah', '645645', 'user.owner', NULL, '{\"mobile\":\"\", \"address\":\"\"}', '2023-08-16 16:02:28', '2023-08-01 10:27:54', 654654, '765765', 0),
(9, 'aa@gmail.com', '$2y$10$RDteMesnNi3yf8joqYpBwe9LbMkH4IW4rrY9XN98zP16KBbFFmHvS', 'ali ayse', 'mahalle', '465654', 'admin.root', NULL, '{\"address\":\"r4aetrg\"}', '2023-08-08 16:58:05', '2023-08-07 07:36:17', 6546547, '765657', 0),
(10, 'sadsds@gmail.com', '', 'osama', 'sfdfg', '4365', 'user.owner', NULL, '{\"mobile\":\"\", \"address\":\"\"}', '2023-08-16 16:02:36', '2023-08-14 11:38:39', 0, NULL, 1),
(11, 'aaj@gmail.com', '$2y$10$fXucWqI8xaLk5MLY.whq/uODNoo8yXIP3WCpodGat7YbtO0TxfnES', 'a', '', '', 'user.tenant', NULL, '{\"mobile\":\"776\",\"address\":\"ukuk\"}', '2023-08-14 09:45:16', '2023-08-14 09:45:16', 0, NULL, 0),
(12, 'bj@gmail.com', '$2y$10$M61thPxbusWvUmT9O9WyS.vBDxMoCw4ifuScDLUJc5J5k08QJ/yhS', 'ahmet', '', '', 'user.owner', NULL, '{\"mobile\":\"4655576\",\"address\":\"juyuj\\u0131tu\"}', '2023-08-16 16:02:43', '2023-08-14 09:46:37', 0, NULL, 0),
(13, 'aaa@gmail.com', '$2y$10$ykUjqREtaUEtzTQNyWxi7.SDzUdaVHF9yLuEWqZxsq32/m5Cdn166', 'jkhjhk', '', '', 'user.tenant', NULL, '{\"mobile\":\"546657654\",\"address\":\"ghfjghhgf\"}', '2023-08-14 10:01:50', '2023-08-14 10:01:49', 0, NULL, 0),
(23, '', '', 'ahmet', '', '', '', NULL, '{\"mobile\":\"\", \"address\":\"\"}', '2023-08-22 08:52:53', '0000-00-00 00:00:00', 0, NULL, 0),
(24, 'abc@gmail.com', '$2y$10$mV21EH7HZtz2uUHqjV4cOuMV98atHPu2c5iVTA8s9FpEcvMOnFYH.', 'fgfg', '', '', 'user.tenant', NULL, '{\"mobile\":\"54\"}', '2023-08-24 09:31:20', '2023-08-24 09:31:20', 0, NULL, 0),
(25, 'nalan@gmail.com', '$2y$10$uX8XllT7NGTlXyVGc8VR/.8tKKNYQ9VPQHgI4gh63mB72i.tfj2bC', 'tyhhyy', '', '', 'user.owner', NULL, '{\"mobile\":\"53454356454\"}', '2023-08-24 14:15:36', '2023-08-24 11:12:46', 0, NULL, 0),
(26, 'kkkkk@gmail.com', '$2y$10$XBiU8kBXeMe2NucyDuOrEe0p6LNTn9s75MP6PVi3oWiVC9WcW.bBi', 'hgnjhg', '', '', 'user.landlord', NULL, '{\"mobile\":\"44398\"}', '2023-08-24 11:14:30', '2023-08-24 11:14:30', 0, NULL, 0),
(27, 'sahad@gmail.com', '$2y$10$hCoW5IKOf3NlaDado/lYFe52yyZdM1mxA..UxSNtFUxjww6xZ30ze', 'ali', '', '', 'user.landlord', NULL, '{\"mobile\":\"4530095\",\"address\":\"ghrtdfspo\\u015fkhgof\"}', '2023-08-24 11:16:27', '2023-08-24 11:16:27', 0, NULL, 0),
(28, 'cetin@gmail.com', '$2y$10$PT9kxVtDixZ4jgtQdMNRX.8vAIuksW4Ml7PAYlc32YS4F1UrgjJ0q', '5rr55fdfd', '', '', 'user.tenant', NULL, '{\"mobile\":\"5345435454\"}', '2023-08-24 11:51:20', '2023-08-24 11:51:20', 0, NULL, 0),
(29, 'kkaa@gmail.com', '$2y$10$hCdymuioXTq4seLiqk06NeSGLY65Pbsu9iXXFysUcGUPVcaxpFOzu', 'retgdfgrd', '', '', 'user.tenant', NULL, 'null', '2023-08-24 14:39:26', '2023-08-24 14:39:26', 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=new, 2=read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banks`
--
ALTER TABLE `banks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contents`
--
ALTER TABLE `contents`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposit`
--
ALTER TABLE `deposit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspects`
--
ALTER TABLE `inspects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inspect_specs`
--
ALTER TABLE `inspect_specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `specs`
--
ALTER TABLE `specs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_message`
--
ALTER TABLE `user_message`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `banks`
--
ALTER TABLE `banks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contents`
--
ALTER TABLE `contents`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `deposit`
--
ALTER TABLE `deposit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT for table `inspects`
--
ALTER TABLE `inspects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT for table `inspect_specs`
--
ALTER TABLE `inspect_specs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4241;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `packages`
--
ALTER TABLE `packages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=333;

--
-- AUTO_INCREMENT for table `specs`
--
ALTER TABLE `specs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user_message`
--
ALTER TABLE `user_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Table structure for table `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Table structure for table `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Table structure for table `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Dumping data for table `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"snap_to_grid\":\"off\",\"angular_direct\":\"direct\",\"relation_lines\":\"true\"}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

-- --------------------------------------------------------

--
-- Table structure for table `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Table structure for table `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

--
-- Dumping data for table `pma__navigationhiding`
--

INSERT INTO `pma__navigationhiding` (`username`, `item_name`, `item_type`, `db_name`, `table_name`) VALUES
('root', 'deposit', 'table', 'aftersale', ''),
('root', 'inspect_specs', 'table', 'aftersale', ''),
('root', 'tenants', 'table', 'aftersale', '');

-- --------------------------------------------------------

--
-- Table structure for table `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Dumping data for table `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"aftersale\",\"table\":\"services\"},{\"db\":\"ptpms\",\"table\":\"properties\"},{\"db\":\"aftersale\",\"table\":\"users\"},{\"db\":\"ptpms\",\"table\":\"user_project\"},{\"db\":\"ptpms\",\"table\":\"users\"},{\"db\":\"ptpms\",\"table\":\"sellers\"},{\"db\":\"ptpms\",\"table\":\"searchlogs\"},{\"db\":\"ptpms\",\"table\":\"proposals\"},{\"db\":\"ptpms\",\"table\":\"projects\"},{\"db\":\"ptpms\",\"table\":\"profiles\"}]');

-- --------------------------------------------------------

--
-- Table structure for table `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Table structure for table `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Dumping data for table `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'aftersale', 'expenses', '[]', '2023-08-10 10:05:36');

-- --------------------------------------------------------

--
-- Table structure for table `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

-- --------------------------------------------------------

--
-- Table structure for table `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Dumping data for table `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2023-08-28 14:49:01', '{\"Console\\/Mode\":\"collapse\",\"NavigationWidth\":242}');

-- --------------------------------------------------------

--
-- Table structure for table `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Table structure for table `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indexes for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indexes for table `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indexes for table `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indexes for table `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indexes for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indexes for table `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indexes for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indexes for table `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indexes for table `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indexes for table `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indexes for table `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indexes for table `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indexes for table `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Database: `ptpms`
--
CREATE DATABASE IF NOT EXISTS `ptpms` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ptpms`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 0,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `category_name` varchar(255) NOT NULL,
  `category_params` varchar(255) NOT NULL DEFAULT '{"icon":"", "link":"", "isProtected":"0"}',
  `category_priority` tinyint(4) NOT NULL DEFAULT 99,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `configs`
--

CREATE TABLE `configs` (
  `id` int(11) NOT NULL,
  `config_key` varchar(255) NOT NULL,
  `config_value` text DEFAULT NULL,
  `stat_updated` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `developers`
--

CREATE TABLE `developers` (
  `id` int(11) NOT NULL,
  `dev_name` varchar(255) NOT NULL,
  `dev_configs` varchar(255) DEFAULT '{"phone":"", "email":"", "mobile":"", "address":""}',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `docs`
--

CREATE TABLE `docs` (
  `id` int(11) NOT NULL,
  `tar_id` int(11) NOT NULL COMMENT 'proj|prop id',
  `tar_tbl` tinyint(4) NOT NULL COMMENT '1=prop, 2=proj',
  `doc_name` varchar(255) NOT NULL,
  `doc_desc` varchar(255) DEFAULT NULL,
  `doc_allowed_roles` varchar(255) DEFAULT 'admin.callcenter,admin.portfolio,admin.supervisor',
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `floorplans`
--

CREATE TABLE `floorplans` (
  `id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `floorplan_name` varchar(255) NOT NULL,
  `floorplan_minsize` smallint(6) DEFAULT NULL,
  `floorplan_maxsize` smallint(6) DEFAULT NULL,
  `floorplan_minprice` int(11) DEFAULT NULL,
  `floorplan_maxprice` int(11) DEFAULT NULL,
  `floorplan_photo` varchar(255) DEFAULT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `histories`
--

CREATE TABLE `histories` (
  `id` int(11) NOT NULL,
  `tar_id` int(11) NOT NULL,
  `tbl_tar` tinyint(4) NOT NULL COMMENT '1=properties, 2=proposals',
  `history_price` varchar(255) DEFAULT NULL,
  `history_country` varchar(255) DEFAULT NULL,
  `history_ip` varchar(255) DEFAULT NULL,
  `history_lang` varchar(255) DEFAULT NULL,
  `stat_created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT 0,
  `log_url` varchar(255) NOT NULL,
  `log_changes` mediumtext DEFAULT NULL COMMENT 'contains dirty  columns, before and after',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=unread, 2=read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `message_to` varchar(255) DEFAULT NULL,
  `message_subject` varchar(255) DEFAULT NULL,
  `message_text` text NOT NULL,
  `message_priority` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=normal, 2=warning, 3=urgent',
  `stat_created` datetime DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 2 COMMENT '1=new, 2=read 	'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `offices`
--

CREATE TABLE `offices` (
  `id` int(11) NOT NULL,
  `office_name` varchar(255) NOT NULL,
  `office_desc` varchar(255) DEFAULT NULL,
  `office_configs` varchar(255) DEFAULT '{"phone":"", "email":"", "mobile":""}' COMMENT '{"phone":"", "email":"", "mobile":""} ',
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `profile_fullname` varchar(255) NOT NULL,
  `profile_job` varchar(255) NOT NULL,
  `profile_logo` varchar(255) NOT NULL,
  `profile_photos` varchar(255) NOT NULL,
  `profile_desc` text NOT NULL,
  `profile_contacts` varchar(255) NOT NULL DEFAULT '{mob":"", "phone":"", "email":""}',
  `profile_address` varchar(255) NOT NULL DEFAULT '{"country":"", "city":"", "area":"", "dist":"","str":"", "bld":"", "no":""}',
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `language_id` int(11) DEFAULT 0,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `developer_id` int(11) DEFAULT 0,
  `seller_id` int(11) DEFAULT 0,
  `features_ids` varchar(255) DEFAULT NULL,
  `project_title` varchar(255) NOT NULL,
  `project_desc` text DEFAULT NULL,
  `project_photos` text DEFAULT NULL,
  `project_videos` text DEFAULT NULL,
  `project_loc` varchar(255) DEFAULT NULL,
  `project_ref` varchar(255) DEFAULT NULL,
  `project_currency` tinyint(4) DEFAULT 3 COMMENT ' 1=Sterling Pound, 2=Euro, 3=Dollar, 4=Turkish lira ',
  `adrs_country` varchar(255) DEFAULT NULL,
  `adrs_city` varchar(255) DEFAULT NULL,
  `adrs_region` varchar(255) DEFAULT NULL,
  `adrs_district` varchar(255) DEFAULT NULL,
  `adrs_street` varchar(255) DEFAULT NULL,
  `param_space` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_delivertype` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_deliverdate` date DEFAULT NULL COMMENT 'date',
  `param_totalunits` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_blocks` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_bldfloors` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_iscitizenship` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_isresidence` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_residential_units` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_commercial_units` mediumint(9) DEFAULT NULL COMMENT 'input',
  `param_unit_types` varchar(255) DEFAULT NULL COMMENT 'multiple ids EX: 588,888,etc',
  `param_units_size_range` varchar(255) DEFAULT NULL COMMENT 'range size EX: 120,220 m2',
  `param_downpayment` tinyint(4) DEFAULT NULL COMMENT 'select 5-100 ',
  `param_installment` tinyint(4) DEFAULT NULL COMMENT ' select 0-95 ',
  `param_installment_months` tinyint(4) DEFAULT NULL COMMENT ' select 1-75 ',
  `seo_title` varchar(255) NOT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_desc` varchar(255) DEFAULT NULL,
  `stat_created` datetime NOT NULL,
  `stat_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `stat_views` int(11) NOT NULL DEFAULT 0,
  `stat_shares` int(11) NOT NULL DEFAULT 0,
  `rec_state` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `properties`
--

CREATE TABLE `properties` (
  `id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT 1,
  `category_id` int(11) NOT NULL DEFAULT 100,
  `user_id` int(11) DEFAULT 0,
  `developer_id` int(11) DEFAULT 0,
  `project_id` int(11) DEFAULT 0,
  `seller_id` int(11) DEFAULT 0,
  `features_ids` varchar(255) DEFAULT NULL,
  `property_title` varchar(255) NOT NULL,
  `property_desc` text DEFAULT NULL,
  `property_photos` text DEFAULT NULL,
  `property_videos` text DEFAULT NULL,
  `property_price` int(11) DEFAULT NULL,
  `property_oldprice` int(11) DEFAULT NULL,
  `property_currency` tinyint(4) NOT NULL DEFAULT 3 COMMENT '1=Sterling Pound, 2=Euro, 3=Dollar, 4=Turkish lira',
  `property_loc` varchar(255) DEFAULT NULL,
  `property_ref` varchar(255) DEFAULT NULL,
  `property_usp` varchar(255) DEFAULT NULL COMMENT ' Unique Sell Points ',
  `property_isfeatured` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=normal, 1=at top of the list, 2=in landingpages ',
  `property_isindexed` tinyint(4) NOT NULL DEFAULT 1 COMMENT ' 	this for google index, noindex - 0-noindex, 1=index ',
  `adrs_country` varchar(255) DEFAULT NULL,
  `adrs_city` varchar(255) DEFAULT NULL,
  `adrs_region` varchar(255) DEFAULT NULL,
  `adrs_district` varchar(255) DEFAULT NULL,
  `adrs_street` varchar(255) DEFAULT NULL,
  `adrs_block` varchar(255) DEFAULT NULL,
  `adrs_no` varchar(255) DEFAULT NULL,
  `param_netspace` int(11) DEFAULT NULL COMMENT 'input',
  `param_grossspace` int(11) DEFAULT NULL COMMENT 'input',
  `param_rooms` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_bedrooms` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_buildage` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_floors` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_floor` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_heat` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_bathrooms` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_balconies` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_isfurnitured` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_isresale` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_iscitizenship` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_isresidence` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_iscommission_included` tinyint(4) DEFAULT NULL COMMENT 'checkbox',
  `param_ispublished` tinyint(4) NOT NULL DEFAULT 0 COMMENT ' 0=not show in the website, 1=show in the website ',
  `param_titledeed` int(11) DEFAULT NULL COMMENT 'input',
  `param_usestatus` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_monthlytax` int(11) DEFAULT NULL COMMENT 'input',
  `param_payment` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_ownership` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_ownertype` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_deposit` int(11) DEFAULT NULL COMMENT 'input',
  `param_delivertype` smallint(6) DEFAULT NULL COMMENT 'select',
  `param_deliverdate` date DEFAULT NULL COMMENT 'data yyyy/mm ',
  `seo_title` varchar(255) DEFAULT NULL,
  `seo_keywords` varchar(255) DEFAULT NULL,
  `seo_desc` varchar(255) DEFAULT NULL,
  `stat_created` datetime NOT NULL,
  `stat_updated` datetime NOT NULL DEFAULT current_timestamp(),
  `stat_views` int(11) NOT NULL DEFAULT 0,
  `stat_shares` int(11) NOT NULL DEFAULT 0,
  `rec_state` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `properties`
--

INSERT INTO `properties` (`id`, `language_id`, `category_id`, `user_id`, `developer_id`, `project_id`, `seller_id`, `features_ids`, `property_title`, `property_desc`, `property_photos`, `property_videos`, `property_price`, `property_oldprice`, `property_currency`, `property_loc`, `property_ref`, `property_usp`, `property_isfeatured`, `property_isindexed`, `adrs_country`, `adrs_city`, `adrs_region`, `adrs_district`, `adrs_street`, `adrs_block`, `adrs_no`, `param_netspace`, `param_grossspace`, `param_rooms`, `param_bedrooms`, `param_buildage`, `param_floors`, `param_floor`, `param_heat`, `param_bathrooms`, `param_balconies`, `param_isfurnitured`, `param_isresale`, `param_iscitizenship`, `param_isresidence`, `param_iscommission_included`, `param_ispublished`, `param_titledeed`, `param_usestatus`, `param_monthlytax`, `param_payment`, `param_ownership`, `param_ownertype`, `param_deposit`, `param_delivertype`, `param_deliverdate`, `seo_title`, `seo_keywords`, `seo_desc`, `stat_created`, `stat_updated`, `stat_views`, `stat_shares`, `rec_state`) VALUES
(131, 1, 100, 40, 146, 0, NULL, ',404,405,412,416,421,424,426,429,430,431,505,507,509,510,513,514,517,518,526,534,536,537,539,542,543,546,', 'sinpaş queen 1+1 cbi ok, empty', '<p>Beautifully designed luxury apartments for sale in Side with hotel facilities including spa, wellness and private beach club.&nbsp; The apartments are result of a contemporary design centred around a large swimming pool with plenty of terraces and on-site management.&nbsp; There is contractual rental guarantee in place which delivers up to 8% rental income per annum.&nbsp; Residents can opt out of the rental scheme should they wish to use the property year round.&nbsp;&nbsp; This is an excellent property investment opportunity as well as a superb holiday home and permanent residence in a year round area close to Antalya city.</p>\n\n<p>The complex consists of<br />\n<br />\n1 Bedroom 54sqm apartments from Euro 69,000<br />\n2 Bedroom 108sqm apartments from Euro 138,000<br />\n2 Bedroom 112sqm duplex apartments from Euro 146,000<br />\n3 Bedroom 193sqm duplex apartments from Euro 189,000</p>\n\n<p>Facilities include<br />\n- Reception and concierge<br />\n- Tennis court<br />\n- 24-hours-security<br />\n- Wireless internet connection<br />\n- Car parking<br />\n- Beach club<br />\n- Rental management</p>\n\n<p>&nbsp;The complex is located very close to sandy beaches of Side, which is a historic holiday resort 30 minutes to Antalya and 40 minutes to Antalya international airport.</p>\n', '[{\"name\":\"169088469901690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469911690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469921690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469931690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469941690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469951690884699.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469961690884700.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469971690884700.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469981690884700.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"169088469991690884700.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"1690884699101690884700.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"1690884699111690884700.png\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"}]', 'T1RcyCZBZ7U,FbXfXnuWPiY', 420000, NULL, 2, '40.980264,28.861568', 'PTP131UID40', 'Nice view,investment opportinutiy,family area,accessable location', 0, 1, 'Türkiye', 'İstanbul', 'Bakırköy', 'Ataköy 2-5-6.', 'Conk Bayırı Caddesi', '4', '3', 50, 80, 169, NULL, 213, 249, 252, 297, 308, 316, 0, 1, 1, 0, 1, 0, NULL, 319, NULL, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-12 07:39:09', '2023-07-11 12:34:42', 0, 0, 1),
(132, 1, 100, 39, 0, 150, 13, NULL, 'Bağcılar/İstanbul, Apartment, AFFORDABLE LUXURIES, 1+1[auto]', '<p>CORE LIVING SATILIK FIRSAT DAİRE</p>\n', '[{\"name\":\"16714513520.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513521.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513522.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513523.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513524.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513525.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513526.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513527.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513528.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16714513529.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135210.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135211.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135212.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135213.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135214.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135215.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135216.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135217.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135218.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135219.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167145135220.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 160000, NULL, 2, '41.056921,28.818319', 'PTP132UID39', 'AFFORDABLE LUXURIES,İNVESTMENT', 0, 1, 'Turkey', 'İstanbul', 'Bağcılar', 'Mahmutbey', '2529', 'NO:4-6', '110', 66, 99, 169, NULL, 211, 240, 266, 299, 308, 316, 0, 1, 0, 0, 1, 0, 75000, 320, 850, NULL, 322, 329, 1000, NULL, NULL, NULL, NULL, NULL, '2022-12-19 11:45:03', '2023-07-11 15:29:32', 0, 0, 1),
(133, 1, 100, 18, 137, 92, NULL, NULL, 'Kadıköy/İstanbul, Apartment, , 2+1[auto]', '<p>empty</p>\n\n<p>gym</p>\n\n<p>pool</p>\n\n<p>sauna</p>\n', '[{\"name\":\"16716097430.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097431.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097432.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097433.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097434.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097435.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097436.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716097437.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16716160930.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 290000, NULL, 2, '40.995115,29.051665', 'PTP133UID42', NULL, 0, 1, 'Turkey', 'İstanbul', 'Kadıköy', 'Fikirtepe', 'Yıldırım Sokak', 'A', '311', 64, 75, 172, NULL, 211, NULL, 266, NULL, 309, NULL, 1, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-21 07:45:30', '2023-07-05 14:38:25', 0, 0, 0),
(134, 1, 100, 40, 0, 0, NULL, NULL, 'new building, suitable for airbnb 1+1, no tennant, w furniture suitable for residence permit', '<p>just in front of kuleli poyraz 2 and feri kuleli projects.</p>\n\n<p>there is no tennat in flat and on sale w its furniture</p>\n\n<p>very suitable for airbnb and residence permit&nbsp;</p>\n\n<p>3rd floor&nbsp;</p>\n', '[{\"name\":\"16722449510.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449511.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449512.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449513.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449514.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449515.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449516.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449517.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449518.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722449519.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224495110.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224495111.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224495112.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224495113.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 139000, NULL, 2, '41.056022,28.972692', 'PTP134UID40', NULL, 0, 1, 'Turkey', 'İstanbul', 'Şişli', 'Paşa', 'Hasret Caddesi', '0', '8', 50, 70, 169, NULL, 211, 224, 252, NULL, 308, 315, 1, 1, 0, 1, 1, 0, 1400000, 319, NULL, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 16:22:50', '2023-07-11 12:34:42', 0, 0, 2),
(135, 1, 100, 40, 0, 0, NULL, NULL, 'şişli paşa mahallesi 2 br new flat', '<p>2 br flat w tenant, tenant will move after sale</p>\n\n<p>suitable for residence permit</p>\n\n<p>new building</p>\n', NULL, NULL, 165000, NULL, 2, '41.055541,28.974387', 'PTP135UID40', NULL, 0, 1, 'Turkey', 'İstanbul', 'Şişli', 'Paşa', 'Darülaceze Yolu Caddesi', '0', '6', 75, 80, 172, NULL, 213, 223, 251, 298, 308, 315, 0, 1, 0, 1, 1, 0, 1400000, 320, NULL, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 16:34:28', '2023-07-11 12:34:42', 0, 0, 2),
(136, 1, 100, 50, 428, 801, NULL, NULL, 'Eyüpsultan/İstanbul, Apartment, , 3+1[auto]', '<p>3+1 APARTMENT IN FOCUS EYUP</p>\n\n<p>SELLER USED FOR CBI SO IT IS NOT SUITABLE FOR CBI</p>\n\n<p>SUITABLE FOR RESIDENCY PERMIT</p>\n\n<p>EMPTY APARTMENT</p>\n', '[{\"name\":\"16722488140.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488141.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488142.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488143.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488144.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488145.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488146.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488147.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488148.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16722488149.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224881410.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167224881411.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 260000, NULL, 2, '41.083946,28.939568', 'PTP136UID50', NULL, 0, 1, 'Turkey', 'İstanbul', 'Eyüpsultan', 'Çırçır', 'Uygar Sokak', 'B', '66', 90, 110, 175, NULL, 210, 228, 258, 296, 309, 316, 0, 1, 0, 1, 1, 0, 1400000, 319, 725, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 17:28:09', '2023-05-29 09:46:14', 0, 0, 1),
(137, 1, 100, 50, 0, 106, NULL, NULL, 'Eyüpsultan/İstanbul, Apartment, , 2+1[auto]', '<p>2+1 APARTMET W TENANT</p>\n\n<p>TENANT WILL MOVE AFTER SALES</p>\n\n<p>&nbsp;</p>\n', NULL, NULL, 175000, NULL, 2, '41.092271,28.926608', 'PTP137UID50', NULL, 0, 1, 'Turkey', 'İstanbul', 'Eyüpsultan', 'Alibeyköy', 'Fatih Sultan Mehmet Bulvarı', 'A', '84', 70, 80, 172, NULL, 212, 229, 256, 296, 308, 316, 0, 1, 0, 1, 1, 0, 1400000, 320, 750, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-28 17:35:25', '2023-07-11 12:34:42', 0, 0, 2),
(138, 1, 100, 18, 0, 226, NULL, NULL, 'Ümraniye/İstanbul, Apartment, , 1+1[auto]', '', NULL, NULL, 180000, NULL, 2, '41.002584,29.123516', 'PTP138UID42', NULL, 0, 1, 'Turkey', 'İstanbul', 'Ümraniye', 'Çamlık', 'Deryalı Sokak', 'a', '104', 43, 66, 169, NULL, 210, 231, 261, NULL, 308, 316, 0, 1, 0, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-29 09:10:08', '2023-07-05 14:38:25', 0, 0, 1),
(139, 1, 100, 41, 185, 0, NULL, NULL, 'Maltepe/İstanbul, Apartment, , 4+1[auto]', '<p>An amazing 4+1 condo with a sea and&nbsp;islands view in Maltepe.</p>\n', '[{\"name\":\"16723847750.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847751.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847752.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847753.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847754.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847755.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847756.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847757.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847758.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16723847759.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477510.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477511.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477512.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477513.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477514.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477515.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477516.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477517.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477518.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477519.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477520.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477521.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477522.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167238477523.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 1000000, NULL, 2, '40.948158,29.108531', 'PTP139UID41', NULL, 0, 1, 'Turkey', 'İstanbul', 'Maltepe', 'Küçükyalı', 'Gümüşçü Sokağı', '1', '1', 180, 243, 179, NULL, 211, 244, 270, 297, 310, 318, 0, 1, 1, 1, 1, 0, 7500000, 319, NULL, NULL, 323, 332, NULL, NULL, NULL, NULL, NULL, NULL, '2022-12-30 07:05:27', '2023-07-11 12:34:42', 0, 0, 2),
(141, 1, 100, 53, 0, 202, 14, NULL, 'Sarıyer/İstanbul, Apartment, , 1+1[auto]', '', '[{\"name\":\"16725920850.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920851.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920852.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920853.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920854.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920855.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920856.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920857.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920858.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16725920859.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208510.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208511.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208512.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208513.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208514.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208515.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208516.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167259208517.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 6265000, NULL, 3, '41.113698,28.985434', 'PTP141UID53', NULL, 0, 1, 'Turkey', 'İstanbul', 'Sarıyer', 'Ayazağa', 'Azerbeycan Cad', 'b', '25', 59, 85, 169, NULL, 213, 229, 251, 296, 308, 316, 0, 1, 0, 1, 1, 0, 2800000, 320, 950, NULL, 322, 330, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-01 15:26:37', '2023-07-11 12:34:42', 0, 0, 2),
(142, 1, 100, 18, 0, 0, 0, NULL, 'Kadıköy/İstanbul, Apartment, , 3+1[auto]', '', '[{\"name\":\"16727374560.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374561.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374562.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374563.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374564.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374565.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16727374566.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 800000, NULL, 2, '40.976351,29.053135', 'PTP142UID42', NULL, 0, 1, 'Turkey', 'İstanbul', 'Kadıköy', 'Göztepe', 'Gülden Sokak', 'a', '24', 105, 137, 175, NULL, 210, 233, 261, NULL, 309, 316, 0, 0, 1, 1, 1, 0, NULL, 319, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-03 08:22:02', '2023-07-05 14:38:25', 0, 0, 1),
(143, 1, 100, 37, 275, 280, NULL, NULL, 'Bağcılar/İstanbul, Apartment, , 1+1[auto]', '', NULL, NULL, 120000, NULL, 2, '41.025247,28.815882', 'PTP143UID37', NULL, 0, 1, 'Turkey', 'İstanbul', 'Bağcılar', 'Bağlar', 'Mimar Sinan Caddesi', 'divab', '184', 50, 70, 169, NULL, 214, 239, 267, 296, 308, 315, 1, 1, 0, 0, 1, 0, NULL, 320, 1200, NULL, 322, 332, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-06 12:36:29', '2023-07-11 12:34:42', 0, 0, 2),
(147, 1, 100, 41, 0, 0, NULL, NULL, 'Maltepe/İstanbul, Apartment, , 3+1[auto]', '<p>An amazing sea and Prince&#39;s Islands view 3+1 condo in Dragos region Maltepe...a superb alternative for lifestyle...</p>\n', '[{\"name\":\"16731674660.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674661.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674662.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674663.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674664.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674665.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674666.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674667.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674668.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16731674669.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746610.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746611.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746612.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746613.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746614.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746615.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746616.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746617.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746618.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746619.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746620.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746621.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746622.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746623.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746624.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746625.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746626.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167316746627.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 750000, NULL, 2, '40.908813,29.136347', 'PTP147UID41', NULL, 0, 1, 'Turkey', 'İstanbul', 'Maltepe', 'Yalı', 'Park İçi Yolu', '1', '3', 130, 150, 175, NULL, 216, 223, 250, 298, 309, 317, NULL, 1, 1, 1, 1, 0, 7500000, 319, 350, NULL, 322, 327, 200000, NULL, NULL, NULL, NULL, NULL, '2023-01-08 08:35:38', '2023-07-05 13:14:06', 0, 0, 1),
(148, 1, 100, 50, 0, 0, NULL, NULL, 'SUITABLE CBI APARTMENT, 3+1 \nALIBEYKOY, EYUPSULTAN', '<p>SUITABLE CBI APARTMENT , 3+1 , 1 MIN TO METRO STATION BY WALKING , 5 MIN TO SHOPPING AREAS BY CAR , CENTRAL LOCATION, 20 MIN TO ISTANBUL AIRPORT , 2 UNIVERSITY&nbsp;AROUND OF IT&nbsp;</p>\n', '[{\"name\":\"16733688890.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688891.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688892.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688893.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688894.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688895.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688896.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688897.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688898.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16733688899.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888910.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888911.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888912.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888913.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888914.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888915.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888916.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888917.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888918.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888919.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888920.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888921.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888922.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888923.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888924.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888925.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888926.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888927.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888928.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888929.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888930.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888931.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888932.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888933.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888934.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888935.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888936.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167336888937.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 345000, NULL, 2, '41.080354,28.937563', 'PTP148UID50', NULL, 0, 1, 'Turkey', 'İstanbul', 'Eyüpsultan', 'Çırçır', '', 'B', '45', 100, 125, 175, NULL, 214, 231, 257, 296, 308, 316, 0, 1, 1, 1, 1, 0, 6500000, 320, NULL, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2023-01-10 16:35:15', '2023-05-29 09:46:14', 0, 0, 1),
(151, 1, 100, 41, 114, 300, NULL, NULL, 'Şişli/İstanbul, Apartment, , 2+1[auto]', '<p>Good investment oppotunity with CBI&nbsp;in Petek Residence at heart of Istanbul.&nbsp;</p>\n', '[{\"name\":\"16736865440.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865441.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865442.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865443.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865444.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865445.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865446.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865447.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865448.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16736865449.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654410.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654411.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654412.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654413.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654414.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654415.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654416.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654417.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654418.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654419.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654420.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654421.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654422.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654423.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654424.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654425.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654426.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654427.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167368654428.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 598000, NULL, 2, '41.042769,28.980901', 'PTP151UID41', NULL, 0, 1, 'Turkey', 'İstanbul', 'Şişli', 'İnönü', '', '1', '113', 85, 136, 172, NULL, 214, 228, 256, 296, 308, 316, 1, 1, 1, 1, 1, 0, 7500000, 321, 835, NULL, 322, 332, 200000, NULL, NULL, NULL, NULL, NULL, '2023-01-14 08:44:36', '2023-07-05 13:14:06', 0, 0, 1),
(152, 1, 100, 41, 114, 508, NULL, NULL, 'Kartal/İstanbul, Apartment, , 3+1', '<p>Amazing 3+1 apartment, sea view option with a huge terrace and balcony. %6 comission should be charged as service fee...</p>\n', '[{\"name\":\"16740336650.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336651.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336652.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336653.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336654.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336655.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336656.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336657.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336658.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16740336659.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366510.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366511.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366512.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366513.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366514.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366515.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167403366516.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 367000, NULL, 2, '40.899979,29.218322', 'PTP152UID41', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Kartal', 'Topselvi', 'Topselvi Caddesi', '1', '100', 150, 280, 175, NULL, 211, 249, 264, 297, 309, 317, NULL, 1, 1, 1, 0, 0, 6882000, 319, 1200, NULL, 322, 331, 100000, NULL, NULL, NULL, NULL, NULL, '2023-01-18 09:09:30', '2023-07-11 12:34:42', 0, 0, 2),
(153, 1, 100, 41, 0, 128, 0, NULL, 'Maltepe/İstanbul, Apartment, , 2+1[auto]', '', '[{\"name\":\"16789599150.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599151.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599152.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599153.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599154.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599155.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599156.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599157.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599158.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16789599159.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991510.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991511.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991512.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991513.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991514.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991515.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991516.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991517.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991518.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991519.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991520.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991521.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991522.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991523.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991524.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991525.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991526.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991527.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167895991528.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, NULL, NULL, 3, '40.918259,29.132861', 'PTP153UID41', NULL, 0, 1, 'Turkey', 'İstanbul', 'Maltepe', 'Yalı', 'Kale Sokak', '1', '48', 70, 150, 172, NULL, 209, 234, 260, 297, 309, 315, 0, 1, 1, 1, 1, 0, 7500000, 319, 1500, NULL, 322, NULL, 200000, NULL, NULL, NULL, NULL, NULL, '2023-01-23 11:59:59', '2023-07-11 12:34:42', 0, 0, 0),
(154, 1, 100, 57, 137, 0, 16, NULL, 'Kadıköy/İstanbul, Apartment, , 1+1[auto]', '<p>URGENT RESALE at Optimist 20th floor with city view</p>\n\n<p>Under market value</p>\n', '[{\"name\":\"16756752730.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752731.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752732.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752733.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752734.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752735.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756752736.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 200000, NULL, 2, '40.995115,29.051665', 'PTP154UID57', NULL, 0, 1, 'Turkey', 'İstanbul', 'Kadıköy', 'Fikirtepe', 'Yıldırım Sokak', '42', '370', 44, 65, 169, NULL, 210, 249, 269, 296, 309, 315, 0, 1, 0, 1, 0, 0, 2000000, 320, 1500, NULL, 322, 329, 2000, NULL, NULL, NULL, NULL, NULL, '2023-02-04 13:30:25', '2023-07-11 12:34:42', 0, 0, 2),
(155, 1, 100, 8, 339, 613, 14, NULL, 'Şişli/İstanbul, Keten Bomonti, Apartment, 2+1', '<p>Payment Plan &nbsp; &nbsp; &nbsp; &nbsp; : Cash&nbsp;&nbsp;</p>\n\n<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</p>\n\n<p>Available types&nbsp; &nbsp; &nbsp; : 1 unit only</p>\n\n<p>&nbsp;</p>\n\n<p>2+1 two bedroom apartment&nbsp;of 110 SqM (Gross), 100 SqM (Net) size and the price is 517.000 USD</p>\n\n<p><br />\n&nbsp;</p>\n\n<p>Commission included: 4% to (Keten sales office) &amp; 11% (PT commission)&nbsp;</p>\n\n<p>Title deed transfer fee: excluded in the price</p>\n\n<p>&nbsp;</p>\n\n<p>Google maps / Yandex Location:&nbsp;https://goo.gl/maps/nbdn9Xi1ZyJsr5bZA</p>\n\n<p>&nbsp;</p>\n\n<p>Contact person, Meral (Keten sales office): 0 530 955 66 46</p>\n\n<p>Buyers both Turkish and foreign look and wait to purchase resale units for themselves here as this building is located in an expat and dynamic community, ideal for young professionals and young families.&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>USPs:&nbsp;</p>\n\n<p>Unique opportunity;</p>\n\n<p>Quality build, lifestyle investment;</p>\n\n<p>Meets CBI criteria and Title deed ready;</p>\n\n<p>Highly desirable building and dynamic neighbourhood;</p>\n\n<p>Sold with white goods and currently tenanted;</p>\n\n<p>Offers outdoor privacy in the heart of the city with two terraces, one on each side;</p>\n\n<p>Bomonti is still developing and is currently being heavily invested into by major international developers and investors alike - offers great potential.</p>\n', '[{\"name\":\"16756463000.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463001.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463002.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463003.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463004.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463005.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463006.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463007.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463008.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16756463009.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630010.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630011.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630012.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630013.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630014.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630015.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630016.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630017.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630018.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167564630019.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 518000, NULL, 2, '41.057355,28.977795', 'PTP155UID8', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Şişli', 'Cumhuriyet', 'Yeniyol', '4', '4', 100, 110, 172, NULL, 214, 226, 250, NULL, 309, 317, NULL, 1, 1, NULL, 1, 0, 7650000, 320, NULL, NULL, 322, 330, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-06 00:47:05', '2023-07-11 12:34:42', 0, 0, 1),
(157, 1, 104, 18, 328, 0, 0, NULL, 'BEYOGLU/ ISTANBUL HOTEL/ PTFS5974 / P. Owner; EMRE GOLE', '<p>Location&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : Beyoğlu</p>\n\n<p>Completion date&nbsp; &nbsp; : Resale</p>\n\n<p>Suite Hotel apartment details :</p>\n\n<p>Price: 4.200.000 USD</p>\n\n<p>Land survey of the building 145 m, net 137 m2</p>\n\n<p>&nbsp;</p>\n\n<p>&nbsp;</p>\n\n<p>The ceiling of the building is 1180 m2</p>\n\n<p>The building has 7 floors:</p>\n\n<p>floor -2, where there is a storeroom and two studio apartments (1 + 0);</p>\n\n<p>Ground floor / reception floor contains 2 offices, 2 bathrooms, a kitchen and a reception area for visitors;</p>\n\n<p>1st floor there are 3 one bedroom apartments (1 + 1);</p>\n\n<p>2nd floor 2 two-bedroom apartments (2 + 1);</p>\n\n<p>3rd floor 2 two-bedroom apartments (2 + 1);</p>\n\n<p>4th floor number of apartments 2 + 1 and an annex containing 2 studio apartments (1+ 0).</p>\n\n<p>Central conditioning</p>\n\n<p>Electrical generator</p>\n\n<p>Rent price - 25,000 USD (during high season)</p>\n\n<p>Commission : %10 included&nbsp;</p>\n\n<p>Contact person: Emre G&ouml;le</p>\n\n<p>https://drive.google.com/drive/folders/1bF-AtRY75So8Aga8dpV_1B6SAsPAf1pi</p>\n', '[{\"name\":\"16775751520.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751521.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751522.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751523.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751524.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751525.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751526.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751527.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751528.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16775751529.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515210.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515211.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515212.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515213.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515214.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515215.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515216.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515217.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167757515218.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 4200000, NULL, 2, '41.044947,29.01696', 'PTP157UID42', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Beyoğlu', '', '', '0', '0', NULL, 1180, 169, NULL, 215, 226, 288, NULL, 314, NULL, NULL, 1, 1, 1, 1, 0, NULL, NULL, NULL, NULL, NULL, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-06 13:16:23', '2023-07-05 14:38:25', 0, 0, 1),
(160, 1, 100, 59, 0, NULL, 17, NULL, 'Sultangazi/İstanbul, Apartment, , 2+1[auto]', '', '[{\"name\":\"16758495370.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495371.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495372.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495373.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495374.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495375.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495376.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495377.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495378.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758495379.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 250000, NULL, 2, '41.112558,28.914274', 'PTP160UID59', NULL, 0, 1, 'Turkey', 'İstanbul', 'Sultangazi', '', '', 'A block', '70', 115, 163, 172, NULL, 213, 239, 267, 296, 309, 316, 0, 1, 1, 1, 1, 0, NULL, 320, NULL, NULL, 322, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-08 09:38:06', '2023-05-25 12:58:40', 0, 0, 1);
INSERT INTO `properties` (`id`, `language_id`, `category_id`, `user_id`, `developer_id`, `project_id`, `seller_id`, `features_ids`, `property_title`, `property_desc`, `property_photos`, `property_videos`, `property_price`, `property_oldprice`, `property_currency`, `property_loc`, `property_ref`, `property_usp`, `property_isfeatured`, `property_isindexed`, `adrs_country`, `adrs_city`, `adrs_region`, `adrs_district`, `adrs_street`, `adrs_block`, `adrs_no`, `param_netspace`, `param_grossspace`, `param_rooms`, `param_bedrooms`, `param_buildage`, `param_floors`, `param_floor`, `param_heat`, `param_bathrooms`, `param_balconies`, `param_isfurnitured`, `param_isresale`, `param_iscitizenship`, `param_isresidence`, `param_iscommission_included`, `param_ispublished`, `param_titledeed`, `param_usestatus`, `param_monthlytax`, `param_payment`, `param_ownership`, `param_ownertype`, `param_deposit`, `param_delivertype`, `param_deliverdate`, `seo_title`, `seo_keywords`, `seo_desc`, `stat_created`, `stat_updated`, `stat_views`, `stat_shares`, `rec_state`) VALUES
(161, 1, 100, 59, 0, 390, 17, NULL, 'Sarıyer/İstanbul, Apartment, , 2+1 skyland', '', '[{\"name\":\"16758567020.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567021.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567022.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567023.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567024.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567025.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567026.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567027.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567028.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758567029.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670210.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670211.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670212.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670213.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670214.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670215.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"167585670216.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 600000, NULL, 2, '41.10258,28.982964', 'PTP161UID59', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Sarıyer', 'Huzurmahale', 'vadı ıstanbul', 'Ablock', '88', 147, 130, 172, NULL, 213, 249, 257, NULL, 309, 316, 1, 1, 0, 1, 1, 0, NULL, 319, NULL, NULL, NULL, 327, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-08 11:36:58', '2023-05-25 12:58:40', 0, 0, 1),
(162, 1, 100, 39, 69, NULL, 18, NULL, 'Bağcılar/İstanbul, Apartment, capital gain opportunity, 2+1[auto]', '', '[{\"name\":\"16758625340.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16758625341.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 200000, NULL, 2, '41.056921,28.818319', 'PTP162UID39', 'capital gain opportunity', 0, 1, 'Turkey', 'İstanbul', 'Bağcılar', 'Mahmutbey', '2529', '6', '119', 92, 140, 172, NULL, 211, 240, 267, 299, 309, 316, 0, 1, 0, 0, 1, 0, 3000000, 320, 1400000, NULL, 322, 329, 2, NULL, NULL, NULL, NULL, NULL, '2023-02-08 13:02:14', '2023-07-11 15:29:32', 0, 0, 1),
(175, 1, 102, 67, 428, 800, 19, NULL, 'Commercial in Kadikoy | $55.000', '<p>Located in Osmanaga - Kadikoy | Next to the famous bull statue</p>\n\n<p>On Sogutlucesme Street where there are numerous shops and high pedestrian traffic</p>\n\n<p>Inside the bazaar / shopping centre</p>\n\n<p>Walking distance to Bahariye Street, seaside, ferry, metro, metrobus, marmaray (train), bus and minibus stations</p>\n', '[{\"name\":\"16765017420.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765017421.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765017422.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765017423.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"168915423601689154236.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423611689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423621689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423631689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423641689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423651689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423661689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"},{\"name\":\"168915423671689154237.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":\"0\",\"order\":\"0\"}]', NULL, 55000, NULL, 2, '40.990662,29.027541', 'PTP175UID67', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Kadıköy', 'Osmanağa', 'Söğütlü Çeşme Caddesi', '64', '69', 25, 32, 168, NULL, 218, 229, 252, 292, 307, 315, 0, 1, 0, 0, 1, 0, 460000, 320, NULL, NULL, 322, 329, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-15 21:42:53', '2023-07-12 09:08:51', 0, 0, 1),
(176, 1, 100, 67, 0, NULL, 19, NULL, 'Ataşehir/İstanbul, Apartment, , 3+1[auto]', '<p><strong>Suitable for CBI and residency</strong></p>\n\n<p><strong>Located in Icerenkoy | Atasehir</strong></p>\n\n<p><strong>Walking distance to M8 Metro Line, Acibadem University and the new culture center</strong></p>\n\n<p><strong>15 min by car to Bagdat Street and the seaside</strong></p>\n', '[{\"name\":\"16765067440.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765067910.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765068160.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765068830.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765069120.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765069530.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765069930.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765070280.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765070740.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765071020.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765071470.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0},{\"name\":\"16765071800.jpg\",\"alt\":\"\",\"desc\":\"\",\"anchor_title\":\"\",\"featured\":0,\"order\":0}]', NULL, 3350000, NULL, 3, '40.975541,29.116272', 'PTP176UID67', NULL, 0, 1, 'Türkiye', 'İstanbul', 'Ataşehir', 'İçerenköy', 'Akça Sokak', 'B Blok', '13', 85, 110, 175, NULL, 218, 232, 252, 296, 308, 316, 0, 1, 1, 1, 1, 0, 3350000, 321, NULL, NULL, 322, 329, NULL, NULL, NULL, NULL, NULL, NULL, '2023-02-15 23:42:40', '2023-05-25 12:58:40', 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `proposals`
--

CREATE TABLE `proposals` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `tar_id` int(11) NOT NULL,
  `tar_tbl` tinyint(4) NOT NULL COMMENT '1=prop, 2=proposal 	',
  `proposal_title` varchar(255) NOT NULL,
  `proposal_desc` text DEFAULT NULL,
  `proposal_configs` varchar(255) DEFAULT '{"floorplan_id":""}' COMMENT '{"floorplan_id":""}',
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `searchlogs`
--

CREATE TABLE `searchlogs` (
  `id` int(11) NOT NULL,
  `search_val` varchar(255) DEFAULT NULL COMMENT 'may contains keyword , address, category id or number range',
  `search_group` varchar(255) NOT NULL COMMENT '1=language, 2=price, 3=keyword, 4=address, 5=specs, 6=features, 7=netspace, 8=grossspace, 9=monthlytax, 10=deposit',
  `search_ctrl` tinyint(4) DEFAULT 1 COMMENT '1=properties, 2=projects',
  `stat_created` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sellers`
--

CREATE TABLE `sellers` (
  `id` int(11) NOT NULL,
  `seller_name` varchar(255) NOT NULL,
  `seller_type` int(11) NOT NULL,
  `seller_nationality` int(11) DEFAULT NULL,
  `seller_photos` varchar(255) DEFAULT NULL,
  `seller_configs` varchar(510) DEFAULT '{"mngr":{"fullname":"", "phone":"", "email":"", "mobile":""} , "slr":{"fullname":"", "phone":"", "email":"", "mobile":""}}',
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `office_id` int(11) DEFAULT 0,
  `user_fullname` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_role` varchar(255) DEFAULT NULL COMMENT 'admin.admin, admin.portfolio, admin.supervisor, admin.callcenter, admin.content, user.portfolio, user.agency, user.client, user.developer',
  `user_token` varchar(255) DEFAULT NULL,
  `user_configs` varchar(255) DEFAULT '{"mobile":"", "address":""}' COMMENT '{"mobile":"", "address":""}',
  `stat_lastlogin` datetime DEFAULT NULL,
  `stat_created` datetime DEFAULT NULL,
  `stat_logins` int(11) NOT NULL DEFAULT 0,
  `stat_ip` varchar(255) DEFAULT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_message`
--

CREATE TABLE `user_message` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message_id` int(11) NOT NULL,
  `stat_created` datetime NOT NULL DEFAULT current_timestamp(),
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=new, 2=read'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_project`
--

CREATE TABLE `user_project` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `project_id` int(11) NOT NULL,
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=assigned, 2=published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_property`
--

CREATE TABLE `user_property` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `property_id` int(11) NOT NULL,
  `stat_created` datetime NOT NULL,
  `rec_state` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1=assigned, 2=published'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `configs`
--
ALTER TABLE `configs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `developers`
--
ALTER TABLE `developers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `docs`
--
ALTER TABLE `docs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `floorplans`
--
ALTER TABLE `floorplans`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `histories`
--
ALTER TABLE `histories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offices`
--
ALTER TABLE `offices`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `properties`
--
ALTER TABLE `properties`
  ADD PRIMARY KEY (`id`),
  ADD KEY `language_id` (`language_id`),
  ADD KEY `rec_state` (`rec_state`);

--
-- Indexes for table `proposals`
--
ALTER TABLE `proposals`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `searchlogs`
--
ALTER TABLE `searchlogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_message`
--
ALTER TABLE `user_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_project`
--
ALTER TABLE `user_project`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_id` (`project_id`),
  ADD UNIQUE KEY `project_id` (`project_id`);

--
-- Indexes for table `user_property`
--
ALTER TABLE `user_property`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `property_id` (`property_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `configs`
--
ALTER TABLE `configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `developers`
--
ALTER TABLE `developers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `docs`
--
ALTER TABLE `docs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `floorplans`
--
ALTER TABLE `floorplans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `histories`
--
ALTER TABLE `histories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `offices`
--
ALTER TABLE `offices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `properties`
--
ALTER TABLE `properties`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=177;

--
-- AUTO_INCREMENT for table `proposals`
--
ALTER TABLE `proposals`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `searchlogs`
--
ALTER TABLE `searchlogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_message`
--
ALTER TABLE `user_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_project`
--
ALTER TABLE `user_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_property`
--
ALTER TABLE `user_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Database: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
