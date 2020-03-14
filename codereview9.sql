-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 14, 2020 at 11:52 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `codereview9`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `zip` int(15) NOT NULL,
  `adresse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`id`, `f_name`, `l_name`, `zip`, `adresse`) VALUES
(1, 'FirstName1', 'LastName1', 1, 'Streetname1/1'),
(2, 'FirstName2', 'LastName2', 2, 'Streetname2/2'),
(3, 'FirstName3', 'LastName3', 3, 'Streetname3/3'),
(4, 'FirstName1', 'LastName1', 1, 'street'),
(5, 'FirstName1', 'LastName1', 1, 'street');

-- --------------------------------------------------------

--
-- Table structure for table `delivery`
--

CREATE TABLE `delivery` (
  `recipient_id` int(11) DEFAULT NULL,
  `package_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `del_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `delivery`
--

INSERT INTO `delivery` (`recipient_id`, `package_id`, `customer_id`, `del_date`) VALUES
(1, 3, 1, NULL),
(2, 1, 2, NULL),
(3, 2, 3, '2020-03-10'),
(2, 2, 2, '2020-03-13'),
(3, 2, 3, '2020-03-10'),
(2, 2, 2, '2020-03-13');

-- --------------------------------------------------------

--
-- Table structure for table `droplocation`
--

CREATE TABLE `droplocation` (
  `id` int(11) NOT NULL,
  `zip` int(15) NOT NULL,
  `adresse` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `droplocation`
--

INSERT INTO `droplocation` (`id`, `zip`, `adresse`) VALUES
(1, 1234, 'DropStreet1'),
(2, 4321, 'DropStreet2'),
(3, 2345, 'DropStreet3');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `f_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`id`, `f_name`) VALUES
(1, 'EmployeeName1'),
(2, 'EmployeeName2'),
(3, 'EmployeeName3');

-- --------------------------------------------------------

--
-- Table structure for table `mailcompany`
--

CREATE TABLE `mailcompany` (
  `name` varchar(100) NOT NULL,
  `employees` int(11) DEFAULT NULL,
  `locations` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `mailcompany`
--

INSERT INTO `mailcompany` (`name`, `employees`, `locations`) VALUES
('Mailio', NULL, NULL),
('Mailio', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `dep_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id`, `customer_id`, `recipient_id`, `dep_date`) VALUES
(1, 1, 2, NULL),
(2, 3, 1, '0000-00-00 00:00:00'),
(3, 1, 2, '2020-03-12 23:00:00'),
(4, 1, 2, '2020-03-12 23:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `processing_action`
--

CREATE TABLE `processing_action` (
  `process_id` int(11) NOT NULL,
  `package_id` int(11) DEFAULT NULL,
  `employee_id` int(11) DEFAULT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `recipient_id` int(11) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `processing_action`
--

INSERT INTO `processing_action` (`process_id`, `package_id`, `employee_id`, `customer_id`, `recipient_id`, `location_id`) VALUES
(1, 1, 1, 1, 1, 1),
(2, 2, 2, 2, 2, 2),
(3, 3, 3, 3, 3, 3);

-- --------------------------------------------------------

--
-- Table structure for table `recipient`
--

CREATE TABLE `recipient` (
  `id` int(11) NOT NULL,
  `f_name` varchar(50) NOT NULL,
  `l_name` varchar(50) NOT NULL,
  `zip` int(15) NOT NULL,
  `adresse` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `recipient`
--

INSERT INTO `recipient` (`id`, `f_name`, `l_name`, `zip`, `adresse`) VALUES
(1, 'FirstName1', 'LastName1', 1111, 'RecipientStreet1'),
(2, 'FirstName2', 'LastName2', 2222, 'RecipientStreet2'),
(3, 'FirstName2', 'LastName2', 3333, 'RecipientStreet2');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `delivery`
--
ALTER TABLE `delivery`
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `droplocation`
--
ALTER TABLE `droplocation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mailcompany`
--
ALTER TABLE `mailcompany`
  ADD KEY `employees` (`employees`),
  ADD KEY `locations` (`locations`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Indexes for table `processing_action`
--
ALTER TABLE `processing_action`
  ADD PRIMARY KEY (`process_id`),
  ADD KEY `package_id` (`package_id`),
  ADD KEY `employee_id` (`employee_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `recipient_id` (`recipient_id`),
  ADD KEY `location_id` (`location_id`);

--
-- Indexes for table `recipient`
--
ALTER TABLE `recipient`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `droplocation`
--
ALTER TABLE `droplocation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `processing_action`
--
ALTER TABLE `processing_action`
  MODIFY `process_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `recipient`
--
ALTER TABLE `recipient`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `delivery`
--
ALTER TABLE `delivery`
  ADD CONSTRAINT `delivery_ibfk_1` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`id`),
  ADD CONSTRAINT `delivery_ibfk_2` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`),
  ADD CONSTRAINT `delivery_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`);

--
-- Constraints for table `mailcompany`
--
ALTER TABLE `mailcompany`
  ADD CONSTRAINT `mailcompany_ibfk_1` FOREIGN KEY (`employees`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `mailcompany_ibfk_2` FOREIGN KEY (`locations`) REFERENCES `droplocation` (`id`);

--
-- Constraints for table `package`
--
ALTER TABLE `package`
  ADD CONSTRAINT `package_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `package_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`id`);

--
-- Constraints for table `processing_action`
--
ALTER TABLE `processing_action`
  ADD CONSTRAINT `processing_action_ibfk_1` FOREIGN KEY (`package_id`) REFERENCES `package` (`id`),
  ADD CONSTRAINT `processing_action_ibfk_2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  ADD CONSTRAINT `processing_action_ibfk_3` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`),
  ADD CONSTRAINT `processing_action_ibfk_4` FOREIGN KEY (`recipient_id`) REFERENCES `recipient` (`id`),
  ADD CONSTRAINT `processing_action_ibfk_5` FOREIGN KEY (`location_id`) REFERENCES `droplocation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
