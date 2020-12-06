-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 03, 2020 at 09:02 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mwsc_abideen_gihozo.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `bill_id` varchar(50) NOT NULL,
  `premise_id` varchar(50) DEFAULT NULL,
  `reading_id` varchar(50) DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `period_of_billing(month)` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `due_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bills`
--

INSERT INTO `bills` (`bill_id`, `premise_id`, `reading_id`, `staff_id`, `period_of_billing(month)`, `amount`, `due_date`) VALUES
('b001', 'p001', 'r001', 's001', 'sep', 1000, '2020-12-31'),
('b002', 'p002', 'r002', 's002', 'sep', 2000, '2020-12-31'),
('b003', 'p003', 'r003', 's003', 'sep', 3200, '2020-12-31'),
('b004', 'p001', 'r004', 's001', 'oct', 2300, '2021-01-31'),
('b005', 'p002', 'r005', 's001', 'oct', 4590, '2021-01-31'),
('b006', 'p001', 'r006', 's001', 'nov', 1000, '2020-12-31'),
('b007', 'p002', 'r007', 's002', 'nov', 200, '2020-12-31');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `name` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) NOT NULL,
  `phone_nbr` int(11) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`name`, `customer_id`, `phone_nbr`, `email`) VALUES
('Gihozo', 'c001', 780188888, 'gihozo@gmail.com'),
('Barezi', 'c002', 786527891, 'barezi@gmail.com'),
('Abideen', 'c003', 781726355, 'deen@gmail.com'),
('Kenny', 'c004', 724152618, 'kenny@gmail.com'),
('Jane', 'c005', 781919829, 'janedoe@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `payment_id` varchar(50) NOT NULL,
  `bill_id` varchar(50) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `remaining_amt` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`payment_id`, `bill_id`, `customer_id`, `remaining_amt`) VALUES
('pm001', 'b001', 'c001', 0),
('pm002', 'b002', 'c002', 0),
('pm003', 'b003', 'c003', 0);

-- --------------------------------------------------------

--
-- Table structure for table `plants`
--

