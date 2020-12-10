-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 10, 2020 at 10:35 AM
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
-- Database: `final_erd_abideen_gihozo`
--

-- --------------------------------------------------------

--
-- Table structure for table `bill`
--

CREATE TABLE `bill` (
  `bill_id` varchar(10) NOT NULL,
  `premise_id` varchar(10) DEFAULT NULL,
  `tarrif_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `bill`
--

INSERT INTO `bill` (`bill_id`, `premise_id`, `tarrif_id`) VALUES
('b001', 'p001', 't001'),
('b002', 'p002', 't002'),
('b003', 'p003', 't001'),
('b004', 'p004', 't001'),
('b005', 'p002', 't002'),
('b006', 'p004', 't001');

-- --------------------------------------------------------

--
-- Table structure for table `charge structure`
--

CREATE TABLE `charge structure` (
  `tarrif_id` varchar(10) DEFAULT NULL,
  `lower_limit` int(11) DEFAULT NULL,
  `upper_limit` int(11) DEFAULT NULL,
  `  charge` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `charge structure`
--

INSERT INTO `charge structure` (`tarrif_id`, `lower_limit`, `upper_limit`, `  charge`) VALUES
('t001', 500, 1000, 900),
('t002', 1000, 2000, 1900);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` varchar(10) NOT NULL,
  `customer_name` varchar(50) DEFAULT NULL,
  `phone_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `phone_number`) VALUES
('c001', 'Barezi ', 780170123),
('c002', 'Abideen', 789162735),
('c003', 'Gihozo', 786351792),
('c004', 'Jane', 785602900),
('c005', 'John', 789165433);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `bill_id` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(10) NOT NULL,
  `amount_paid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`bill_id`, `transaction_id`, `amount_paid`) VALUES
('b001', 'tr001', 10000),
('b002', 'tr002', 2450),
('b003', 'tr003', 6780),
('b004', 'tr004', 5420),
('b005', 'tr005', 7890),
('b006', 'tr006', 6000);

-- --------------------------------------------------------

--
-- Table structure for table `plant`
--

CREATE TABLE `plant` (
  `plant_id` varchar(10) NOT NULL,
  `plant_name` varchar(50) DEFAULT NULL,
  `plant_capacity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `plant`
--

INSERT INTO `plant` (`plant_id`, `plant_name`, `plant_capacity`) VALUES
('pl001', 'kicukiro', 598),
('pl002', 'kacyiru', 1000),
('pl003', 'masoro', 1200),
('pl004', 'remera', 809),
('pl005', 'rango', 1290),
('pl006', 'lagos', 2390),
('pl007', 'kabuga', 3121),
('pl008', 'tumba', 2119);

-- --------------------------------------------------------

--
-- Table structure for table `premise`
--

CREATE TABLE `premise` (
  `premise_id` varchar(10) NOT NULL,
  `customer_id` varchar(10) DEFAULT NULL,
  `meter_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `premise`
--

INSERT INTO `premise` (`premise_id`, `customer_id`, `meter_number`) VALUES
('p001', 'c001', 12345),
('p002', 'c002', 12543),
('p003', 'c003', 12678),
('p004', 'c004', 12898),
('p005', 'c005', 12678);

-- --------------------------------------------------------

--
-- Table structure for table `route`
--

CREATE TABLE `route` (
  `route_id` varchar(10) NOT NULL,
  `route_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `route`
--

INSERT INTO `route` (`route_id`, `route_name`) VALUES
('r001', 'kck'),
('r002', 'kyl'),
('r003', 'msr'),
('r004', 'rmr'),
('r005', NULL),
('r006', 'lgs'),
('r007', 'kbg'),
('r008', 'tmb');

-- --------------------------------------------------------

--
-- Table structure for table `sector`
--

CREATE TABLE `sector` (
  `sector_id` varchar(10) NOT NULL,
  `sector_name` varchar(50) DEFAULT NULL,
  `sector_address` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sector`
--

INSERT INTO `sector` (`sector_id`, `sector_name`, `sector_address`) VALUES
('se001', 'sector1', 'S501st'),
('se002', 'sector2', 'S502st'),
('se003', 'sector3', 'S503st'),
('se004', 'sector4', 'S504st'),
('se005', 'sector5', 'S505st');

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `staff_id` varchar(10) NOT NULL,
  `staff_name` varchar(50) DEFAULT NULL,
  `sector_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`staff_id`, `staff_name`, `sector_id`) VALUES
('s001', 'Steph', 'se001'),
('s002', 'Jacob', 'se002'),
('s003', 'Ben', 'se003'),
('s004', 'Gyslain', 'se004'),
('s005', 'Queen', 'se005'),
('s006', 'Chris', 'se003'),
('s007', 'Joe', 'se004'),
('s008', 'Dorcy', 'se001');

-- --------------------------------------------------------

--
-- Table structure for table `tarrif`
--

CREATE TABLE `tarrif` (
  `tarrif_id` varchar(10) NOT NULL,
  `tarrif_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tarrif`
--

INSERT INTO `tarrif` (`tarrif_id`, `tarrif_name`) VALUES
('t001', 'domestic'),
('t002', 'commercial');

-- --------------------------------------------------------

--
-- Table structure for table `zone`
--

CREATE TABLE `zone` (
  `zone_id` varchar(10) NOT NULL,
  `zone_name` varchar(50) DEFAULT NULL,
  `sector_id` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `zone`
--

INSERT INTO `zone` (`zone_id`, `zone_name`, `sector_id`) VALUES
('z001', 'gakenke', 'se001'),
('z002', 'abuja', 'se001'),
('z003', 'nyanza', 'se002'),
('z004', 'kanombe', 'se002'),
('z005', 'burundi', 'se003'),
('z006', 'brazilian', 'se003'),
('z007', 'nyagatare', 'se004'),
('z008', 'kirehe', 'se004'),
('z009', 'gasabo', 'se005'),
('z010', 'gikondo', 'se005');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`transaction_id`);

--
-- Indexes for table `plant`
--
ALTER TABLE `plant`
  ADD PRIMARY KEY (`plant_id`);

--
-- Indexes for table `premise`
--
ALTER TABLE `premise`
  ADD PRIMARY KEY (`premise_id`);

--
-- Indexes for table `route`
--
ALTER TABLE `route`
  ADD PRIMARY KEY (`route_id`);

--
-- Indexes for table `sector`
--
ALTER TABLE `sector`
  ADD PRIMARY KEY (`sector_id`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `tarrif`
--
ALTER TABLE `tarrif`
  ADD PRIMARY KEY (`tarrif_id`);

--
-- Indexes for table `zone`
--
ALTER TABLE `zone`
  ADD PRIMARY KEY (`zone_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
