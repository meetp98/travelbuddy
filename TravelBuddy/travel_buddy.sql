-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2022 at 11:52 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `car_pooling_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `booking_id` int(11) NOT NULL,
  `booking_car_id` varchar(255) NOT NULL,
  `booking_user_id` varchar(255) NOT NULL,
  `booking_name` varchar(255) NOT NULL,
  `booking_contact` varchar(255) NOT NULL,
  `booking_email` varchar(255) NOT NULL,
  `booking_pickup_date` varchar(255) NOT NULL,
  `booking_drop_date` varchar(255) NOT NULL,
  `booking_pickup_address` text NOT NULL,
  `booking_drop_address` text NOT NULL,
  `booking_date` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`booking_id`, `booking_car_id`, `booking_user_id`, `booking_name`, `booking_contact`, `booking_email`, `booking_pickup_date`, `booking_drop_date`, `booking_pickup_address`, `booking_drop_address`, `booking_date`) VALUES
(4, '3', '21', 'Jay Singh', '7896787654', 'jay@gmail.com', '01 March,2018', '10 March,2018', 'Gaur City Noida', 'Ranikhet', '06:58AM on March 16, 2018'),
(5, '4', '25', 'Amit Kumar', '9876543123', 'amit@gmail.com', '16 March,2018', '20 March,2018', 'Amrapali Paltinum Sector 120 Noida', 'Shimla', '07:47AM on March 16, 2018'),
(6, '8', '26', 'Kaushal Kishore', '8978675645', 'kaushal.rahuljaiswal@gmail.com', '26 March,2018', '30 March,2018', 'Pusta Gali New Lahore Colony', 'Mall Road Manali', '08:19AM on March 16, 2018'),
(7, '8', '26', 'Kaushal Kishore', '8978675645', 'kaushal.rahuljaiswal@gmail.com', '19 March,2018', '22 March,2018', 'Pusta Gali New Lahore Colony', 'Mall Road Manali', '08:20AM on March 16, 2018'),
(8, '6', '26', 'Kaushal Kishore', '9876543234', 'kaushal.rahuljaiswal@gmail.com', '16 March,2018', '17 March,2018', '85, Pusta Gali New Lahore Colony', '85, Pusta Gali New Lahore Colony', '08:40AM on March 16, 2018'),
(9, '6', '26', 'Rahul Kumar', '8978675645', 'rahul@gmail.com', '16 March,2018', '20 March,2018', 'Sector 120 Noida', 'Manali HP', '09:08AM on March 16, 2018'),
(10, '2', '25', 'asdf', 'asdf', 'asdf', '16 June,2021', '9 June,2021', 'asdf', 'adsf', '04:08AM on June 03, 2021'),
(11, '6', '25', 'Kausal', '934875839475', 'kaushal@gmail.com', '15 June,2021', '30 June,2021', 'Test', 'Test', '04:39PM on June 15, 2021'),
(12, '2', '8', 'hk', 'jhj', 'hkj', 'hkj', 'hj', 'hjk', 'hj', '06:19PM on October 06, 2022');

-- --------------------------------------------------------

--
-- Table structure for table `cars_car`
--

CREATE TABLE `cars_car` (
  `car_id` int(11) NOT NULL,
  `car_vendor_id` varchar(255) NOT NULL,
  `car_name` varchar(255) NOT NULL,
  `car_type_id` varchar(255) NOT NULL,
  `car_company_id` varchar(255) NOT NULL,
  `car_price` varchar(255) NOT NULL,
  `car_image` varchar(255) NOT NULL,
  `car_description` text NOT NULL,
  `car_number` varchar(255) NOT NULL,
  `car_from_locations` varchar(255) NOT NULL,
  `car_to_locations` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `cars_car`
--

INSERT INTO `cars_car` (`car_id`, `car_vendor_id`, `car_name`, `car_type_id`, `car_company_id`, `car_price`, `car_image`, `car_description`, `car_number`, `car_from_locations`, `car_to_locations`) VALUES
(2, '11', 'Baleno RX1', '2', '1', '1100', '/uploads/2.jpg', 'Keyless chuck Swivel thumb rest Compact case stores all parts. Extension included Comes with a plastic holdle to place the screwdriver bits in it Magnetic bits are easy and tight to absorb into the handle. Handle with rubber wrap for comfortable grip. Comes with a plastic storage box Compact storage design^ convenient to place and carry Multi-functional Pocket Screwdriver Set.\n', '91', 'Noida', 'Delhi'),
(3, '25', 'Tata Nexon', '5', '4', '1170', '/uploads/3.jpg', 'It\'s socks total bad car....it\'s type sale sock. Footpath...I paid 165 but socks total price 30 only.... very very bad...plz don\'t purchase..I am very sarrow.', '199', 'Noida', 'Delhi'),
(4, '25', 'Toyata Fortuner', '7', '4', '1170', '/uploads/4.jpg', 'I run about 40-50 kms a week. I bought this shoe after reading the reviews but am disappointed with this shoe. \n', '87', 'Delhi', 'Gurgaon'),
(5, '25', 'Toyata Innova', '3', '2', '1170', '/uploads/5.png', 'ARTS CHETAN COPPER GOLD PLATED LONG NECKLACE ST WITH JHUMKIES\r\n', '12', 'Delhi', 'Noida'),
(6, '25', 'Swift Dezire ', '4', '2', '1170', '/uploads/6.jpg', 'Car quality is excellent. Pure cotton. Fittings is just perfect. Nice colour combination. Thank you.\n', '15', 'Noida', 'Gurgaon'),
(7, '25', 'Swift', '5', '2', '1200', '/uploads/7.jpg', 'Facial hair is a prominent feature of a man\'s face and it needs to be groomed regularly if you want to maintain a suave image. Helping you do this is this Nova trimmer. It comes with 40 trim settings which let you trim and style your facial hair. This beard trimmer comes with length settings that range from 0.5 mm to 20 mm making it very useful no matter whether you want to maintain a clean-shaven look or a neat beard. The trimmer is designed with titanium coated blades that provide a superior cutting performance. Whats more it comes with washable body , which means it can be used even under the shower. This trimmer works for 90 mins on one quick charge. Designed in such a way that it works both in corded and cordless mode. It also comes with two combs for beard and head hair trimming.It also comes with universal voltage 110-240v which means it can be used worldwide. All these features are packed in this Trimmer with turbo boost motor for efficiency in trimming.', '97', 'Noida', 'Fraidabad'),
(8, '25', 'BMW S3', '8', '2', '1200', '/uploads/8.jpg', 'The Lenovo PA10400 power bank is a high performance and quality car with 2 fast charge output for devices as mobile phone, tablet, etc. It has large capacity of 10400mAH.\n', '100', '', ''),
(9, '25', 'Audi A6', '5', '2', '3423', '/uploads/9.jpg', 'Lens :- UV protective plastic Lens Size :- Medium 58mm Color:- Black color frame with full black lenses Waarnty:- 1 year against manufacturing defects Ideal for:- Men & Women\r\n', '32', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `company_id` int(11) NOT NULL,
  `company_name` varchar(255) NOT NULL,
  `company_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`company_id`, `company_name`, `company_description`) VALUES
