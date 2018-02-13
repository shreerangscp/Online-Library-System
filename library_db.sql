-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 13, 2017 at 08:11 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `library`
--

-- --------------------------------------------------------

--
-- Table structure for table `authors`
--

CREATE TABLE `authors` (
  `author_id` int(11) NOT NULL,
  `author_name` varchar(50) NOT NULL,
  `create_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `author_is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `authors`
--

INSERT INTO `authors` (`author_id`, `author_name`, `create_date_time`, `author_is_deleted`) VALUES
(1, 'Stephen King', '2017-12-12 17:21:02', 0),
(2, 'Tolkien', '2017-12-12 17:21:02', 0),
(3, 'Nicholas', '2017-12-12 17:21:02', 0),
(4, 'Rowling', '2017-12-12 17:21:02', 0),
(5, 'Jon Snow', '2017-12-12 17:21:02', 0),
(6, 'Jaqen Haguar', '2017-12-12 17:21:02', 0),
(7, 'Eddard Stark', '2017-12-12 17:21:02', 0),
(8, 'Arya Stark', '2017-12-12 17:21:02', 0),
(9, 'Sansa Starkk', '2017-12-12 17:21:02', 0),
(10, 'Jammie Lannister', '2017-12-12 17:21:02', 1),
(11, 'Ryan', '2017-12-13 06:20:25', 0);

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE `book` (
  `book_id` int(11) NOT NULL,
  `book_doc_id` int(11) DEFAULT NULL,
  `book_isbn` varchar(50) DEFAULT NULL,
  `book_is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`book_id`, `book_doc_id`, `book_isbn`, `book_is_deleted`) VALUES
(4, 22, '1100', 0),
(5, 23, '1200', 0),
(6, 24, '1300', 0),
(7, 25, '1400', 0),
(8, 26, '1500', 0),
(9, 37, '21', 0),
(10, 38, '22', 0),
(11, 39, '23', 0),
(12, 40, '24', 0),
(13, 41, '25', 0),
(14, 43, '147852369', 0);

-- --------------------------------------------------------

--
-- Table structure for table `borrow`
--

CREATE TABLE `borrow` (
  `borrow_id` int(11) NOT NULL,
  `borrow_copy_id` int(11) DEFAULT NULL,
  `borrow_bt_borrow_number` int(11) DEFAULT NULL,
  `bt_doc_id` int(11) DEFAULT NULL,
  `borrow_reader_id` int(11) DEFAULT NULL,
  `borrow_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `return_date_time` timestamp NULL DEFAULT NULL,
  `expected_return` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `borrow`
--

INSERT INTO `borrow` (`borrow_id`, `borrow_copy_id`, `borrow_bt_borrow_number`, `bt_doc_id`, `borrow_reader_id`, `borrow_date_time`, `return_date_time`, `expected_return`) VALUES
(17, 6, NULL, 22, 5, '2017-12-11 02:37:22', '2017-12-11 02:39:29', '2017-12-30 05:00:00'),
(18, 6, NULL, 22, 8, '2017-12-11 02:40:15', '2017-12-11 03:28:24', '2017-12-30 05:00:00'),
(19, 10, NULL, 24, 8, '2017-12-11 02:40:24', '2017-12-11 02:45:29', '2017-12-30 05:00:00'),
(20, 16, NULL, 27, 7, '2017-12-11 02:40:29', '2017-12-11 03:16:43', '2017-12-30 05:00:00'),
(21, 24, NULL, 31, 6, '2017-12-12 02:07:39', '2017-12-12 02:09:37', '2017-12-31 05:00:00'),
(22, 14, NULL, 26, 8, '2017-12-12 05:20:36', '2017-12-12 05:21:48', '2018-01-01 05:00:00'),
(23, 12, NULL, 25, 18, '2017-12-12 05:20:45', '2017-12-12 05:21:52', '2018-01-01 05:00:00'),
(24, 13, NULL, 25, 13, '2017-12-12 05:20:51', '2017-12-12 05:21:55', '2018-01-01 05:00:00'),
(25, 18, NULL, 28, 8, '2017-12-12 19:55:38', '2017-12-12 20:09:09', '2018-01-01 05:00:00'),
(26, 19, NULL, 28, 7, '2017-12-12 20:06:38', '2017-12-12 20:14:39', '2018-01-01 05:00:00'),
(27, 16, NULL, 27, 8, '2017-12-12 20:23:47', '2017-12-12 21:19:19', '2018-01-01 05:00:00'),
(28, 10, NULL, 24, 9, '2017-12-12 21:06:33', '2017-12-13 02:26:35', '2018-01-01 05:00:00'),
(29, 24, NULL, 31, 8, '2017-12-13 01:52:49', '2017-12-13 02:26:39', '2018-01-01 05:00:00'),
(30, 13, NULL, 25, 8, '2017-12-13 01:58:21', '2017-12-13 02:26:42', '2018-01-01 05:00:00'),
(31, 19, NULL, 28, 8, '2017-12-13 02:02:23', '2017-12-13 02:26:32', '2018-01-01 05:00:00'),
(32, 23, NULL, 30, 5, '2017-12-13 02:22:26', '2017-12-13 02:26:29', '2018-01-01 05:00:00'),
(33, 25, NULL, 30, 5, '2017-12-13 02:26:06', '2017-12-13 02:26:26', '2018-01-01 05:00:00'),
(34, 25, NULL, 30, 5, '2017-12-13 02:26:16', '2017-12-13 02:26:26', '2018-01-01 05:00:00'),
(35, 20, NULL, 29, 14, '2017-12-13 02:31:26', '2017-12-13 02:32:10', '2018-01-01 05:00:00'),
(36, 24, NULL, 31, 7, '2017-12-13 03:02:56', '2017-12-13 03:03:34', '2018-01-01 05:00:00'),
(37, 26, NULL, 31, 7, '2017-12-13 06:20:55', '2017-12-13 06:20:59', '2018-01-02 05:00:00'),
(38, 24, NULL, 31, 8, '2017-12-13 06:47:24', '2017-12-13 06:48:25', '2018-01-02 05:00:00'),
(39, 26, NULL, 31, 7, '2017-12-13 06:47:29', '2017-12-13 06:48:27', '2018-01-02 05:00:00'),
(40, 24, NULL, 31, 7, '2017-12-13 06:48:19', '2018-12-15 06:48:27', '2018-01-02 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `borrower_transaction`
--

CREATE TABLE `borrower_transaction` (
  `bt_borrow_number` int(11) NOT NULL,
  `bt_borrow_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `bt_return_date_time` timestamp NULL DEFAULT NULL,
  `bt_borrow_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `lib_branch_id` int(11) NOT NULL,
  `lib_branch_name` varchar(100) NOT NULL,
  `lib_branch_location` varchar(100) NOT NULL,
  `create_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`lib_branch_id`, `lib_branch_name`, `lib_branch_location`, `create_date_time`) VALUES
(1, 'Van Houten Library', 'NJIT Newark', '2017-12-06 00:18:37'),
(2, 'Manhattan Library', 'New York', '2017-12-10 20:31:05');

-- --------------------------------------------------------

--
-- Table structure for table `chief_editor`
--

CREATE TABLE `chief_editor` (
  `ce_id` int(11) NOT NULL,
  `ce_fname` varchar(50) NOT NULL,
  `ce_lname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `chief_editor`
--

INSERT INTO `chief_editor` (`ce_id`, `ce_fname`, `ce_lname`) VALUES
(1, 'Rosie ', 'Donnell'),
(2, 'Arianna', 'Huffington'),
(3, 'Hugh  ', 'Hefner'),
(4, 'Oliver', 'Stone'),
(5, 'Jacqueline ', ' Kennedy'),
(6, 'Christopher ', 'Nolan'),
(7, 'Alexa ', 'Chung'),
(8, 'Stan  ', 'Lee'),
(9, 'Piers  ', 'Morgan'),
(10, 'Tom  ', 'Green');

-- --------------------------------------------------------

--
-- Table structure for table `copy`
--

CREATE TABLE `copy` (
  `copy_id` int(11) NOT NULL,
  `copy_num` int(11) NOT NULL,
  `copy_doc_id` int(11) DEFAULT NULL,
  `copy_lib_branch_id` int(11) DEFAULT NULL,
  `copy_position` int(6) DEFAULT NULL,
  `copy_is_borrowed` int(11) DEFAULT '0',
  `copy_is_deleted` int(11) DEFAULT '0',
  `copy_is_reserved` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy`
--

INSERT INTO `copy` (`copy_id`, `copy_num`, `copy_doc_id`, `copy_lib_branch_id`, `copy_position`, `copy_is_borrowed`, `copy_is_deleted`, `copy_is_reserved`) VALUES
(6, 1, 22, 1, 1, 0, 0, 0),
(7, 2, 22, 1, 2, 0, 0, 0),
(8, 1, 23, 1, 4, 0, 0, 0),
(9, 2, 23, 1, 5, 0, 0, 0),
(10, 1, 24, 1, 7, 0, 0, 0),
(11, 2, 24, 1, 8, 0, 0, 0),
(12, 1, 25, 1, 10, 0, 0, 0),
(13, 2, 25, 1, 11, 0, 0, 0),
(14, 1, 26, 1, 13, 0, 0, 0),
(15, 2, 26, 1, 14, 0, 0, 0),
(16, 1, 27, 1, 16, 0, 0, 0),
(17, 2, 27, 1, 17, 0, 0, 0),
(18, 1, 28, 1, 19, 0, 0, 0),
(19, 2, 28, 1, 20, 0, 0, 0),
(20, 1, 29, 1, 22, 0, 0, 0),
(21, 2, 29, 1, 23, 0, 0, 0),
(22, 1, 30, 1, 25, 0, 0, 0),
(23, 2, 30, 1, 26, 0, 0, 0),
(24, 1, 31, 1, 28, 0, 0, 0),
(25, 3, 30, 1, 29, 0, 0, 0),
(26, 2, 31, 1, 29, 0, 0, 0),
(27, 5, 43, 1, 9, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `copy_pos`
--

CREATE TABLE `copy_pos` (
  `copy_pos_id` int(11) NOT NULL,
  `copy_pos_location` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `copy_pos`
--

INSERT INTO `copy_pos` (`copy_pos_id`, `copy_pos_location`) VALUES
(1, '001A01'),
(2, '001A02'),
(3, '001A03'),
(4, '001B01'),
(5, '001B02'),
(6, '001B03'),
(7, '001C01'),
(8, '001C02'),
(9, '001C03'),
(10, '001D01'),
(11, '001D02'),
(12, '001D03'),
(13, '001E01'),
(14, '001E02'),
(15, '001E03'),
(16, '001F01'),
(17, '001F02'),
(18, '001F03'),
(19, '001G01'),
(20, '001G02'),
(21, '001G03'),
(22, '001H01'),
(23, '001H02'),
(24, '001H03'),
(25, '001I01'),
(26, '001I02'),
(27, '001I03'),
(28, '001J01'),
(29, '001J02'),
(30, '001J03');

-- --------------------------------------------------------

--
-- Table structure for table `descriptor`
--

CREATE TABLE `descriptor` (
  `descriptor_id` int(11) NOT NULL,
  `descriptor_doc_id` int(11) DEFAULT NULL,
  `descriptor_name` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `doc_id` int(11) NOT NULL,
  `doc_title` varchar(50) NOT NULL,
  `doc_publisher_id` int(11) DEFAULT NULL,
  `create_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `doc_dt_id` int(11) DEFAULT NULL,
  `doc_lib_branch_id` int(11) DEFAULT NULL,
  `doc_count_borrowed` int(11) DEFAULT '0',
  `doc_is_deleted` int(11) DEFAULT '0',
  `doc_authors_id` int(11) DEFAULT NULL,
  `doc_reserved_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`doc_id`, `doc_title`, `doc_publisher_id`, `create_date_time`, `doc_dt_id`, `doc_lib_branch_id`, `doc_count_borrowed`, `doc_is_deleted`, `doc_authors_id`, `doc_reserved_count`) VALUES
(1, 'hhhhhhh', 3, '2017-12-05 22:40:25', NULL, 1, 0, 1, NULL, 0),
(2, 'Cricket', 6, '2017-12-05 22:54:20', NULL, 1, 0, 1, NULL, 0),
(3, 'Bowling for Columbine', 10, '2017-12-08 19:45:34', NULL, 1, 0, 1, NULL, 0),
(4, 'Inside Job', 9, '2017-12-08 19:46:01', NULL, 1, 0, 1, NULL, 0),
(5, 'The Smartest Guys in the Room', 8, '2017-12-08 19:46:18', NULL, 1, 0, 1, NULL, 0),
(6, 'Why We Fight', 7, '2017-12-08 19:46:33', NULL, 1, 0, 1, NULL, 0),
(7, 'Control Room', 6, '2017-12-08 19:46:48', NULL, 1, 0, 1, NULL, 0),
(8, 'Banaz: A Love Story', 5, '2017-12-08 19:47:18', NULL, 1, 0, 1, NULL, 0),
(9, 'The War You Don\'t See', 4, '2017-12-08 19:47:46', NULL, 1, 0, 1, NULL, 0),
(10, 'Game of Thrones', 3, '2017-12-08 19:48:02', NULL, 1, 0, 1, NULL, 0),
(11, 'Flash', 2, '2017-12-08 19:48:14', NULL, 1, 0, 1, NULL, 0),
(12, 'Punisher', 1, '2017-12-08 19:48:59', NULL, 1, 0, 1, NULL, 0),
(13, 'hhhhhhhh', 3, '2017-12-08 23:40:33', 1, 1, 0, 1, NULL, 0),
(14, 'hhhhhhhh', 3, '2017-12-08 23:46:49', 1, 1, 0, 1, NULL, 0),
(15, 'hhhhhhhh', 3, '2017-12-08 23:50:20', 1, 1, 0, 1, NULL, 0),
(16, 'hhhhhhhh', 3, '2017-12-08 23:51:08', 1, 1, 0, 1, NULL, 0),
(17, 'hhhhhhhh', 3, '2017-12-09 00:01:09', 1, 1, 0, 1, NULL, 0),
(18, 'dsvdfsfvds', 4, '2017-12-09 00:02:34', 1, 1, 0, 1, NULL, 0),
(19, 'rthyjhgfds', 6, '2017-12-09 00:28:52', 2, 1, 0, 1, NULL, 0),
(20, 'asgdh', 2, '2017-12-10 20:53:14', 2, 2, 0, 1, NULL, 0),
(21, 'iouyhjkhbkbg', 1, '2017-12-10 21:09:04', 1, 2, 0, 1, NULL, 0),
(22, 'Killers of the Flower Moon', 10, '2017-12-11 02:12:11', 1, 1, 2, 0, 10, 0),
(23, 'Beartown', 9, '2017-12-11 02:12:30', 1, 1, 0, 0, 9, 0),
(24, 'Exit West', 8, '2017-12-11 02:12:52', 1, 1, 2, 0, 8, 0),
(25, 'Priestdaddy', 7, '2017-12-11 02:13:31', 1, 1, 3, 0, 7, 1),
(26, 'Lincoln in the Bardo', 6, '2017-12-11 02:13:54', 1, 1, 1, 0, 6, 0),
(27, 'The Impossible Fortress', 5, '2017-12-11 02:17:59', 2, 1, 2, 0, 5, 0),
(28, 'Hunger', 4, '2017-12-11 02:19:00', 2, 1, 2, 0, 4, 1),
(29, 'A Brief History of Tomorrow', 3, '2017-12-11 02:19:27', 2, 1, 1, 0, 3, 0),
(30, 'Desert Solitaire', 2, '2017-12-11 02:20:05', 2, 1, 2, 0, 2, 2),
(31, 'Geek Love', 1, '2017-12-11 02:20:26', 2, 1, 6, 0, 1, 3),
(32, 'In Search of Lost Time', 1, '2017-12-12 18:17:48', 2, 2, 0, 0, NULL, 0),
(33, 'War and Peace', 2, '2017-12-12 18:19:15', 2, 2, 0, 0, NULL, 0),
(34, 'The Divine Comedy', 3, '2017-12-12 18:19:35', 2, 2, 0, 0, NULL, 0),
(35, 'Hamlet by William Shakespeare', 4, '2017-12-12 18:19:52', 2, 2, 0, 0, NULL, 0),
(36, 'The Adventures ', 5, '2017-12-12 18:20:14', 2, 2, 0, 0, NULL, 0),
(37, 'The Great Wall', 6, '2017-12-12 18:30:41', 1, 2, 0, 0, NULL, 0),
(38, 'The Iliad by Homer', 7, '2017-12-12 18:31:18', 1, 2, 0, 0, NULL, 0),
(39, 'Madame Bovary', 8, '2017-12-12 18:31:36', 1, 2, 0, 0, NULL, 0),
(40, 'Crime and Punishment', 9, '2017-12-12 18:31:53', 1, 2, 0, 0, NULL, 0),
(41, 'The Brothers Karamazov', 10, '2017-12-12 18:32:35', 1, 2, 0, 0, NULL, 0),
(42, 'Twilight', 1, '2017-12-13 02:29:04', 2, 1, 0, 0, NULL, 0),
(43, 'Eclipse', 2, '2017-12-13 02:30:02', 1, 2, 0, 0, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `documents_type`
--

CREATE TABLE `documents_type` (
  `dt_id` int(11) NOT NULL,
  `dt_name` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `documents_type`
--

INSERT INTO `documents_type` (`dt_id`, `dt_name`) VALUES
(1, 'Book'),
(2, 'Journal Volume'),
(3, 'Journal Issue');

-- --------------------------------------------------------

--
-- Table structure for table `has`
--

CREATE TABLE `has` (
  `has_id` int(11) NOT NULL,
  `has_lib_branch_id` int(11) DEFAULT NULL,
  `has_copy_num` int(11) DEFAULT NULL,
  `has_doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ieditor`
--

CREATE TABLE `ieditor` (
  `ieditor_id` int(11) NOT NULL,
  `ieditor_issue_num` int(11) DEFAULT NULL,
  `ieditor_doc_id` int(11) DEFAULT NULL,
  `ieditor_iname` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `journal_issue`
--

CREATE TABLE `journal_issue` (
  `ji_id` int(11) NOT NULL,
  `ji_doc_id` int(11) DEFAULT NULL,
  `ji_issue_num` int(11) NOT NULL,
  `ji_scope` varchar(50) DEFAULT NULL,
  `ji_jv_id` int(11) DEFAULT NULL,
  `create_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ji_is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_issue`
--

INSERT INTO `journal_issue` (`ji_id`, `ji_doc_id`, `ji_issue_num`, `ji_scope`, `ji_jv_id`, `create_date_time`, `ji_is_deleted`) VALUES
(1, 27, 1234567, NULL, 6, '2017-12-13 02:30:11', 0);

-- --------------------------------------------------------

--
-- Table structure for table `journal_volume`
--

CREATE TABLE `journal_volume` (
  `jv_id` int(11) NOT NULL,
  `jv_doc_id` int(11) DEFAULT NULL,
  `jv_vol_num` int(11) NOT NULL,
  `jv_editor_id` int(11) DEFAULT NULL,
  `jv_is_deleted` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `journal_volume`
--

INSERT INTO `journal_volume` (`jv_id`, `jv_doc_id`, `jv_vol_num`, `jv_editor_id`, `jv_is_deleted`) VALUES
(3, 27, 2100, 1, 0),
(4, 28, 2200, 2, 0),
(5, 29, 2300, 3, 0),
(6, 30, 2400, 4, 0),
(7, 31, 2500, 5, 0),
(8, 32, 11, 1, 0),
(9, 33, 12, 2, 0),
(10, 34, 13, 3, 0),
(11, 35, 14, 4, 0),
(12, 36, 15, 5, 0),
(13, 42, 159753, 2, 0);

-- --------------------------------------------------------

--
-- Table structure for table `login_history`
--

CREATE TABLE `login_history` (
  `lh_id` int(11) NOT NULL,
  `lh_username` varchar(25) NOT NULL,
  `lh_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lh_user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `login_history`
--

INSERT INTO `login_history` (`lh_id`, `lh_username`, `lh_date_time`, `lh_user_id`) VALUES
(1, 'shreerang', '2017-12-12 19:34:52', 8),
(2, 'shreerang', '2017-12-12 19:47:53', 8),
(3, 'shreerang', '2017-12-12 20:05:18', 8),
(4, 'shreerang', '2017-12-12 23:45:29', 8),
(5, 'shreerang', '2017-12-13 00:01:43', 8),
(6, 'shreerang', '2017-12-13 00:04:32', 8),
(7, 'arman', '2017-12-13 02:06:40', 5),
(8, 'manish', '2017-12-13 03:06:23', 7),
(9, 'manish', '2017-12-13 06:42:32', 7);

-- --------------------------------------------------------

--
-- Table structure for table `proceedings`
--

CREATE TABLE `proceedings` (
  `proceedings_id` int(11) NOT NULL,
  `proceedings_doc_id` int(11) DEFAULT NULL,
  `proceedings_date` date DEFAULT NULL,
  `proceedings_location` varchar(50) DEFAULT NULL,
  `proceedings_editor` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `publisher`
--

CREATE TABLE `publisher` (
  `publisher_id` int(11) NOT NULL,
  `publisher_name` varchar(50) DEFAULT NULL,
  `publisher_address` varchar(100) DEFAULT NULL,
  `create_date` date DEFAULT NULL,
  `create_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `publisher`
--

INSERT INTO `publisher` (`publisher_id`, `publisher_name`, `publisher_address`, `create_date`, `create_time`) VALUES
(1, 'Penguin Random House', 'UK', '2017-12-05', '16:49:48'),
(2, 'Hachette Livre', 'UK', '2017-12-05', '16:49:48'),
(3, 'HarperCollins', 'UK', '2017-12-05', '16:49:48'),
(4, 'Pan Macmillan', 'UK', '2017-12-05', '16:49:48'),
(5, 'Pearson Education', 'Hoboken', '2017-12-05', '16:49:48'),
(6, 'Oxford University Press', 'UK', '2017-12-05', '16:49:48'),
(7, 'Bloomsbury', 'Pennsylvania', '2017-12-05', '16:49:48'),
(8, 'Random House', 'New York', '2017-12-05', '16:49:49'),
(9, 'Rare Bird Books', 'Los Angeles', '2017-12-05', '16:49:49'),
(10, 'Tin House', 'Portland', '2017-12-05', '16:49:49');

-- --------------------------------------------------------

--
-- Table structure for table `reader`
--

CREATE TABLE `reader` (
  `reader_id` int(11) NOT NULL,
  `reader_fname` varchar(15) NOT NULL,
  `reader_lname` varchar(15) NOT NULL,
  `reader_phone_number` int(10) DEFAULT NULL,
  `reader_address` varchar(50) DEFAULT NULL,
  `reader_type_rt_id` int(11) DEFAULT NULL,
  `create_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `reader_doc_borrowed` int(11) DEFAULT '0',
  `reader_is_deleted` int(11) DEFAULT '0',
  `reader_reserve_count` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reader`
--

INSERT INTO `reader` (`reader_id`, `reader_fname`, `reader_lname`, `reader_phone_number`, `reader_address`, `reader_type_rt_id`, `create_date`, `reader_doc_borrowed`, `reader_is_deleted`, `reader_reserve_count`) VALUES
(5, 'Arman', 'Gupta', 9999, 'Jersey City', 2, '2017-12-11 00:45:19', 4, 0, 2),
(6, 'Harsh', 'Shah', 8888, 'New York', 2, '2017-12-11 00:45:52', 1, 0, NULL),
(7, 'Manish', 'Tomar', 7777, 'Newark', 2, '2017-12-11 00:46:07', 6, 0, 2),
(8, 'Shreerang', 'Paradkar', 6666, 'Harrison', 2, '2017-12-11 00:46:21', 9, 1, 3),
(9, 'Vivek', 'Pereira', 55551, 'Harrisonnn', 2, '2017-12-12 04:58:48', 1, 1, NULL),
(10, 'Mihir', 'Pendse', 4444, 'NY', 1, '2017-12-12 04:59:05', 0, 1, NULL),
(11, 'Anurag', 'Singh', 3333, 'Harrison', 1, '2017-12-12 04:59:35', 0, 0, NULL),
(12, 'Anubhav', 'Gupta', 3333, 'Chicago', 2, '2017-12-12 04:59:54', 0, 0, NULL),
(13, 'Rishabh', 'Jaiswal', 2222, 'California', 1, '2017-12-12 05:00:16', 1, 0, NULL),
(14, 'Amit', 'Sawant', 2222, 'Dallas', 1, '2017-12-12 05:00:29', 1, 0, NULL),
(15, 'Anush', 'Shetty', 1111, 'Rochester', 1, '2017-12-12 05:00:49', 0, 0, NULL),
(16, 'Akhil', 'Kalra', 1111, 'Harrison', 2, '2017-12-12 05:01:18', 0, 0, NULL),
(17, 'Shubham', 'Sali', 3333, 'Harrison', 1, '2017-12-12 05:01:35', 0, 0, NULL),
(18, 'Ganesh', 'Sonavane', 8888, 'Jersey City', 1, '2017-12-12 05:01:53', 1, 0, NULL),
(19, 'Rohit', 'Neeraj', 8888, 'Mumbai', 1, '2017-12-12 05:05:57', 0, 0, NULL),
(20, 'Kedar', 'Patil', 4444, 'Mumbai', 1, '2017-12-12 05:18:09', 0, 0, NULL),
(21, 'Rajesh', 'Patil', 9999, 'Mumbai', 1, '2017-12-12 05:18:23', 0, 0, NULL),
(22, 'Tyrion', 'Lannister', 7777, 'KingsLanding', 1, '2017-12-13 02:28:22', 0, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `reader_type`
--

CREATE TABLE `reader_type` (
  `rt_id` int(11) NOT NULL,
  `rt_name` varchar(15) DEFAULT NULL,
  `create_date_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reader_type`
--

INSERT INTO `reader_type` (`rt_id`, `rt_name`, `create_date_time`) VALUES
(1, 'Staff', '2017-12-05 05:00:00'),
(2, 'Student', '2017-12-05 05:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_number` int(11) NOT NULL,
  `reservation_date` date DEFAULT NULL,
  `reservation_time` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reserves`
--

CREATE TABLE `reserves` (
  `reserves_id` int(11) NOT NULL,
  `reserves_reservation_number` int(11) DEFAULT NULL,
  `reserves_reader_id` int(11) DEFAULT NULL,
  `reserves_copy_id` int(11) DEFAULT NULL,
  `reserves_doc_id` int(11) DEFAULT NULL,
  `reserves_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `reserves_is_available` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reserves`
--

INSERT INTO `reserves` (`reserves_id`, `reserves_reservation_number`, `reserves_reader_id`, `reserves_copy_id`, `reserves_doc_id`, `reserves_date_time`, `reserves_is_available`) VALUES
(1, NULL, 8, 19, 28, '2017-12-13 00:15:16', 0),
(2, NULL, 8, 13, 25, '2017-12-13 00:17:29', 0),
(3, NULL, 8, 24, 31, '2017-12-13 00:58:17', 0),
(4, NULL, 5, 23, 30, '2017-12-13 02:07:14', 1),
(5, NULL, 5, 25, 30, '2017-12-13 02:19:08', 1),
(6, NULL, 7, 26, 31, '2017-12-13 03:07:18', 1),
(7, NULL, 7, 24, 31, '2017-12-13 06:43:49', 1);

-- --------------------------------------------------------

--
-- Table structure for table `search`
--

CREATE TABLE `search` (
  `search_id` int(11) NOT NULL,
  `search_st_id` int(11) DEFAULT NULL,
  `search_lib_branch_id` int(11) DEFAULT NULL,
  `search_keyword` varchar(100) DEFAULT NULL,
  `search_date_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `search_doc_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search`
--

INSERT INTO `search` (`search_id`, `search_st_id`, `search_lib_branch_id`, `search_keyword`, `search_date_time`, `search_doc_id`) VALUES
(1, 1, NULL, NULL, '2017-12-12 07:36:47', 23),
(2, 1, NULL, NULL, '2017-12-12 07:53:14', 24),
(3, 1, NULL, NULL, '2017-12-12 07:54:11', 26),
(4, 2, NULL, 'Beartown', '2017-12-12 08:12:54', NULL),
(5, 2, NULL, 'bear', '2017-12-12 08:29:04', NULL),
(6, 2, NULL, 'the', '2017-12-12 16:58:53', NULL),
(7, 2, NULL, 'a', '2017-12-12 17:24:56', NULL),
(8, 1, NULL, NULL, '2017-12-12 19:06:01', 30),
(9, 2, NULL, 'th', '2017-12-12 19:06:33', NULL),
(10, 1, NULL, NULL, '2017-12-12 23:19:38', 34),
(11, 2, NULL, 'the', '2017-12-12 23:20:00', NULL),
(12, 1, NULL, NULL, '2017-12-13 01:14:58', 23),
(13, 2, NULL, 'the', '2017-12-13 01:15:23', NULL),
(14, 1, NULL, NULL, '2017-12-13 02:33:05', 35),
(15, 2, NULL, 'cli', '2017-12-13 02:33:37', NULL),
(16, 2, NULL, 'wil', '2017-12-13 02:33:47', NULL),
(17, 1, NULL, NULL, '2017-12-13 03:04:44', 35),
(18, NULL, NULL, 'the', '2017-12-13 06:34:21', NULL),
(19, NULL, NULL, 'ver', '2017-12-13 06:36:11', NULL),
(20, NULL, NULL, 'gua', '2017-12-13 06:36:24', NULL),
(21, NULL, NULL, 'ars', '2017-12-13 06:36:43', NULL),
(22, NULL, NULL, 'ntu', '2017-12-13 06:36:58', NULL),
(23, NULL, NULL, 'no', '2017-12-13 06:37:04', NULL),
(24, NULL, NULL, 'the', '2017-12-13 06:37:12', NULL),
(25, NULL, NULL, 'lannister', '2017-12-13 06:37:20', NULL),
(26, NULL, NULL, 'h', '2017-12-13 06:41:44', NULL),
(27, NULL, NULL, 'arya', '2017-12-13 06:41:54', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `search_type`
--

CREATE TABLE `search_type` (
  `st_id` int(11) NOT NULL,
  `st_name` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `search_type`
--

INSERT INTO `search_type` (`st_id`, `st_name`) VALUES
(1, 'Doc-ID'),
(2, 'Title'),
(3, 'Author'),
(4, 'Publisher');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` varchar(15) NOT NULL,
  `password` varchar(15) NOT NULL,
  `create_date` date DEFAULT NULL,
  `create_time` time DEFAULT NULL,
  `modified_date` date DEFAULT NULL,
  `modified_time` time DEFAULT NULL,
  `is_admin` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `create_date`, `create_time`, `modified_date`, `modified_time`, `is_admin`) VALUES
(1, 'library', 'admin', '2017-12-03', '20:45:22', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `writes`
--

CREATE TABLE `writes` (
  `write_id` int(11) NOT NULL,
  `write_doc_id` int(11) DEFAULT NULL,
  `write_author_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `writes`
--

INSERT INTO `writes` (`write_id`, `write_doc_id`, `write_author_id`) VALUES
(1, 22, 10),
(2, 23, 9),
(3, 24, 8),
(4, 25, 7),
(5, 26, 6),
(6, 27, 5),
(7, 28, 4),
(8, 29, 3),
(9, 30, 2),
(10, 31, 1),
(11, 32, 10),
(12, 33, 9),
(13, 34, 8),
(14, 35, 7),
(15, 36, 6),
(16, 37, 5),
(17, 38, 4),
(18, 39, 3),
(19, 40, 2),
(20, 41, 1),
(21, 42, 1),
(22, 43, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `authors`
--
ALTER TABLE `authors`
  ADD PRIMARY KEY (`author_id`);

--
-- Indexes for table `book`
--
ALTER TABLE `book`
  ADD PRIMARY KEY (`book_id`),
  ADD KEY `book_doc_id` (`book_doc_id`);

--
-- Indexes for table `borrow`
--
ALTER TABLE `borrow`
  ADD PRIMARY KEY (`borrow_id`),
  ADD KEY `borrow_copy_id` (`borrow_copy_id`),
  ADD KEY `borrow_bt_borrow_number` (`borrow_bt_borrow_number`),
  ADD KEY `bt_doc_id` (`bt_doc_id`),
  ADD KEY `bt_reader_id` (`borrow_reader_id`);

--
-- Indexes for table `borrower_transaction`
--
ALTER TABLE `borrower_transaction`
  ADD PRIMARY KEY (`bt_borrow_number`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`lib_branch_id`);

--
-- Indexes for table `chief_editor`
--
ALTER TABLE `chief_editor`
  ADD PRIMARY KEY (`ce_id`);

--
-- Indexes for table `copy`
--
ALTER TABLE `copy`
  ADD PRIMARY KEY (`copy_id`),
  ADD KEY `copy_doc_id` (`copy_doc_id`),
  ADD KEY `copy_lib_branch_id` (`copy_lib_branch_id`),
  ADD KEY `fk1` (`copy_position`);

--
-- Indexes for table `copy_pos`
--
ALTER TABLE `copy_pos`
  ADD PRIMARY KEY (`copy_pos_id`);

--
-- Indexes for table `descriptor`
--
ALTER TABLE `descriptor`
  ADD PRIMARY KEY (`descriptor_id`),
  ADD KEY `descriptor_doc_id` (`descriptor_doc_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`doc_id`),
  ADD KEY `doc_publisher_id` (`doc_publisher_id`);

--
-- Indexes for table `documents_type`
--
ALTER TABLE `documents_type`
  ADD PRIMARY KEY (`dt_id`);

--
-- Indexes for table `has`
--
ALTER TABLE `has`
  ADD PRIMARY KEY (`has_id`),
  ADD KEY `has_lib_branch_id` (`has_lib_branch_id`),
  ADD KEY `has_copy_num` (`has_copy_num`),
  ADD KEY `has_doc_id` (`has_doc_id`);

--
-- Indexes for table `ieditor`
--
ALTER TABLE `ieditor`
  ADD PRIMARY KEY (`ieditor_id`),
  ADD KEY `ieditor_issue_num` (`ieditor_issue_num`),
  ADD KEY `ieditor_doc_id` (`ieditor_doc_id`);

--
-- Indexes for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD PRIMARY KEY (`ji_id`),
  ADD KEY `ji_doc_id` (`ji_doc_id`);

--
-- Indexes for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD PRIMARY KEY (`jv_id`),
  ADD KEY `jv_doc_id` (`jv_doc_id`),
  ADD KEY `jv_editor_id` (`jv_editor_id`);

--
-- Indexes for table `login_history`
--
ALTER TABLE `login_history`
  ADD PRIMARY KEY (`lh_id`);

--
-- Indexes for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD PRIMARY KEY (`proceedings_id`),
  ADD KEY `proceedings_doc_id` (`proceedings_doc_id`);

--
-- Indexes for table `publisher`
--
ALTER TABLE `publisher`
  ADD PRIMARY KEY (`publisher_id`);

--
-- Indexes for table `reader`
--
ALTER TABLE `reader`
  ADD PRIMARY KEY (`reader_id`),
  ADD KEY `reader_type_rt_id` (`reader_type_rt_id`);

--
-- Indexes for table `reader_type`
--
ALTER TABLE `reader_type`
  ADD PRIMARY KEY (`rt_id`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_number`);

--
-- Indexes for table `reserves`
--
ALTER TABLE `reserves`
  ADD PRIMARY KEY (`reserves_id`),
  ADD KEY `reserves_reservation_number` (`reserves_reservation_number`),
  ADD KEY `reserves_reader_id` (`reserves_reader_id`),
  ADD KEY `reserves_copy_id` (`reserves_copy_id`),
  ADD KEY `reserves_doc_id` (`reserves_doc_id`);

--
-- Indexes for table `search`
--
ALTER TABLE `search`
  ADD PRIMARY KEY (`search_id`);

--
-- Indexes for table `search_type`
--
ALTER TABLE `search_type`
  ADD PRIMARY KEY (`st_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `writes`
--
ALTER TABLE `writes`
  ADD PRIMARY KEY (`write_id`),
  ADD KEY `write_doc_id` (`write_doc_id`),
  ADD KEY `write_author_id` (`write_author_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `authors`
--
ALTER TABLE `authors`
  MODIFY `author_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `book`
--
ALTER TABLE `book`
  MODIFY `book_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `borrow`
--
ALTER TABLE `borrow`
  MODIFY `borrow_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `borrower_transaction`
--
ALTER TABLE `borrower_transaction`
  MODIFY `bt_borrow_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `lib_branch_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `chief_editor`
--
ALTER TABLE `chief_editor`
  MODIFY `ce_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `copy`
--
ALTER TABLE `copy`
  MODIFY `copy_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `copy_pos`
--
ALTER TABLE `copy_pos`
  MODIFY `copy_pos_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `descriptor`
--
ALTER TABLE `descriptor`
  MODIFY `descriptor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `doc_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `documents_type`
--
ALTER TABLE `documents_type`
  MODIFY `dt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `has`
--
ALTER TABLE `has`
  MODIFY `has_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ieditor`
--
ALTER TABLE `ieditor`
  MODIFY `ieditor_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `journal_issue`
--
ALTER TABLE `journal_issue`
  MODIFY `ji_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `journal_volume`
--
ALTER TABLE `journal_volume`
  MODIFY `jv_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `login_history`
--
ALTER TABLE `login_history`
  MODIFY `lh_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `proceedings`
--
ALTER TABLE `proceedings`
  MODIFY `proceedings_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `publisher`
--
ALTER TABLE `publisher`
  MODIFY `publisher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `reader`
--
ALTER TABLE `reader`
  MODIFY `reader_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `reader_type`
--
ALTER TABLE `reader_type`
  MODIFY `rt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_number` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserves`
--
ALTER TABLE `reserves`
  MODIFY `reserves_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `search`
--
ALTER TABLE `search`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `search_type`
--
ALTER TABLE `search_type`
  MODIFY `st_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `writes`
--
ALTER TABLE `writes`
  MODIFY `write_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`book_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `borrow`
--
ALTER TABLE `borrow`
  ADD CONSTRAINT `borrow_ibfk_1` FOREIGN KEY (`borrow_copy_id`) REFERENCES `copy` (`copy_id`),
  ADD CONSTRAINT `borrow_ibfk_2` FOREIGN KEY (`borrow_bt_borrow_number`) REFERENCES `borrower_transaction` (`bt_borrow_number`),
  ADD CONSTRAINT `borrow_ibfk_3` FOREIGN KEY (`bt_doc_id`) REFERENCES `documents` (`doc_id`),
  ADD CONSTRAINT `borrow_ibfk_4` FOREIGN KEY (`borrow_reader_id`) REFERENCES `reader` (`reader_id`);

--
-- Constraints for table `copy`
--
ALTER TABLE `copy`
  ADD CONSTRAINT `copy_ibfk_1` FOREIGN KEY (`copy_doc_id`) REFERENCES `documents` (`doc_id`),
  ADD CONSTRAINT `copy_ibfk_2` FOREIGN KEY (`copy_lib_branch_id`) REFERENCES `branch` (`lib_branch_id`),
  ADD CONSTRAINT `fk1` FOREIGN KEY (`copy_position`) REFERENCES `copy_pos` (`copy_pos_id`);

--
-- Constraints for table `descriptor`
--
ALTER TABLE `descriptor`
  ADD CONSTRAINT `descriptor_ibfk_1` FOREIGN KEY (`descriptor_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`doc_publisher_id`) REFERENCES `publisher` (`publisher_id`);

--
-- Constraints for table `has`
--
ALTER TABLE `has`
  ADD CONSTRAINT `has_ibfk_1` FOREIGN KEY (`has_lib_branch_id`) REFERENCES `branch` (`lib_branch_id`),
  ADD CONSTRAINT `has_ibfk_2` FOREIGN KEY (`has_copy_num`) REFERENCES `copy` (`copy_id`),
  ADD CONSTRAINT `has_ibfk_3` FOREIGN KEY (`has_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `ieditor`
--
ALTER TABLE `ieditor`
  ADD CONSTRAINT `ieditor_ibfk_1` FOREIGN KEY (`ieditor_issue_num`) REFERENCES `journal_issue` (`ji_id`),
  ADD CONSTRAINT `ieditor_ibfk_2` FOREIGN KEY (`ieditor_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `journal_issue`
--
ALTER TABLE `journal_issue`
  ADD CONSTRAINT `journal_issue_ibfk_1` FOREIGN KEY (`ji_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `journal_volume`
--
ALTER TABLE `journal_volume`
  ADD CONSTRAINT `journal_volume_ibfk_1` FOREIGN KEY (`jv_doc_id`) REFERENCES `documents` (`doc_id`),
  ADD CONSTRAINT `journal_volume_ibfk_2` FOREIGN KEY (`jv_editor_id`) REFERENCES `chief_editor` (`ce_id`);

--
-- Constraints for table `proceedings`
--
ALTER TABLE `proceedings`
  ADD CONSTRAINT `proceedings_ibfk_1` FOREIGN KEY (`proceedings_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `reader`
--
ALTER TABLE `reader`
  ADD CONSTRAINT `reader_ibfk_1` FOREIGN KEY (`reader_type_rt_id`) REFERENCES `reader_type` (`rt_id`);

--
-- Constraints for table `reserves`
--
ALTER TABLE `reserves`
  ADD CONSTRAINT `reserves_ibfk_1` FOREIGN KEY (`reserves_reservation_number`) REFERENCES `reservation` (`reservation_number`),
  ADD CONSTRAINT `reserves_ibfk_2` FOREIGN KEY (`reserves_reader_id`) REFERENCES `reader` (`reader_id`),
  ADD CONSTRAINT `reserves_ibfk_3` FOREIGN KEY (`reserves_copy_id`) REFERENCES `copy` (`copy_id`),
  ADD CONSTRAINT `reserves_ibfk_4` FOREIGN KEY (`reserves_doc_id`) REFERENCES `documents` (`doc_id`);

--
-- Constraints for table `writes`
--
ALTER TABLE `writes`
  ADD CONSTRAINT `writes_ibfk_1` FOREIGN KEY (`write_doc_id`) REFERENCES `documents` (`doc_id`),
  ADD CONSTRAINT `writes_ibfk_2` FOREIGN KEY (`write_author_id`) REFERENCES `authors` (`author_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
