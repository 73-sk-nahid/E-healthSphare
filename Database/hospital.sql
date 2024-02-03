-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 03, 2024 at 06:37 PM
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
-- Database: `hospital`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointment`
--

CREATE TABLE `appointment` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `fromm` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `too` varchar(255) NOT NULL,
  `cTime` varchar(255) NOT NULL,
  `paymentstatus` varchar(255) DEFAULT NULL,
  `transID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `appointment`
--

INSERT INTO `appointment` (`id`, `name`, `fromm`, `phone`, `message`, `too`, `cTime`, `paymentstatus`, `transID`) VALUES
(35, 'Sk. Redwan', '4067', '01521709192', 'hlw', 'e37c742a49ef62f9f9340d7f05be4e30', '1706973888', 'Paid', '65be5ac06bd9d'),
(36, 'Sk. Redwan', '4067', '01521709192', 'urgent', 'e37c742a49ef62f9f9340d7f05be4e30', '1706974185', 'Paid', '65be5be93863d'),
(37, 'Sk. Redwan', '4067', '01521709192', 'fever', 'e37c742a49ef62f9f9340d7f05be4e30', '1706974211', 'Paid', '65be5c0361721');

-- --------------------------------------------------------

--
-- Table structure for table `hiv`
--

CREATE TABLE `hiv` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `moc` varchar(255) NOT NULL,
  `dComments` text NOT NULL,
  `cTime` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `outbreaks`
--

CREATE TABLE `outbreaks` (
  `id` int(11) NOT NULL,
  `outBreak` varchar(255) NOT NULL,
  `comments` text NOT NULL,
  `location` varchar(255) NOT NULL,
  `cTime` varchar(255) NOT NULL,
  `measures` text NOT NULL,
  `token` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `age` varchar(255) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `dateOfBirth` varchar(255) NOT NULL,
  `cTime` varchar(255) NOT NULL,
  `diagnosis` text NOT NULL,
  `prescription` text NOT NULL,
  `token` varchar(255) NOT NULL,
  `doctor` varchar(255) NOT NULL,
  `number` varchar(255) DEFAULT NULL,
  `pcondition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `name`, `location`, `age`, `gender`, `phone`, `dateOfBirth`, `cTime`, `diagnosis`, `prescription`, `token`, `doctor`, `number`, `pcondition`) VALUES
(1, 'Sk. Redwan', 'Demra, Dhaka', '23', 'Male', '01521709192', '10 - 02 - 2001', '1706942230', 'Heart Block', 'Finix -20mg', 'ec915f6366a3ce25145a507b7df076a5', 'e37c742a49ef62f9f9340d7f05be4e30', '4067', 'Inpatient');

-- --------------------------------------------------------

--
-- Table structure for table `paymentstatus`
--

CREATE TABLE `paymentstatus` (
  `amount` int(11) NOT NULL,
  `status` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) NOT NULL,
  `secondName` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `profile` varchar(255) DEFAULT NULL,
  `gender` varchar(255) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstName`, `secondName`, `email`, `password`, `token`, `status`, `phone`, `profile`, `gender`, `role`) VALUES
(1, 'E-healthsphare', 'Admin', 'ehealthsphere01@gmail.com', '111111', '1234567890', 1, '0712345678', NULL, 'Male', 'admin'),
(2, 'Sk. Nahid', 'Ahmed', 'nahidsheikh2001@gmail.com', 'hospital', 'e37c742a49ef62f9f9340d7f05be4e30', 2, '01521709192', NULL, 'Male', 'Heart Surgeons');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointment`
--
ALTER TABLE `appointment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hiv`
--
ALTER TABLE `hiv`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `outbreaks`
--
ALTER TABLE `outbreaks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointment`
--
ALTER TABLE `appointment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `hiv`
--
ALTER TABLE `hiv`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `outbreaks`
--
ALTER TABLE `outbreaks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
