-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 16, 2025 at 01:59 PM
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
(1, '123123213213213', 11, '2025-09-11', 'yes', 1, 1),
(2, '12213', 12, '2025-09-15', '12121', 12, 1);

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
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `Product_ID` int NOT NULL,
  `LocationS` varchar(100) NOT NULL,
  `LocationR` varchar(100) NOT NULL,
  `Price` decimal(10,2) NOT NULL,
  `Inventory` int NOT NULL,
  `UnitIN` datetime DEFAULT NULL,
  `UnitOut` timestamp NULL DEFAULT NULL,
  `Status` varchar(100) NOT NULL,
  `ExpirationDate` date DEFAULT NULL,
  `Barcode` int NOT NULL,
  `Supplier_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`Product_ID`, `LocationS`, `LocationR`, `Price`, `Inventory`, `UnitIN`, `UnitOut`, `Status`, `ExpirationDate`, `Barcode`, `Supplier_ID`) VALUES
(6, 'Shelf A', 'Row A', 33333333.00, 12, '2025-09-16 18:21:00', NULL, 'LOW', '2025-09-15', 2134, 1),
(9, 'Shelf A', 'Row A', 122.00, 12, '2025-09-16 18:26:00', '2025-09-16 10:48:00', 'LOW', '2025-09-16', 12333, 1),
(7, 'Shelf A', 'Row A', 122.00, 11, '2025-09-16 18:38:00', NULL, 'IN STOCK', '2025-09-16', 21342, 1);

-- --------------------------------------------------------

--
-- Table structure for table `newaddition`
--

CREATE TABLE `newaddition` (
  `Inventory_ID` int NOT NULL,
  `Product_ID` int NOT NULL,
  `Quantity` int NOT NULL,
  `Date_Added` timestamp NOT NULL,
  `Expiration_Date` date DEFAULT NULL,
  `Status` text NOT NULL,
  `Supplier_ID` int NOT NULL,
  `LocationS` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `LocationR` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `newaddition`
--

INSERT INTO `newaddition` (`Inventory_ID`, `Product_ID`, `Quantity`, `Date_Added`, `Expiration_Date`, `Status`, `Supplier_ID`, `LocationS`, `LocationR`) VALUES
(17, 1, 123, '2025-09-15 16:00:00', '2025-09-16', 'new addition', 1, 'A', 'B'),
(18, 1, 12, '2025-09-15 16:00:00', NULL, 'new addition', 1, 'A', 'B'),
(19, 1, 1, '2025-09-15 16:00:00', NULL, 'new addition', 1, 'Shelf B', 'Row B'),
(20, 2, 1, '2025-09-16 08:27:00', NULL, 'new addition', 1, 'Shelf A', 'Row A'),
(33, 1, 1, '2025-09-16 08:54:00', NULL, 'new addition', 1, 'Shelf A', 'Row A'),
(38, 6, 12, '2025-09-16 10:21:00', NULL, 'new addition', 1, 'Shelf A', 'Row A'),
(40, 9, 22, '2025-09-16 10:26:00', NULL, 'new addition', 1, 'Shelf A', 'Row A'),
(41, 7, 11, '2025-09-16 10:38:00', '2025-09-16', 'new addition', 1, 'Shelf A', 'Row A');

--
-- Triggers `newaddition`
--
DELIMITER $$
CREATE TRIGGER `after_newaddition_insert` AFTER INSERT ON `newaddition` FOR EACH ROW BEGIN
    DECLARE v_Price DECIMAL(10,2);
    DECLARE v_Supplier_ID VARCHAR(50);
    DECLARE v_ExpirationDate DATE;
    DECLARE v_Barcode VARCHAR(100);
    DECLARE v_NewInventory INT;
    DECLARE v_Status VARCHAR(20);

    -- ✅ Get values from product table
    SELECT StorePrice, Supplier_ID, ExpirationDate, Barcode
    INTO v_Price, v_Supplier_ID, v_ExpirationDate, v_Barcode
    FROM product
    WHERE Product_ID = NEW.Product_ID;

    -- ✅ Check if product already exists in inventory at same location
    IF EXISTS (
        SELECT 1 FROM inventory 
        WHERE Product_ID = NEW.Product_ID
          AND LocationS = NEW.LocationS
          AND LocationR = NEW.LocationR
    ) THEN
        -- Update existing inventory
        UPDATE inventory
        SET 
            Inventory = Inventory + NEW.Quantity,
            UnitIN = NEW.Date_Added,
            Status = CASE
                WHEN (Inventory + NEW.Quantity) < POWER((Inventory + NEW.Quantity), 2) * 0.20 
                THEN 'LOW'
                ELSE 'OK'
            END
        WHERE Product_ID = NEW.Product_ID
          AND LocationS = NEW.LocationS
          AND LocationR = NEW.LocationR;
    ELSE
        -- Insert new inventory row
        SET v_NewInventory = NEW.Quantity;
        SET v_Status = CASE 
            WHEN v_NewInventory <= 10
            THEN 'LOW' 
            WHEN v_NewInventory >= 10
            THEN 'IN STOCK' 
            
            ELSE 'OUT OF STOCK'
        END;

        INSERT INTO inventory (
            Product_ID,
            LocationS,
            LocationR,
            Price,
            Inventory,
            UnitIN,
            UnitOut,
            Status,
            Supplier_ID,
            ExpirationDate,
            Barcode
        ) VALUES (
            NEW.Product_ID,
            NEW.LocationS,
            NEW.LocationR,
            v_Price,
            v_NewInventory,
            NEW.Date_Added,
            NULL,
            v_Status,
            v_Supplier_ID,
            v_ExpirationDate,
            v_Barcode
        );
    END IF;
END
$$
DELIMITER ;

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
  `UnitSold` int DEFAULT NULL,
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
(1, 'qqqqqqqqqqq', 'Rim', 12, 123, 12, 999, 123, '', 1, '2025-09-01', '1111'),
(6, 'QQQQQQQQQQQQQQQ', 'Rim', 12, 12, 1, 33333333, 22222, 0x363863376537643963316463325f796f696d69796161612e6a7067, 1, '2025-09-15', '2134'),
(7, 'XXXXXXX', 'Rim', 12, 11, 1, 122, 12, NULL, 1, '2025-09-16', '21342'),
(8, 'ccccccccccccCCCCC', 'Rim', 12, 11, 1, 122121, 121, NULL, 1, '2025-09-16', '11111'),
(9, 'AAAAAAAAA', 'Rim', 22, 12, 11, 122, 12, NULL, 1, '2025-09-16', '12333'),
(10, 'sssssssssssSSSSSSS', 'Rim', 12, 122, NULL, 12, 12, NULL, 1, '2025-09-16', '12333');

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
  `SalesDate` timestamp NOT NULL,
  `Account_ID` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`Order_ID`, `Transaction_ID`, `Product_ID`, `Quantity`, `TotalPrice`, `Barcode`, `SalesDate`, `Account_ID`) VALUES
(1, 2, 1, 1, 1000, 2025, '2025-08-31 16:00:00', 1),
(2, 2, 2, 1, 999, 2025, '2025-08-31 16:00:00', 1),
(3, 2, 1, 1, 1000, 2025, '2025-08-31 16:00:00', 1),
(4, 3, 1, 1, 1000, 2025, '2025-08-31 16:00:00', 1),
(5, 2, 9, 5, 1200, 2025, '2025-09-15 16:00:00', 1),
(6, 2, 9, 5, 1200, 2025, '2025-09-16 10:48:00', 1);

--
-- Triggers `sales`
--
DELIMITER $$
CREATE TRIGGER `after_sales_insert_aggregration` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    DECLARE daily_start DATE;
    DECLARE daily_end DATE;
    
    DECLARE weekly_start DATE;
    DECLARE weekly_end DATE;
    
    DECLARE monthly_start DATE;
    DECLARE monthly_end DATE;

    -- Compute period boundaries
    SET daily_start = DATE(NEW.SalesDate);
    SET daily_end = daily_start;

    SET weekly_start = DATE_SUB(NEW.SalesDate, INTERVAL WEEKDAY(NEW.SalesDate) DAY);
    SET weekly_end = DATE_ADD(weekly_start, INTERVAL 6 DAY);

    SET monthly_start = DATE_FORMAT(NEW.SalesDate, '%Y-%m-01');
    SET monthly_end = LAST_DAY(NEW.SalesDate);

    -- DAILY AGGREGATION
    INSERT INTO salesaggregration (
        PeriodType, PeriodStart, PeriodEnd, Product_ID, TotalSales, TotalQuantity
    )
    VALUES (
        'daily', daily_start, daily_end, NEW.Product_ID, NEW.TotalPrice, NEW.Quantity
    )
    ON DUPLICATE KEY UPDATE
        TotalSales = TotalSales + NEW.TotalPrice,
        TotalQuantity = TotalQuantity + NEW.Quantity;

    -- WEEKLY AGGREGATION
    INSERT INTO salesaggregration (
        PeriodType, PeriodStart, PeriodEnd, Product_ID, TotalSales, TotalQuantity
    )
    VALUES (
        'weekly', weekly_start, weekly_end, NEW.Product_ID, NEW.TotalPrice, NEW.Quantity
    )
    ON DUPLICATE KEY UPDATE
        TotalSales = TotalSales + NEW.TotalPrice,
        TotalQuantity = TotalQuantity + NEW.Quantity;

    -- MONTHLY AGGREGATION
    INSERT INTO salesaggregration (
        PeriodType, PeriodStart, PeriodEnd, Product_ID, TotalSales, TotalQuantity
    )
    VALUES (
        'monthly', monthly_start, monthly_end, NEW.Product_ID, NEW.TotalPrice, NEW.Quantity
    )
    ON DUPLICATE KEY UPDATE
        TotalSales = TotalSales + NEW.TotalPrice,
        TotalQuantity = TotalQuantity + NEW.Quantity;

END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_sales_insert_inventory` AFTER INSERT ON `sales` FOR EACH ROW BEGIN
    -- Reduce inventory and update UnitOut for the sold product
    UPDATE inventory
    SET 
        Inventory = Inventory - NEW.Quantity,
        UnitOut = NEW.SalesDate
    WHERE Product_ID = NEW.Product_ID;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `salesaggregration`
