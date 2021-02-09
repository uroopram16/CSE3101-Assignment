-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 09, 2021 at 06:29 PM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inspogram`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `AID` int(4) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`AID`, `first_name`, `last_name`, `email`, `password`) VALUES
(1, 'Vanie', 'Roopram', 'uroopram@gmail.com', 'Password'),
(2, 'Elizabette', 'France', 'france@yahoo.com', 'oranges'),
(3, 'Sarah', 'Ally', 's_ally@hotmail.com', 'LLLLL'),
(4, 'Mary', 'John', 'mjohn@yahoo.com', 'hellothere');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `CID` int(4) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  `PID` int(4) NOT NULL,
  `AID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`CID`, `comment`, `PID`, `AID`) VALUES
(1, 'Well Said', 1, 2),
(2, 'So true', 1, 4),
(3, 'Well said my friend.', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `creates`
--

CREATE TABLE `creates` (
  `CrID` int(4) NOT NULL,
  `PID` int(4) NOT NULL,
  `AID` int(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creates`
--

INSERT INTO `creates` (`CrID`, `PID`, `AID`) VALUES
(1, 1, 3),
(2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `PID` int(6) NOT NULL,
  `message` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`PID`, `message`) VALUES
(1, 'There is always a rainbow behind a hurricane'),
(2, 'Life is about making an impact, not making an income. --Kevin Kruse');

-- --------------------------------------------------------

--
-- Stand-in structure for view `postview`
-- (See below for the actual view)
--
CREATE TABLE `postview` (
`first_name` varchar(255)
,`last_name` varchar(255)
,`message` varchar(1000)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `viewallpost`
-- (See below for the actual view)
--
CREATE TABLE `viewallpost` (
`message` varchar(1000)
,`comment` varchar(1000)
,`first_name` varchar(255)
,`last_name` varchar(255)
);

-- --------------------------------------------------------

--
-- Structure for view `postview`
--
DROP TABLE IF EXISTS `postview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `postview`  AS  select `accounts`.`first_name` AS `first_name`,`accounts`.`last_name` AS `last_name`,`posts`.`message` AS `message` from ((`posts` join `creates`) join `accounts`) where `creates`.`AID` = `accounts`.`AID` and `posts`.`PID` = `creates`.`PID` ;

-- --------------------------------------------------------

--
-- Structure for view `viewallpost`
--
DROP TABLE IF EXISTS `viewallpost`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `viewallpost`  AS  select `posts`.`message` AS `message`,`comments`.`comment` AS `comment`,`accounts`.`first_name` AS `first_name`,`accounts`.`last_name` AS `last_name` from ((`posts` join `comments`) join `accounts`) where `posts`.`PID` = `comments`.`PID` and `comments`.`AID` = `accounts`.`AID` ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`AID`);

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`CID`),
  ADD KEY `FK_Accountcomment` (`PID`),
  ADD KEY `FK_postcomment` (`AID`);

--
-- Indexes for table `creates`
--
ALTER TABLE `creates`
  ADD PRIMARY KEY (`CrID`),
  ADD KEY `FK_postcreate` (`PID`),
  ADD KEY `FK_accountcreate` (`AID`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`PID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `FK_Accountcomment` FOREIGN KEY (`PID`) REFERENCES `posts` (`PID`),
  ADD CONSTRAINT `FK_postcomment` FOREIGN KEY (`AID`) REFERENCES `accounts` (`AID`);

--
-- Constraints for table `creates`
--
ALTER TABLE `creates`
  ADD CONSTRAINT `FK_accountcreate` FOREIGN KEY (`AID`) REFERENCES `accounts` (`AID`),
  ADD CONSTRAINT `FK_postcreate` FOREIGN KEY (`PID`) REFERENCES `posts` (`PID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
