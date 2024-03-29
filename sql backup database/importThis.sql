-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 08, 2024 at 04:55 PM
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
-- Database: `supermarket_3h`
--
DROP DATABASE IF EXISTS `supermarket_3h`;

CREATE DATABASE IF NOT EXISTS `supermarket_3h` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `supermarket_3h`;

-- --------------------------------------------------------

--
-- Table structure for table `access_rights`
--

CREATE TABLE `access_rights` (
  `Field` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Role_ID` int(11) DEFAULT NULL,
  `Role_Name` varchar(255) DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `account`
--

CREATE TABLE `account` (
  `account_ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `login_status` tinyint(1) DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_ID` bigint(20) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `zip_code` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `Admin_ID` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_ID` int(11) NOT NULL,
  `fName` varchar(100) DEFAULT NULL,
  `lName` varchar(100) DEFAULT NULL,
  `mName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone_no` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer_support`
--

CREATE TABLE `customer_support` (
  `custumer_supportt_ID` bigint(20) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `department`
--

CREATE TABLE `department` (
  `Department_ID` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Department_Name` varchar(255) DEFAULT NULL,
  `Admin_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `Employee_ID` int(11) NOT NULL,
  `Department_ID` int(11) DEFAULT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `Position` varchar(255) DEFAULT NULL,
  `Access_Level` varchar(255) DEFAULT NULL,
  `Hire_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Inverntory_ID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `QuantityAvailable` int(11) DEFAULT NULL,
  `MinStocks` int(11) DEFAULT NULL,
  `MaxStocks` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `log`
--

CREATE TABLE `log` (
  `logID` int(11) NOT NULL,
  `account_ID` int(11) DEFAULT NULL,
  `log_name` varchar(255) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `loyalty_card`
--

CREATE TABLE `loyalty_card` (
  `loyaltyCard_ID` bigint(20) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `barcode` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE `notes` (
  `note_ID` bigint(20) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `note_text` text DEFAULT NULL,
  `date_created` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `Order_ID` int(11) NOT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `product_ID` int(11) DEFAULT NULL,
  `Inventory_ID` int(11) DEFAULT NULL,
  `Order_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_customer`
--

CREATE TABLE `order_customer` (
  `Order_ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `product_ID` int(11) DEFAULT NULL,
  `Order_Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail`
--

CREATE TABLE `order_detail` (
  `OrderDetail_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `OrderQuantity` int(11) DEFAULT NULL,
  `ExpectedDate` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `ActualDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_detail_customer`
--

CREATE TABLE `order_detail_customer` (
  `OrderDetail_ID` int(11) NOT NULL,
  `Order_ID` int(11) DEFAULT NULL,
  `OrderQuantity` int(11) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `total_price` double DEFAULT NULL,
  `ExpectedDate` date DEFAULT NULL,
  `DeliveryDate` date DEFAULT NULL,
  `deliveredDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `performance`
--

CREATE TABLE `performance` (
  `Performance _ID` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Performance_Score` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `Supplier_ID` int(11) DEFAULT NULL,
  `Product Code` varchar(255) DEFAULT NULL,
  `Barcode` varchar(255) DEFAULT NULL,
  `ProductName` varchar(255) DEFAULT NULL,
  `ProductDescription` varchar(255) DEFAULT NULL,
  `ProductCategory` varchar(255) DEFAULT NULL,
  `ProductQuantity` int(11) DEFAULT NULL,
  `ProductExpiry` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchase_ID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `total_amount` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts`
--

CREATE TABLE `receipts` (
  `receiptID` int(11) NOT NULL,
  `TransactionID` int(11) DEFAULT NULL,
  `receipt_type` varchar(255) DEFAULT NULL,
  `receipt_amount` double DEFAULT NULL,
  `receipt_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `receipts_history`
--

CREATE TABLE `receipts_history` (
  `receipts_historyID` int(11) NOT NULL,
  `receiptID` int(11) DEFAULT NULL,
  `receipt_type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reward_redeemed`
--

CREATE TABLE `reward_redeemed` (
  `redeem_ID` bigint(20) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `points` bigint(20) DEFAULT NULL,
  `redeemed` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `salesID` int(11) NOT NULL,
  `EmployeeID` int(11) DEFAULT NULL,
  `sale_amount` double DEFAULT NULL,
  `sale_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `statistics`
--

CREATE TABLE `statistics` (
  `salesID` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Sale_Amount` double DEFAULT NULL,
  `Date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int(11) NOT NULL,
  `SuplierName` varchar(255) DEFAULT NULL,
  `Supplier Address` varchar(255) DEFAULT NULL,
  `ContactNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tax_report`
--

CREATE TABLE `tax_report` (
  `tax_reportID` int(11) NOT NULL,
  `receiptID` int(11) DEFAULT NULL,
  `tax_amount` double DEFAULT NULL,
  `report_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `time_clock`
--

CREATE TABLE `time_clock` (
  `Clock_ID` int(11) NOT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Clock_In_Time` datetime DEFAULT NULL,
  `Clock_Out_Time` datetime DEFAULT NULL,
  `Break_Time` datetime DEFAULT NULL,
  `Overtime_Hours` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `TransactionID` int(11) NOT NULL,
  `customer_ID` int(11) DEFAULT NULL,
  `Employee_ID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Amount` double DEFAULT NULL,
  `Description` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfer`
--

CREATE TABLE `transfer` (
  `Transfer_ID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `WearhouseID_sender` int(11) DEFAULT NULL,
  `WearhouseID_receiver` int(11) DEFAULT NULL,
  `TransferQuantity` int(11) DEFAULT NULL,
  `SentDate` date DEFAULT NULL,
  `RecieveDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouse`
--

CREATE TABLE `warehouse` (
  `Warehouse_ID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `PhoneNumber` int(11) DEFAULT NULL,
  `LocationAddress` varchar(255) DEFAULT NULL,
  `WarehouseName` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `workload`
--

CREATE TABLE `workload` (
  `Employee_ID` int(11) NOT NULL,
  `Date` date DEFAULT NULL,
  `Hour` int(11) DEFAULT NULL,
  `Workload` double DEFAULT NULL,
  `Task_Type` varchar(255) DEFAULT NULL,
  `Priority_Level` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `access_rights`
--
ALTER TABLE `access_rights`
  ADD PRIMARY KEY (`Field`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `account`
--
ALTER TABLE `account`
  ADD PRIMARY KEY (`account_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`Admin_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_ID`);

--
-- Indexes for table `customer_support`
--
ALTER TABLE `customer_support`
  ADD PRIMARY KEY (`custumer_supportt_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`Department_ID`),
  ADD KEY `Admin_ID` (`Admin_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`Inverntory_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`logID`),
  ADD KEY `account_ID` (`account_ID`);

--
-- Indexes for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD PRIMARY KEY (`loyaltyCard_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
  ADD PRIMARY KEY (`note_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `product_ID` (`product_ID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`),
  ADD KEY `Inventory_ID` (`Inventory_ID`);

--
-- Indexes for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD PRIMARY KEY (`OrderDetail_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `order_detail_customer`
--
ALTER TABLE `order_detail_customer`
  ADD PRIMARY KEY (`OrderDetail_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `performance`
--
ALTER TABLE `performance`
  ADD PRIMARY KEY (`Performance _ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductID`),
  ADD KEY `Supplier_ID` (`Supplier_ID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchase_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `receipts`
--
ALTER TABLE `receipts`
  ADD PRIMARY KEY (`receiptID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `receipts_history`
--
ALTER TABLE `receipts_history`
  ADD PRIMARY KEY (`receipts_historyID`),
  ADD KEY `receiptID` (`receiptID`);

--
-- Indexes for table `reward_redeemed`
--
ALTER TABLE `reward_redeemed`
  ADD PRIMARY KEY (`redeem_ID`),
  ADD KEY `customer_ID` (`customer_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`salesID`),
  ADD KEY `EmployeeID` (`EmployeeID`);

--
-- Indexes for table `statistics`
--
ALTER TABLE `statistics`
  ADD PRIMARY KEY (`salesID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `tax_report`
--
ALTER TABLE `tax_report`
  ADD PRIMARY KEY (`tax_reportID`),
  ADD KEY `receiptID` (`receiptID`);

--
-- Indexes for table `time_clock`
--
ALTER TABLE `time_clock`
  ADD PRIMARY KEY (`Clock_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `customer_ID` (`customer_ID`),
  ADD KEY `Employee_ID` (`Employee_ID`);

--
-- Indexes for table `transfer`
--
ALTER TABLE `transfer`
  ADD PRIMARY KEY (`Transfer_ID`),
  ADD KEY `ProductID` (`ProductID`),
  ADD KEY `WearhouseID_sender` (`WearhouseID_sender`),
  ADD KEY `WearhouseID_receiver` (`WearhouseID_receiver`);

--
-- Indexes for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD PRIMARY KEY (`Warehouse_ID`),
  ADD KEY `ProductID` (`ProductID`);

--
-- Indexes for table `workload`
--
ALTER TABLE `workload`
  ADD PRIMARY KEY (`Employee_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `access_rights`
--
ALTER TABLE `access_rights`
  MODIFY `Field` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `account`
--
ALTER TABLE `account`
  MODIFY `account_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer_support`
--
ALTER TABLE `customer_support`
  MODIFY `custumer_supportt_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `department`
--
ALTER TABLE `department`
  MODIFY `Department_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `Inverntory_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `log`
--
ALTER TABLE `log`
  MODIFY `logID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  MODIFY `loyaltyCard_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
  MODIFY `note_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_customer`
--
ALTER TABLE `order_customer`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail`
--
ALTER TABLE `order_detail`
  MODIFY `OrderDetail_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order_detail_customer`
--
ALTER TABLE `order_detail_customer`
  MODIFY `OrderDetail_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `performance`
--
ALTER TABLE `performance`
  MODIFY `Performance _ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchase_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipts`
--
ALTER TABLE `receipts`
  MODIFY `receiptID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `receipts_history`
--
ALTER TABLE `receipts_history`
  MODIFY `receipts_historyID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reward_redeemed`
--
ALTER TABLE `reward_redeemed`
  MODIFY `redeem_ID` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `salesID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tax_report`
--
ALTER TABLE `tax_report`
  MODIFY `tax_reportID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `time_clock`
--
ALTER TABLE `time_clock`
  MODIFY `Clock_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `TransactionID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfer`
--
ALTER TABLE `transfer`
  MODIFY `Transfer_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `warehouse`
--
ALTER TABLE `warehouse`
  MODIFY `Warehouse_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `workload`
--
ALTER TABLE `workload`
  MODIFY `Employee_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `access_rights`
--
ALTER TABLE `access_rights`
  ADD CONSTRAINT `access_rights_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `account`
--
ALTER TABLE `account`
  ADD CONSTRAINT `account_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `address_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `customer_support`
--
ALTER TABLE `customer_support`
  ADD CONSTRAINT `customer_support_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `department`
--
ALTER TABLE `department`
  ADD CONSTRAINT `department_ibfk_1` FOREIGN KEY (`Admin_ID`) REFERENCES `admin` (`Admin_ID`),
  ADD CONSTRAINT `department_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `inventory_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`),
  ADD CONSTRAINT `inventory_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `log`
--
ALTER TABLE `log`
  ADD CONSTRAINT `log_ibfk_1` FOREIGN KEY (`account_ID`) REFERENCES `account` (`account_ID`);

--
-- Constraints for table `loyalty_card`
--
ALTER TABLE `loyalty_card`
  ADD CONSTRAINT `loyalty_card_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
  ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`product_ID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`Inventory_ID`) REFERENCES `inventory` (`Inverntory_ID`);

--
-- Constraints for table `order_customer`
--
ALTER TABLE `order_customer`
  ADD CONSTRAINT `order_customer_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `order_detail`
--
ALTER TABLE `order_detail`
  ADD CONSTRAINT `order_detail_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order` (`Order_ID`);

--
-- Constraints for table `order_detail_customer`
--
ALTER TABLE `order_detail_customer`
  ADD CONSTRAINT `order_detail_customer_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `order_customer` (`Order_ID`);

--
-- Constraints for table `performance`
--
ALTER TABLE `performance`
  ADD CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `product_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `supplier` (`Supplier_ID`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `receipts`
--
ALTER TABLE `receipts`
  ADD CONSTRAINT `receipts_ibfk_1` FOREIGN KEY (`TransactionID`) REFERENCES `transaction` (`TransactionID`);

--
-- Constraints for table `receipts_history`
--
ALTER TABLE `receipts_history`
  ADD CONSTRAINT `receipts_history_ibfk_1` FOREIGN KEY (`receiptID`) REFERENCES `receipts` (`receiptID`);

--
-- Constraints for table `reward_redeemed`
--
ALTER TABLE `reward_redeemed`
  ADD CONSTRAINT `reward_redeemed_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`);

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`EmployeeID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `statistics`
--
ALTER TABLE `statistics`
  ADD CONSTRAINT `statistics_ibfk_1` FOREIGN KEY (`salesID`) REFERENCES `sales` (`salesID`),
  ADD CONSTRAINT `statistics_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `tax_report`
--
ALTER TABLE `tax_report`
  ADD CONSTRAINT `tax_report_ibfk_1` FOREIGN KEY (`receiptID`) REFERENCES `receipts` (`receiptID`);

--
-- Constraints for table `time_clock`
--
ALTER TABLE `time_clock`
  ADD CONSTRAINT `time_clock_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`customer_ID`) REFERENCES `customer` (`customer_ID`),
  ADD CONSTRAINT `transaction_ibfk_2` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);

--
-- Constraints for table `transfer`
--
ALTER TABLE `transfer`
  ADD CONSTRAINT `transfer_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`),
  ADD CONSTRAINT `transfer_ibfk_2` FOREIGN KEY (`WearhouseID_sender`) REFERENCES `warehouse` (`Warehouse_ID`),
  ADD CONSTRAINT `transfer_ibfk_3` FOREIGN KEY (`WearhouseID_receiver`) REFERENCES `warehouse` (`Warehouse_ID`);

--
-- Constraints for table `warehouse`
--
ALTER TABLE `warehouse`
  ADD CONSTRAINT `warehouse_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`);

--
-- Constraints for table `workload`
--
ALTER TABLE `workload`
  ADD CONSTRAINT `workload_ibfk_1` FOREIGN KEY (`Employee_ID`) REFERENCES `employee` (`Employee_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