--

CREATE TABLE `salesaggregration` (
  `Aggregation_ID` int NOT NULL,
  `PeriodType` enum('daily','weekly','monthly') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `PeriodStart` date NOT NULL,
  `PeriodEnd` date NOT NULL,
  `Product_ID` int NOT NULL,
  `TotalSales` decimal(10,2) NOT NULL,
  `TotalQuantity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `salesaggregration`
--

INSERT INTO `salesaggregration` (`Aggregation_ID`, `PeriodType`, `PeriodStart`, `PeriodEnd`, `Product_ID`, `TotalSales`, `TotalQuantity`) VALUES
(1, 'daily', '2025-09-01', '2025-09-01', 1, 3000.00, 3),
(2, 'weekly', '2025-09-01', '2025-09-07', 1, 3000.00, 3),
(3, 'monthly', '2025-09-01', '2025-09-30', 1, 3000.00, 3),
(4, 'daily', '2025-09-01', '2025-09-01', 2, 999.00, 1),
(5, 'weekly', '2025-09-01', '2025-09-07', 2, 999.00, 1),
(6, 'monthly', '2025-09-01', '2025-09-30', 2, 999.00, 1),
(13, 'daily', '2025-09-16', '2025-09-16', 9, 2400.00, 10),
(14, 'weekly', '2025-09-15', '2025-09-21', 9, 2400.00, 10),
(15, 'monthly', '2025-09-01', '2025-09-30', 9, 2400.00, 10);

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
(4, 'KALOY213123123213213', 'BULACAN', 'gomezcarlo333@gmail.com', '123213123213213213213', 'asd'),
(5, 'KALOY222', 'BULACAN', 'gomezcarlo333@gmail.com', '12122121', 'shabu');

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
(1, 1, 12, '11', 111, 1, 12, 'cash', 'online'),
(2, 1, 2, '1', 111, 1, 12, 'cash', 'online');

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
(5, NULL, NULL, NULL, NULL, 0x617474656e64616e6365332e706e67, NULL, NULL),
(6, 'asdasd', 'gomezcarlo2222@gmail.com', '09fa386f06b9af7966cf63ec4effa3ae', '09167549519', NULL, NULL, NULL),
(7, '324243ss', 'gomezcarlo22222@gmail.com', '09fa386f06b9af7966cf63ec4effa3ae', '09167549519', NULL, NULL, NULL);

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
-- Indexes for table `newaddition`
--
ALTER TABLE `newaddition`
  ADD PRIMARY KEY (`Inventory_ID`);

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
-- Indexes for table `salesaggregration`
--
ALTER TABLE `salesaggregration`
  ADD PRIMARY KEY (`Aggregation_ID`),
  ADD UNIQUE KEY `unique_aggregation` (`PeriodType`,`PeriodStart`,`Product_ID`);

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
  MODIFY `CReturn_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `forecast`
--
ALTER TABLE `forecast`
  MODIFY `Forecast_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `newaddition`
--
ALTER TABLE `newaddition`
  MODIFY `Inventory_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

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
  MODIFY `Order_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `salesaggregration`
--
ALTER TABLE `salesaggregration`
  MODIFY `Aggregation_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `supplier`
--
ALTER TABLE `supplier`
  MODIFY `Supplier_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `supplierreturns`
--
ALTER TABLE `supplierreturns`
  MODIFY `SReturns_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `Transaction_ID` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
