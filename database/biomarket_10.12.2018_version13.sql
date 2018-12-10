-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Dec 10, 2018 at 02:16 AM
-- Server version: 5.7.23
-- PHP Version: 7.2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `biomarket`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart_tmp`
--

DROP TABLE IF EXISTS `cart_tmp`;
CREATE TABLE IF NOT EXISTS `cart_tmp` (
  `crt_ln` int(11) NOT NULL AUTO_INCREMENT,
  `crt_id` int(30) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `ord_qty` int(8) NOT NULL,
  PRIMARY KEY (`crt_ln`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cart_tmp`
--

INSERT INTO `cart_tmp` (`crt_ln`, `crt_id`, `prod_id`, `ord_qty`) VALUES
(14, 7, 15, 11),
(20, 7, 1, 1),
(16, 7, 12, 3),
(19, 7, 6, 3);

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT,
  `cat_name` enum('BAKERY','DRINK','VEGETABLES','DAIRY') NOT NULL,
  `cat_img` text NOT NULL,
  PRIMARY KEY (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`cat_id`, `cat_name`, `cat_img`) VALUES
(1, 'BAKERY', 'img/bread.svg'),
(2, 'DRINK', 'img/coffee-cup.svg'),
(3, 'VEGETABLES', 'img/broccoli.svg'),
(4, 'DAIRY', 'img/piece-of-cheese.svg');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order`
--

DROP TABLE IF EXISTS `customer_order`;
CREATE TABLE IF NOT EXISTS `customer_order` (
  `ord_num` varchar(111) NOT NULL,
  `usr_id` int(11) NOT NULL,
  `ord_dte` date NOT NULL,
  `sts` enum('ORDERED','SHIPPED','DELIVERED') NOT NULL,
  `price_sum` decimal(5,2) NOT NULL,
  `adr_ln_1` varchar(60) NOT NULL,
  `adr_ln_2` varchar(60) NOT NULL,
  `pstcod` varchar(10) NOT NULL,
  PRIMARY KEY (`ord_num`) USING BTREE,
  KEY `usr_id` (`usr_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_order`
--

INSERT INTO `customer_order` (`ord_num`, `usr_id`, `ord_dte`, `sts`, `price_sum`, `adr_ln_1`, `adr_ln_2`, `pstcod`) VALUES
('9_20181210021455', 9, '2018-12-10', 'ORDERED', '6.64', '100 Staines Road', 'London', 'W5 5RF');

-- --------------------------------------------------------

--
-- Table structure for table `customer_order_line`
--

DROP TABLE IF EXISTS `customer_order_line`;
CREATE TABLE IF NOT EXISTS `customer_order_line` (
  `ord_ln` int(11) NOT NULL,
  `ord_num` varchar(111) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `ord_qty` int(8) NOT NULL,
  `sub_total` decimal(5,2) NOT NULL,
  PRIMARY KEY (`ord_ln`) USING BTREE,
  KEY `ord_num` (`ord_num`),
  KEY `prod_id` (`prod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `customer_order_line`
--