(1, 'Mahindra', 'Mahindra Company'),
(2, 'Suzuki', 'Suzuki Company'),
(3, 'Fiat', 'Fiat Company'),
(4, 'Tata', 'Tata Company');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('029pe79xbhotxzfitld7fh65z8n26a21', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2022-10-23 08:20:08'),
('1yszxy97tw2qhvxtkfzcipmqmxg5901o', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-01-26 07:59:01'),
('7j9l72udb3e32lzxea5v0zlgvc83w4k2', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2021-06-29 16:41:15'),
('7ozzxxef6egb64yw36qc8cndu6gl53kk', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-03-01 09:09:57'),
('9bgzvan3fd73sdzjqy4fy90dxwzgmltg', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-01-29 14:09:38'),
('bacotwk5evkwev03q8ofy8wabjb4bdsw', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2022-10-23 06:38:31'),
('c7f2yysow67qjgtrgzabr8rx8eyvdnji', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-01-29 14:19:42'),
('ebqsosvupih3d6rfcy220w6eeoopoqt8', 'NDE1ODNmMjY1ZjNlZDA2Y2ExYzc1ZGU5NWEyNGEzN2IzMWY2OGVjYTp7Im9yZGVyX2lkIjoiMCIsImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-02-21 10:22:08'),
('j1unuxzc2z846m0r1xmkioa3xd63spfg', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-02-21 12:30:00'),
('kud03isj0n68h5im89vd5p02q8egfq3d', 'YTQ3MWUyYmQzZWQ5NTI5YjQ1ZTFlNjFhZTliMTMwMGQ0YTcxYTc2OTp7Im9yZGVyX2lkIjoyLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX25hbWUiOmZhbHNlfQ==', '2018-03-30 09:13:21'),
('lngvm1csvqh3pbft6um4hooeb8ukm84u', 'YTNhMzg2ZjI1NzRiYWRhNjliMzAzZDMwZTZlZmU3NTJiZDI3ZGYzZTp7Im9yZGVyX2lkIjoiMCIsInVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-02-21 12:31:48'),
('pm9ifc6usfn38cwfcpuget8cu0g48c3k', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2018-01-29 13:36:24'),
('qi4jui1wag7y5kjd3nal07b1h2jlc9ia', 'OTJjZGRkY2E5ZjhhZDYwOTczNTQxZDlkNTJhNTYzNGY5ZDRjMDgwMjp7InVzZXJfaWQiOjgsInVzZXJfbGV2ZWxfaWQiOjEsImF1dGhlbnRpY2F0ZWQiOnRydWUsInVzZXJfbmFtZSI6IkFtaXQgS3VtYXIifQ==', '2017-07-21 11:40:27'),
('sq9msnzucmlif2uxg5eqns10znscifu0', 'MDZiNTU1MGVjZDFkNDliNDc3ZWY1OGExZDgwOTk5MWFkYTZjZmE3NDp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2xldmVsX2lkIjpmYWxzZSwidXNlcl9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2018-03-30 08:59:20'),
('xqitzy5mm8bz740ja8unqi2yzmdyj7ed', 'MDMwNWRjNWZmMGI3MjYyOWE1ZDI2YjE1NWEzMjg3OWVkYzM3MjEwNDp7Im9yZGVyX2lkIjozNCwiYXV0aGVudGljYXRlZCI6ZmFsc2UsInVzZXJfbGV2ZWxfaWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9uYW1lIjpmYWxzZX0=', '2018-02-20 13:24:04'),
('z3qym51f7p1bpcfu7dapt5lssmh5z0mk', 'OGQwNWU0ZWZmZWFkN2UxODYzMzQyY2UyY2ZiMzNmOWMxNDU4NWVkMjp7ImF1dGhlbnRpY2F0ZWQiOmZhbHNlLCJ1c2VyX2lkIjpmYWxzZSwidXNlcl9sZXZlbF9pZCI6ZmFsc2UsInVzZXJfbmFtZSI6ZmFsc2V9', '2021-06-17 04:34:36');

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `type_id` int(11) NOT NULL,
  `type_name` varchar(255) NOT NULL,
  `type_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`type_id`, `type_name`, `type_description`) VALUES
(1, 'Hatchback', 'Hatchback Cars'),
(2, 'Sedan', 'Sedan Cars'),
(3, 'MPV', 'MPV Cars'),
(4, 'SUV', 'SUV Cars'),
(5, 'Crossover', 'Crossover Cars'),
(6, 'Convertible', 'Convertible Cars'),
(7, 'Coupe', 'Coupe Cars'),
(8, '14 Seaters', '14 Seaters Cars');

-- --------------------------------------------------------

--
-- Table structure for table `users_city`
--

CREATE TABLE `users_city` (
  `city_id` int(11) NOT NULL,
  `city_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_city`
--

INSERT INTO `users_city` (`city_id`, `city_name`) VALUES
(1, 'Allahabad'),
(2, 'Varanasi');

-- --------------------------------------------------------

--
-- Table structure for table `users_country`
--

CREATE TABLE `users_country` (
  `country_id` int(11) NOT NULL,
  `country_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_country`
--

INSERT INTO `users_country` (`country_id`, `country_name`) VALUES
(1, 'India'),
(2, 'USA');

-- --------------------------------------------------------

--
-- Table structure for table `users_role`
--

CREATE TABLE `users_role` (
  `role_id` int(11) NOT NULL,
  `role_title` varchar(255) NOT NULL,
  `role_description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_role`
--

INSERT INTO `users_role` (`role_id`, `role_title`, `role_description`) VALUES
(1, 'System Admin', 'Admin Roles and Permissions'),
(2, 'Normal User', 'Users Roles and Permissions'),
(3, 'Doctor', 'Doctors User Permission and Role'),
(4, 'Patient', 'Patient User Permission and Role');

-- --------------------------------------------------------

--
-- Table structure for table `users_state`
--

CREATE TABLE `users_state` (
  `state_id` int(11) NOT NULL,
  `state_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_state`
--

INSERT INTO `users_state` (`state_id`, `state_name`) VALUES
(1, 'UttarnPradesh'),
(2, 'Madhya Pradesh');

-- --------------------------------------------------------

--
-- Table structure for table `users_user`
--

CREATE TABLE `users_user` (
  `user_id` int(11) NOT NULL,
  `user_level_id` int(11) NOT NULL DEFAULT 2,
  `user_username` varchar(255) NOT NULL,
  `user_password` varchar(255) NOT NULL,
  `user_name` varchar(255) NOT NULL,
  `user_add1` varchar(255) NOT NULL,
  `user_add2` varchar(255) NOT NULL,
  `user_city` int(11) NOT NULL,
  `user_state` int(11) NOT NULL,
  `user_country` int(11) NOT NULL,
  `user_email` varchar(255) NOT NULL,
  `user_mobile` varchar(255) NOT NULL,
  `user_gender` varchar(255) NOT NULL,
  `user_dob` varchar(255) NOT NULL,
  `user_image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

--
-- Dumping data for table `users_user`
--

INSERT INTO `users_user` (`user_id`, `user_level_id`, `user_username`, `user_password`, `user_name`, `user_add1`, `user_add2`, `user_city`, `user_state`, `user_country`, `user_email`, `user_mobile`, `user_gender`, `user_dob`, `user_image`) VALUES
(8, 1, 'admin', 'test', 'Amit Kumar', 'Allahabad', 'Lunckonw', 1, 1, 1, 'amit@gmail.com', '9878987678', 'Male', '2 July,1987', '/uploads/p1.jpg'),
(10, 1, 'manasa', 'test', 'Manasa Singh', 'House no : 768', 'Noida', 2, 1, 1, 'manasa@gmail.com', '9876543212', 'Female', '18 January,1968', '/uploads/p2.jpg'),
(11, 2, 'aman', 'test', 'Aman Kumar', 'House No : 355, Sector 23', 'Noida', 1, 2, 1, 'aman@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p3.jpg'),
(14, 2, 'pawan', 'test', 'Pawan Kumar', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'pawan@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p5.jpg'),
(15, 3, 'vishal', 'test', 'Vishal Singh', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'vvishal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/d1.jpg'),
(16, 3, 'admin1', 'test', 'Amit Kumar', 'Allahabad', 'Lunckonw', 1, 1, 1, 'amit@gmail.com', '9878987678', 'Male', '2 July,1987', '/uploads/d2.jpg'),
(17, 3, 'manasa', 'test', 'Manasa Singh', 'House no : 768', 'Noida', 2, 1, 1, 'manasa@gmail.com', '9876543212', 'Female', '18 January,1968', '/uploads/d3.jpg'),
(18, 3, 'aman', 'test', 'Aman Kumar', 'House No : 355, Sector 23', 'Noida', 1, 2, 1, 'aman@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/d4.jpg'),
(19, 4, 'kaushal', 'test', 'Kaushal Kishore', 'House No : 355, Sector 23', 'Noida', 2, 2, 2, 'kaushal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p6.jpg'),
(20, 4, 'pawan', 'test', 'Pawan Kumar', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'pawan@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p7.jpg'),
(21, 4, 'vishal', 'test', 'Vishal Singh', 'House No : 355, Sector 23', 'Noida', 1, 1, 2, 'vvishal@gmail.com', '987654321', 'Male', '18 January,1968', '/uploads/p8.jpg'),
(25, 2, 'customer', 'test', 'Kaushal Kishore', 'S  206 Amrapali Zodiac', 'Sector 120 Noida', 1, 2, 1, 'kaushal.rahuljaiswal@gmail.com', '8376986802', 'Male', '12 February,2018', '/uploads/28bdc83.jpg'),
(26, 2, 'jay', 'test', 'Jay Kumar', 'Add1', '', 1, 1, 2, 'jay@gmail.com', '9876543212', 'Male', '16 March,2018', '/uploads/Screen%20Shot%202018-03-14%20at%205.51.04%20PM.png');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `cars_car`
--
ALTER TABLE `cars_car`
  ADD PRIMARY KEY (`car_id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`company_id`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`type_id`);

--
-- Indexes for table `users_city`
--
ALTER TABLE `users_city`
  ADD PRIMARY KEY (`city_id`);

--
-- Indexes for table `users_country`
--
ALTER TABLE `users_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indexes for table `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`role_id`);

--
-- Indexes for table `users_state`
--
ALTER TABLE `users_state`
  ADD PRIMARY KEY (`state_id`);

--
-- Indexes for table `users_user`
--
ALTER TABLE `users_user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `booking`
--
ALTER TABLE `booking`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `cars_car`
--
ALTER TABLE `cars_car`
  MODIFY `car_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `company_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users_city`
--
ALTER TABLE `users_city`
  MODIFY `city_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_country`
--
ALTER TABLE `users_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_role`
--
ALTER TABLE `users_role`
  MODIFY `role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users_state`
--
ALTER TABLE `users_state`
  MODIFY `state_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_user`
--
ALTER TABLE `users_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
