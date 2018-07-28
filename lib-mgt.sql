-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3307
-- Generation Time: Jul 23, 2018 at 06:26 PM
-- Server version: 10.2.14-MariaDB
-- PHP Version: 5.6.35

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cs548_library`
--
CREATE DATABASE IF NOT EXISTS `cs548_library` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cs548_library`;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `bookid` int(15) NOT NULL AUTO_INCREMENT,
  `title` varchar(15) NOT NULL,
  `author` varchar(15) NOT NULL,
  `isbn` int(10) NOT NULL,
  PRIMARY KEY (`bookid`),
  UNIQUE KEY `name_UNIQUE` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`bookid`, `title`, `author`, `isbn`) VALUES
(200, 'MATH', 'PAUL', 1111),
(201, 'HISTORY', 'KATHLENE', 2222),
(202, 'SCIENCE', 'FAITH', 3333),
(203, 'ECONOMY', 'ALISON', 4444);

-- --------------------------------------------------------

--
-- Table structure for table `bookissue`
--

DROP TABLE IF EXISTS `bookissue`;
CREATE TABLE IF NOT EXISTS `bookissue` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `memid` int(15) NOT NULL,
  `bookid` int(15) NOT NULL,
  `issuedate` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `memid` (`memid`),
  KEY `bookid` (`bookid`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bookissue`
--

INSERT INTO `bookissue` (`id`, `memid`, `bookid`, `issuedate`) VALUES
(1, 1000, 203, NULL),
(2, 1000, 201, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
CREATE TABLE IF NOT EXISTS `member` (
  `memid` int(15) NOT NULL AUTO_INCREMENT,
  `name` varchar(15) NOT NULL DEFAULT '',
  `address` varchar(15) NOT NULL DEFAULT '',
  `classification` varchar(15) NOT NULL DEFAULT '',
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  PRIMARY KEY (`memid`),
  UNIQUE KEY `username_UNIQUE` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=1002 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memid`, `name`, `address`, `classification`, `username`, `password`) VALUES
(1000, 'Abhishek', 'Mumbai', 'Grad', 'admin', 'admin'),
(1001, 'Subhash Jha', 'Subhash', 'Grad', 'subhash', 'subhash');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookissue`
--
ALTER TABLE `bookissue`
  ADD CONSTRAINT `bookissue_ibfk_1` FOREIGN KEY (`memid`) REFERENCES `member` (`memid`) ON DELETE CASCADE,
  ADD CONSTRAINT `bookissue_ibfk_2` FOREIGN KEY (`bookid`) REFERENCES `book` (`bookid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