INSERT INTO `customer_order_line` (`ord_ln`, `ord_num`, `prod_id`, `ord_qty`, `sub_total`) VALUES
(50, '9_20181210021455', 5, 1, '2.62'),
(51, '9_20181210021455', 13, 1, '4.02'),
(35, '9_20181210011405', 1, 1, '1.25'),
(36, '9_20181210011448', 15, 12, '42.72'),
(38, '9_20181210012640', 5, 1, '2.62'),
(37, '9_20181210012640', 7, 1, '2.14'),
(41, '9_20181210013145', 4, 1, '1.25'),
(40, '9_20181210013145', 5, 1, '2.62'),
(42, '9_20181210013215', 4, 1, '1.25'),
(45, '9_20181210014146', 2, 1, '2.03'),
(44, '9_20181210014146', 4, 1, '1.25'),
(48, '9_20181210014406', 13, 1, '4.02'),
(49, '9_20181210014423', 5, 1, '2.62');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `prod_id` int(11) NOT NULL AUTO_INCREMENT,
  `prod_name` varchar(50) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  `sup_id` int(11) NOT NULL,
  `prod_dsc` varchar(230) NOT NULL,
  `prod_img` text NOT NULL,
  `cat_id` int(11) NOT NULL,
  `sto_qty` int(8) NOT NULL,
  PRIMARY KEY (`prod_id`),
  KEY `sup_id` (`sup_id`),
  KEY `cat_id` (`cat_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`prod_id`, `prod_name`, `price`, `sup_id`, `prod_dsc`, `prod_img`, `cat_id`, `sto_qty`) VALUES
(1, 'Pomegrade Juice', '1.25', 2, 'Really nice product description for Pomegrade Juice', 'img/uploads/5bfc8efd684495.54781090.jpg', 2, 11),
(2, 'Kale Juice', '2.03', 2, 'Really nice product description for Kale Juice', 'img/uploads/5bfc8ee02d5a58.55705998.jpg', 2, 13),
(3, 'Carrot Juice', '0.86', 2, 'Really nice product description for Carrot Juice', 'img/uploads/5bfc8ebcb60fa4.65547830.jpg', 2, 109),
(4, 'Broccoli and Ricotta Pie', '1.25', 1, 'Really nice product description for Broccoli and Ricotta Pie', 'img/uploads/5bfc8dc80e44b7.38413046.jpg', 1, 119),
(5, 'Bread with Raisins', '2.62', 1, 'Really nice product description for Bread with Raisins', 'img/uploads/5bfc8b69202624.26787220.jpg', 1, 121),
(6, 'Coconut Bars', '3.58', 1, 'Really nice product description for Coconut Bars', 'img/uploads/5bfc8dea460e81.62966147.jpg', 1, 18),
(7, 'French Baguette', '2.14', 1, 'Really nice product description for French Baguette', 'img/uploads/5bfc8e819496a5.59336623.jpg', 1, 181),
(8, 'Yogurt', '0.50', 4, 'Really nice product description for Yogurt', 'img/uploads/5bfc93e69e7ae7.06241521.jpg', 4, 16),
(9, 'Cottage Cheese', '4.15', 4, 'Really nice product description for Cottage Cheese', 'img/uploads/5bfc944b347bb6.96054639.jpg', 4, 120),
(10, 'Goat Cheese', '3.45', 4, 'Really nice product description for Goat Cheese', 'img/uploads/5c0cf86ca07326.27274002.jpg', 4, 42),
(11, 'Avocado', '2.78', 3, 'Really nice product description for Avocado', 'img/uploads/5bfc9547e90978.70031156.jpg', 3, 9),
(12, 'Peas', '5.70', 3, 'Really nice product description for Peas', 'img/uploads/5bfc95aa96d079.50991718.jpg', 3, 98),
(13, 'Beetroots', '4.02', 3, 'Really nice product description for Beetroots', 'img/uploads/5bfc961f9de346.08918563.jpg', 3, 14),
(14, 'Tomatoes', '1.52', 3, 'Really nice product description for Tomatoes', 'img/uploads/5bfc96d55d6458.60612011.jpg', 3, 2),
(15, 'Lime and Apple Juice', '3.56', 2, 'Really nice product description for Lime and Apple Juice', 'img/uploads/5bfca66b203680.63516952.jpg', 2, 119),
(16, 'Quark Breakfast', '10.10', 4, 'Really nice product description for Quark Breakfast Selection', 'img/uploads/5bfca7094f5864.47772269.jpg', 4, 15),
(17, 'Onions', '1.25', 3, 'Really nice product description for Onions', 'img/uploads/5bfca533eb0f58.64750428.jpg', 3, 79);

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
CREATE TABLE IF NOT EXISTS `suppliers` (
  `sup_id` int(11) NOT NULL AUTO_INCREMENT,
  `sup_name` varchar(50) NOT NULL,
  `sup_email` varchar(80) NOT NULL,
  PRIMARY KEY (`sup_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`sup_id`, `sup_name`, `sup_email`) VALUES
