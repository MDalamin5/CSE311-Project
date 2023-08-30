-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Aug 30, 2023 at 05:43 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `CSE311`
--

-- --------------------------------------------------------

--
-- Table structure for table `Course`
--

CREATE TABLE `Course` (
  `C_no` int(11) NOT NULL,
  `Course_name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Course`
--

INSERT INTO `Course` (`C_no`, `Course_name`) VALUES
(101, 'Mathematics'),
(102, 'History'),
(103, 'Computer Science'),
(104, 'Chemistry'),
(105, 'Physics'),
(106, 'Biology'),
(107, 'Literature'),
(108, 'Geography'),
(109, 'Computer Programming'),
(110, 'Ethics');

-- --------------------------------------------------------

--
-- Table structure for table `Enrollment`
--

CREATE TABLE `Enrollment` (
  `S_no` int(11) NOT NULL,
  `C_no` int(11) NOT NULL,
  `j_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Enrollment`
--

INSERT INTO `Enrollment` (`S_no`, `C_no`, `j_date`) VALUES
(2, 103, '2023-08-03'),
(3, 101, '2023-08-01'),
(4, 104, '2023-08-04'),
(5, 105, '2023-08-05'),
(6, 106, '2023-08-06'),
(7, 107, '2023-08-07'),
(8, 108, '2023-08-08'),
(9, 109, '2023-08-09'),
(10, 110, '2023-08-10');

-- --------------------------------------------------------

--
-- Table structure for table `Student`
--

CREATE TABLE `Student` (
  `S_no` int(11) NOT NULL,
  `S_name` varchar(255) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `Student`
--

INSERT INTO `Student` (`S_no`, `S_name`, `Age`) VALUES
(2, 'Nusrat Islam', 22),
(3, 'Ayesha Rahman', 20),
(4, 'Rahim Khan', 23),
(5, 'Tahmina Akter', 21),
(6, 'Karim Ahmed', 20),
(7, 'Mira Rahman', 22),
(8, 'Imran Hasan', 24),
(9, 'Sakina Begum', 19),
(10, 'Nasir Khan', 21);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Course`
--
ALTER TABLE `Course`
  ADD PRIMARY KEY (`C_no`);

--
-- Indexes for table `Enrollment`
--
ALTER TABLE `Enrollment`
  ADD PRIMARY KEY (`S_no`,`C_no`),
  ADD KEY `C_no` (`C_no`);

--
-- Indexes for table `Student`
--
ALTER TABLE `Student`
  ADD PRIMARY KEY (`S_no`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Enrollment`
--
ALTER TABLE `Enrollment`
  ADD CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`S_no`) REFERENCES `Student` (`S_no`) ON DELETE CASCADE,
  ADD CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`C_no`) REFERENCES `Course` (`C_no`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
