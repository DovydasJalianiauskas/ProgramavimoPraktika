-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 17, 2023 at 08:34 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `programavimopraktika`
--
CREATE DATABASE IF NOT EXISTS `programavimopraktika` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `programavimopraktika`;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `ServiceID` int(11) NOT NULL,
  `ServiceName` varchar(255) NOT NULL,
  `ServiceCost` decimal(10,2) NOT NULL,
  `UserGroupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`ServiceID`, `ServiceName`, `ServiceCost`, `UserGroupID`) VALUES
(1, 'Elevator fee', 20.99, 1),
(2, 'Electricity', 50.00, 1),
(3, 'Cold Water fee', 15.99, 1),
(4, 'Hot Water fee', 25.99, 1),
(6, 'Electricity', 16.13, 2),
(7, 'Cold Water fee', 17.32, 2),
(8, 'Hot Water fee', 23.24, 2),
(9, 'Gas', 49.23, 2),
(10, 'Electricity', 67.06, 3),
(11, 'Cold Water fee', 43.93, 3),
(12, 'Hot Water fee', 68.45, 3),
(13, 'Gas', 65.45, 3),
(14, 'Electricity', 41.93, 4),
(15, 'Cold Water fee', 63.27, 4),
(16, 'Hot Water fee', 45.56, 4),
(17, 'Gas', 23.00, 4),
(18, 'Elevator fee', 28.32, 5),
(19, 'Electricity', 57.61, 5),
(20, 'Cold Water fee', 58.09, 5),
(21, 'Hot Water fee', 37.61, 5),
(22, 'Gas', 63.76, 5);

-- --------------------------------------------------------

--
-- Table structure for table `usergroups`
--

CREATE TABLE `usergroups` (
  `UserGroupID` int(11) NOT NULL,
  `Location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usergroups`
--

INSERT INTO `usergroups` (`UserGroupID`, `Location`) VALUES
(1, 'Kalvarijų street'),
(2, 'Ulonų street'),
(3, 'Žalgirio street'),
(4, 'Rinktinės street'),
(5, 'Studentų street');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `Username` varchar(30) NOT NULL,
  `Password` varchar(30) NOT NULL,
  `Privilege` int(11) NOT NULL,
  `UserGroupID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`UserID`, `Username`, `Password`, `Privilege`, `UserGroupID`) VALUES
(1, 'Admin', 'Admin123', 1, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`ServiceID`),
  ADD KEY `FK_UserGroupID` (`UserGroupID`);

--
-- Indexes for table `usergroups`
--
ALTER TABLE `usergroups`
  ADD PRIMARY KEY (`UserGroupID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD KEY `FK_UserGroups_UserGroupID` (`UserGroupID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `ServiceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `usergroups`
--
ALTER TABLE `usergroups`
  MODIFY `UserGroupID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `FK_UserGroupID` FOREIGN KEY (`UserGroupID`) REFERENCES `usergroups` (`UserGroupID`) ON DELETE CASCADE,
  ADD CONSTRAINT `services_ibfk_1` FOREIGN KEY (`UserGroupID`) REFERENCES `usergroups` (`UserGroupID`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `FK_UserGroups_UserGroupID` FOREIGN KEY (`UserGroupID`) REFERENCES `usergroups` (`UserGroupID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