(1, 'Real Bakery', 'Rbakery@bake.com'),
(2, 'Organic Drink Corp', 'Odrink@drinkcorp.com'),
(3, 'Fresh Veggie', 'Fveggie@veggie.com'),
(4, 'Happy Cows Dairy', 'happycow@dairy.com');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ord`
--

DROP TABLE IF EXISTS `supplier_ord`;
CREATE TABLE IF NOT EXISTS `supplier_ord` (
  `sup_ord_id` varchar(100) NOT NULL,
  `sts` enum('SUBMITED','CLOSED') NOT NULL,
  `ord_dte` date NOT NULL,
  `price_sum` decimal(5,2) NOT NULL,
  PRIMARY KEY (`sup_ord_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_ord`
--

INSERT INTO `supplier_ord` (`sup_ord_id`, `sts`, `ord_dte`, `price_sum`) VALUES
('8_20181210000334', 'CLOSED', '2018-12-10', '5.53'),
('5_20181209235615', 'CLOSED', '2018-12-09', '570.00'),
('5_20181209235448', 'CLOSED', '2018-12-09', '38.70'),
('5_20181209235410', 'CLOSED', '2018-12-09', '123.15'),
('5_20181209235340', 'CLOSED', '2018-12-09', '65.91'),
('5_20181209235321', 'CLOSED', '2018-12-09', '86.70'),
('5_20181209235233', 'CLOSED', '2018-12-09', '6.81');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_ord_ln`
--

