-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Feb 26, 2015 at 11:49 AM
-- Server version: 5.6.20-log
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE IF NOT EXISTS `authors` (
  `author_id` int(20) NOT NULL AUTO_INCREMENT,
  `author_name` varchar(60) NOT NULL,
  PRIMARY KEY (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`) VALUES
(1, 'HC Verma'),
(2, 'Chetan Bhagat'),
(4, 'P Bahadur'),
(5, 'arnab');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE IF NOT EXISTS `books` (
  `book_id` int(20) NOT NULL AUTO_INCREMENT,
  `copy_id` int(20) NOT NULL,
  `date_arrived` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_id`, `copy_id`, `date_arrived`) VALUES
(9, 2, '2014-12-07 11:17:52'),
(10, 2, '2014-12-07 11:17:57'),
(11, 3, '2014-12-07 11:18:02'),
(12, 4, '2014-12-30 09:30:40');

-- --------------------------------------------------------

--
-- Table structure for table `book_copy`
--

CREATE TABLE IF NOT EXISTS `book_copy` (
  `copy_id` int(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `publisher_id` varchar(20) NOT NULL,
  `author_id` varchar(20) NOT NULL,
  `year_published` int(4) NOT NULL,
  `Shelf` varchar(10) NOT NULL,
  `Rack_Number` varchar(10) NOT NULL,
  `Price_per_copy` float NOT NULL,
  `copies` int(3) NOT NULL,
  `count` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`copy_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `book_copy`
--

INSERT INTO `book_copy` (`copy_id`, `title`, `publisher_id`, `author_id`, `year_published`, `Shelf`, `Rack_Number`, `Price_per_copy`, `copies`, `count`) VALUES
(2, 'concepts of physics', '1', '1', 2007, 'A', '1', 250, 2, '0'),
(3, 'half girlfriend', '2', '2', 2014, 'B', '1', 100, 1, '1'),
(4, 'poc', '5', '5', 2014, 'K', '2', 10, 1, '0');

-- --------------------------------------------------------

--
-- Table structure for table `loan_faculty`
--

CREATE TABLE IF NOT EXISTS `loan_faculty` (
  `loan_id` int(20) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(20) NOT NULL,
  `faculty_id` varchar(10) NOT NULL,
  `date_out` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_expected` date DEFAULT NULL,
  `date_returned` date DEFAULT NULL,
  `Fine` int(10) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `loan_faculty`
--

INSERT INTO `loan_faculty` (`loan_id`, `book_id`, `faculty_id`, `date_out`, `date_expected`, `date_returned`, `Fine`) VALUES
(9, '9', '1', '2014-12-07 18:06:38', '2015-02-10', '2014-12-07', 0);

-- --------------------------------------------------------

--
-- Table structure for table `loan_stud`
--

CREATE TABLE IF NOT EXISTS `loan_stud` (
  `loan_id` int(20) NOT NULL AUTO_INCREMENT,
  `book_id` varchar(20) NOT NULL,
  `roll_no` varchar(10) NOT NULL,
  `date_out` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `date_expected` date DEFAULT NULL,
  `date_returned` date DEFAULT NULL,
  `fine` int(5) DEFAULT NULL,
  PRIMARY KEY (`loan_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Dumping data for table `loan_stud`
--

INSERT INTO `loan_stud` (`loan_id`, `book_id`, `roll_no`, `date_out`, `date_expected`, `date_returned`, `fine`) VALUES
(66, '9', '12118015', '2014-12-07 06:27:49', '2015-02-10', '2014-12-07', NULL),
(67, '11', '12118016', '2014-12-07 17:53:03', '2015-02-10', '2014-12-07', 25);

-- --------------------------------------------------------

--
-- Table structure for table `publishers`
--

CREATE TABLE IF NOT EXISTS `publishers` (
  `publisher_id` int(20) NOT NULL AUTO_INCREMENT,
  `publisher_name` varchar(60) NOT NULL,
  PRIMARY KEY (`publisher_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `publishers`
--

INSERT INTO `publishers` (`publisher_id`, `publisher_name`) VALUES
(1, 'Bharti Bhavan'),
(2, 'Pearson'),
(4, 'Bharti Bhawan'),
(5, 'ed');

-- --------------------------------------------------------

--
-- Table structure for table `students`
--

CREATE TABLE IF NOT EXISTS `students` (
  `roll_no` varchar(10) NOT NULL,
  `full_name` char(60) NOT NULL,
  `department` char(50) NOT NULL,
  `semester` int(2) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`roll_no`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `students`
--

INSERT INTO `students` (`roll_no`, `full_name`, `department`, `semester`, `email`, `password`) VALUES
('12118001', 'Aayush Agrawal', 'Information Technology', 5, 'agfhgf@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('12118015', 'Anubhav Sahu', 'Information Technology', 5, 'sdfghdfgh@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('12118016', 'Arnab Banerjee', 'Information Technology', 5, 'arnab@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('12118058', 'Rahul Dewangan', 'Information Technology', 5, 'rahul@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('12118070', 'Saurabh Gupta', 'Information Technology', 5, 'saurabhz@outlook.com', '81dc9bdb52d04dc20036dbd8313ed055'),
('12118901', 'Avijeet Mandloi', 'Information Technology', 5, 'dgjgjg@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055');

-- --------------------------------------------------------

--
-- Table structure for table `teachers`
--

CREATE TABLE IF NOT EXISTS `teachers` (
  `faculty_id` varchar(20) NOT NULL,
  `full_name` char(60) NOT NULL,
  `department` char(50) NOT NULL,
  `email` varchar(30) NOT NULL,
  `password` varchar(50) NOT NULL,
  `position_no` int(2) NOT NULL,
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `teachers`
--

INSERT INTO `teachers` (`faculty_id`, `full_name`, `department`, `email`, `password`, `position_no`) VALUES
('1', 'arnab', 'Information Technology', 'asd@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', 1),
('56', 'Anubhav Sahu', 'Information Technology', 'sdfghdfgh@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
