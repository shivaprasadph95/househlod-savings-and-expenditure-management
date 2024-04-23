-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Nov 10, 2022 at 02:14 PM
-- Server version: 5.7.26
-- PHP Version: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `detsdb`
--

DELIMITER $$
--
-- Procedures
--
DROP PROCEDURE IF EXISTS `tbud`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tbud` (IN `userid` INT(10))  select sum(BudgetCost)  as totalbudget from tblbudget where UserId=userid$$

DROP PROCEDURE IF EXISTS `texp`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `texp` (IN `userid` INT(10))  select sum(ExpenseCost)  as totalexpense from tblexpense where UserId=userid$$

DROP PROCEDURE IF EXISTS `tinc`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tinc` (IN `userid` INT(10))  select sum(IncomeCost)  as totalincome from tblincome where UserId= userid$$

DROP PROCEDURE IF EXISTS `tlon`$$
CREATE DEFINER=`root`@`localhost` PROCEDURE `tlon` (IN `userid` INT)  select sum(LoanCost)  as totalloan from tblloan where UserId=userid$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
CREATE TABLE IF NOT EXISTS `log` (
  `lid` int(11) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `ID` int(10) NOT NULL,
  `type` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `cost` int(10) NOT NULL,
  `action` varchar(10) NOT NULL,
  `time` date NOT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `log`
--

INSERT INTO `log` (`lid`, `UserId`, `ID`, `type`, `name`, `cost`, `action`, `time`) VALUES
(39, 14, 135, 'expense', 'DTH', 350, 'inserted', '2023-01-10'),
(40, 14, 136, 'expense', 'ration/supplies', 5000, 'inserted', '2023-01-10'),
(30, 13, 132, 'expense', 'chicken', 5000, 'deleted', '2023-01-10'),
(31, 13, 133, 'expense', 'efef', 50000, 'deleted', '2023-01-10'),
(32, 13, 5, 'expense', 'chicken', 2134, 'deleted', '2023-02-10'),
(33, 13, 6, 'expense', 'efef', 2134, 'deleted', '2023-02-10'),
(34, 13, 4, 'loan', 'rttrh', 9000, 'deleted', '2023-11-10'),
(35, 13, 6, 'loan', 'salary', 444, 'deleted', '2023-11-10'),
(36, 14, 7, 'income', 'salary', 50000, 'inserted', '2022-11-10'),
(37, 14, 8, 'income', 'apartment rent', 7000, 'inserted', '2022-11-10'),
(38, 14, 134, 'expense', 'electricity bill', 1000, 'inserted', '2022-11-10'),
(28, 13, 1, 'budget', 'chicken', 1000, 'deleted', '2022-11-10'),
(29, 13, 4, 'budget', 'chicken', 4559, 'deleted', '2022-11-10'),
(41, 14, 137, 'expense', 'emergency hospital bill', 15000, 'inserted', '2022-11-10'),
(42, 14, 9, 'income', 'hdfc bank balance', 500000, 'inserted', '2022-11-10'),
(43, 14, 7, 'loan', 'bike loan', 5000, 'inserted', '2022-11-10');

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

DROP TABLE IF EXISTS `tbladmin`;
CREATE TABLE IF NOT EXISTS `tbladmin` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(16, 'demoadmin', 'demoadmin@gmail.com', 1234567890, '61152c80d1514e22fba66002597d0104', '2022-11-10 14:12:56');

-- --------------------------------------------------------

--
-- Table structure for table `tblbudget`
--

DROP TABLE IF EXISTS `tblbudget`;
CREATE TABLE IF NOT EXISTS `tblbudget` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `BudgetDate` date DEFAULT NULL,
  `BudgetItem` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `BudgetCost` varchar(200) CHARACTER SET latin1 DEFAULT NULL,
  `NoteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_bin;

--
-- Triggers `tblbudget`
--
DROP TRIGGER IF EXISTS `buddeletelog`;
DELIMITER $$
CREATE TRIGGER `buddeletelog` BEFORE DELETE ON `tblbudget` FOR EACH ROW INSERT INTO log VALUES(null, OLD.UserId, OLD.ID, 'budget', OLD.BudgetItem, OLD.BudgetCost, 'deleted', NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `budinsertlog`;
DELIMITER $$
CREATE TRIGGER `budinsertlog` AFTER INSERT ON `tblbudget` FOR EACH ROW INSERT INTO log VALUES(null, NEW.UserId, NEW.ID, 'budget', NEW.BudgetItem, NEW.BudgetCost, 'inserted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblexpense`
--

DROP TABLE IF EXISTS `tblexpense`;
CREATE TABLE IF NOT EXISTS `tblexpense` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `ExpenseDate` date DEFAULT NULL,
  `ExpenseItem` varchar(200) DEFAULT NULL,
  `ExpenseCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblexpense`
--

INSERT INTO `tblexpense` (`ID`, `UserId`, `ExpenseDate`, `ExpenseItem`, `ExpenseCost`, `NoteDate`) VALUES
(134, 14, '2022-11-01', 'electricity bill', '1000', '2022-11-10 10:07:33'),
(135, 14, '2022-11-01', 'DTH', '350', '2022-11-10 10:08:05'),
(136, 14, '2022-11-01', 'ration/supplies', '5000', '2022-11-10 10:09:24'),
(137, 14, '2022-11-08', 'emergency hospital bill', '15000', '2022-11-10 10:11:18');

--
-- Triggers `tblexpense`
--
DROP TRIGGER IF EXISTS `expdeletelog`;
DELIMITER $$
CREATE TRIGGER `expdeletelog` BEFORE DELETE ON `tblexpense` FOR EACH ROW INSERT INTO log VALUES(null, OLD.UserId, OLD.ID, 'expense', OLD.ExpenseItem, OLD.ExpenseCost, 'deleted', NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `expinsertlog`;
DELIMITER $$
CREATE TRIGGER `expinsertlog` AFTER INSERT ON `tblexpense` FOR EACH ROW INSERT INTO log VALUES(null, NEW.UserId, NEW.ID, 'expense', NEW.ExpenseItem, NEW.ExpenseCost, 'inserted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblincome`
--

DROP TABLE IF EXISTS `tblincome`;
CREATE TABLE IF NOT EXISTS `tblincome` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `IncomeDate` date DEFAULT NULL,
  `IncomeItem` varchar(200) DEFAULT NULL,
  `IncomeCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblincome`
--

INSERT INTO `tblincome` (`ID`, `UserId`, `IncomeDate`, `IncomeItem`, `IncomeCost`, `NoteDate`) VALUES
(7, 14, '2022-11-01', 'salary', '50000', '2022-11-10 10:05:48'),
(8, 14, '2022-11-01', 'apartment rent', '7000', '2022-11-10 10:06:56'),
(9, 14, '2022-11-01', 'hdfc bank balance', '500000', '2022-11-10 10:12:03');

--
-- Triggers `tblincome`
--
DROP TRIGGER IF EXISTS `incdeletelog`;
DELIMITER $$
CREATE TRIGGER `incdeletelog` BEFORE DELETE ON `tblincome` FOR EACH ROW INSERT INTO log VALUES(null, OLD.UserId, OLD.ID, 'expense', OLD.IncomeItem, OLD.IncomeCost, 'deleted', NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `incinsertlog`;
DELIMITER $$
CREATE TRIGGER `incinsertlog` AFTER INSERT ON `tblincome` FOR EACH ROW INSERT INTO log VALUES(null, NEW.UserId, NEW.ID, 'income', NEW.IncomeItem, NEW.IncomeCost, 'inserted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tblloan`
--

DROP TABLE IF EXISTS `tblloan`;
CREATE TABLE IF NOT EXISTS `tblloan` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `UserId` int(10) NOT NULL,
  `LoanDate` date DEFAULT NULL,
  `LoanItem` varchar(200) DEFAULT NULL,
  `LoanCost` varchar(200) DEFAULT NULL,
  `NoteDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblloan`
--

INSERT INTO `tblloan` (`ID`, `UserId`, `LoanDate`, `LoanItem`, `LoanCost`, `NoteDate`) VALUES
(7, 14, '2022-11-01', 'bike loan', '5000', '2022-11-10 10:13:28');

--
-- Triggers `tblloan`
--
DROP TRIGGER IF EXISTS `loaninsertlog`;
DELIMITER $$
CREATE TRIGGER `loaninsertlog` AFTER INSERT ON `tblloan` FOR EACH ROW INSERT INTO log VALUES(null, NEW.UserId, NEW.ID, 'loan', NEW.LoanItem, NEW.LoanCost, 'inserted', NOW())
$$
DELIMITER ;
DROP TRIGGER IF EXISTS `londeletelog`;
DELIMITER $$
CREATE TRIGGER `londeletelog` BEFORE DELETE ON `tblloan` FOR EACH ROW INSERT INTO log VALUES(null, OLD.UserId, OLD.ID, 'loan', OLD.LoanItem, OLD.LoanCost, 'deleted', NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `tbluser`
--

DROP TABLE IF EXISTS `tbluser`;
CREATE TABLE IF NOT EXISTS `tbluser` (
  `ID` int(10) NOT NULL AUTO_INCREMENT,
  `FullName` varchar(150) DEFAULT NULL,
  `Email` varchar(200) DEFAULT NULL,
  `MobileNumber` bigint(10) DEFAULT NULL,
  `Password` varchar(200) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbluser`
--

INSERT INTO `tbluser` (`ID`, `FullName`, `Email`, `MobileNumber`, `Password`, `RegDate`) VALUES
(14, 'demouser', 'demouser@gmail.com', 8957611111, '91017d590a69dc49807671a51f10ab7f', '2022-11-10 10:04:49');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
