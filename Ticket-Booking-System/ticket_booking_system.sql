-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2023 at 04:04 PM
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
-- Database: `ticket_booking_system`
--

-- --------------------------------------------------------

--
-- Table structure for table `buses`
--

CREATE TABLE `buses` (
  `Bus_Number` int(11) NOT NULL,
  `Seating_capacity` int(11) DEFAULT NULL,
  `Model` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `business_man`
--

CREATE TABLE `business_man` (
  `Passenger_ID` int(11) NOT NULL,
  `Business_Name` varchar(30) DEFAULT NULL,
  `Business_Type` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_reservation`
--

CREATE TABLE `bus_reservation` (
  `Reservation_id` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Seat_Number` int(11) DEFAULT NULL,
  `Ticket_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_routes`
--

CREATE TABLE `bus_routes` (
  `Route_Number` int(11) NOT NULL,
  `Starting_Point` varchar(30) DEFAULT NULL,
  `Destination` varchar(30) DEFAULT NULL,
  `Distance` int(11) DEFAULT NULL,
  `Total_Fare` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_schedule`
--

CREATE TABLE `bus_schedule` (
  `Schedule_ID` int(11) NOT NULL,
  `Departure_Time` datetime DEFAULT NULL,
  `Arrival_Time` datetime DEFAULT NULL,
  `Route_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_stations`
--

CREATE TABLE `bus_stations` (
  `Station_id` int(11) NOT NULL,
  `Station_Name` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bus_stops`
--

CREATE TABLE `bus_stops` (
  `BusStop_ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Location` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `Discount_id` int(11) NOT NULL,
  `Discount_Type` varchar(20) DEFAULT NULL,
  `Amount` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `freedom_fighter`
--

CREATE TABLE `freedom_fighter` (
  `Passenger_ID` int(11) NOT NULL,
  `Fighter_Name` varchar(30) DEFAULT NULL,
  `Award_Received` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `journey_history`
--

CREATE TABLE `journey_history` (
  `History_id` int(11) NOT NULL,
  `Past_trip` varchar(50) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Ticket_details` text DEFAULT NULL,
  `Passenger_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `Notification_id` int(11) NOT NULL,
  `Message` text DEFAULT NULL,
  `Notification_type` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `other`
--

CREATE TABLE `other` (
  `Passenger_ID` int(11) NOT NULL,
  `Descriptions` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `passengers`
--

CREATE TABLE `passengers` (
  `Passenger_ID` int(11) NOT NULL,
  `Name` varchar(30) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Mobile_number` varchar(11) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Institute` varchar(30) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Profession` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_method`
--

CREATE TABLE `payment_method` (
  `Pay_method_id` int(11) NOT NULL,
  `Method_Name` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `Refund_id` int(11) NOT NULL,
  `Refund_Amount` decimal(10,2) DEFAULT NULL,
  `Reason` text DEFAULT NULL,
  `Ticket_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `seat`
--

CREATE TABLE `seat` (
  `Seat_ID` int(11) NOT NULL,
  `Seat_Number` int(11) DEFAULT NULL,
  `Bus_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `service_holder`
--

CREATE TABLE `service_holder` (
  `Passenger_ID` int(11) NOT NULL,
  `Company_Name` varchar(20) DEFAULT NULL,
  `Position` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student`
--

CREATE TABLE `student` (
  `Passenger_ID` int(11) NOT NULL,
  `Major` varchar(10) DEFAULT NULL,
  `Student_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tickets`
--

CREATE TABLE `tickets` (
  `Ticket_Number` int(11) NOT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Passenger_id` int(11) DEFAULT NULL,
  `Type_id` int(11) DEFAULT NULL,
  `Pay_method_id` int(11) DEFAULT NULL,
  `Bus_number` int(11) DEFAULT NULL,
  `Schedule_id` int(11) DEFAULT NULL,
  `Discount_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ticket_types`
--

CREATE TABLE `ticket_types` (
  `Type_ID` int(11) NOT NULL,
  `Type_Name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `buses`
--
ALTER TABLE `buses`
  ADD PRIMARY KEY (`Bus_Number`);

--
-- Indexes for table `business_man`
--
ALTER TABLE `business_man`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `bus_reservation`
--
ALTER TABLE `bus_reservation`
  ADD PRIMARY KEY (`Reservation_id`),
  ADD KEY `Ticket_number` (`Ticket_number`);

--
-- Indexes for table `bus_routes`
--
ALTER TABLE `bus_routes`
  ADD PRIMARY KEY (`Route_Number`);

--
-- Indexes for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD PRIMARY KEY (`Schedule_ID`),
  ADD KEY `Route_number` (`Route_number`);

--
-- Indexes for table `bus_stations`
--
ALTER TABLE `bus_stations`
  ADD PRIMARY KEY (`Station_id`);

--
-- Indexes for table `bus_stops`
--
ALTER TABLE `bus_stops`
  ADD PRIMARY KEY (`BusStop_ID`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`Discount_id`);

--
-- Indexes for table `freedom_fighter`
--
ALTER TABLE `freedom_fighter`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `journey_history`
--
ALTER TABLE `journey_history`
  ADD PRIMARY KEY (`History_id`),
  ADD KEY `Passenger_id` (`Passenger_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`Notification_id`);

--
-- Indexes for table `other`
--
ALTER TABLE `other`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `passengers`
--
ALTER TABLE `passengers`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `payment_method`
--
ALTER TABLE `payment_method`
  ADD PRIMARY KEY (`Pay_method_id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`Refund_id`),
  ADD KEY `Ticket_number` (`Ticket_number`);

--
-- Indexes for table `seat`
--
ALTER TABLE `seat`
  ADD PRIMARY KEY (`Seat_ID`),
  ADD KEY `Bus_ID` (`Bus_ID`);

--
-- Indexes for table `service_holder`
--
ALTER TABLE `service_holder`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`Passenger_ID`);

--
-- Indexes for table `tickets`
--
ALTER TABLE `tickets`
  ADD PRIMARY KEY (`Ticket_Number`),
  ADD KEY `Passenger_id` (`Passenger_id`),
  ADD KEY `Type_id` (`Type_id`),
  ADD KEY `Pay_method_id` (`Pay_method_id`),
  ADD KEY `Bus_number` (`Bus_number`),
  ADD KEY `Schedule_id` (`Schedule_id`),
  ADD KEY `Discount_id` (`Discount_id`);

--
-- Indexes for table `ticket_types`
--
ALTER TABLE `ticket_types`
  ADD PRIMARY KEY (`Type_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `business_man`
--
ALTER TABLE `business_man`
  ADD CONSTRAINT `business_man_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `bus_reservation`
--
ALTER TABLE `bus_reservation`
  ADD CONSTRAINT `bus_reservation_ibfk_1` FOREIGN KEY (`Ticket_number`) REFERENCES `tickets` (`Ticket_Number`);

--
-- Constraints for table `bus_schedule`
--
ALTER TABLE `bus_schedule`
  ADD CONSTRAINT `bus_schedule_ibfk_1` FOREIGN KEY (`Route_number`) REFERENCES `bus_routes` (`Route_Number`);

--
-- Constraints for table `freedom_fighter`
--
ALTER TABLE `freedom_fighter`
  ADD CONSTRAINT `freedom_fighter_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `journey_history`
--
ALTER TABLE `journey_history`
  ADD CONSTRAINT `journey_history_ibfk_1` FOREIGN KEY (`Passenger_id`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `other`
--
ALTER TABLE `other`
  ADD CONSTRAINT `other_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `refund_ibfk_1` FOREIGN KEY (`Ticket_number`) REFERENCES `tickets` (`Ticket_Number`);

--
-- Constraints for table `seat`
--
ALTER TABLE `seat`
  ADD CONSTRAINT `seat_ibfk_1` FOREIGN KEY (`Bus_ID`) REFERENCES `buses` (`Bus_Number`);

--
-- Constraints for table `service_holder`
--
ALTER TABLE `service_holder`
  ADD CONSTRAINT `service_holder_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibfk_1` FOREIGN KEY (`Passenger_ID`) REFERENCES `passengers` (`Passenger_ID`);

--
-- Constraints for table `tickets`
--
ALTER TABLE `tickets`
  ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`Passenger_id`) REFERENCES `passengers` (`Passenger_ID`),
  ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`Type_id`) REFERENCES `ticket_types` (`Type_ID`),
  ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`Pay_method_id`) REFERENCES `payment_method` (`Pay_method_id`),
  ADD CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`Bus_number`) REFERENCES `buses` (`Bus_Number`),
  ADD CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`Schedule_id`) REFERENCES `bus_schedule` (`Schedule_ID`),
  ADD CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`Discount_id`) REFERENCES `discount` (`Discount_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