CREATE TABLE `plants` (
  `plant_id` varchar(50) NOT NULL,
  `plant_name` varchar(50) DEFAULT NULL,
  `size_in_cubic_meter` int(11) DEFAULT NULL,
  `route_name` varchar(50) DEFAULT NULL,
  `zone_id` varchar(50) DEFAULT NULL,
  `supply_capacity` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plants`
--

INSERT INTO `plants` (`plant_id`, `plant_name`, `size_in_cubic_meter`, `route_name`, `zone_id`, `supply_capacity`) VALUES
('pl001', 'kicukiro', 600, 'kck', 'z001', '500'),
('pl002', 'kacyiru', 800, 'kyl', 'z002', '678'),
('pl003', 'masoro', 900, 'msr', 'z003', ''),
('pl004', 'remera', 543, 'rmr', 'z004', '756'),
('pl005', 'rango', 463, 'rng', 'z005', '837'),
('pl006', 'lagos', 674, 'lgs', 'z006', '753'),
('pl007', 'kabuga', 645, 'kbg', 'z007', '912'),
('pl008', 'tumba', 4322, 'tmb', 'z008', '432');

-- --------------------------------------------------------

--
-- Table structure for table `premises`
--

CREATE TABLE `premises` (
  `premise_id` varchar(50) NOT NULL,
  `customer_id` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `structure` varchar(12) DEFAULT NULL,
  `status` varchar(50) DEFAULT NULL,
  `route_id` varchar(50) DEFAULT NULL,
  `meter_number` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premises`
--

INSERT INTO `premises` (`premise_id`, `customer_id`, `address`, `structure`, `status`, `route_id`, `meter_number`) VALUES
('p001', 'c001', 'addy01', 'domestic', 'paid', 'r001', 'meter001'),
('p002', 'c002', 'addy2', 'domestic', 'paid', 'r002', 'meter002'),
('p003', 'c003', 'addy3', 'domestic', 'paid', 'r003', 'meter003'),
('p004', 'c004', 'addy4', 'domestic', 'paid', 'r001', 'meter004'),
('p005', 'c005', 'addy5', 'commercial', 'not paid', 'r002', 'meter005');

-- --------------------------------------------------------

--
-- Table structure for table `readings`
--

CREATE TABLE `readings` (
  `premise_id` varchar(50) DEFAULT NULL,
  `staff_id` varchar(50) DEFAULT NULL,
  `previous_reading` int(11) DEFAULT NULL,
  `current_reading` int(11) DEFAULT NULL,
  `month` varchar(50) DEFAULT NULL,
  `date` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `readings`
--

INSERT INTO `readings` (`premise_id`, `staff_id`, `previous_reading`, `current_reading`, `month`, `date`) VALUES
('p001', 's001', 12, 21, 'sep', 20200930),
('p002', 's002', 34, 73, 'sep', 20200930),
('p003', 's003', 56, 89, 'sep', 20200930),
('p004', 's001', 87, 97, 'sep', 20200930),
('p005', 's002', 90, 101, 'sep', 20200930);

-- --------------------------------------------------------

--
-- Table structure for table `routes`
--

CREATE TABLE `routes` (
  `route_id` varchar(50) NOT NULL,
  `route_name` varchar(50) DEFAULT NULL,
  `plant_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `routes`
--

INSERT INTO `routes` (`route_id`, `route_name`, `plant_id`) VALUES
('r001', 'kck', 'pl001'),
('r002', 'kyl', 'pl002'),
('r003', 'msr', 'pl003'),
('r004', 'rmr', 'pl004'),
('r005', 'rng', 'pl005'),
('r006', 'lgs', 'pl006'),
('r007', 'kbg', 'pl007'),
('r008', 'tmb', 'pl008');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `sector_id` varchar(50) NOT NULL,
  `sector_name` varchar(50) DEFAULT NULL,
  `plant_name` varchar(50) DEFAULT NULL,
  `monthly_consumption` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`sector_id`, `sector_name`, `plant_name`, `monthly_consumption`) VALUES
('se001', 'sector1', 'kicukiro', '1200'),
('se002', 'sector2', 'kicukiro', '3210'),
('se003', 'sector3', 'masoro', '8900'),
('se004', 'sector4', 'remera', '2300');

-- --------------------------------------------------------

--
-- Table structure for table `sector office`
--

CREATE TABLE `sector office` (
  `sector_id` varchar(50) DEFAULT NULL,
  `office_id` varchar(50) NOT NULL,
  `office_manager` varchar(50) DEFAULT NULL,
  `office_location` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector office`
--

INSERT INTO `sector office` (`sector_id`, `office_id`, `office_manager`, `office_location`) VALUES
('se001', 'o001', 'Queen', 'Kigali heights'),
('se002', 'o002', 'James', 'T2000'),
('se003', 'o003', 'Chris', 'Kanombe'),
('se004', 'o004', 'Joe', 'Gikondo');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `office_id` varchar(50) DEFAULT NULL,
  `staff_id` varchar(50) NOT NULL,
  `staff_name` varchar(50) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`office_id`, `staff_id`, `staff_name`, `role`) VALUES
('o001', 's001', 'Steph', 'biller'),
('o002', 's002', 'Jacob', 'biller'),
('o003', 's003', 'Ben', 'biller'),
('o004', 's004', 'James', 'supervisor'),
('o001', 's005', 'Queen', 'supervisor'),
('o002', 's006', 'Chris', 'supervisor'),
('o003', 's007', 'Joe', 'supervisor');

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `sector_id` varchar(50) DEFAULT NULL,
  `zone_id` varchar(50) NOT NULL,
  `zone_name` varchar(50) DEFAULT NULL,
  `route_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zones`
--

INSERT INTO `zones` (`sector_id`, `zone_id`, `zone_name`, `route_name`) VALUES
('se001', 'z001', 'kicukiro', 'kck'),
('se001', 'z002', 'kacyiru', 'kyl'),
('se002', 'z003', 'masoro', 'msr'),
('se002', 'z004', 'remera', 'rmr'),
('se003', 'z005', 'rango', 'rng'),
('se003', 'z006', 'lagos', 'lgs'),
('se004', 'z007', 'kabuga', 'kbg'),
('se004', 'z008', 'tumba', 'tmb');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `plants`
--
ALTER TABLE `plants`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indexes for table `premises`
--
ALTER TABLE `premises`
  ADD PRIMARY KEY (`premise_id`);

--
-- Indexes for table `routes`
--
ALTER TABLE `routes`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sector_id`);

--
-- Indexes for table `sector office`
--
ALTER TABLE `sector office`
  ADD PRIMARY KEY (`office_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`zone_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