DROP TABLE IF EXISTS `supplier_ord_ln`;
CREATE TABLE IF NOT EXISTS `supplier_ord_ln` (
  `sup_ord_id` varchar(30) NOT NULL,
  `sup_ord_ln` int(11) NOT NULL,
  `ord_qty` int(11) NOT NULL,
  `prod_id` int(11) NOT NULL,
  `price` decimal(5,2) NOT NULL,
  PRIMARY KEY (`sup_ord_ln`),
  KEY `sup_ord_id` (`sup_ord_id`),
  KEY `product_id` (`prod_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `supplier_ord_ln`
--

INSERT INTO `supplier_ord_ln` (`sup_ord_id`, `sup_ord_ln`, `ord_qty`, `prod_id`, `price`) VALUES
('8_20181210000334', 73, 1, 4, '1.25'),
('8_20181210000334', 74, 2, 7, '4.28'),
('5_20181209235615', 72, 100, 12, '570.00'),
('5_20181209235448', 70, 10, 4, '12.50'),
('5_20181209235448', 71, 10, 5, '26.20'),
('5_20181209235410', 65, 12, 4, '15.00'),
('5_20181209235410', 66, 10, 5, '26.20'),
('5_20181209235410', 67, 15, 2, '30.45'),
('5_20181209235410', 68, 8, 1, '10.00'),
('5_20181209235410', 69, 10, 9, '41.50'),
('5_20181209235340', 63, 15, 4, '18.75'),
('5_20181209235340', 64, 18, 5, '47.16'),
('5_20181209235321', 62, 5, 9, '20.75'),
('5_20181209235321', 61, 5, 10, '17.25'),
('5_20181209235321', 60, 5, 13, '20.10'),
('5_20181209235321', 58, 6, 6, '21.48'),
('5_20181209235321', 59, 2, 15, '7.12'),
('5_20181209235233', 57, 2, 11, '5.56'),
('5_20181209235233', 56, 1, 1, '1.25'),
('5_20181207213914', 39, 2, 5, '5.24'),
('5_20181207213914', 38, 2, 4, '2.50'),
('5_20181208112709', 44, 3, 14, '4.56'),
('5_20181208112709', 43, 2, 11, '5.56'),
('5_20181208112709', 42, 1, 4, '1.25'),
('5_20181208113018', 45, 2, 11, '5.56'),
('5_20181209231438', 54, 1, 6, '3.58'),
('5_20181209233922', 55, 1, 4, '1.25');

-- --------------------------------------------------------

--
-- Table structure for table `sup_ord_tmp`
--

DROP TABLE IF EXISTS `sup_ord_tmp`;
CREATE TABLE IF NOT EXISTS `sup_ord_tmp` (
  `sup_ord_id` int(30) NOT NULL,
  `ord_ln` int(11) NOT NULL AUTO_INCREMENT,
  `ord_qty` int(8) NOT NULL,
  `prod_id` int(11) NOT NULL,
  PRIMARY KEY (`ord_ln`)
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tmp_dob`
--

DROP TABLE IF EXISTS `tmp_dob`;
CREATE TABLE IF NOT EXISTS `tmp_dob` (
  `usr_id` int(11) NOT NULL,
  `days` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `usr_id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(45) NOT NULL,
  `l_name` varchar(45) NOT NULL,
  `e_mail` varchar(80) NOT NULL,
  `phn_num` varchar(11) NOT NULL,
  `dob` date NOT NULL,
  `adr_ln_1` varchar(60) NOT NULL,
  `adr_ln_2` varchar(60) DEFAULT NULL,
  `pstcod` varchar(10) NOT NULL,
  `lvl` enum('MEMBER','ADMIN') NOT NULL DEFAULT 'MEMBER',
  `pswrd` varchar(255) NOT NULL,
  `acc_crt_dte` datetime NOT NULL,
  PRIMARY KEY (`usr_id`),
  UNIQUE KEY `e_mail` (`e_mail`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`usr_id`, `f_name`, `l_name`, `e_mail`, `phn_num`, `dob`, `adr_ln_1`, `adr_ln_2`, `pstcod`, `lvl`, `pswrd`, `acc_crt_dte`) VALUES
(1, 'Admin', 'Biomarket', 'admin@biomarket.co.uk', '1234568', '2018-12-11', 'UWL', 'London', 'W5 5RF', 'ADMIN', '$2y$10$6cCkjGqqf2QyQmxP/w.aEuVHjBgMf3iIBM0Gvo7fkyl.rfdHAaXHS', '2018-12-01 07:31:25'),
(2, 'Edit', 'Egri', 'edit.egri@yahoo.co.uk', '132435', '2018-11-05', '56 Staines Road', 'London', 'TW14 9HP', 'MEMBER', '$2y$10$nAzaXTXVvZMy0CM.yXiJ7.prueM/GMoFNhdzxIx5cke.44KamxjW.', '2018-11-26 00:25:40'),
(3, 'John', 'Small', 'egri.editerika@gmail.com', '242', '2018-12-04', 'cvnc', 'cvnc', 'cnvc', 'MEMBER', '$2y$10$bWP9ae.ZgmWtWKXtkyhJuuzXHytEENL8we8WHOx9UccRtoOUiTtpy', '2018-12-01 15:44:20'),
(4, 'Dominykas', 'Genys', 'dominykasgenysmail@gmail.com', '07401528222', '2018-11-06', '777', 'london', 'tw3 3ne', 'MEMBER', '$2y$10$lXc.2Ep53EIRVOvwc4YKp.TE8039.UE8iGYgF/3uFB9ph.3TIBzSS', '2018-12-01 16:01:44'),
(5, 'AdminTester', 'Tester', '21353578@student.uwl.ac.uk', '07401528456', '2018-09-03', '12 kalo st.', 'london', 'W5 5RF', 'ADMIN', '$2y$10$LsFHtGnFwz8WnYfvkI8TTe0T7Bq99bt7MpadXcXU1H3aOhXU1qh3W', '2018-12-01 16:15:24'),
(6, 'James', 'Evans', 'egri.editerika@sm.com', '242', '2018-12-04', 'cvnc', 'cvnc', 'cnvc', 'MEMBER', '$2y$10$bWP9ae.ZgmWtWKXtkyhJuuzXHytEENL8we8WHOx9UccRtoOUiTtpy', '2018-12-01 15:44:20'),
(7, 'Era', 'Lamm', 'lammmeer@gmail.com', '242', '2018-12-04', '123', 'Feltham', 'cnvc', 'MEMBER', '$2y$10$O2TAs54vH8qmlsw1axMcteoiF8.YWxA51j7FbmuwRI2fVkqv4CpvG', '2018-12-01 15:44:20'),
(8, 'Admin', 'Admin', 'admin', '1234', '2018-12-02', '123 road', 'London', 'W5 5RF', 'ADMIN', '$2y$10$wplUFF.dJLMHSmgFk74vEusuSNOQCJOKZ/oUxUd3rY120I4OAt3Wi', '2018-12-09 11:31:21'),
(9, 'member', 'member', 'member', '123', '2018-12-02', '100 Staines Road', 'London', 'W5 5RF', 'MEMBER', '$2y$10$Kuif4Jbg4PM5wFmWRyTQneTjVpsuNiEh4RB0M2TwxLbJ2h/k57VTK', '2018-12-09 11:32:53');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`cat_id`) REFERENCES `category` (`cat_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;