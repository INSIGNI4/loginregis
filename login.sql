-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 11, 2025 at 07:25 AM
-- Server version: 8.0.43
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `login`
--

-- --------------------------------------------------------

--
-- Table structure for table `analytics`
--

CREATE TABLE `analytics` (
  `AnalyticsID` int NOT NULL,
  `Forecast_ID` int NOT NULL,
  `Forecast_Type` text NOT NULL,
  `Report_Date` date NOT NULL,
  `ProductScope` int NOT NULL,
  `PeriodType` text NOT NULL,
  `SalesMetrics` int NOT NULL,
  `Inventory_ID` int NOT NULL,
  `Account_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `analytics`
--

INSERT INTO `analytics` (`AnalyticsID`, `Forecast_ID`, `Forecast_Type`, `Report_Date`, `ProductScope`, `PeriodType`, `SalesMetrics`, `Inventory_ID`, `Account_ID`) VALUES
(1, 1, 'Weekly', '2025-09-11', 1, 'weekly', 30, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `Customer_ID` int NOT NULL,
  `CustomerName` varchar(100) NOT NULL,
  `Location` varchar(250) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `PhoneNumber` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`Customer_ID`, `CustomerName`, `Location`, `Email`, `PhoneNumber`) VALUES
(1, 'ASD', 'BULACAN', 'gomezcarlo333@gmail.com', 123213),
(2, 'ASD', 'BULACAN', 'gomezcarlo333@gmail.com', 123123);

-- --------------------------------------------------------

--
-- Table structure for table `customersreturns`
--

CREATE TABLE `customersreturns` (
  `CReturn_ID` int NOT NULL,
  `ReferenceNo` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `ReturnedDate` date NOT NULL,
  `ReasonForReturn` text NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `Product_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customersreturns`
--

INSERT INTO `customersreturns` (`CReturn_ID`, `ReferenceNo`, `Quantity`, `ReturnedDate`, `ReasonForReturn`, `Customer_ID`, `Product_ID`) VALUES
(1, '123123213213213', 11, '2025-09-11', 'yes', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `forecast`
--

CREATE TABLE `forecast` (
  `Forecast_ID` int NOT NULL,
  `ForecastType` text NOT NULL,
  `ProductScope` int NOT NULL,
  `ForecastPeriod` text NOT NULL,
  `ForecastStart` date NOT NULL,
  `ForecastEnd` date NOT NULL,
  `ProjectedSales` int NOT NULL,
  `ConfidenceLevel` int NOT NULL,
  `Account_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `forecast`
--

INSERT INTO `forecast` (`Forecast_ID`, `ForecastType`, `ProductScope`, `ForecastPeriod`, `ForecastStart`, `ForecastEnd`, `ProjectedSales`, `ConfidenceLevel`, `Account_ID`) VALUES
(1, 'single', 1, 'weekly', '2025-09-11', '2025-09-18', 11, 12, 12);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int NOT NULL,
  `ProductName` varchar(100) NOT NULL,
  `Type` varchar(100) NOT NULL,
  `ReordingPoints` int NOT NULL,
  `UnitsOrdered` int NOT NULL,
  `UnitSold` int NOT NULL,
  `StorePrice` int NOT NULL,
  `SupplierPrice` int NOT NULL,
  `Image` blob,
  `Supplier_ID` int NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Barcode` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `ProductName`, `Type`, `ReordingPoints`, `UnitsOrdered`, `UnitSold`, `StorePrice`, `SupplierPrice`, `Image`, `Supplier_ID`, `ExpirationDate`, `Barcode`) VALUES
(1, 'awdwadawdawd', 'Rim', 12, 123, 12, 123213, 123, '', 1, '2025-09-01', '1111111111111111111111111111111111111111111111111111'),
(2, 'etits', 'Rim', 12312, 122112, 111, 1221, 1212, NULL, 1, '2025-09-03', '1111111111111111111111111111111111111111111111111111'),
(3, 'etits', 'Rim', 213213, 1223, 12, 12321, 1221, 0x796f696d69796161612e6a7067, 123213, '2025-09-03', '1111111111111111111111111111111111111111111111111111'),
(4, 'KKK', 'Rim', 21, 232, 21, 3232, 123, 0x77616c6c70617065727364656e2e636f6d5f62656175746966756c2d636f6f6c2d6d6f756e7461696e732d68645f3338343078323136302e6a7067, 1, '2025-09-03', '2134242354523'),
(5, '123asdas', 'Rim', 123, 1231221, 123123, 121, 21, 0x4172636869746563747572616c206c61796f75742e6a7067, 111, '2025-09-11', '123333333333');

-- --------------------------------------------------------

--
-- Table structure for table `pulledoutitems`
--

CREATE TABLE `pulledoutitems` (
  `Pulled_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Supplier_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Reason` text NOT NULL,
  `PulledDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `pulledoutitems`
--

INSERT INTO `pulledoutitems` (`Pulled_ID`, `Product_ID`, `Supplier_ID`, `Quantity`, `Reason`, `PulledDate`) VALUES
(1, 1, 1, 123, 'asd', '2025-09-11');

-- --------------------------------------------------------

--
-- Table structure for table `restock`
--

CREATE TABLE `restock` (
  `Orestock_ID` int NOT NULL,
  `Type` varchar(100) NOT NULL,
  `Quantity` int NOT NULL,
  `OrderDate` date NOT NULL,
  `Product_ID` int NOT NULL,
  `Supplier_ID` int NOT NULL,
  `Status` varchar(100) NOT NULL,
  `ProofOfTransaction` blob NOT NULL,
  `DeliveryStatus` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `restock`
--

INSERT INTO `restock` (`Orestock_ID`, `Type`, `Quantity`, `OrderDate`, `Product_ID`, `Supplier_ID`, `Status`, `ProofOfTransaction`, `DeliveryStatus`) VALUES
(1, 'Rim', 12, '2025-09-06', 1, 1, 'pending', 0x617474656e64616e6365332e706e67, 'delayed'),
(2, 'Rim', 1, '2025-09-11', 1, 1, 'pending', 0x617474656e64616e6365332e706e67, 'delayed');

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `Order_ID` int NOT NULL,
  `Transaction_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `TotalPrice` int NOT NULL,
  `Barcode` int NOT NULL,
  `SalesDate` date NOT NULL,
  `Account_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Order_ID`, `Transaction_ID`, `Product_ID`, `Quantity`, `TotalPrice`, `Barcode`, `SalesDate`, `Account_ID`) VALUES
(1, 12321, 123, 123, 123, 1233333, '2025-09-11', 213123);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE `supplier` (
  `Supplier_ID` int NOT NULL,
  `SupplierName` varchar(100) NOT NULL,
  `Location` varchar(250) NOT NULL,
  `Email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PhoneNumber` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `OfferedProductsType` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`Supplier_ID`, `SupplierName`, `Location`, `Email`, `PhoneNumber`, `OfferedProductsType`) VALUES
(1, 'KALOY', 'BULACAN', 'gomezcarlo333@gmail.com', '123213213213', 'shabu'),
(2, 'KALOY12312321321312', 'BULACAN', 'gomezcarlo333@gmail.com', '12312321', 'shabu'),
(3, 'KALOY', 'BULACAN', 'asdsad', '123213123213213213213213213213213', '123213'),
(4, 'KALOY213123123213213', 'BULACAN', 'gomezcarlo333@gmail.com', '123213123213213213213', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `supplierreturns`
--

CREATE TABLE `supplierreturns` (
  `SReturns_ID` int NOT NULL,
  `Supplier_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `ReturnedDate` date NOT NULL,
  `Status` text NOT NULL,
  `Reason` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `supplierreturns`
--

INSERT INTO `supplierreturns` (`SReturns_ID`, `Supplier_ID`, `Product_ID`, `Quantity`, `ReturnedDate`, `Status`, `Reason`) VALUES
(1, 1, 1, 11, '2025-09-11', 'pending', 'asd');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `Transaction_ID` int NOT NULL,
  `Customer_ID` int DEFAULT NULL,
  `ReferenceNo` int NOT NULL,
  `PurchaseType` text NOT NULL,
  `PurchaseScope` int NOT NULL,
  `Product_ID` int NOT NULL,
  `TotalSales` int NOT NULL,
  `PaymentMethod` text NOT NULL,
  `DeliveryType` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`Transaction_ID`, `Customer_ID`, `ReferenceNo`, `PurchaseType`, `PurchaseScope`, `Product_ID`, `TotalSales`, `PaymentMethod`, `DeliveryType`) VALUES
(1, 1, 12, '11', 111, 1, 12, 'cash', 'online');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `userName` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `image` blob,
  `reset_token_hash` varchar(100) DEFAULT NULL,
  `reset_token_expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `userName`, `email`, `password`, `phone`, `image`, `reset_token_hash`, `reset_token_expires_at`) VALUES
(1, 'CARLOJAY', 'gomezcarlo222@gmail.com', '09fa386f06b9af7966cf63ec4effa3ae', '09167549519', NULL, NULL, NULL),
(2, '324243', 'gomezcarlo333@gmail.com', '09fa386f06b9af7966cf63ec4effa3ae', '09167549519', NULL, NULL, NULL),
(3, NULL, NULL, NULL, NULL, 0x617474656e64616e6365332e706e67, NULL, NULL),
(4, NULL, NULL, NULL, NULL, 0x617474656e64616e6365332e706e67, NULL, NULL),
(5, NULL, NULL, NULL, NULL, 0x617474656e64616e6365332e706e67, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `analytics`
--
ALTER TABLE `analytics`
  ADD PRIMARY KEY (`AnalyticsID`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`Customer_ID`);

--
-- Indexes for table `customersreturns`
--
ALTER TABLE `customersreturns`
  ADD PRIMARY KEY (`CReturn_ID`);

--
-- Indexes for table `forecast`
--
ALTER TABLE `forecast`
  ADD PRIMARY KEY (`Forecast_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `pulledoutitems`
--
ALTER TABLE `pulledoutitems`
  ADD PRIMARY KEY (`Pulled_ID`);

--
-- Indexes for table `restock`
--
ALTER TABLE `restock`
  ADD PRIMARY KEY (`Orestock_ID`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`Order_ID`);

--
-- Indexes for table `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`Supplier_ID`);

--
-- Indexes for table `supplierreturns`
--
ALTER TABLE `supplierreturns`
  ADD PRIMARY KEY (`SReturns_ID`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`Transaction_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `analytics`
--
ALTER TABLE `analytics`
  MODIFY `AnalyticsID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `Customer_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customersreturns`
--
ALTER TABLE `customersreturns`
  MODIFY `CReturn_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `forecast`
--
ALTER TABLE `forecast`
  MODIFY `Forecast_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `pulledoutitems`
--
ALTER TABLE `pulledoutitems`
  MODIFY `Pulled_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `restock`
--
ALTER TABLE `restock`
  MODIFY `Orestock_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `Order_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `supplierreturns`
--
ALTER TABLE `supplierreturns`
  MODIFY `SReturns_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
