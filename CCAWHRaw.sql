-- SQL Manager 2008 for SQL Server 3.2.0.2
-- ---------------------------------------
-- Host      : .\SQLEXPRESS
-- Database  : CCAWHRaw
-- Version   : Microsoft SQL Server  11.0.3000.0


--CREATE DATABASE [CCAWHRaw]
--ON PRIMARY
--  ( NAME = [CCAWHRaw],
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CCAWHRaw.mdf',
--    SIZE = 5 MB,
--    MAXSIZE = UNLIMITED,
--    FILEGROWTH = 1 MB )
--LOG ON
--  ( NAME = [CCAWHRaw_log],
--    FILENAME = 'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CCAWHRaw_log.ldf',
--    SIZE = 1 MB,
--    MAXSIZE = 1 MB,
--    FILEGROWTH = 10 % )
--COLLATE Chinese_PRC_CI_AS
--GO

USE [CCAWHRaw]
GO

--
-- Definition for user KoneUser : 
--

CREATE USER [KoneUser]
  FOR LOGIN  [KoneUser]
  WITH DEFAULT_SCHEMA = [dbo]
GO

--
-- Definition for contract DEFAULT : 
--

CREATE CONTRACT [DEFAULT] 
  AUTHORIZATION [dbo]
  ([DEFAULT] SENT BY ANY)
GO

--
-- Definition for table VendorList : 
--

CREATE TABLE [dbo].[VendorList] (
  [VendorID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Descript] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ShortDes] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [GreenTime] nvarchar(5) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Users : 
--

CREATE TABLE [dbo].[Users] (
  [UserID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Password] nvarchar(255) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Functions] nvarchar(1000) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table UserRights : 
--

CREATE TABLE [dbo].[UserRights] (
  [UserID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ControlTag] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [ControlName] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [IsRight] bit CONSTRAINT [DF_UserRights_IsRight] DEFAULT 0 NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table trace_xe_event_map : 
--

CREATE TABLE [sys].[trace_xe_event_map] (
  [trace_event_id] smallint NOT NULL,
  [package_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [xe_event_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

--
-- Definition for table trace_xe_action_map : 
--

CREATE TABLE [sys].[trace_xe_action_map] (
  [trace_column_id] smallint NOT NULL,
  [package_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
  [xe_action_name] nvarchar(60) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
)
GO

--
-- Definition for table temp : 
--

CREATE TABLE [dbo].[temp] (
  [PurchDoc] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Item] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Vendor] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Material] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Shorttext] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Qty] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Unit] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Delivdate] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [交付日期] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [计划确认人] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [发送日期] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [FromFile] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [SheetName] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table StoreBar2 : 
--

CREATE TABLE [dbo].[StoreBar2] (
  [YearID] tinyint NOT NULL,
  [Lot] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [Line] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [DelivID] int NOT NULL,
  [Bar2ID] nvarchar(4000) COLLATE Chinese_PRC_CI_AS NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Store : 
--

CREATE TABLE [dbo].[Store] (
  [ID] nvarchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [Code] nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Line] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [YearID] tinyint NULL,
  [DelivID] int NULL,
  [Lot] nvarchar(100) COLLATE Chinese_PRC_CI_AS NULL,
  [PO] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [Item] nvarchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [Rawsheet] nvarchar(30) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Qty] int NOT NULL,
  [PackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [NeedQty] int NULL,
  [InputTime] datetime NULL,
  [Memo] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [UserID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Repeatdoc : 
--

CREATE TABLE [dbo].[Repeatdoc] (
  [PurchDoc] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Item] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Vendor] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Material] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Shorttext] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Qty] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Unit] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Delivdate] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [交付日期] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [计划确认人] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [发送日期] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [FromFile] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [SheetName] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [InputTime] datetime NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Raw : 
--

CREATE TABLE [dbo].[Raw] (
  [Rawsheet] nvarchar(30) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Description] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Length] float NULL,
  [Width] float NULL,
  [Thick] float NULL,
  [MType] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table RackRaw : 
--

CREATE TABLE [dbo].[RackRaw] (
  [ID] int NOT NULL,
  [RackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [LayID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [RackName] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Rawsheet] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [Laymemo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RowNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [ColumnNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [FlexibleID] bit NULL,
  [UniqueID] bit NULL
)
ON [PRIMARY]
GO

--
-- Definition for table RackLayout : 
--

CREATE TABLE [dbo].[RackLayout] (
  [ID] int NOT NULL,
  [RackName] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [LayID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Layoutx] float NOT NULL,
  [Layouty] float NOT NULL,
  [Laywidth] float NOT NULL,
  [Layheight] float NOT NULL,
  [RowNum] int NULL,
  [ColumnNum] int NULL,
  [ForUse] bit NULL,
  [ConType] nvarchar(10) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Rack : 
--

CREATE TABLE [dbo].[Rack] (
  [ID] int NOT NULL,
  [RackName] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [LayID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Laymemo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RowNo] int NULL,
  [column1] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column2] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column3] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column4] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column5] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column6] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column7] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column8] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column9] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [column10] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Purdoc : 
--

CREATE TABLE [dbo].[Purdoc] (
  [PurchDoc] nvarchar(50) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Item] nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Vendor] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [Material] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [ShortText] nvarchar(200) COLLATE Chinese_PRC_CI_AS NULL,
  [Qty] float NULL,
  [Unit] nvarchar(10) COLLATE Chinese_PRC_CI_AS NULL,
  [Delivdate] datetime NULL,
  [交付日期] datetime NULL,
  [计划确认人] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [发送日期] datetime NULL,
  [FromFile] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [SheetName] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [InputTime] datetime NULL,
  [Status] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table Infotable : 
--

CREATE TABLE [dbo].[Infotable] (
  [InfoText] nvarchar(255) COLLATE Chinese_PRC_CI_AS NULL,
  [Infotime] datetime NULL,
  [UserName] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL
)
ON [PRIMARY]
GO

--
-- Definition for table C02Temp : 
--

CREATE TABLE [dbo].[C02Temp] (
  [YearID] tinyint NOT NULL,
  [Lot] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [Line] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [PackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [DelivID] int NOT NULL,
  [Bar2ID] nvarchar(4000) COLLATE Chinese_PRC_CI_AS NOT NULL
)
ON [PRIMARY]
GO

--
-- Definition for table C02 : 
--

CREATE TABLE [dbo].[C02] (
  [Code] nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Line] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [PackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [YearID] int NULL,
  [DelivID] int NULL,
  [Lot] nvarchar(50) COLLATE Chinese_PRC_CI_AS NULL,
  [Rawsheet] nvarchar(30) COLLATE Chinese_PRC_CI_AS NULL,
  [Qty] int NULL,
  [NeedQty] int NULL,
  [UserID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [TempID] int NULL,
  [RackName] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RowNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [ColumnNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [ScanTime] datetime CONSTRAINT [DF_C01_ScanTime] DEFAULT getdate() NULL
)
ON [PRIMARY]
GO

--
-- Definition for table C01 : 
--

CREATE TABLE [dbo].[C01] (
  [ID] nvarchar(100) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Code] nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [PO] nvarchar(20) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Item] nvarchar(10) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Rawsheet] nvarchar(30) COLLATE Chinese_PRC_CI_AS NOT NULL,
  [Qty] int NOT NULL,
  [PackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [UserID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [TempID] int NULL,
  [RackName] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RackID] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [RowNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [ColumnNo] nvarchar(20) COLLATE Chinese_PRC_CI_AS NULL,
  [ScanTime] datetime CONSTRAINT [DF_C01_ScanTime_1] DEFAULT getdate() NULL
)
ON [PRIMARY]
GO

--
-- Data for table dbo.Purdoc  (LIMIT 0,500)
--

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537100', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 150, N'PC', '20190226', '20190501', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537100', N'20', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 150, N'PC', '20190226', '20190501', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537101', N'10', N'test company', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 150, N'PC', '20190226', '20190501', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 150, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', 140, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', 50, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', 70, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', 70, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', 90, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', 80, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', 240, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', 30, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537173', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 100, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537173', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', 100, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537173', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', 100, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537173', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', 100, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537174', N'10', N'four company', N'KM50316387', N'冷板，1.2*1230*2400', 200, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537174', N'20', N'two company', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', 100, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537174', N'30', N'two company', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', 200, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537174', N'40', N'one company', N'KM50316504', N'冷板PL1X332X2017MM', 150, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537174', N'50', N'third company', N'KM50316460', N'冷板PL2x1250x2530 SPCC', 30, N'PC', '20190226', '20190427', N'YE', '20190225', N'rawtest1.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537175', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', 150, N'PC', '20190226', '20190426', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537175', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', 250, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537175', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', 300, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537175', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', 100, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537176', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', 200, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537176', N'20', N'two company', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', 100, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537176', N'30', N'two company', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', 200, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537176', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', 150, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537176', N'50', N'One company', N'KM50316460', N'冷板PL2x1250x2530 SPCC', 150, N'PC', '20190226', '20190428', N'YE', '20190225', N'rawtest2.xlsx', N'Sheet1', '20190426 21:30:41', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537178', N'10', N'浙江物产金属集团有限公司', N'KM51068225', N'ST43_ST43 0.6mm*1000mm*2375mm', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537178', N'20', N'浙江物产金属集团有限公司', N'KM51134990', N'ST43_ST443,1.2*1200*1500', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537178', N'30', N'浙江物产金属集团有限公司', N'KM51073208', N'ST4_PL1x860x2410 sliver Brushed materials', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537178', N'40', N'浙江物产金属集团有限公司', N'KM51196853', N'MP1_PL 1 x 1000 x 1630 Silver Mirror polished S.S', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'10', N'浙江物产金属集团有限公司', N'KM50080448', N'F1_F1 - Asturias Satin PL1.5*3050*1219', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'20', N'浙江物产金属集团有限公司', N'KM948778', N'MP2_金色镜面板 1X1219X2720MM 1.4301 8N <U>', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'30', N'浙江物产金属集团有限公司', N'KM928444', N'MP4_STEEL SHEET AISI304 1.0X1219X2720 MP4 <U>', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'40', N'浙江物产金属集团有限公司', N'KM50080428', N'ST33S_ST33S - Silver Curve, etched stainless steel PL1.0*1219*2720', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'50', N'浙江物产金属集团有限公司', N'KM50080436', N'ST36S_ST36S - Silver Graphics, etched stainless steel PL1.0*1219*2720', 200, N'PC', '20190226', '20190502', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', N'finish')
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'60', N'浙江物产金属集团有限公司', N'KM50080436', N'ST36S_ST36S - Silver Graphics, etched stainless steel PL1.0*1219*2720', 200, N'PC', '20190226', '20190503', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

INSERT INTO [dbo].[Purdoc] ([PurchDoc], [Item], [Vendor], [Material], [ShortText], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime], [Status])
VALUES 
  (N'4525537179', N'70', N'浙江物产金属集团有限公司', N'KM50080436', N'ST36S_ST36S - Silver Graphics, etched stainless steel PL1.0*1219*2720', 200, N'PC', '20190226', '20190505', N'YE', '20190225', N'rawtest3.xlsx', N'Sheet1', '20190502 13:19:14', NULL)
GO

--
-- Data for table dbo.Rack  (LIMIT 0,500)
--

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (1, N'P', N'Layout1', N'室内', 1, N'P-4', N'P-3', N'P-2', N'P-1', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (2, N'P', N'Layout1', N'室内', 2, N'P-4', N'P-3', N'P-2', N'P-1', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (3, N'P', N'Layout1', N'室内', 3, N'P-4', N'P-3', N'P-2', N'P-1', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (4, N'P', N'Layout1', N'室内', 4, N'P-4', N'P-3', N'P-2', N'P-1', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (5, N'P', N'Layout1', N'室内', 5, N'P-4-5', N'P-3-5', N'P-2-5', N'P-1-5', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (6, N'P', N'Layout1', N'室内', 6, N'P-4-6', N'P-3-6', N'P-2-6', N'P-1-6', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (7, N'O', N'Layout1', N'室内', 1, N'O-9-1', N'O-8-1', N'O-7-1', N'O-6-1', N'O-5-1', N'O-4-1', N'O-3-1', N'O-2-1', N'O-1-1', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (8, N'O', N'Layout1', N'室内', 2, N'O-9-2', N'O-8-2', N'O-7-2', N'O-6-2', N'O-5-2', N'O-4-2', N'O-3-2', N'O-2-2', N'O-1-2', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (9, N'O', N'Layout1', N'室内', 3, N'O-9-3', N'O-8-3', N'O-7-3', N'O-6-3', N'O-5-3', N'O-4-3', N'O-3-3', N'O-2-3', N'O-1-3', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (10, N'O', N'Layout1', N'室内', 4, N'O-9-4', N'O-8-4', N'O-7-4', N'O-6-4', N'O-5-4', N'O-4-4', N'O-3-4', N'O-2-4', N'O-1-4', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (11, N'O', N'Layout1', N'室内', 5, N'O-9-5', N'O-8-5', N'O-7-5', N'O-6-5', N'O-5-5', N'O-4-5', N'O-3-5', N'O-2-5', N'O-1-5', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (12, N'O', N'Layout1', N'室内', 6, N'O-9-6', N'O-8-6', N'O-7-6', N'O-6-6', N'O-5-6', N'O-4-6', N'O-3-6', N'O-2-6', N'O-1-6', NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (13, N'N', N'Layout1', N'室内', 1, N'N-7-1', N'N-6', N'N-5-1', N'N-4-1', N'N-3-1', N'N-2-1', N'N-1-1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (14, N'N', N'Layout1', N'室内', 2, N'N-7-2', N'N-6', N'N-5-2', N'N-4-2', N'N-3-2', N'N-2-2', N'N-1-2', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (15, N'N', N'Layout1', N'室内', 3, N'N-7-3', N'N-6', N'N-5-3', N'N-4-3', N'N-3-3', N'N-2-3', N'N-1-3', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (16, N'N', N'Layout1', N'室内', 4, N'N-7-4', N'N-6', N'N-5-3', N'N-4-3', N'N-3-3', N'N-2-3', N'N-1-3', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (17, N'N', N'Layout1', N'室内', 5, N'N-7-5', N'N-6-5', N'N-5-4', N'N-4-4', N'N-3-4', N'N-2-4', N'N-1-4', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (18, N'N', N'Layout1', N'室内', 6, N'N-7-6', N'N-6-6', N'N-5-4', N'N-4-4', N'N-3-4', N'N-2-4', N'N-1-4', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (19, N'Q', N'Layout1', N'室内', 1, N'Q-3-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (20, N'Q', N'Layout1', N'室内', 2, N'Q-3-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (21, N'Q', N'Layout1', N'室内', 3, N'Q-3-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (22, N'Q', N'Layout1', N'室内', 4, N'Q-3-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (23, N'Q', N'Layout1', N'室内', 5, N'Q-3-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (24, N'Q', N'Layout1', N'室内', 6, N'Q-3-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (25, N'R', N'Layout1', N'室内', 1, N'R-1-1', N'R-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (26, N'R', N'Layout1', N'室内', 2, N'R-1-2', N'R-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (27, N'R', N'Layout1', N'室内', 3, N'R-1-3', N'R-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (28, N'R', N'Layout1', N'室内', 4, N'R-1-4', N'R-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (29, N'R', N'Layout1', N'室内', 5, N'R-1-5', N'R-2-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (30, N'R', N'Layout1', N'室内', 6, N'R-1-6', N'R-2-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (31, N'S', N'Layout1', N'室内', 1, N'S-1-1', N'S-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (32, N'S', N'Layout1', N'室内', 2, N'S-1-2', N'S-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (33, N'S', N'Layout1', N'室内', 3, N'S-1-3', N'S-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (34, N'S', N'Layout1', N'室内', 4, N'S-1-4', N'S-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (35, N'S', N'Layout1', N'室内', 5, N'S-1-5', N'S-2-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (36, N'S', N'Layout1', N'室内', 6, N'S-1-6', N'S-2-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (37, N'T', N'Layout1', N'室内', 1, N'T-1-1', N'T-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (38, N'T', N'Layout1', N'室内', 2, N'T-1-2', N'T-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (39, N'T', N'Layout1', N'室内', 3, N'T-1-3', N'T-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (40, N'T', N'Layout1', N'室内', 4, N'T-1-4', N'T-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (41, N'T', N'Layout1', N'室内', 5, N'T-1-5', N'T-2-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (42, N'T', N'Layout1', N'室内', 6, N'T-1-6', N'T-2-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (43, N'U', N'Layout1', N'室内', 1, N'U-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (44, N'U', N'Layout1', N'室内', 2, N'U-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (45, N'U', N'Layout1', N'室内', 3, N'U-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (46, N'U', N'Layout1', N'室内', 4, N'U-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (47, N'U', N'Layout1', N'室内', 5, N'U-1-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (48, N'U', N'Layout1', N'室内', 6, N'U-1-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (49, N'V', N'Layout1', N'室内', 1, N'V-1', N'V-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (50, N'V', N'Layout1', N'室内', 2, N'V-1', N'V-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (51, N'V', N'Layout1', N'室内', 3, N'V-1', N'V-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (52, N'V', N'Layout1', N'室内', 4, N'V-1', N'V-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (53, N'V', N'Layout1', N'室内', 5, N'V-1-5', N'V-2-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (54, N'V', N'Layout1', N'室内', 6, N'V-1-6', N'V-2-6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (55, N'W', N'Layout1', N'室内', 1, N'W-1-1', N'W-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (56, N'W', N'Layout1', N'室内', 2, N'W-1-2', N'W-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (57, N'W', N'Layout1', N'室内', 3, N'W-1-3', N'W-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (58, N'W', N'Layout1', N'室内', 4, N'W-1-4', N'W-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (59, N'W', N'Layout1', N'室内', 5, N'W-1-5', N'W-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (60, N'W', N'Layout1', N'室内', 6, N'W-1-6', N'W-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (61, N'X', N'Layout1', N'室内', 1, N'X-1-1', N'X-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (62, N'X', N'Layout1', N'室内', 2, N'X-1-2', N'X-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (63, N'X', N'Layout1', N'室内', 3, N'X-1-3', N'X-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (64, N'X', N'Layout1', N'室内', 4, N'X-1-3', N'X-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (65, N'X', N'Layout1', N'室内', 5, N'X-1-4', N'X-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (66, N'X', N'Layout1', N'室内', 6, N'X-1-4', N'X-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (67, N'Y', N'Layout1', N'室内', 1, N'Y-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (68, N'Y', N'Layout1', N'室内', 2, N'Y-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (69, N'Y', N'Layout1', N'室内', 3, N'Y-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (70, N'Y', N'Layout1', N'室内', 4, N'Y-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (71, N'Y', N'Layout1', N'室内', 5, N'Y-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (72, N'Y', N'Layout1', N'室内', 6, N'Y-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (73, N'Q2', N'Layout1', N'室内', 1, N'Q-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (74, N'Q2', N'Layout1', N'室内', 2, N'Q-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (75, N'Q2', N'Layout1', N'室内', 3, N'Q-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (76, N'Q2', N'Layout1', N'室内', 4, N'Q-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (77, N'Q2', N'Layout1', N'室内', 5, N'Q-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (78, N'Q2', N'Layout1', N'室内', 6, N'Q-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (79, N'Q2', N'Layout1', N'室内', 7, N'Q-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (80, N'Q2', N'Layout1', N'室内', 8, N'Q-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (81, N'Q2', N'Layout1', N'室内', 9, N'Q-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (82, N'Q2', N'Layout1', N'室内', 10, N'Q-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (83, N'Q2', N'Layout1', N'室内', 11, N'Q-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (84, N'Q2', N'Layout1', N'室内', 12, N'Q-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (85, N'Q2', N'Layout1', N'室内', 13, N'Q-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (86, N'Q2', N'Layout1', N'室内', 14, N'Q-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (87, N'Q2', N'Layout1', N'室内', 15, N'Q-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (88, N'Q2', N'Layout1', N'室内', 16, N'Q-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (89, N'Z', N'Layout1', N'室内', 1, N'Z-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (90, N'Z', N'Layout1', N'室内', 2, N'Z-1-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (91, N'Z', N'Layout1', N'室内', 3, N'Z-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (92, N'Z', N'Layout1', N'室内', 4, N'Z-1-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (93, N'Z', N'Layout1', N'室内', 5, N'Z-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (94, N'Z', N'Layout1', N'室内', 6, N'Z-1-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (95, N'Z', N'Layout1', N'室内', 7, N'Z-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (96, N'Z', N'Layout1', N'室内', 8, N'Z-1-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (97, N'Z', N'Layout1', N'室内', 9, N'Z-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (98, N'Z', N'Layout1', N'室内', 10, N'Z-2-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (99, N'Z', N'Layout1', N'室内', 11, N'Z-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (100, N'Z', N'Layout1', N'室内', 12, N'Z-2-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (101, N'Z', N'Layout1', N'室内', 13, N'Z-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (102, N'Z', N'Layout1', N'室内', 14, N'Z-2-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (103, N'Z', N'Layout1', N'室内', 15, N'Z-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (104, N'Z', N'Layout1', N'室内', 16, N'Z-2-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (105, N'J', N'Layout1', N'线边', 1, N'J-1-1', N'J-2-1', N'J-3-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (106, N'J', N'Layout1', N'线边', 2, N'J-1-2', N'J-2-2', N'J-3-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (107, N'J', N'Layout1', N'线边', 3, N'J-1-3', N'J-2-3', N'J-3-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (108, N'J', N'Layout1', N'线边', 4, N'J-1-4', N'J-2-4', N'J-3-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (109, N'J', N'Layout1', N'线边', 5, N'J-1-5', N'J-2-5', N'J-3-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (110, N'K', N'Layout1', N'线边', 1, N'K-1-1', N'K-2-1', N'K-3-1', N'K-4-1', N'K-5-1', N'K-6-1', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (111, N'K', N'Layout1', N'线边', 2, N'K-1-2', N'K-2-2', N'K-3-2', N'K-4-2', N'K-5-2', N'K-6-2', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (112, N'K', N'Layout1', N'线边', 3, N'K-1-3', N'K-2-3', N'K-3-3', N'K-4-3', N'K-5-3', N'K-6-3', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (113, N'K', N'Layout1', N'线边', 4, N'K-1-4', N'K-2-4', N'K-3-4', N'K-4-4', N'K-5-4', N'K-6-4', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (114, N'K', N'Layout1', N'线边', 5, N'K-1-5', N'K-2-5', N'K-3-5', N'K-4-5', N'K-5-5', NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (115, N'M', N'Layout1', N'线边', 1, N'M-1-1', N'M-2-1', N'M-3-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (116, N'M', N'Layout1', N'线边', 2, N'M-1-2', N'M-2-2', N'M-3-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (117, N'M', N'Layout1', N'线边', 3, N'M-1-3', N'M-2-3', N'M-3-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (118, N'M', N'Layout1', N'线边', 4, N'M-1-4', N'M-2-4', N'M-3-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (119, N'M', N'Layout1', N'线边', 5, N'M-1-5', N'M-2-5', N'M-3-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (120, N'L', N'Layout1', N'线边', 1, N'L-1-1', N'L-2-1', N'L-3-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (121, N'L', N'Layout1', N'线边', 2, N'L-1-2', N'L-2-2', N'L-3-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (122, N'L', N'Layout1', N'线边', 3, N'L-1-3', N'L-2-3', N'L-3-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (123, N'L', N'Layout1', N'线边', 4, N'L-1-4', N'L-2-4', N'L-3-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (124, N'L', N'Layout1', N'线边', 5, NULL, NULL, N'L-3-5', NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (125, N'BY0', N'Layout2', NULL, 1, N'BY-02-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (126, N'BY0', N'Layout2', NULL, 2, N'BY-02-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (127, N'BY0', N'Layout2', NULL, 3, N'BY-02-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (128, N'BY1', N'Layout2', NULL, 1, N'BY-01-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (129, N'BY1', N'Layout2', NULL, 2, N'BY-01-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (130, N'BY1', N'Layout2', NULL, 3, N'BY-01-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (131, N'BY1', N'Layout2', NULL, 4, N'BY-01-4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (132, N'BY2', N'Layout2', NULL, 1, N'BY-00-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (133, N'BY2', N'Layout2', NULL, 2, N'BY-00-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (134, N'BY2', N'Layout2', NULL, 3, N'BY-00-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (135, N'YL0', N'Layout2', NULL, 1, N'YL-1-1', N'YL-2-1', N'YL-3-1', N'YL-4-1', N'YL-5-1', N'YL-6-1', N'YL-7-1', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (136, N'YL0', N'Layout2', NULL, 2, N'YL-1-2', N'YL-2-2', N'YL-3-2', N'YL-4-2', N'YL-5-2', N'YL-6-2', N'YL-7-2', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (137, N'YL0', N'Layout2', NULL, 3, N'YL-1-3', N'YL-2-3', N'YL-3-3', N'YL-4-3', N'YL-5-3', N'YL-6-3', N'YL-7-3', NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (138, N'YL1', N'Layout2', NULL, 1, N'YL-8-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (139, N'YL1', N'Layout2', NULL, 2, N'YL-8-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (140, N'YL1', N'Layout2', NULL, 3, N'YL-8-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (141, N'YL2', N'Layout2', NULL, 1, N'YL-14-1', N'YL-13-1', N'YL-12-1', N'YL-11-1', N'YL-10-1', N'YL-9-1', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (142, N'YL2', N'Layout2', NULL, 2, N'YL-14-2', N'YL-13-2', N'YL-12-2', N'YL-11-2', N'YL-10-2', N'YL-9-2', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (143, N'YL2', N'Layout2', NULL, 3, N'YL-14-3', N'YL-13-3', N'YL-12-3', N'YL-11-3', N'YL-10-3', N'YL-9-3', NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (144, N'YL3', N'Layout2', NULL, 1, N'YL-16-1', N'YL-15-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (145, N'YL3', N'Layout2', NULL, 2, N'YL-16-2', N'YL-15-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (146, N'YL3', N'Layout2', NULL, 3, N'YL-16-3', N'YL-15-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (147, N'YL4', N'Layout2', NULL, 1, N'YL-17-1', N'YL-18-1', N'YL-19-1', N'YL-20-1', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (148, N'YL4', N'Layout2', NULL, 2, N'YL-17-2', N'YL-18-2', N'YL-19-2', N'YL-20-2', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (149, N'YL4', N'Layout2', NULL, 3, N'YL-17-3', N'YL-18-3', N'YL-19-3', N'YL-20-3', NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (150, N'YL5', N'Layout2', NULL, 1, N'YL-21-1', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (151, N'YL5', N'Layout2', NULL, 2, N'YL-21-2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

INSERT INTO [dbo].[Rack] ([ID], [RackName], [LayID], [Laymemo], [RowNo], [column1], [column2], [column3], [column4], [column5], [column6], [column7], [column8], [column9], [column10])
VALUES 
  (152, N'YL5', N'Layout2', NULL, 3, N'YL-21-3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO

--
-- Data for table dbo.RackLayout  (LIMIT 0,500)
--

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (1, N'P', N'Layout1', 0.116, 0.278, 0.137, 0.167, 6, 4, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (2, N'O', N'Layout1', 0.291, 0.278, 0.308, 0.167, 6, 9, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (3, N'N', N'Layout1', 0.639, 0.278, 0.239, 0.167, 6, 7, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (4, N'Q', N'Layout1', 0.049, 0.75, 0.034, 0.167, 6, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (5, N'R', N'Layout1', 0.116, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (6, N'S', N'Layout1', 0.217, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (7, N'T', N'Layout1', 0.324, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (8, N'U', N'Layout1', 0.56, 0.75, 0.034, 0.167, 6, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (9, N'V', N'Layout1', 0.605, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (10, N'W', N'Layout1', 0.707, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (11, N'X', N'Layout1', 0.808, 0.75, 0.068, 0.167, 6, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (12, N'Y', N'Layout1', 0.909, 0.75, 0.034, 0.167, 6, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (13, N'Q2', N'Layout1', 0.015, 0.306, 0.034, 0.444, 16, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (14, N'Z', N'Layout1', 0.943, 0.306, 0.034, 0.444, 16, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (15, N'J', N'Layout1', 0.15, 0.056, 0.103, 0.139, 5, 3, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (16, N'K', N'Layout1', 0.291, 0.056, 0.205, 0.139, 5, 6, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (17, N'M', N'Layout1', 0.639, 0.056, 0.103, 0.139, 5, 3, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (18, N'L', N'Layout1', 0.493, 0.056, 0.103, 0.139, 5, 3, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (50, N'1', N'Layout1', 0.003, 0.26, 0.983, 3, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (51, N'2', N'Layout1', 0.003, 0.93, 0.983, 3, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (52, N'3', N'Layout1', 0.003, 0.26, 3, 0.675, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (53, N'4', N'Layout1', 0.985, 0.26, 3, 0.675, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (100, N'BY0', N'Layout2', 0.019, 0.037, 0.071, 0.087, 3, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (101, N'BY1', N'Layout2', 0.019, 0.153, 0.071, 0.116, 4, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (102, N'BY2', N'Layout2', 0.019, 0.298, 0.071, 0.089, 3, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (103, N'YL0', N'Layout2', 0.237, 0.387, 0.659, 0.087, 3, 7, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (104, N'YL1', N'Layout2', 0.916, 0.533, 0.056, 0.087, 3, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (105, N'YL2', N'Layout2', 0.331, 0.736, 0.565, 0.087, 3, 6, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (106, N'YL3', N'Layout2', 0.125, 0.736, 0.112, 0.087, 3, 2, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (107, N'YL4', N'Layout2', 0.331, 0.883, 0.376, 0.087, 3, 4, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (108, N'YL5', N'Layout2', 0.916, 0.883, 0.056, 0.087, 3, 1, 1, N'rack')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (150, N'1', N'Layout2', 0.115, 0.358, 0.869, 3, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (151, N'2', N'Layout2', 0.115, 0.854, 0.869, 3, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (152, N'3', N'Layout2', 0.115, 0.358, 3, 0.498, NULL, NULL, 1, N'line')
GO

INSERT INTO [dbo].[RackLayout] ([ID], [RackName], [LayID], [Layoutx], [Layouty], [Laywidth], [Layheight], [RowNum], [ColumnNum], [ForUse], [ConType])
VALUES 
  (153, N'4', N'Layout2', 0.982, 0.358, 3, 0.498, NULL, NULL, 1, N'line')
GO

--
-- Data for table dbo.RackRaw  (LIMIT 0,500)
--

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (1, N'P-4', N'Layout1', N'P', N'KM51168662', N'室内', N'1', N'1', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (2, N'P-3', N'Layout1', N'P', N'KM50080426', N'室内', N'1', N'2', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (3, N'P-2', N'Layout1', N'P', N'KM50080444', N'室内', N'1', N'3', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (4, N'P-1', N'Layout1', N'P', N'KM50080424', N'室内', N'1', N'4', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (5, N'P-4', N'Layout1', N'P', N'KM50080425', N'室内', N'2', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (6, N'P-3', N'Layout1', N'P', N'ZK11192', N'室内', N'2', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (7, N'P-2', N'Layout1', N'P', N'KM50080430', N'室内', N'2', N'3', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (8, N'P-1', N'Layout1', N'P', N'KM50080438', N'室内', N'2', N'4', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (9, N'P-4', N'Layout1', N'P', N'KM50080433', N'室内', N'3', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (10, N'P-3', N'Layout1', N'P', N'KM50308035', N'室内', N'3', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (11, N'P-2', N'Layout1', N'P', N'KM50080434', N'室内', N'3', N'3', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (12, N'P-1', N'Layout1', N'P', N'KM1349670', N'室内', N'3', N'4', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (13, N'P-4', N'Layout1', N'P', N'KM1349714', N'室内', N'4', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (14, N'P-3', N'Layout1', N'P', N'KM928446', N'室内', N'4', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (15, N'P-2', N'Layout1', N'P', N'KM50080437', N'室内', N'4', N'3', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (16, N'P-1', N'Layout1', N'P', N'KM1349706', N'室内', N'4', N'4', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (17, N'P-4-5', N'Layout1', N'P', N'ZK10735', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (18, N'P-3-5', N'Layout1', N'P', N'KM1349701', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (19, N'P-2-5', N'Layout1', N'P', N'KM50080440', N'室内', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (20, N'P-1-5', N'Layout1', N'P', N'KM50080446', N'室内', N'5', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (21, N'P-4-6', N'Layout1', N'P', N'KM50316397', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (22, N'P-3-6', N'Layout1', N'P', N'KM50316375', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (23, N'P-2-6', N'Layout1', N'P', N'KM50308061', N'室内', N'6', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (24, N'P-1-6', N'Layout1', N'P', N'KM50316396', N'室内', N'6', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (25, N'O-9-1', N'Layout1', N'O', N'ZK11062', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (26, N'O-8-1', N'Layout1', N'O', N'KM51073219', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (27, N'O-7-1', N'Layout1', N'O', N'ZK11217', N'室内', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (28, N'O-6-1', N'Layout1', N'O', N'KM51073212', N'室内', N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (29, N'O-5-1', N'Layout1', N'O', N'KM50082349', N'室内', N'1', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (30, N'O-4-1', N'Layout1', N'O', N'KM51108148', N'室内', N'1', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (31, N'O-3-1', N'Layout1', N'O', N'KM51107469', N'室内', N'1', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (32, N'O-2-1', N'Layout1', N'O', N'KM51068235', N'室内', N'1', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (33, N'O-1-1', N'Layout1', N'O', N'KM51068219', N'室内', N'1', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (34, N'O-9-2', N'Layout1', N'O', N'KM51173343', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (35, N'O-8-2', N'Layout1', N'O', N'ZK11181', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (36, N'O-7-2', N'Layout1', N'O', N'KM51073209', N'室内', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (37, N'O-6-2', N'Layout1', N'O', N'KM51073205', N'室内', N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (38, N'O-5-2', N'Layout1', N'O', N'ZK11180', N'室内', N'2', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (39, N'O-4-2', N'Layout1', N'O', N'KM51107464', N'室内', N'2', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (40, N'O-3-2', N'Layout1', N'O', N'KM50035798', N'室内', N'2', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (41, N'O-2-2', N'Layout1', N'O', N'KM51068233', N'室内', N'2', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (42, N'O-1-2', N'Layout1', N'O', N'KM51068227', N'室内', N'2', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (43, N'O-9-3', N'Layout1', N'O', N'ZK11230', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (44, N'O-8-3', N'Layout1', N'O', N'ZK11182', N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (45, N'O-7-3', N'Layout1', N'O', N'KM51073204', N'室内', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (46, N'O-6-3', N'Layout1', N'O', N'KM51073206', N'室内', N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (47, N'O-5-3', N'Layout1', N'O', N'KM50082353', N'室内', N'3', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (48, N'O-4-3', N'Layout1', N'O', N'KM51108431', N'室内', N'3', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (49, N'O-3-3', N'Layout1', N'O', N'KM51108371', N'室内', N'3', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (50, N'O-2-3', N'Layout1', N'O', N'KM51068241', N'室内', N'3', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (51, N'O-1-3', N'Layout1', N'O', N'KM51068226', N'室内', N'3', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (52, N'O-9-4', N'Layout1', N'O', N'ZK11223', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (53, N'O-8-4', N'Layout1', N'O', N'KM948777', N'室内', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (54, N'O-7-4', N'Layout1', N'O', N'KM51073217', N'室内', N'4', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (55, N'O-6-4', N'Layout1', N'O', N'KM51073200', N'室内', N'4', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (56, N'O-5-4', N'Layout1', N'O', N'KM50316388', N'室内', N'4', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (57, N'O-4-4', N'Layout1', N'O', N'KM51108150', N'室内', N'4', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (58, N'O-3-4', N'Layout1', N'O', N'KM51107483', N'室内', N'4', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (59, N'O-2-4', N'Layout1', N'O', N'KM51068236', N'室内', N'4', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (60, N'O-1-4', N'Layout1', N'O', N'KM51068232', N'室内', N'4', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (61, N'O-9-5', N'Layout1', N'O', N'KM51088470', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (62, N'O-8-5', N'Layout1', N'O', N'KM51073211', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (63, N'O-7-5', N'Layout1', N'O', N'KM51073215', N'室内', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (64, N'O-6-5', N'Layout1', N'O', N'KM51073203', N'室内', N'5', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (65, N'O-5-5', N'Layout1', N'O', N'ZK11186', N'室内', N'5', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (66, N'O-4-5', N'Layout1', N'O', N'KM51108335', N'室内', N'5', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (67, N'O-3-5', N'Layout1', N'O', N'KM51108373', N'室内', N'5', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (68, N'O-2-5', N'Layout1', N'O', N'KM50082342', N'室内', N'5', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (69, N'O-1-5', N'Layout1', N'O', N'KM51068229', N'室内', N'5', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (70, N'O-9-6', N'Layout1', N'O', N'KM51088468', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (71, N'O-8-6', N'Layout1', N'O', N'KM928449', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (72, N'O-7-6', N'Layout1', N'O', N'KM51073199', N'室内', N'6', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (73, N'O-6-6', N'Layout1', N'O', N'KM51073201', N'室内', N'6', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (74, N'O-5-6', N'Layout1', N'O', N'KM50316389', N'室内', N'6', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (75, N'O-4-6', N'Layout1', N'O', N'KM50035799', N'室内', N'6', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (76, N'O-3-6', N'Layout1', N'O', N'KM51068231', N'室内', N'6', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (77, N'O-2-6', N'Layout1', N'O', N'KM51068234', N'室内', N'6', N'8', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (78, N'O-1-6', N'Layout1', N'O', N'KM50308494', N'室内', N'6', N'9', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (79, N'N-7-1', N'Layout1', N'N', N'KM50080443', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (80, N'N-6', N'Layout1', N'N', N'KM51252476', N'室内', N'1', N'2', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (81, N'N-5-1', N'Layout1', N'N', NULL, N'室内', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (82, N'N-4-1', N'Layout1', N'N', N'KM50316456', N'室内', N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (83, N'N-3-1', N'Layout1', N'N', N'KM51073207', N'室内', N'1', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (84, N'N-2-1', N'Layout1', N'N', NULL, N'室内', N'1', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (85, N'N-1-1', N'Layout1', N'N', NULL, N'室内', N'1', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (86, N'N-7-2', N'Layout1', N'N', N'KM51073213', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (87, N'N-6', N'Layout1', N'N', N'KM51252500', N'室内', N'2', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (88, N'N-5-2', N'Layout1', N'N', NULL, N'室内', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (89, N'N-4-2', N'Layout1', N'N', N'KM50316454', N'室内', N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (90, N'N-3-2', N'Layout1', N'N', N'KM51455146', N'室内', N'2', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (91, N'N-2-2', N'Layout1', N'N', NULL, N'室内', N'2', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (92, N'N-1-2', N'Layout1', N'N', NULL, N'室内', N'2', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (93, N'N-7-3', N'Layout1', N'N', N'KM51073202', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (94, N'N-6', N'Layout1', N'N', N'KM51252485', N'室内', N'3', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (95, N'N-5-3', N'Layout1', N'N', N'KM51382832', N'室内', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (96, N'N-4-3', N'Layout1', N'N', N'KM50316450', N'室内', N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (97, N'N-3-3', N'Layout1', N'N', N'KM51275023', N'室内', N'3', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (98, N'N-2-3', N'Layout1', N'N', NULL, N'室内', N'3', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (99, N'N-1-3', N'Layout1', N'N', N'KM50316458', N'室内', N'3', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (100, N'N-7-4', N'Layout1', N'N', N'KM50082337', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (101, N'N-6', N'Layout1', N'N', N'KM51252487', N'室内', N'4', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (102, N'N-5-3', N'Layout1', N'N', N'KM51382832', N'室内', N'4', N'3', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (103, N'N-4-3', N'Layout1', N'N', N'KM50316450', N'室内', N'4', N'4', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (104, N'N-3-3', N'Layout1', N'N', N'KM51275023', N'室内', N'4', N'5', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (105, N'N-2-3', N'Layout1', N'N', NULL, N'室内', N'4', N'6', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (106, N'N-1-3', N'Layout1', N'N', N'KM50316458', N'室内', N'4', N'7', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (107, N'N-7-5', N'Layout1', N'N', N'KM51275012', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (108, N'N-6-5', N'Layout1', N'N', N'KM51252490', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (109, N'N-5-4', N'Layout1', N'N', N'KM51382830', N'室内', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (110, N'N-4-4', N'Layout1', N'N', N'KM50316398', N'室内', N'5', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (111, N'N-3-4', N'Layout1', N'N', NULL, N'室内', N'5', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (112, N'N-2-4', N'Layout1', N'N', NULL, N'室内', N'5', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (113, N'N-1-4', N'Layout1', N'N', N'KM1354962', N'室内', N'5', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (114, N'N-7-6', N'Layout1', N'N', N'KM1349699', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (115, N'N-6-6', N'Layout1', N'N', N'KM51252481', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (116, N'N-5-4', N'Layout1', N'N', N'KM51382830', N'室内', N'6', N'3', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (117, N'N-4-4', N'Layout1', N'N', N'KM50316398', N'室内', N'6', N'4', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (118, N'N-3-4', N'Layout1', N'N', NULL, N'室内', N'6', N'5', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (119, N'N-2-4', N'Layout1', N'N', NULL, N'室内', N'6', N'6', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (120, N'N-1-4', N'Layout1', N'N', N'KM1354962', N'室内', N'6', N'7', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (121, N'Q-3-1', N'Layout1', N'Q', NULL, N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (122, N'Q-3-2', N'Layout1', N'Q', NULL, N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (123, N'Q-3-3', N'Layout1', N'Q', NULL, N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (124, N'Q-3-3', N'Layout1', N'Q', NULL, N'室内', N'4', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (125, N'Q-3-4', N'Layout1', N'Q', NULL, N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (126, N'Q-3-4', N'Layout1', N'Q', NULL, N'室内', N'6', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (127, N'R-1-1', N'Layout1', N'R', N'ZK10734', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (128, N'R-2-1', N'Layout1', N'R', N'ZK11177', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (129, N'R-1-2', N'Layout1', N'R', N'KM50002753', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (130, N'R-2-2', N'Layout1', N'R', N'KM50316376', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (131, N'R-1-3', N'Layout1', N'R', N'KM51068238', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (132, N'R-2-3', N'Layout1', N'R', N'KM50316374', N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (133, N'R-1-4', N'Layout1', N'R', N'ZK11183', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (134, N'R-2-4', N'Layout1', N'R', N'KM50316448', N'室内', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (135, N'R-1-5', N'Layout1', N'R', N'KM50082335', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (136, N'R-2-5', N'Layout1', N'R', N'KM51068239', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (137, N'R-1-6', N'Layout1', N'R', N'KM50316446', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (138, N'R-2-6', N'Layout1', N'R', N'KM50316377', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (139, N'S-1-1', N'Layout1', N'S', N'KM50029769', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (140, N'S-2-1', N'Layout1', N'S', N'KM51196850', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (141, N'S-1-2', N'Layout1', N'S', N'KM50082336', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (142, N'S-2-2', N'Layout1', N'S', N'KM50029768', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (143, N'S-1-3', N'Layout1', N'S', N'KM50082348', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (144, N'S-2-3', N'Layout1', N'S', N'KM51196851', N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (145, N'S-1-4', N'Layout1', N'S', N'KM50082338', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (146, N'S-2-4', N'Layout1', N'S', N'KM50029767', N'室内', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (147, N'S-1-5', N'Layout1', N'S', N'KM51196852', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (148, N'S-2-5', N'Layout1', N'S', N'KM50082340', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (149, N'S-1-6', N'Layout1', N'S', N'KM51196854', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (150, N'S-2-6', N'Layout1', N'S', N'KM51068225', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (151, N'T-1-1', N'Layout1', N'T', N'KM51134990', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (152, N'T-2-1', N'Layout1', N'T', N'KM51073208', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (153, N'T-1-2', N'Layout1', N'T', N'KM51196853', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (154, N'T-2-2', N'Layout1', N'T', N'KM50080448', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (155, N'T-1-3', N'Layout1', N'T', N'KM50082346', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (156, N'T-2-3', N'Layout1', N'T', N'KM1349702', N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (157, N'T-1-4', N'Layout1', N'T', N'KM50082347', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (158, N'T-2-4', N'Layout1', N'T', N'KM50002752', N'室内', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (159, N'T-1-5', N'Layout1', N'T', N'KM50082341', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (160, N'T-2-5', N'Layout1', N'T', N'KM50002755', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (161, N'T-1-6', N'Layout1', N'T', N'KM50002751', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (162, N'T-2-6', N'Layout1', N'T', N'KM50002754', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (163, N'U-1-1', N'Layout1', N'U', N'KM50080423', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (164, N'U-1-2', N'Layout1', N'U', N'KM948778', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (165, N'U-1-3', N'Layout1', N'U', N'KM928444', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (166, N'U-1-4', N'Layout1', N'U', N'KM50080428', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (167, N'U-1-5', N'Layout1', N'U', N'KM50080436', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (168, N'U-1-6', N'Layout1', N'U', N'KM50080432', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (169, N'V-1', N'Layout1', N'V', N'KM51275009', N'室内', N'1', N'1', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (170, N'V-2', N'Layout1', N'V', N'KM51274983', N'室内', N'1', N'2', 1, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (171, N'V-1', N'Layout1', N'V', N'KM51275008', N'室内', N'2', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (172, N'V-2', N'Layout1', N'V', N'KM51274995', N'室内', N'2', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (173, N'V-1', N'Layout1', N'V', N'KM51252483', N'室内', N'3', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (174, N'V-2', N'Layout1', N'V', N'KM51274993', N'室内', N'3', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (175, N'V-1', N'Layout1', N'V', N'KM51275024', N'室内', N'4', N'1', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (176, N'V-2', N'Layout1', N'V', N'KM51252499', N'室内', N'4', N'2', 1, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (177, N'V-1-5', N'Layout1', N'V', N'KM51275016', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (178, N'V-2-5', N'Layout1', N'V', N'KM51252488', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (179, N'V-1-6', N'Layout1', N'V', N'KM51274989', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (180, N'V-2-6', N'Layout1', N'V', N'KM51252498', N'室内', N'6', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (181, N'W-1-1', N'Layout1', N'W', N'KM50009448', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (182, N'W-2-1', N'Layout1', N'W', N'KM51442527', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (183, N'W-1-2', N'Layout1', N'W', N'KM50082343', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (184, N'W-2-2', N'Layout1', N'W', N'KM51382833', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (185, N'W-1-3', N'Layout1', N'W', N'KM50082344', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (186, N'W-2-3', N'Layout1', N'W', N'KM51382834', N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (187, N'W-1-4', N'Layout1', N'W', N'KM50082345', N'室内', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (188, N'W-2-3', N'Layout1', N'W', N'KM51382834', N'室内', N'4', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (189, N'W-1-5', N'Layout1', N'W', N'KM50029824', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (190, N'W-2-4', N'Layout1', N'W', N'KM51382829', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (191, N'W-1-6', N'Layout1', N'W', N'KM50009446', N'室内', N'6', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (192, N'W-2-4', N'Layout1', N'W', N'KM51382829', N'室内', N'6', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (193, N'X-1-1', N'Layout1', N'X', NULL, N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (194, N'X-2-1', N'Layout1', N'X', N'KM51442535', N'室内', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (195, N'X-1-2', N'Layout1', N'X', N'KM51442539', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (196, N'X-2-2', N'Layout1', N'X', N'KM51442882', N'室内', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (197, N'X-1-3', N'Layout1', N'X', N'KM51442537', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (198, N'X-2-3', N'Layout1', N'X', NULL, N'室内', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (199, N'X-1-3', N'Layout1', N'X', N'KM51442537', N'室内', N'4', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (200, N'X-2-3', N'Layout1', N'X', NULL, N'室内', N'4', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (201, N'X-1-4', N'Layout1', N'X', NULL, N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (202, N'X-2-4', N'Layout1', N'X', N'KM51442534', N'室内', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (203, N'X-1-4', N'Layout1', N'X', NULL, N'室内', N'6', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (204, N'X-2-4', N'Layout1', N'X', N'KM51442534', N'室内', N'6', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (205, N'Y-1-1', N'Layout1', N'Y', N'KM51442881', N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (206, N'Y-1-2', N'Layout1', N'Y', N'KM51442880', N'室内', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (207, N'Y-1-3', N'Layout1', N'Y', N'KM51442880', N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (208, N'Y-1-3', N'Layout1', N'Y', N'KM51442880', N'室内', N'4', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (209, N'Y-1-4', N'Layout1', N'Y', N'KM51442879', N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (210, N'Y-1-4', N'Layout1', N'Y', N'KM51442879', N'室内', N'6', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (211, N'Q-1-1', N'Layout1', N'Q2', NULL, N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (212, N'Q-1-1', N'Layout1', N'Q2', NULL, N'室内', N'2', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (213, N'Q-1-2', N'Layout1', N'Q2', NULL, N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (214, N'Q-1-2', N'Layout1', N'Q2', NULL, N'室内', N'4', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (215, N'Q-1-3', N'Layout1', N'Q2', NULL, N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (216, N'Q-1-3', N'Layout1', N'Q2', NULL, N'室内', N'6', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (217, N'Q-1-4', N'Layout1', N'Q2', NULL, N'室内', N'7', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (218, N'Q-1-4', N'Layout1', N'Q2', NULL, N'室内', N'8', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (219, N'Q-2-1', N'Layout1', N'Q2', NULL, N'室内', N'9', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (220, N'Q-2-1', N'Layout1', N'Q2', NULL, N'室内', N'10', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (221, N'Q-2-2', N'Layout1', N'Q2', NULL, N'室内', N'11', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (222, N'Q-2-2', N'Layout1', N'Q2', NULL, N'室内', N'12', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (223, N'Q-2-3', N'Layout1', N'Q2', NULL, N'室内', N'13', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (224, N'Q-2-3', N'Layout1', N'Q2', NULL, N'室内', N'14', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (225, N'Q-2-4', N'Layout1', N'Q2', NULL, N'室内', N'15', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (226, N'Q-2-4', N'Layout1', N'Q2', NULL, N'室内', N'16', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (227, N'Z-1-1', N'Layout1', N'Z', NULL, N'室内', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (228, N'Z-1-1', N'Layout1', N'Z', NULL, N'室内', N'2', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (229, N'Z-1-2', N'Layout1', N'Z', NULL, N'室内', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (230, N'Z-1-2', N'Layout1', N'Z', NULL, N'室内', N'4', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (231, N'Z-1-3', N'Layout1', N'Z', NULL, N'室内', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (232, N'Z-1-3', N'Layout1', N'Z', NULL, N'室内', N'6', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (233, N'Z-1-4', N'Layout1', N'Z', NULL, N'室内', N'7', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (234, N'Z-1-4', N'Layout1', N'Z', NULL, N'室内', N'8', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (235, N'Z-2-1', N'Layout1', N'Z', NULL, N'室内', N'9', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (236, N'Z-2-1', N'Layout1', N'Z', NULL, N'室内', N'10', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (237, N'Z-2-2', N'Layout1', N'Z', NULL, N'室内', N'11', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (238, N'Z-2-2', N'Layout1', N'Z', NULL, N'室内', N'12', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (239, N'Z-2-3', N'Layout1', N'Z', NULL, N'室内', N'13', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (240, N'Z-2-3', N'Layout1', N'Z', NULL, N'室内', N'14', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (241, N'Z-2-4', N'Layout1', N'Z', NULL, N'室内', N'15', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (242, N'Z-2-4', N'Layout1', N'Z', NULL, N'室内', N'16', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (243, N'J-1-1', N'Layout1', N'J', NULL, N'线边', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (244, N'J-2-1', N'Layout1', N'J', NULL, N'线边', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (245, N'J-3-1', N'Layout1', N'J', NULL, N'线边', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (246, N'J-1-2', N'Layout1', N'J', NULL, N'线边', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (247, N'J-2-2', N'Layout1', N'J', NULL, N'线边', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (248, N'J-3-2', N'Layout1', N'J', NULL, N'线边', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (249, N'J-1-3', N'Layout1', N'J', NULL, N'线边', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (250, N'J-2-3', N'Layout1', N'J', NULL, N'线边', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (251, N'J-3-3', N'Layout1', N'J', NULL, N'线边', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (252, N'J-1-4', N'Layout1', N'J', NULL, N'线边', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (253, N'J-2-4', N'Layout1', N'J', NULL, N'线边', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (254, N'J-3-4', N'Layout1', N'J', NULL, N'线边', N'4', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (255, N'J-1-5', N'Layout1', N'J', NULL, N'线边', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (256, N'J-2-5', N'Layout1', N'J', NULL, N'线边', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (257, N'J-3-5', N'Layout1', N'J', NULL, N'线边', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (258, N'K-1-1', N'Layout1', N'K', NULL, N'线边', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (259, N'K-2-1', N'Layout1', N'K', NULL, N'线边', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (260, N'K-3-1', N'Layout1', N'K', N'KM51073210', N'线边', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (261, N'K-4-1', N'Layout1', N'K', N'KM51073221', N'线边', N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (262, N'K-5-1', N'Layout1', N'K', N'KM51073216', N'线边', N'1', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (263, N'K-6-1', N'Layout1', N'K', N'KM51073218', N'线边', N'1', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (264, N'K-1-2', N'Layout1', N'K', NULL, N'线边', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (265, N'K-2-2', N'Layout1', N'K', NULL, N'线边', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (266, N'K-3-2', N'Layout1', N'K', N'KM51073210', N'线边', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (267, N'K-4-2', N'Layout1', N'K', N'KM51073221', N'线边', N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (268, N'K-5-2', N'Layout1', N'K', N'KM51073216', N'线边', N'2', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (269, N'K-6-2', N'Layout1', N'K', N'KM51073218', N'线边', N'2', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (270, N'K-1-3', N'Layout1', N'K', NULL, N'线边', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (271, N'K-2-3', N'Layout1', N'K', NULL, N'线边', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (272, N'K-3-3', N'Layout1', N'K', N'KM50082339', N'线边', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (273, N'K-4-3', N'Layout1', N'K', N'KM51073220', N'线边', N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (274, N'K-5-3', N'Layout1', N'K', N'KM51073214', N'线边', N'3', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (275, N'K-6-3', N'Layout1', N'K', NULL, N'线边', N'3', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (276, N'K-1-4', N'Layout1', N'K', NULL, N'线边', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (277, N'K-2-4', N'Layout1', N'K', NULL, N'线边', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (278, N'K-3-4', N'Layout1', N'K', N'KM50082339', N'线边', N'4', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (279, N'K-4-4', N'Layout1', N'K', N'KM51073220', N'线边', N'4', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (280, N'K-5-4', N'Layout1', N'K', N'KM51073214', N'线边', N'4', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (281, N'K-6-4', N'Layout1', N'K', NULL, N'线边', N'4', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (282, N'K-1-5', N'Layout1', N'K', NULL, N'线边', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (283, N'K-2-5', N'Layout1', N'K', NULL, N'线边', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (284, N'K-3-5', N'Layout1', N'K', NULL, N'线边', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (285, N'K-4-5', N'Layout1', N'K', NULL, N'线边', N'5', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (286, N'K-5-5', N'Layout1', N'K', NULL, N'线边', N'5', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (287, N'M-1-1', N'Layout1', N'M', N'KM51382831', N'线边', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (288, N'M-2-1', N'Layout1', N'M', N'KM50316406', N'线边', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (289, N'M-3-1', N'Layout1', N'M', N'KM51108369', N'线边', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (290, N'M-1-2', N'Layout1', N'M', N'KM51382831', N'线边', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (291, N'M-2-2', N'Layout1', N'M', N'KM50316407', N'线边', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (292, N'M-3-2', N'Layout1', N'M', N'KM51108369', N'线边', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (293, N'M-1-3', N'Layout1', N'M', N'KM50002750', N'线边', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (294, N'M-2-3', N'Layout1', N'M', N'KM50316408', N'线边', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (295, N'M-3-3', N'Layout1', N'M', N'KM51108370', N'线边', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (296, N'M-1-4', N'Layout1', N'M', N'KM50002750', N'线边', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (297, N'M-2-4', N'Layout1', N'M', NULL, N'线边', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (298, N'M-3-4', N'Layout1', N'M', N'KM51108370', N'线边', N'4', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (299, N'M-1-5', N'Layout1', N'M', NULL, N'线边', N'5', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (300, N'M-2-5', N'Layout1', N'M', NULL, N'线边', N'5', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (301, N'M-3-5', N'Layout1', N'M', N'KM51108372', N'线边', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (302, N'L-1-1', N'Layout1', N'L', N'KM51442538', N'线边', N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (303, N'L-2-1', N'Layout1', N'L', N'KM50002749', N'线边', N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (304, N'L-3-1', N'Layout1', N'L', N'ZK10737', N'线边', N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (305, N'L-1-2', N'Layout1', N'L', N'KM51442536', N'线边', N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (306, N'L-2-2', N'Layout1', N'L', N'KM50002749', N'线边', N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (307, N'L-3-2', N'Layout1', N'L', N'ZK10737', N'线边', N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (308, N'L-1-3', N'Layout1', N'L', NULL, N'线边', N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (309, N'L-2-3', N'Layout1', N'L', N'KM50308493', N'线边', N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (310, N'L-3-3', N'Layout1', N'L', N'KM50009447', N'线边', N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (311, N'L-1-4', N'Layout1', N'L', NULL, N'线边', N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (312, N'L-2-4', N'Layout1', N'L', N'KM50308493', N'线边', N'4', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (313, N'L-3-4', N'Layout1', N'L', N'KM50009447', N'线边', N'4', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (314, N'L-3-5', N'Layout1', N'L', NULL, N'线边', N'5', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (315, N'BY-02-1', N'Layout2', N'BY0', N'KM51073187', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (316, N'BY-02-2', N'Layout2', N'BY0', N'KM51107452', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (317, N'BY-02-3', N'Layout2', N'BY0', N'KM50316383', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (318, N'BY-01-1', N'Layout2', N'BY1', N'KM51073191', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (319, N'BY-01-2', N'Layout2', N'BY1', N'KM51073194', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (320, N'BY-01-2', N'Layout2', N'BY1', N'KM51073195', NULL, N'2', N'1', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (321, N'BY-01-3', N'Layout2', N'BY1', N'KM51073193', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (322, N'BY-01-4', N'Layout2', N'BY1', N'KM51073190', NULL, N'4', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (323, N'BY-00-1', N'Layout2', N'BY2', N'KM50316504', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (324, N'BY-00-2', N'Layout2', N'BY2', N'KM50316504', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (325, N'BY-00-3', N'Layout2', N'BY2', N'KM51073186', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (326, N'YL-1-1', N'Layout2', N'YL0', N'KM1332437', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (327, N'YL-2-1', N'Layout2', N'YL0', N'KM50316432', NULL, N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (328, N'YL-2-1', N'Layout2', N'YL0', N'KM51455114', NULL, N'1', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (329, N'YL-3-1', N'Layout2', N'YL0', N'KM50316428', NULL, N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (330, N'YL-4-1', N'Layout2', N'YL0', N'KM51455109', NULL, N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (331, N'YL-5-1', N'Layout2', N'YL0', N'KM50316434', NULL, N'1', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (332, N'YL-6-1', N'Layout2', N'YL0', N'KM50316505', NULL, N'1', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (333, N'YL-7-1', N'Layout2', N'YL0', N'KM51405993', NULL, N'1', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (334, N'YL-1-2', N'Layout2', N'YL0', N'KM50316384', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (335, N'YL-2-2', N'Layout2', N'YL0', N'KM50316433', NULL, N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (336, N'YL-3-2', N'Layout2', N'YL0', N'KM50316460', NULL, N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (337, N'YL-3-2', N'Layout2', N'YL0', N'KM51455117', NULL, N'2', N'3', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (338, N'YL-4-2', N'Layout2', N'YL0', N'KM51068214', NULL, N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (339, N'YL-5-2', N'Layout2', N'YL0', NULL, NULL, N'2', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (340, N'YL-6-2', N'Layout2', N'YL0', N'KM51068215', NULL, N'2', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (341, N'YL-7-2', N'Layout2', N'YL0', N'KM50316444', NULL, N'2', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (342, N'YL-1-3', N'Layout2', N'YL0', N'KM50316387', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (343, N'YL-2-3', N'Layout2', N'YL0', N'KM269068', NULL, N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (344, N'YL-2-3', N'Layout2', N'YL0', N'KM51455189', NULL, N'3', N'2', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (345, N'YL-3-3', N'Layout2', N'YL0', N'KM50316459', NULL, N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (346, N'YL-4-3', N'Layout2', N'YL0', N'KM51068214', NULL, N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (347, N'YL-5-3', N'Layout2', N'YL0', N'KM51107435', NULL, N'3', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (348, N'YL-6-3', N'Layout2', N'YL0', NULL, NULL, N'3', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (349, N'YL-7-3', N'Layout2', N'YL0', N'KM50316498', NULL, N'3', N'7', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (350, N'YL-8-1', N'Layout2', N'YL1', N'KM51419573', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (351, N'YL-8-2', N'Layout2', N'YL1', N'KM51419575', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (352, N'YL-8-3', N'Layout2', N'YL1', N'KM51075059', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (353, N'YL-14-1', N'Layout2', N'YL2', N'KM897545', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (354, N'YL-13-1', N'Layout2', N'YL2', N'KM1332434', NULL, N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (355, N'YL-12-1', N'Layout2', N'YL2', N'KM1358375', NULL, N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (356, N'YL-11-1', N'Layout2', N'YL2', N'KM51073181', NULL, N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (357, N'YL-10-1', N'Layout2', N'YL2', N'KM1332435', NULL, N'1', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (358, N'YL-9-1', N'Layout2', N'YL2', N'KM51107457', NULL, N'1', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (359, N'YL-14-2', N'Layout2', N'YL2', N'KM50009449', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (360, N'YL-13-2', N'Layout2', N'YL2', N'KM1332439', NULL, N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (361, N'YL-12-2', N'Layout2', N'YL2', N'KM50316473', NULL, N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (362, N'YL-11-2', N'Layout2', N'YL2', N'KM51073185', NULL, N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (363, N'YL-10-2', N'Layout2', N'YL2', N'KM50316425', NULL, N'2', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (364, N'YL-9-2', N'Layout2', N'YL2', N'KM51068216', NULL, N'2', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (365, N'YL-14-3', N'Layout2', N'YL2', N'KM51252504', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (366, N'YL-13-3', N'Layout2', N'YL2', N'KM51168663', NULL, N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (367, N'YL-12-3', N'Layout2', N'YL2', N'KM51068217', NULL, N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (368, N'YL-11-3', N'Layout2', N'YL2', N'KM51073185', NULL, N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (369, N'YL-10-3', N'Layout2', N'YL2', N'KM50316386', NULL, N'3', N'5', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (370, N'YL-9-3', N'Layout2', N'YL2', N'KM50316435', NULL, N'3', N'6', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (371, N'YL-16-1', N'Layout2', N'YL3', N'KM51107451', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (372, N'YL-15-1', N'Layout2', N'YL3', N'KM51073189', NULL, N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (373, N'YL-16-2', N'Layout2', N'YL3', N'KM51107451', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (374, N'YL-15-2', N'Layout2', N'YL3', N'KM51073189', NULL, N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (375, N'YL-16-3', N'Layout2', N'YL3', N'KM51107451', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (376, N'YL-15-3', N'Layout2', N'YL3', N'KM51073189', NULL, N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (377, N'YL-17-1', N'Layout2', N'YL4', N'KM51405993', NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (378, N'YL-18-1', N'Layout2', N'YL4', N'KM50316385', NULL, N'1', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (379, N'YL-19-1', N'Layout2', N'YL4', N'KM50316430', NULL, N'1', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (380, N'YL-19-1', N'Layout2', N'YL4', N'KM50316436', NULL, N'1', N'3', 0, 0)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (381, N'YL-20-1', N'Layout2', N'YL4', N'KM50316441', NULL, N'1', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (382, N'YL-17-2', N'Layout2', N'YL4', N'KM50316426', NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (383, N'YL-18-2', N'Layout2', N'YL4', N'KM50316429', NULL, N'2', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (384, N'YL-19-2', N'Layout2', N'YL4', N'KM50316439', NULL, N'2', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (385, N'YL-20-2', N'Layout2', N'YL4', N'KM50316437', NULL, N'2', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (386, N'YL-17-3', N'Layout2', N'YL4', N'KM50316427', NULL, N'3', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (387, N'YL-18-3', N'Layout2', N'YL4', NULL, NULL, N'3', N'2', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (388, N'YL-19-3', N'Layout2', N'YL4', N'KM50316440', NULL, N'3', N'3', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (389, N'YL-20-3', N'Layout2', N'YL4', N'KM50316443', NULL, N'3', N'4', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (390, N'YL-21-1', N'Layout2', N'YL5', NULL, NULL, N'1', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (391, N'YL-21-2', N'Layout2', N'YL5', NULL, NULL, N'2', N'1', 0, 1)
GO

INSERT INTO [dbo].[RackRaw] ([ID], [RackID], [LayID], [RackName], [Rawsheet], [Laymemo], [RowNo], [ColumnNo], [FlexibleID], [UniqueID])
VALUES 
  (392, N'YL-21-3', N'Layout2', N'YL5', N'KM269080', NULL, N'3', N'1', 0, 1)
GO

--
-- Data for table dbo.Raw  (LIMIT 0,500)
--

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'DEE3668099', N'P_冷扎板 PL2x1250x3000 SPCC-DT <P>', 3000, 1250, 2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332392', N'P_冷轧钢板  PL1x1000x2400-DC01-Am-O DT <P>', 2400, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332426', N'P_冷轧钢板  PL1x1499x2400-DC01-Am-O DT <P>', 2400, 1499, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332429', N'P_冷轧钢板  PL1x1219x2400-DC01-Am-O DT <P>', 2400, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332431', N'P_冷轧板PL1x1499x2500SPCCDT/Q/BQB402-94 <P>', 2500, 1499, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332434', N'P_冷轧板PL1x1219x2520SPCCDT/Q/BQB402-94 <P>', 2520, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332435', N'P_冷轧钢板1X1000X2500-DC01-Am-O DT <P>', 2500, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332436', N'P_冷轧钢板 PL1x1499x2600-DC01-Am-O <P>', 2600, 1499, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332437', N'P_冷轧板PL1x1219x2600SPCCDT/Q/BQB402-94 <P>', 2600, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332438', N'P_冷轧钢板PL1x1000x2600-DC01-Am-O <P>', 2600, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1332439', N'P_冷轧板 1X1219X2784MM DC01-AM-O <P>', 2784, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349456', N'ST25S_ST25S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST25S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349668', N'ST25G_ST25GGOLDEN ETCHED STAINLESS STEEL1.0*1219*2720', 2720, 1219, 1, N'ST25G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349670', N'ST26S_ST26S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349699', N'ST26G_ST26G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST26G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349700', N'ST27S_ST27S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST27S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349701', N'ST27G_ST27G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST27G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349702', N'ST28S_ST28S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349703', N'ST28G_ST28G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST28G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349704', N'ST29S_ST29S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST29S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349705', N'ST29G_ST29G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST29G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349706', N'ST30S_ST30S银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST30S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349707', N'ST30G_ST30G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST30G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349708', N'ST12G_ST12G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST12G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349709', N'ST13G_ST13G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST13G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349710', N'ST18G_ST18G金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST18G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349711', N'ST20G_ST20G 金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST20G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349712', N'ST22G_ST22G 金色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST22G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349713', N'ST23S_ST23S 银色蚀刻不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST23S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1349714', N'ST21S_ST21S 银色和纹不锈钢1.0*1219*2720', 2720, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1354958', N'MP1_MP1银色镜面不锈钢1.5*1219*2600', 2600, 1219, 1.5, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1354959', N'MP2_MP2金色镜面不锈钢1.5*1219*2600', 2600, 1219, 1.5, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1354960', N'MP3_MP3玫瑰金镜面不锈钢1.5*1219*2600', 2600, 1219, 1.5, N'MP3')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1354961', N'MP4_MP4古铜色镜面不锈钢1.5*1219*2600', 2600, 1219, 1.5, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1354962', N'MP5_MP5黑色镜面不锈钢1.5*1219*2600', 2600, 1219, 1.5, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1358375', N'Z_zinc-coated steel plate,1.5X1250X2600mm', 2600, 1250, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1359527', N'ST21S_ST21S INDIRECT STEEL 1.5*1219*3050', 3050, 1219, 1.5, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1359530', N'ST21G_ST21G INDIRECT STEEL 1.5*1219*3050', 3050, 1219, 1.5, N'ST21G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM1359531', N'MP6_MP6 SILVER SATIN ST STEEL 1.5*1219*3050', 3050, 1219, 1.5, N'MP6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM244997', N'P_钢板 PL1.5x1250x2500SPCC DT/Q/BQB 402-94 <P>', 2500, 1250, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM249098', N'Z_STEEL PLATE,1.5X1250X2500MM ST', 2500, 1250, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM269032', N'Z_STEEL PLATE,1X1250X2500MM ST <U>', 2500, 1250, 1, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM269042', N'Z_STEEL PLATE,2X1250X2500MM ST', 2500, 1250, 2, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM269068', N'P_冷轧板PL1X1250X2500 ST JISG3141<P>', 2500, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM269080', N'P_冷轧板PL3x1250x3000SPCCDT/Q/BQB402-94 <P>', 3000, 1250, 3, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM304CFS1', N'LST4_1.5_银色长发丝不锈钢板PL1.5x1219x2510 <U>', 2510, 1219, 1.5, N'LST4_1.5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM304CFS2', N'LST4_1.5_银色长发丝不锈钢板PL1.5x1000x2510 <U>', 2510, 1000, 1.5, N'LST4_1.5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002749', N'ST43_PL1.0x1219x2784 Stainless steel AISI443', 2784, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002750', N'ST43_AISI443 steel plate 1.5*1219*3050 mm', 3050, 1219, 1.5, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002751', N'ST43_STEEL SHEET 1X1219X1480MM AISI443', 1480, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002752', N'ST43_PL1x1219x2400 Stainless steel AISI443', 2400, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002753', N'ST43_STEEL PLATE, 1.0X1000X2400MM AISI443', 2400, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002754', N'ST43_STEEL PLATE, 1.0X1219X2600MM AISI443', 2600, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002755', N'ST43_PL1x1000x2600 Steel plate AISI443', 2600, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50002756', N'ST43_AISI443 steel plate 1.5*1219*2438 mm', 2438, 1219, 1.5, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50009446', N'ST4_银色发丝不锈钢板PL1x1000x1480 <U>', 1480, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50009447', N'ST4_ST4 1.5X1219X2750', 2750, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50009448', N'ST4_ST4 1.5X1219X1010', 1010, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50009449', N'P_COLD STEEL  1.5X1499X2750', 2750, 1499, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029766', N'ST4_银色发丝不锈钢板PL1x1219x2300', 2300, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029767', N'MP1_MIRROR,SILVER 1X1219X2300MM AISI304', 2300, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029768', N'ST43_PL1.0x1219x2300 Stainless steel AISI443', 2300, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029769', N'ST4_PL1x1000x1640 Silver Brush S.S', 1640, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029770', N'ST4_PL1x852x1430 Silver Brush S.S', 1430, 852, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029824', N'ST4_PL1x1219x1640 Silver Brush S.S', 1640, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029855', N'P_冷轧板PL1x1219x2500SPCCDT/Q/BQB402-94 <P>', 2500, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029859', N'MP1_银色镜面不锈钢板PL1X1219X2400 <U>', 2400, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029860', N'MP1_银色镜面不锈钢板PL1X1219X2600 <U>', 2600, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50029861', N'MP1_银色镜面不锈钢板PL1x1219x2500 <U>', 2500, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50035798', N'ST43_ST43 0.6mm*1219mm*2450mm', 2450, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50035799', N'ST43_ST43 0.6mm*1000mm*2450mm', 2450, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50035800', N'P_STEEL PLATE  1.2*1219*2450MM ST', 2450, 1219, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50049910', N'ST4_银色发丝不锈钢板PL1x1000x2400 <U>', 2400, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080423', N'TS2_TS2 - Flemish Linen, textured stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'TS2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080424', N'ST31S_ST31S - Silver High-rise, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080425', N'ST31G_ST31G - Golden High-rise, etched stainless steel', 2720, 1219, 1, N'ST31G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080426', N'ST32S_ST32S - Silver Pleat, etched stainless steelPL1.0*1215*2800', 2800, 1215, 1, N'ST32S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080427', N'ST32G_ST32G - Golden Pleat, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST32G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080428', N'ST33S_ST33S - Silver Curve, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST33S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080430', N'ST33G_ST33G - Golden, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST33G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080432', N'ST34S_ST34S - Silver Diamond, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST34S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080433', N'ST34G_ST34G - Golden Diamond, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST34G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080434', N'ST35S_ST35S - Silver Harmony, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST35S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080435', N'ST35G_ST35G - Golden Harmony, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST35G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080436', N'ST36S_ST36S - Silver Graphics, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST36S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080437', N'ST36G_ST36G - Golden Graphics, etched stainless steel PL1.0*1219*2720', 2720, 1219, 1, N'ST36G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080438', N'ST37S_ST37S - Steel Chain, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST37S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080439', N'ST37G_ST37G - Golden Chain, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST37G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080440', N'ST38S_ST38S - Silver Ornament, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST38S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080441', N'ST38G_ST38G - Golden Ornament, etched stainless steel PL1.0*1215*2800', 2800, 1215, 1, N'ST38G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080443', N'F1_F1 - Asturias Satin (AISI304)PL1.0*1219*2720', 2720, 1219, 1, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080444', N'PS5_PS5 - Radiant Bamboo, printed steelPL1.0*1219*2720', 2720, 1219, 1, N'PS5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080445', N'PS6_PS6 - Hong-Kong Lights, printed steelPL1.0*1219*2720', 2720, 1219, 1, N'PS6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080446', N'PS7_PS7 - Delicate Cool, printed steelPL1.0*1219*2720', 2720, 1219, 1, N'PS7')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080447', N'PS8_PS8 - Dot Cloud PL1.0*1219*2720', 2720, 1219, 1, N'PS8')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080448', N'F1_F1 - Asturias Satin PL1.5*3050*1219', 3050, 1219, 1.5, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50080449', N'ST4_PL1x1219x2220 sliver Brushed materials', 2220, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082335', N'ST43_STEEL PLATE, 0.8X1000X2400MM AISI443', 2400, 1000, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082336', N'ST43_STEEL PLATE, 0.8X1000X1620MM AISI443', 1620, 1000, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082337', N'ST43_STEEL PLATE, 0.8X1219X2400MM AISI443', 2400, 1219, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082338', N'ST43_STEEL PLATE, 0.8X1219X1620MM AISI443', 1620, 1219, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082339', N'ST4_PL0.8x1000x1620-Brush stainless SUS304', 1620, 1000, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082340', N'ST4_PL0.8x1000x2400-Brush stainless SUS304', 2400, 1000, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082341', N'ST4_PL0.8x1219x1620-Brush stainless SUS304', 1620, 1219, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082342', N'ST4_PL0.8x1219x2400-Brush stainless SUS304', 2400, 1219, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082343', N'ST43_STEEL PLATE, 1*760*1640mm AISI443', 1640, 760, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082344', N'ST43_STEEL PLATE, 0.8*760*1380mm AISI443', 1380, 760, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082345', N'ST43_STEEL PLATE, 0.8*760*1130mm AISI443', 1130, 760, 0.8, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082346', N'ST4_PL1*760*1640mm-Brush stainless SUS304', 1640, 760, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082347', N'ST4_PL0.8*760*1380mm-Brush stainless SUS304', 1380, 760, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082348', N'ST4_PL0.8*760*1130mm-Brush stainless SUS304', 1130, 760, 0.8, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082349', N'ST4_SUS304, 0.6*1100*2130', 2130, 1100, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50082353', N'ST4_SUS304  0.6*1000*2130', 2130, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50090542', N'HM81_Vertical HM81 SUS304 1.0X1219X2720MM HM8', 2720, 1219, 1, N'HM81')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308033', N'ST2_PL1x1219x2784 Golden Brush  S.S', 2784, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308035', N'MP4_STEEL SHEET AISI304 1.0X1219X2784 MP4', 2784, 1219, 1, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308036', N'MP5_STEEL SHEET AISI304 1.0X1219X2784', 2784, 1219, 1, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308037', N'MP6_STEEL SHEET AISI304 1.0X1219X2784 HM-C', 2784, 1219, 1, N'MP6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308038', N'ST21S_SILVER INDIRECT 1.0*1219*2784', 2784, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308040', N'ST21G_Etched stainless steel(ST21)1*1219*2784', 2784, 1219, 1, N'ST21G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308041', N'ST26S_ST26S SILVER ETCHED 1.0*1219*2784', 2784, 1219, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308042', N'ST26G_ST26G,GOL.ET.ST.ST,1.0*1219*2784,HM-11', 2784, 1219, 1, N'ST26G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308043', N'ST28S_ST28S SILVER ETCHED 1.0*1219*2784', 2784, 1219, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308044', N'ST28G_ST28G GOLDEN ETCHED 1.0*1219*2784', 2784, 1219, 1, N'ST28G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308045', N'ST31S_ST31S Silver High-rise, 1.0*1219*2784', 2784, 1219, 1, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308046', N'ST31G_ST31G Golden High-rise, 1.0*1219*2784', 2784, 1219, 1, N'ST31G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308047', N'ST33S_ST33S - Silver Curve, PL1.0*1219*2784', 2784, 1219, 1, N'ST33S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308048', N'ST33G_ST33G - Golden, etched, PL1.0*1219*2784', 2784, 1219, 1, N'ST33G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308049', N'ST35S_ST35S - Silver Harmony, 1.0*1219*2784', 2784, 1219, 1, N'ST35S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308060', N'ST35G_ST35G - Silver Graphics, 1.0*1219*2784', 2784, 1219, 1, N'ST35G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308061', N'ST36S_ST36S - Silver Graphics, 1.0*1219*2784', 2784, 1219, 1, N'ST36S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308062', N'ST36G_ST36G - Golden Graphics, 1.0*1219*2784', 2784, 1219, 1, N'ST36G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308073', N'F1_F1 - Asturias Satin 304 PL1.0*1219*2784', 2784, 1219, 1, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308074', N'TS2_TS2 - Flemish Linen,  PL1.0*1219*2784', 2784, 1219, 1, N'TS2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308075', N'PS5_PS5 - Radiant Bamboo,  PL1*1219*2784', 2784, 1219, 1, N'PS5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308076', N'PS6_PS6 - Hong-Kong Lights,PL1.0*1219*2784', 2784, 1219, 1, N'PS6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308077', N'PS7_PS7 - Delicate Cool, PL1.0*1219*2784', 2784, 1219, 1, N'PS7')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308087', N'PS8_PS8 - Dot Cloud printed PL1.0*1219*2784', 2784, 1219, 1, N'PS8')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308493', N'ST4_BRUSHED ST4 0.6MM*1219MM*2460MM', 2460, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50308494', N'ST4_Brushed ST4, 0.6mm*1000mm*2450mm', 2450, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316374', N'ST4_SUS304  0.6*1100*2230,  HH=2200,LL=900', 2230, 1100, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316375', N'ST4_SUS304  0.6*1000*2230,  HH=2200,LL=800', 2230, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316376', N'ST43_ST443   0.6*1100*2130,  HH=2100,LL=900', 2130, 1100, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316377', N'ST43_ST443   0.6*1000*2130,  HH=2100,LL=800', 2130, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316378', N'ST43_ST443   0.6*1100*2230,  HH=2200,LL=900', 2230, 1100, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316379', N'ST43_ST443   0.6*1000*2230,  HH=2200,LL=800', 2230, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316380', N'P_COLD ROLLED PL1X730X2400', 2400, 730, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316381', N'P_COLD ROLLED PL1X1230X2300,  HH<=2100', 2300, 1230, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316382', N'P_COLD ROLLED PL1X1230X2400, 2100<HH<=2200', 2400, 1230, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316383', N'P_COLD ROLLED PL1.2X730X2400', 2400, 730, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316384', N'P_STEEL PLATE  1.2*1130*2300 ST', 2300, 1130, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316385', N'P_STEEL PLATE  1.2*1130*2400 ST', 2400, 1130, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316386', N'P_STEEL PLATE  1.2*1230*2300 ST', 2300, 1230, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316387', N'P_STEEL PLATE,1.2*1230*2400', 2400, 1230, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316388', N'ST4_SUS304  0.6*650*2230,  HH=2200', 2230, 650, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316389', N'ST43_ST443   0.6*650*2230,  HH=2200', 2230, 650, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316390', N'F1_F1  0.6*1100*2230,  HH=2100,LL=900', 2230, 1100, 0.6, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316391', N'F1_F1  0.6*650*2230,  HH=2200', 2230, 650, 0.6, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316396', N'ST4_SUS304   1*1100*2130, for HH=2100,LL=900', 2130, 1100, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316397', N'ST4_SUS304 1*1000*2130, for HH=2100,LL=800', 2130, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316398', N'ST4_SUS304   1*1100*2230, for HH=2200,LL=900', 2230, 1100, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316399', N'ST4_SUS304 1*1000*2230, for HH=2200,LL=800', 2230, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316400', N'ST43_ST443   1*1100*2130, for HH=2100,LL=900', 2130, 1100, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316401', N'ST43_ST443   1*1000*2130, for HH=2100,LL=800', 2130, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316402', N'ST43_ST443   1*1100*2230, for HH=2200,LL=900', 2230, 1100, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316403', N'ST43_ST443  1*1000*2230, for HH=2200,LL=800', 2230, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316404', N'ST4_SUS304  1*650*2230, for HH=2200', 2230, 650, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316405', N'ST43_ST443   1*650*2230, for HH=2200', 2230, 650, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316406', N'ST4_ST4 0.6*471.8*2118，LL=800; HH=2100; CO', 2118, 471.8, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316407', N'ST43_ST43 0.6*471.8*2118，LL=800; HH=2100; CO', 2118, 471.8, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316408', N'ST43_ST43 0.6*521.8*2118，LL=900; HH=2100; CO', 2118, 521.8, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316425', N'P_COLD ROLLED PL1.2X580X2300MM', 2300, 580, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316426', N'P_COLD ROLLED PL1.2X1260X2300MM', 2300, 1260, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316427', N'P_COLD ROLLED PL1.2X680X2300MM', 2300, 680, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316428', N'P_COLD ROLLED PL1.2X1499X2300MM', 2300, 1499, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316429', N'P_COLD ROLLED PL1.2X780X2300MM', 2300, 780, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316430', N'P_COLD ROLLED PL1.2X830X2300MM', 2300, 830, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316431', N'P_COLD ROLLED PL1.2X580X2600MM', 2600, 580, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316432', N'P_COLD ROLLED PL1.2X1250X2600MM', 2600, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316433', N'P_COLD ROLLED PL1.2X680X2600MM', 2600, 680, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316434', N'P_COLD ROLLED PL1.2X1499X2600MM', 2600, 1499, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316435', N'P_COLD ROLLED PL1.2X780X2600MM', 2600, 780, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316436', N'P_COLD ROLLED PL1.2X830X2600MM', 2600, 830, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316437', N'P_COLD ROLLED PL1X560X2150MM', 2150, 560, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316438', N'P_COLD ROLLED PL1X1250X2150MM', 2150, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316439', N'P_COLD ROLLED PL1X660X2150MM', 2150, 660, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316440', N'P_COLD ROLLED PL1X760X2150MM', 2150, 760, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316441', N'P_COLD ROLLED PL1X560X2450MM', 2450, 560, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316442', N'P_COLD ROLLED PL1X1250X2450MM', 2450, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316443', N'P_COLD ROLLED PL1X660X2450MM', 2450, 660, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316444', N'P_COLD ROLLED PL1X760X2450MM', 2450, 760, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316445', N'ST43_SUS443 0.6MM*1219MM*2150MM', 2150, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316446', N'ST4_SUS304 0.6MM*1219MM*2150MM', 2150, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316447', N'ST43_ SUS443 0.6MM*660MM*2150MM', 2150, 660, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316448', N'ST4_ SUS304 0.6MM*660MM*2150MM', 2150, 660, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316449', N'ST43_ SUS443 0.6MM*760MM*2150MM', 2150, 760, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316450', N'ST4_ SUS304 0.6MM*760MM*2150MM', 2150, 760, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316453', N'ST43_ SUS443 0.6MM*660MM*2450MM', 2450, 660, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316454', N'ST4_ SUS304 0.6MM*660MM*2450MM', 2450, 660, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316455', N'ST43_ SUS443 0.6MM*760MM*2450MM', 2450, 760, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316456', N'ST4_ SUS304 0.6MM*760MM*2450MM', 2450, 760, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316457', N'ST43_SUS443 1.0MM*1219MM*2450MM', 2450, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316458', N'ST4_SUS304 1MM*1219MM*2450MM', 2450, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316459', N'P_COLD ROLLED PL2x1250x2230 SPCC', 2230, 1250, 2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316460', N'P_COLD ROLLED PL2x1250x2530 SPCC', 2530, 1250, 2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316473', N'P_COLD ROLLED,0.8*179.8*1720 MM', 1720, 179.8, 0.8, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316476', N'P_COLD ROLLED PL 1.2*1250*2800', 2800, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316498', N'P_ROLLER SHEET 0.8*1250*2000MM', 2000, 1250, 0.8, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316504', N'P_COLD ROLLED PL1X332X2017MM', 2017, 332, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM50316505', N'Z_ZNIC COATING PL1.5*1500*2500MM', 2500, 1500, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51037953', N'P_冷轧板COLD ROLLED PL1X1250X2520MM <P>', 2520, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51037954', N'P_冷轧板COLD ROLLED PL1X1250X2620MM <P>', 2620, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068212', N'P_COLD ROLLED PL1X1219X2455mm', 2455, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068213', N'P_COLD ROLLED PL1X1000X2455mm', 2455, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068214', N'P_COLD ROLLED PL1X1219X2375mm', 2375, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068215', N'P_COLD ROLLED PL1X1000X2375mm', 2375, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068216', N'P_COLD ROLLED PL1X1219X2275mm', 2275, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068217', N'P_COLD ROLLED PL1X1000X2275mm', 2275, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068219', N'ST43_ST43 0.6mm*1219mm*2375mm', 2375, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068225', N'ST43_ST43 0.6mm*1000mm*2375mm', 2375, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068226', N'ST43_ST43 0.6mm*1040mm*2375mm', 2375, 1040, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068227', N'ST43_ST43 0.6mm*739.6mm*2365mm', 2365, 739.6, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068229', N'ST43_ST43 0.6mm*1219mm*2275mm', 2275, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068231', N'ST43_ST43 0.6mm*1000mm*2275mm', 2275, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068232', N'ST43_ST43 0.6mm*1040mm*2275mm', 2275, 1040, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068233', N'ST4_Brushed ST4 0.6mm*1219mm*2375mm', 2375, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068234', N'ST4_Brushed ST4 0.6mm*1000mm*2375mm', 2375, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068235', N'ST4_Brushed ST4 0.6mm*1040mm*2375mm', 2375, 1040, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068236', N'ST4_Brushed ST4 0.6mm*739.6mm*2365mm', 2365, 739.6, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068238', N'ST4_Brushed ST4 0.6mm*1219mm*2275mm', 2275, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068239', N'ST4_Brushed ST4 0.6mm*1000mm*2275mm', 2275, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51068241', N'ST4_Brushed ST4 0.6mm*1040mm*2275mm', 2275, 1040, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073180', N'P_COLD ROLLED PL1X705X2500MM', 2500, 705, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073181', N'P_COLD ROLLED PL1X880X2500MM', 2500, 880, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073182', N'P_COLD ROLLED PL1X1000X2500MM', 2500, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073183', N'P_COLD ROLLED PL1X1250X2500MM', 2500, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073184', N'P_COLD ROLLED PL1X705X2630MM', 2630, 705, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073185', N'P_COLD ROLLED PL1X880X2630MM', 2630, 880, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073186', N'P_COLD ROLLED PL1X1000X2630MM', 2630, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073187', N'P_COLD ROLLED PL1X1250X2630MM', 2630, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073188', N'P_COLD ROLLED PL1.5x705X2800MM', 2800, 705, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073189', N'P_COLD ROLLED PL1.5x880X2800MM', 2800, 880, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073190', N'P_COLD ROLLED PL1.5x1000X2800MM', 2800, 1000, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073191', N'P_COLD ROLLED PL1.5x1250X2800MM', 2800, 1250, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073192', N'P_COLD ROLLED PL1.5x705X2980MM', 2980, 705, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073193', N'P_COLD ROLLED PL1.5x880X2980MM', 2980, 880, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073194', N'P_COLD ROLLED PL1.5x1000X2980MM', 2980, 1000, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073195', N'P_COLD ROLLED PL1.5x1250X2980MM', 2980, 1250, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073199', N'ST4_PL1x680x2210 sliver Brushed materials', 2210, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073200', N'ST4_PL1x860x2210 sliver Brushed materials', 2210, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073201', N'ST4_PL1x1000x2210 sliver Brushed materials', 2210, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073202', N'ST4_PL1x1219x2210 sliver Brushed materials', 2210, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073203', N'ST4_PL1x680x2310 sliver Brushed materials', 2310, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073204', N'ST4_PL1x860x2310 sliver Brushed materials', 2310, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073205', N'ST4_PL1x1000x2310 sliver Brushed materials', 2310, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073206', N'ST4_PL1x1219x2310 sliver Brushed materials', 2310, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073207', N'ST4_PL1x680x2410 sliver Brushed materials', 2410, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073208', N'ST4_PL1x860x2410 sliver Brushed materials', 2410, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073209', N'ST4_PL1x1000x2410 sliver Brushed materials', 2410, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073210', N'ST4_PL1x1219x2410 sliver Brushed materials', 2410, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073211', N'ST4_PL1x680x2510 sliver Brushed materials', 2510, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073212', N'ST4_PL1x860x2510 sliver Brushed materials', 2510, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073213', N'ST4_PL1x1000x2510 sliver Brushed materials', 2510, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073214', N'ST4_PL1x1219x2510 sliver Brushed materials', 2510, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073215', N'ST4_PL1x680x2610 sliver Brushed materials', 2610, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073216', N'ST4_PL1x860x2610 sliver Brushed materials', 2610, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073217', N'ST4_PL1x1000x2610 sliver Brushed materials', 2610, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073218', N'ST4_PL1x1219x2610 sliver Brushed materials', 2610, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073219', N'ST4_PL1x680x2784 sliver Brushed materials', 2784, 680, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073220', N'ST4_PL1x860x2784 sliver Brushed materials', 2784, 860, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51073221', N'ST4_PL1x1000x2784 sliver Brushed materials', 2784, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51075058', N'P_COLD ROLLED PL1X700X2784MM', 2784, 700, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51075059', N'P_COLD ROLLED PL1X880X2784MM', 2784, 880, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51075060', N'P_COLD ROLLED PL1X1000X2784MM', 2784, 1000, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088467', N'F1_F1-Asturias Satin PL1.5x1219x3133', 3133, 1219, 1.5, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088468', N'ST4_ST4-Brush stainless PL1.5x1219x3133', 3133, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088469', N'ST43_ST43-AISI443 steel plate PL1.5x1219x3133', 3133, 1219, 1.5, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088470', N'ST2_ST2-Golden Brush PL1.5x1219x3133', 3133, 1219, 1.5, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088471', N'MP1_MP1-Mirror polished PL1.5x1219x3133', 3133, 1219, 1.5, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51088472', N'P_COLD ROLLED PL1.5x1219x3133', 3133, 1219, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107435', N'P_冷板 1.2*1219*2555', 2555, 1219, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107450', N'P_冷板 1.2*1000*2555', 2555, 1000, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107451', N'P_冷板 1.2*1219*2475', 2475, 1219, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107452', N'P_冷板 1.2*1000*2475', 2475, 1000, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107457', N'P_冷板 1.2*1250*2500', 2500, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107464', N'ST43_不锈钢ST443 0.6*1219*2550', 2550, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107469', N'ST43_不锈钢ST443 0.6*1219*2475', 2475, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51107483', N'ST43_不锈钢ST443 0.6*1000*2550', 2550, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108148', N'ST43_不锈钢ST443 0.6*1040*2475', 2475, 1040, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108150', N'ST43_不锈钢ST443 0.6*1000*2475', 2475, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108335', N'ST43_不锈钢ST443 0.6*739.6*2465', 2465, 739.6, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108369', N'ST4_不锈钢 SUS304 0.6*1219*2550', 2550, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108370', N'ST4_不锈钢 SUS304 0.6*1219*2475', 2475, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108371', N'ST4_不锈钢 SUS304 0.6*1000*2550', 2550, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108372', N'ST4_不锈钢 SUS304 0.6*1040*2475', 2475, 1040, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108373', N'ST4_不锈钢 SUS304 0.6*1000*2475', 2475, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51108431', N'ST4_不锈钢 SUS304 0.6*739.6*2465', 2465, 739.6, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51134990', N'ST43_ST443,1.2*1200*1500', 1500, 1200, 1.2, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51168662', N'ST4 _ST4 PL1X1219X2834', 2834, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51168663', N'P_COLD ROLLED PL1X1219X2834', 2834, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51173343', N'MP4_MP4 STAINLESS STEEL 1.5X1219X3133', 3133, 1219, 1.5, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51173344', N'MP5_MP5 STAINLESS STEEL 1.5X1219X3133', 3133, 1219, 1.5, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51196850', N'MP1_PL1x1000x2420 Silver Mirror Polished S.S', 2420, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51196851', N'MP2_PL 1 x 1000 x 2400 Golden Mirror Polished S.S', 2400, 1000, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51196852', N'MP1_PL 1 x 1219 x1630 Silver Mirror polished S.S', 1630, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51196853', N'MP1_PL 1 x 1000 x 1630 Silver Mirror polished S.S', 1630, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51196854', N'ST43_1x1000x1630 Brush stainless AISI443', 1630, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252476', N'TS2_TS2 - PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'TS2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252477', N'PS5_PS5 -  PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'PS5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252478', N'PS6_PS6 -  PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'PS6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252479', N'PS7_PS7 - PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'PS7')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252480', N'PS8_PS8 -  PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'PS8')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252481', N'ST21S_ST21S -PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252482', N'ST21G_ST21G-PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST21G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252483', N'ST26S_ST26S - PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252484', N'ST26G_ST26G-PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST26G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252485', N'ST28S_ST28S -PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252486', N'ST28G_ST28G- PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST28G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252487', N'ST31S_ST31S- PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252488', N'ST31G_ST31G-PL1.5*1219*3050 MM', 3050, 1219, 1.5, N'ST31G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252489', N'ST32S_ST32S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST32S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252490', N'ST32G_ST32G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST32G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252491', N'ST33S_ST33S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST33S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252492', N'ST33G_ST33G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST33G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252493', N'ST34S_ST34S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST34S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252494', N'ST34G_ST34G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST34G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252495', N'ST35S_ST35S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST35S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252496', N'ST35G_ST35G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST35G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252497', N'ST36S_ST36S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST36S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252498', N'ST36G_ST36G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST36G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252499', N'ST37S_ST37S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST37S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252500', N'ST37G_ST37G - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST37G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252501', N'ST38S_ST38S - PL1.5*1219*3050', 3050, 1219, 1.5, N'ST38S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252502', N'ST38G_ST38G -PL1.5*1219*3050', 3050, 1219, 1.5, N'ST38G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252503', N'MP6_STEEL SHEET AISI304 1.5X1219X3050 HM-C', 3050, 1219, 1.5, N'MP6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51252504', N'Z_ZINC-COATED STEEL PLATE,1.5X1250X3000', 3000, 1250, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51254514', N'Z_ZINC-COATED STEEL PLATE,1.0X1250X3050MM', 3050, 1250, 1, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51274983', N'ST43_ST443 0.6*1219*2750', 2750, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51274989', N'ST43_ST443 0.6*1219*2675', 2675, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51274993', N'ST43_ST443 0.6*1000*2750', 2750, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51274995', N'ST43_ST443 0.6*1040*2675', 2675, 1040, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51274996', N'ST43_ST443 0.6*1000*2675', 2675, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275001', N'ST43_ST443 0.6*739.6*2675', 2675, 739.6, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275008', N'ST4_SUS304 0.6*1219*2750', 2750, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275009', N'ST4_SUS304 0.6*1219*2675', 2675, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275012', N'ST4_SUS304 0.6*1000*2750', 2750, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275016', N'ST4_SUS304 0.6*1040*2675', 2675, 1040, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275023', N'ST4_SUS304 0.6*1000*2675', 2675, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51275024', N'ST4_SUS304 0.6*739.6*2675', 2675, 739.6, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51298488', N'ST21S_ST21S -PL1.5*1219*3133 MM', 3133, 1219, 1.5, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51298489', N'ST21G_ST21G -PL1.5*1219*3133 MM', 3133, 1219, 1.5, N'ST21G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382829', N'ST4_PL1.5x1219x2708 STAINLELESS SUS304', 2708, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382830', N'ST4_PL1.5x1219x2808 STAINLELESS SUS304', 2808, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382831', N'ST4_PL1.5x1219x2908 STAINLELESS SUS304', 2908, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382832', N'ST4_PL1.5x1219x2743 STAINLESS STEEL SUS304', 2743, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382833', N'ST4_PL1.5x1219x2843 STAINLESS STELL  SUS304', 2843, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51382834', N'ST4_PL1.5x1219x2943 STAINLESS STELL SUS304', 2943, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51405993', N'Z_ZINC PLATE,PL1.5*1500*2600MM', 2600, 1500, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51419573', N'P_COLD ROLLED PL1.5X1250X3250', 3250, 1250, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51419575', N'P_冷轧板 1.0X1250X3250MM DC01-AM-O <P>', 3250, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51419577', N'ST4_PL1.0X1219X3250 短丝不锈钢 (SUS304 No4) <U>', 3250, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51419578', N'ST4_ST4-Brush stainless PL1.5X1219X3250', 3250, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442522', N'ST5_ST5-COPPER BRUSHED,PL1.0*1219*2784', 2784, 1219, 1, N'ST5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442523', N'ST39SB_ST39SB-BAMBOO ETCHED SS,PL1*1219*2784', 2784, 1219, 1, N'ST39SB')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442524', N'ST39CB_ST39CB-COPPER BAMBO ETCHED,PL1*1219*2784', 2784, 1219, 1, N'ST39CB')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442525', N'ST36C_ST36C-COPPER GRAPHICS,PL1*1219*2784', 2784, 1219, 1, N'ST36C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442526', N'ST31C_ST31C-COPPER HIGH RISE, PL1*1219*2784', 2784, 1219, 1, N'ST31C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442527', N'A_A-STST ACID PROOF ST316, PL1*1219*2784', 2784, 1219, 1, N'A')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442528', N'ST5_ST5-COPPER BRUSHED,PL1.5*1219*3050', 3050, 1219, 1.5, N'ST5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442529', N'ST39SB_ST39SB-BAMBOO ETCHED SS,PL1.5*1219*3050', 3050, 1219, 1.5, N'ST39SB')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442530', N'ST39CB_ST39CB-COPPER BAMBO ETCH,PL1.5*1219*3050', 3050, 1219, 1.5, N'ST39CB')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442531', N'ST36C_ST36C-COPPER GRAPHICS, PL1.5*1219*3050', 3050, 1219, 1.5, N'ST36C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442532', N'ST31C_ST31C-COPPER HIGH RISE, PL1.5*1219*3050', 3050, 1219, 1.5, N'ST31C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442533', N'A_ST31C-COPPER HIGH RISE, PL1.5*1219*3050', 3050, 1219, 1.5, N'A')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442534', N'ST4_PL1.5x680x2908 SLIVER BRUSHED MATERIALS SUS304', 2908, 680, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442535', N'ST4_PL1.5x860x2908 SLIVER BRUSHED MATERIALS SUS304', 2908, 860, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442536', N'ST4_PL1.5x1000x2908 SLIVER BRUSHED MATERIALS SUS304', 2908, 1000, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442537', N'ST4_PL1.5x680x2808 SLIVER BRUSHED MATERIALS SUS304', 2808, 680, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442538', N'ST4_PL1.5x860x2808 SLIVER BRUSHED MATERIALS SUS304', 2808, 860, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442539', N'ST4_PL1.5x1000x2808 SLIVER BRUSHED MATERIALS SUS304', 2808, 1000, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442879', N'ST4_PL1.5x680x3050 SLIVER BRUSHED MATERIALS SUS304', 3050, 680, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442880', N'ST4_PL1.5x860x3050 SLIVER BRUSHED MATERIALS SUS304', 3050, 860, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442881', N'ST4_PL1.5x1000x3050 SLIVER BRUSHED MATERIALS SUS304', 3050, 1000, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442882', N'ST4_PL1.5x1219x2608 SLIVER BRUSHED MATERIALS SUS304', 2608, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51442883', N'ST4_PL1.5x1219x2508 SLIVER BRUSHED MATERIALS SUS304', 2508, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455105', N'P_COLD ROLLED,1.2X1500X2400MM', 2400, 1500, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455107', N'P_COLD ROLLED,1.2X1500X2800MM', 2800, 1500, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455108', N'P_COLD ROLLED,1.2X1250X2300MM', 2300, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455109', N'P_COLD ROLLED,1.2X1250X2400MM', 2400, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455110', N'P_COLD ROLLED,1.2X1250X2600MM', 2600, 1250, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455112', N'P_COLD ROLLED,1.0X1500X2150MM', 2150, 1500, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455113', N'P_COLD ROLLED,1.0X1500X2250MM', 2250, 1500, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455114', N'P_COLD ROLLED,1.0X1500X2450MM', 2450, 1500, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455115', N'P_COLD ROLLED,1.0X1500X2650MM', 2650, 1500, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455117', N'P_COLD ROLLED,1.0X1250X2250MM', 2250, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455119', N'P_COLD ROLLED,1.0X1250X2650MM', 2650, 1250, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455120', N'Z_ZINC-COATED STEEL PLATE,1.0X1250X2250MM', 2250, 1250, 1, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455121', N'Z_ZINC-COATED STEEL PLATE,1.0X1250X2450MM', 2450, 1250, 1, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455122', N'Z_ZINC-COATED STEEL PLATE,1.0X1250X2650MM', 2250, 1250, 1, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455123', N'ST43_SUS443,0.6MMX1000MMX2150MM', 2150, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455124', N'ST43_SUS443,0.6MMX1000MMX2250MM', 2250, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455126', N'ST43_SUS443,0.6MMX1000MMX2650MM', 2650, 1000, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455127', N'ST43_SUS443,1.0MMX1000MMX2150MM', 2150, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455128', N'ST43_SUS4431.0MMX1000MMX2250MM', 2250, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455129', N'ST43_SUS443,1.0MMX1000MMX2450MM', 2450, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455130', N'ST43_SUS443,1.0MMX1000MMX2650MM', 2650, 1000, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455131', N'ST43_SUS443,0.6MMX1219MMX2250MM', 2250, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455132', N'ST43_SUS443,0.6MMX1219MMX2450MM', 2450, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455133', N'ST43_SUS443,0.6MMX1219MMX2650MM', 2650, 1219, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455134', N'ST43_SUS443,1.0MMX1219MMX2150MM', 2150, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455135', N'ST43_SUS443,1.0MMX1219MMX2250MM', 2250, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455137', N'ST43_SUS443,1.0MMX1219MMX2650MM', 2650, 1219, 1, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455138', N'ST4_SUS304,0.6MMX1000MMX2150MM', 2150, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455139', N'ST4_SUS304,0.6MMX1000MMX2250MM', 2250, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455141', N'ST4_SUS304,0.6MMX1000MMX2650MM', 2650, 1000, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455142', N'ST4_SUS304,1.0MMX1000MMX2150MM', 2150, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455143', N'ST4_SUS3041.0MMX1000MMX2250MM', 2250, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455144', N'ST4_SUS304,1.0MMX1000MMX2450MM', 2450, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455145', N'ST4_SUS304,1.0MMX1000MMX2650MM', 2650, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455146', N'ST4_SUS304,0.6MMX1219MMX2250MM', 2250, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455147', N'ST4_SUS304,0.6MMX1219MMX2450MM', 2450, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455148', N'ST4_SUS304,0.6MMX1219MMX2650MM', 2650, 1219, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455149', N'ST4_SUS304,1.0MMX1219MMX2150MM', 2150, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455150', N'ST4_SUS304,1.0MMX1219MMX2250MM', 2250, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455152', N'ST4_SUS304,1.0MMX1219MMX2650MM', 2650, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455153', N'MP1_MP1,MIRROR,SILVER,1.0MMX1000MMX2150MM', 2150, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455154', N'MP1_MP1,MIRROR,SILVER,1.0MMX1000MMX2250MM', 2250, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455155', N'MP1_MP1,MIRROR,SILVER,1.0MMX1000MMX2450MM', 2450, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455156', N'MP1_MP1,MIRROR,SILVER,1.0MMX1000MMX2650MM', 2650, 1000, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455157', N'MP1_MP1,MIRROR,SILVER,1.0MMX1219MMX2150MM', 2150, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455158', N'MP1_MP1,MIRROR,SILVER,1.0MMX1219MMX2250MM', 2250, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455159', N'MP1_MP1,MIRROR,SILVER,1.0MMX1219MMX2450MM', 2450, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455160', N'MP1_MP1,MIRROR,SILVER,1.0MMX1219MMX2650MM', 2650, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455161', N'MP2_MP2,MIRROR,GOLDEN,1.0MMX1219MMX2250MM', 2250, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455162', N'MP2_MP2,MIRROR,GOLDEN,1.0MMX1219MMX2450MM', 2450, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455163', N'MP2_MP2,MIRROR,GOLDEN,1.0MMX1219MMX2650MM', 2650, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455164', N'ST2_ST2,GOLDEN BRUSHED,1.0MMX1219MMX2250MM', 2250, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455165', N'ST2_ST2,GOLDEN BRUSHED,1.0MMX1219MMX2450MM', 2450, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455166', N'ST2_ST2,GOLDEN BRUSHED,1.0MMX1219MMX2650MM', 2650, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455167', N'F1_F1,0.6MMX1219MMX2250MM', 2250, 1219, 0.6, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455168', N'F1_F1,0.6MMX1219MMX2450MM', 2450, 1219, 0.6, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455169', N'F1_F1,0.6MMX1219MMX2650MM', 2650, 1219, 0.6, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455170', N'ST21S_ST21S,SILVER INDIRECT STAINLESS STEEL', 2250, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455171', N'ST21S_ST21S,SILVER INDIRECT STAINLESS STEEL', 2450, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455172', N'ST21S_ST21S,SILVER INDIRECT STAINLESS STEEL', 2650, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455173', N'ST21S_ST21G,GOLDEN INDIRECT STAINLESS STEEL', 2250, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455174', N'ST21S_ST21G,GOLDEN INDIRECT STAINLESS STEEL', 2450, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455175', N'ST21S_ST21G,GOLDEN INDIRECT STAINLESS STEEL', 2650, 1219, 1, N'ST21S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455176', N'ST26S_ST26S,SILVER ETCHED STAINLESS STEEL', 2250, 1219, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455177', N'ST26S_ST26S,SILVER ETCHED STAINLESS STEEL', 2450, 1219, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455178', N'ST26S_ST26S,SILVER ETCHED STAINLESS STEEL', 2650, 1219, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455179', N'ST28S_ST28S,SILVER ETCHED STAINLESS STEEL', 2250, 1219, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455180', N'ST28S_ST28S,SILVER ETCHED STAINLESS STEEL', 2450, 1219, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455181', N'ST28S_ST28S,SILVER ETCHED STAINLESS STEEL', 2650, 1219, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455182', N'ST31S_ST31S,SILVER HIGH-RISE,ETCHED STAINLESS', 2250, 1219, 1, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455183', N'ST31S_ST31S,SILVER HIGH-RISE,ETCHED STAINLESS', 2450, 1219, 1, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455184', N'ST31S_ST31S,SILVER HIGH-RISE,ETCHED STAINLESS', 2650, 1219, 1, N'ST31S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455185', N'ST37S_ST37S,STEEL CHAIN,ETCHED STAINLESS', 2250, 1219, 1, N'ST37S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455186', N'ST37S_ST37S,STEEL CHAIN,ETCHED STAINLESS', 2450, 1219, 1, N'ST37S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455187', N'ST37S_ST37S,STEEL CHAIN,ETCHED STAINLESS', 2650, 1219, 1, N'ST37S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455188', N'Z_ZNIC COATING,1.2X1500X2650MM', 2650, 1500, 1.2, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455189', N'P_COLD ROLLED,0.8X179.8X1930MM', 1930, 179.8, 0.8, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455190', N'P_COLD ROLLED,0.8X179.8X2030MM', 2030, 179.8, 0.8, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51455191', N'P_COLD ROLLED,0.8X179.8X2130MM', 2130, 179.8, 0.8, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51459408', N'Z_ZNIC COATING,1.2×1500×2150MM', 2150, 1500, 1.2, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51459409', N'Z_ZNIC COATING,1.2×1500×2250MM', 2250, 1500, 1.2, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51459410', N'Z_ZNIC COATING,1.2×1500×2450MM', 2450, 1500, 1.2, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474694', N'A_A,WET POLISHED AISI 316,1.0×1219×2250MM', 2250, 1219, 1, N'A')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474695', N'A_A,WET POLISHED AISI 316,1.0×1219×2450MM', 2450, 1219, 1, N'A')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474696', N'A_A,WET POLISHED AISI 316,1.0×1219×2650MM', 2650, 1219, 1, N'A')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474697', N'ST5_ST5,COPPER BRUSHED STST,1.0×1219×2250MM', 2250, 1219, 1, N'ST5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474698', N'ST5_ST5,COPPER BRUSHED STST,1.0×1219×2450MM', 2450, 1219, 1, N'ST5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474699', N'ST5_ST5,COPPER BRUSHED STST,1.0×1219×2650MM', 2650, 1219, 1, N'ST5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474700', N'ST31C_ST31C,COPPER HIGH-RISE ETCHED', 2250, 1219, 1, N'ST31C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474701', N'ST31C_ST31C,COPPER HIGH-RISE ETCHED', 2450, 1219, 1, N'ST31C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51474702', N'ST31C_ST31C,COPPER HIGH-RISE ETCHED', 2650, 1219, 1, N'ST31C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493973', N'ST40S_ST40S-SILVER POLYGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST40S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493974', N'ST40C_ST40C-COPPER POLYGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST40C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493975', N'ST40B_ST40B-BLACK PLOYGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST40B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493976', N'ST41S_ST41S-SILVER HEXAGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST41S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493977', N'ST41C_ST41C-COPPER HEXAGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST41C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493978', N'ST41B_ST41B-BLACK HEXAGON,PL1.0x1219x2784', 2784, 1219, 1, N'ST41B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493979', N'ST42S_ST42S-SILVER CIRCLE,PL1.0x1219x2784', 2784, 1219, 1, N'ST42S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493980', N'ST42C_ST42C-COPPER CIRCLE,PL1.0x1219x2784', 2784, 1219, 1, N'ST42C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493981', N'ST42B_ST42B-BLACK CIRCLE,PL1.0x1219x2784', 2784, 1219, 1, N'ST42B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493982', N'ST40S_ST40S-SILVER POLYGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST40S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493983', N'ST40C_ST40C-COPPER POLYGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST40C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493984', N'ST40B_ST40B-BLACK PLOYGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST40B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493985', N'ST41S_ST41S-SILVER HEXAGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST41S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493986', N'ST41C_ST41C-COPPER HEXAGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST41C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493987', N'ST41B_ST41B-BLACK HEXAGON,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST41B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493988', N'ST42S_ST42S-SILVER CIRCLE,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST42S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493989', N'ST42C_ST42C-COPPER CIRCLE,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST42C')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51493990', N'ST42B_ST42B-BLACK CIRCLE,PL1.5x1219x3050', 3050, 1219, 1.5, N'ST42B')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541004', N'P_STEEL PLATE 1.0*775*2275', 2275, 775, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541005', N'P_STEEL PLATE 1.0*775*2375', 2375, 775, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541006', N'P_STEEL PLATE 1.2*775*2475', 2475, 775, 1.2, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541008', N'ST43_ST443 0.6*611.6*2275', 2275, 611.5, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541009', N'ST43_ST443 0.6*611.6*2375', 2375, 611.5, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541010', N'ST43_ST443 0.6*611.6*2475', 2475, 611.5, 0.6, N'ST43')
GO

--
-- Data for table dbo.Raw  (LIMIT 500,500)
--

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541011', N'ST43_ST443 0.6*611.6*2675', 2675, 611.5, 0.6, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541038', N'ST4_ST4 0.6*611.6*2275', 2275, 611.5, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541039', N'ST4_ST4 0.6*611.6*2375', 2375, 611.5, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541040', N'ST4_ST4 0.6*611.6*2475', 2475, 611.5, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM51541041', N'ST4_ST4 0.6*611.6*2675', 2675, 611.5, 0.6, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM897545', N'P_冷轧钢板 1.5x1499x3050mm SPCC-DT <P>', 3050, 1499, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899412', N'ST9_蚀刻1.5x1219x3050 钢板(SUS304 ST-9) <U>', 3050, 1219, 1.5, N'ST9')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899413', N'ST10_蚀刻1.5X1219X3050 钢板(SUS304 ST-10) <U>', 3050, 1219, 1.5, N'ST10')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899414', N'ST11_蚀刻1.5x1219x3050 钢板(SUS304 ST-11) <U>', 3050, 1219, 1.5, N'ST11')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899415', N'ST12S_蚀刻1.0x1219x2438 钢板(SUS304 HM36) <U>', 2438, 1219, 1, N'ST12S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899416', N'ST13S_蚀刻1.0x1219x2438 钢板(SUS304 HM81) <U>', 2438, 1219, 1, N'ST13S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899418', N'ST12S_蚀刻1.0x1219x2720 钢板(SUS304 HM36) <U>', 2720, 1219, 1, N'ST12S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899419', N'ST13S_蚀刻1.0x1219x2720 钢板(SUS304 HM81) <U>', 2720, 1219, 1, N'ST13S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899420', N'ST14_蚀刻1.0x1219x2720 钢板(SUS304 HMK18) <U>', 2720, 1219, 1, N'ST14')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899421', N'ST12_蚀刻1.5x1219x3050 钢板(SUS304 HM36) <U>', 3050, 1219, 1.5, N'ST12')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899422', N'ST13_蚀刻1.5x1219x3050 钢板(SUS304 HM81) <U>', 3050, 1219, 1.5, N'ST13')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM899423', N'ST14_蚀刻1.5x1219x3050 钢板(SUS304 HMK18) <U>', 3050, 1219, 1.5, N'ST14')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928418', N'R13_PVC COATED STEEL 1.0X1219X2700 FA0601-1 <U>', 2700, 1219, 1, N'R13')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928420', N'R14_PVC COATED STEEL 1.0X1219X2700 FA1109-1 <U>', 2700, 1219, 1, N'R14')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928421', N'R14_PVC COATED STEEL 1.0X1219X2400 FM301-7 <U>', 2400, 1219, 1, N'R14')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928422', N'R15_PVC COATED STEEL 1.0X1219X2700 FM301-7 <U>', 2700, 1219, 1, N'R15')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928424', N'R16_PVC COATED STEEL 1.0X1219X2700 FM110-77 <U>', 2700, 1219, 1, N'R16')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928425', N'R17_PVC COATED STEEL 1.0X1219X2400 FM801-28 <U>', 2400, 1219, 1, N'R17')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928426', N'R17_PVC COATED STEEL 1.0X1219X2700 FM801-28 <U>', 2700, 1219, 1, N'R17')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928427', N'R18_PVC COATED STEEL 1.0X1219X2400 FB0501-3C <U>', 2400, 1219, 1, N'R18')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928428', N'R18_PVC COATED STEEL 1.0X1219X2700 FB0501-3C <U>', 2700, 1219, 1, N'R18')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928442', N'MP3_STEEL SHEET AISI304 1.0X1219X2720 MP3 <U>', 2720, 1219, 1, N'MP3')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928443', N'MP4_STEEL SHEET AISI304 1.0X1219X2400 MP4 <U>', 2400, 1219, 1, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928444', N'MP4_STEEL SHEET AISI304 1.0X1219X2720 MP4 <U>', 2720, 1219, 1, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928446', N'MP5_STEEL SHEET AISI304 1.0X1219X2720 MP5 <U>', 2720, 1219, 1, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928449', N'MP6_STEEL SHEET AISI304 1.0X1219X2720 HM-C <U>', 2720, 1219, 1, N'MP6')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928450', N'HQ16_蚀刻STEEL SHEET AISI304 1.0X1219X2400 HQ-16 <U>', 2400, 1219, 1, N'HQ16')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928451', N'ST16_蚀刻STEEL SHEET AISI304 1.0X1219X2720 HQ-16 <U>', 2720, 1219, 1, N'ST16')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928453', N'ST17_蚀刻STEEL SHEET AISI304 1.0X1219X2720 HQ-17 <U>', 2720, 1219, 1, N'ST17')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928453_1.5', N'ST17_1.5_蚀刻STEEL SHEET AISI304 1.5X1219X2720 HQ-17 <U>', 2720, 1219, 1.5, N'ST17_1.5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928455', N'ST18S_蚀刻STEEL SHEET AISI304 1.0X1219X2720 HQ-18 <U>', 2720, 1219, 1, N'ST18S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928457', N'ST15S_蚀刻STEEL SHEET AISI304 1.0X1219X2720 HQ-08 <U>', 2720, 1219, 1, N'ST15S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928458', N'HSGY044_蚀刻STEEL SH. AISI304 1.0X1219X2400 HS-GY044 <U>', 2400, 1219, 1, N'HSGY044')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928459', N'ST19S_蚀刻STEEL SH. AISI304 1.0X1219X2720 HS-GY044 <U>', 2720, 1219, 1, N'ST19S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM928461', N'ST20S_蚀刻STEEL SH. AISI304 1.0X1219X2720 HS-GY062 <U>', 2720, 1219, 1, N'ST20S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM940561', N'ST40_不锈铁PL1.0x1219x2400 Stainless steel AISI439 <439>', 2400, 1219, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM940562', N'ST40_不锈铁PL1.0x1219x2700 Stainless steel AISI439 <439>', 2700, 1219, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM948775', N'P_冷轧板PL1x1219x1480SPCCDT <P>', 1480, 1219, 1, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM948776', N'ST4_银色发丝不锈钢板PL1x1219x1480 <U>', 1480, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM948777', N'MP1_银色镜面板 1X1219X2720MM 1.4301 8N <U>', 2720, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM948778', N'MP2_金色镜面板 1X1219X2720MM 1.4301 8N <U>', 2720, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM972083', N'ST23G_Etched stainless steel(ST23) Golden 1.0X1219X2720MM <U>', 2720, 1219, 1, N'ST23G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM972084', N'ST22S_Etched stainless steel(ST22)Silver 1.0X1219X2720MM <U>', 2720, 1219, 1, N'ST22S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM972085', N'ST21G_Golded HM-SST 1.0X1219X2720MM<U>', 2720, 1219, 1, N'ST21G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM978001', N'ST4_银色发丝不锈钢板PL1x1000x2420 <U>', 2420, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM986460', N'ST40_不锈铁PL1.0x1000x2400 Stainless steel AISI439 <439>', 2400, 1000, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM986511', N'ST4_银色发丝不锈钢板PL1x1000x2500 <U>', 2500, 1000, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM987316', N'ST40_不锈铁PL1.0x1000x2600 Stainless steel AISI439 <439>', 2600, 1000, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM987318', N'ST40_不锈铁PL1.0x1219x2600 Stainless steel AISI439 <439>', 2600, 1219, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM987319', N'ST40_不锈铁PL1.0x1219x1480 Stainless steel AISI439 <439>', 1480, 1219, 1, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'KM990711', N'ST40_不锈铁AISI439 steel plate 1.5*1219*3050 mm', 3050, 1219, 1.5, N'ST40')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_F1_1*2710*420', N'余料_F1_1*2710*420', 2710, 420, 1, N'F1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_MP2_1*2710*350', N'余料_MP2_1*2710*350', 2710, 350, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_MP2_1.5*2970*450', N'余料_MP2_1.5*2970*450', 2970, 450, 1.5, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_MP4_1*2710*420', N'余料_MP4_1*2710*420', 2710, 420, 1, N'MP4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_MP5_1*2710*460', N'余料_MP5_1*2710*460', 2710, 460, 1, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_MP5_1*2710*500', N'余料_MP5_1*2710*500', 2710, 500, 1, N'MP5')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_PS7_1*2710*420', N'余料_PS7_1*2710*420', 2710, 420, 1, N'PS7')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST26S_1*2710*450', N'余料_ST26S_1*2710*450', 2710, 450, 1, N'ST26S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST28S_1*2710*810', N'余料_ST28S_1*2710*810', 2710, 810, 1, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST28S_1.5*3040*570', N'余料_ST28S_1.5*3040*570', 3040, 570, 1.5, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST28S_1.5*3040*810', N'余料_ST28S_1.5*3040*810', 3040, 810, 1.5, N'ST28S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST32S_1*2790*890', N'余料_ST32S_1*2790*890', 2790, 890, 1, N'ST32S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST32S_1.5*3040*440', N'余料_ST32S_1.5*3040*440', 3040, 440, 1.5, N'ST32S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST33G_1.5*3040*390', N'余料_ST33G_1.5*3040*390', 3040, 390, 1.5, N'ST33G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST34G_1.5*3040*460', N'余料_ST34G_1.5*3040*460', 3040, 460, 1.5, N'ST34G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST36G_1.5*3040*400', N'余料_ST36G_1.5*3040*400', 3040, 400, 1.5, N'ST36G')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST38S_1.5*3040*410', N'余料_ST38S_1.5*3040*410', 3040, 410, 1.5, N'ST38S')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST43_1.5*3040*410', N'余料_ST43_1.5*3040*410', 3040, 410, 1.5, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_ST43_1.5*3040*580', N'余料_ST43_1.5*3040*580', 3040, 580, 1.5, N'ST43')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'YL_Z_1.5*2490*720', N'余料_Z_1.5*2490*720', 2490, 720, 1.5, N'Z')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10377', N'ST9_蚀刻不锈钢 PL1.0x1219x2438-ST9 雪花状 <U>', 2438, 1219, 1, N'ST9')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10378', N'ST10_蚀刻不锈钢 PL1.0x1219x2438-ST10 点状 <U>', 2438, 1219, 1, N'ST10')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10379', N'ST11_蚀刻不锈钢 PL1.0x1219x2438-ST11 交叉 <U>', 2438, 1219, 1, N'ST11')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10680', N'P_冷轧板PL1.5X1250X2600-ST1203 SPCC-DT <P>', 2600, 1250, 1.5, N'P')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10734', N'ST4_PL1.5x1219x2438-Brush stainless SUS304 4 <U>', 2438, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10735', N'ST4_PL1x1219x2800-Brush stainless SUS304 No4 <U>', 2800, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK10737', N'ST4_PL1.5x1219x3050 短丝不锈钢(SUS304 NO4) <U>', 3050, 1219, 1.5, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11062', N'MP1_镜面不锈钢板1.5*1219*3050 <U>', 3050, 1219, 1.5, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11113', N'MP1_MIRROR,1X1219X2800MM <U>', 2800, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11118', N'ST9_蚀刻Etched stainless PL 1.0*1219*2720(ST-9) <U>', 2720, 1219, 1, N'ST9')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11119', N'ST10_蚀刻Etched stainless PL 1.0*1219*2720(ST-10) <U>', 2720, 1219, 1, N'ST10')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11120', N'ST11_蚀刻Etched stainless PL 1.0*1219*2720(ST-11) <U>', 2720, 1219, 1, N'ST11')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11144', N'L24_', 3000, 1219, 3, N'L24')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11145', N'L21_', 3000, 1219, 3, N'L21')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11146', N'L22_', 3000, 1219, 3, N'L22')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11147', N'L23_', 3000, 1219, 3, N'L23')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11148', N'L25_', 3000, 1219, 3, N'L25')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11149', N'L26_', 3000, 1219, 3, N'L26')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11177', N'ST4_银色发丝不锈钢板PL1x1219x2420 <U>', 2420, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11178', N'ST4_银色发丝不锈钢板PL1x1219x2520 <U>', 2520, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11179', N'ST4_银色发丝不锈钢板PL1x1219x2620 <U>', 2620, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11180', N'MP1_银色镜面不锈钢板PL1x1219x2420 <U>', 2420, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11181', N'MP1_银色镜面不锈钢板PL1x1219x2520 <U>', 2520, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11182', N'MP1_银色镜面不锈钢板PL1X1219X2620 <U>', 2620, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11183', N'ST2_金色发丝不锈钢板PL1x1219x2400 <U>', 2400, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11185', N'ST2_金色发丝不锈钢板PL1x1219x2600 <U>', 2600, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11186', N'MP2_金色镜面不锈钢板PL1x1219x2400 <U>', 2400, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11187', N'MP2_金色镜面不锈钢板PL1x1219x2500 <U>', 2500, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11188', N'MP2_金色镜面不锈钢板PL1X1219X2580 <U>', 2600, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11192', N'ST2_PL1.5x1219x2400 Golden Brushed S.S', 2400, 1219, 1.5, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11193', N'MP2_PL1.5x1219x2400 Golden Mirror Polis S.S', 2400, 1219, 1.5, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11195', N'MP1_银色镜面不锈钢板PL1.5x1219x2400 <U>', 2400, 1219, 1.5, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11212', N'ST2_金色发丝不锈钢板PL1.5x1219x3300 <U>', 3300, 1219, 1.5, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11213', N'MP2_金色镜面不锈钢板PL1.5x1219x3300 <U>', 3300, 1219, 1.5, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11217', N'ST4_PL1x1219x2784 短丝不锈钢 (SUS304 No4) <U>', 2784, 1219, 1, N'ST4')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11220', N'MP1_PL1x1219x2784 Silver Mirror polished S.S', 2784, 1219, 1, N'MP1')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11223', N'ST2_PL1x1219x2720 金色短丝不锈钢(SUS304 No4) <U>', 2720, 1219, 1, N'ST2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11226', N'MP2_PL1x1219x2784 Golden Mirror polished S.S', 2784, 1219, 1, N'MP2')
GO

INSERT INTO [dbo].[Raw] ([Rawsheet], [Description], [Length], [Width], [Thick], [MType])
VALUES 
  (N'ZK11230', N'ST2_PL1.5x1219x3050 金色短发丝不锈钢 <U>', 3050, 1219, 1.5, N'ST2')
GO

--
-- Data for table dbo.Repeatdoc  (LIMIT 0,500)
--

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:09:13')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:14:17')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 15:15:22')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:09')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:09')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:09')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:21:20')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190410 09:23:03')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:59:57')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:59:57')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:59:57')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:02:18')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:05:49')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:05:49')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:05:49')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:07:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:07:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:07:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:10')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:10')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:10')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:41')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:41')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:09:41')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:10:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:10:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:10:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:11:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:11:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:11:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 15:29:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190411 13:01:21')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:19:58')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:19:58')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:19:58')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:20:42')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:20:42')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:20:42')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:21:23')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:34')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:53')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:53')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:24:53')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:24:54')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:26:38')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:26:38')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:26:38')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:28:14')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:15')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:15')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:15')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:16')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:30:28')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:33:50')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:00')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:44')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:44')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:34:44')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:34:45')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:29')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:29')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:29')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:30')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:37:37')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:40:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:45:02')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:06')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'10', N'浙江物产金属集团有限公司', N'KM50316386', N'冷板1.2*1230*2300MM ST,LL=900,HH<=2100', N'150', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:32')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:32')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest.xlsx', N'Sheet1', '20190409 16:46:32')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'20', N'浙江物产金属集团有限公司', N'KM51107451', N'冷板 1.2*1219*2475', N'140', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'30', N'浙江物产金属集团有限公司', N'KM249098', N'电镀锌板PL1.5x1250x2500 (SECC)', N'50', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537171', N'40', N'浙江物产金属集团有限公司', N'KM51073187', N'冷板 PL1X1250X2630MM', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'10', N'浙江物产金属集团有限公司', N'KM50316387', N'冷板，1.2*1230*2400', N'70', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'20', N'浙江物产金属集团有限公司', N'KM51252504', N'ZINC-COATED STEEL PLATE,1.5X1250X3000', N'90', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'30', N'浙江物产金属集团有限公司', N'KM1332437', N'Cold rolled she.PL1x1219x2600-DC01-Am-O', N'80', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'40', N'浙江物产金属集团有限公司', N'KM50316504', N'冷板PL1X332X2017MM', N'240', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

INSERT INTO [dbo].[Repeatdoc] ([PurchDoc], [Item], [Vendor], [Material], [Shorttext], [Qty], [Unit], [Delivdate], [交付日期], [计划确认人], [发送日期], [FromFile], [SheetName], [InputTime])
VALUES 
  (N'4525537172', N'50', N'浙江物产金属集团有限公司', N'KM50316460', N'冷板PL2x1250x2530 SPCC', N'30', N'PC', N'02/26/2019', N'02/26/2019', N'YE', N'02/25/2019', N'rawtest1.xlsx', N'Sheet1', '20190409 16:46:33')
GO

--
-- Data for table dbo.Store  (LIMIT 0,500)
--

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|10|KM50316386|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'10', N'test', 100, N'1/2', NULL, '20190426 21:47:57', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|10|KM50316386|50|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'10', N'KM50316386', 50, N'2/2', NULL, '20190426 21:47:57', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|20|KM51107451|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'20', N'KM50080444', 100, N'1/1', NULL, '20190426 21:47:57', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|20|KM51107451|40|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'20', N'KM50080444', 40, N'1/1', NULL, '20190426 21:47:57', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|30|KM249098|50|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'30', N'KM249098', 50, N'1/1', NULL, '20190426 21:48:13', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537171|40|KM51073187|70|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537171', N'40', N'KM51073187', 70, N'1/1', NULL, '20190426 21:48:47', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|10|KM50316387|70|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'10', N'KM50316387', 70, N'1/1', NULL, '20190426 21:48:47', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|20|KM51252504|90|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'20', N'KM51252504', 90, N'1/1', NULL, '20190426 21:48:47', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|10|KM51068225|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'10', N'ZK10735', 100, N'1/2', NULL, '20190502 13:23:58.597', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|40|KM50316504|100|1/3', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'40', N'KM50316504', 100, N'1/3', NULL, '20190426 21:49:54', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|40|KM50316504|100|2/3', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'40', N'KM50316504', 100, N'2/3', NULL, '20190426 21:49:54', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|40|KM50316504|40|3/3', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'40', N'ZK11192', 40, N'3/3', NULL, '20190426 21:49:54', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537172|50|KM50316460|30|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537172', N'50', N'KM50316460', 30, N'1/1', NULL, '20190426 21:49:54', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537173|10|KM50316386|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537173', N'10', N'KM50316386', 100, N'1/1', NULL, '20190427 21:55:13', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537173|20|KM51107451|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537173', N'20', N'KM51107451', 100, N'1/1', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537173|40|KM51073187|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537173', N'40', N'KM51073187', 100, N'1/1', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|10|KM50316387|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'10', N'KM50316387', 100, N'1/2', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|10|KM50316387|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'10', N'KM50316387', 100, N'2/2', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|20|KM51252504|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'20', N'KM51252504', 100, N'1/1', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|30|KM1332437|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'30', N'KM1332437', 100, N'1/2', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|40|KM50316504|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'40', N'KM50316504', 100, N'1/2', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|40|KM50316504|50|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'40', N'ZK11177', 50, N'2/2', NULL, '20190427 21:57:28', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|10|KM51068225|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'10', N'KM51068225', 100, N'2/2', NULL, '20190502 13:24:05.390', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|10|KM50316386|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'10', N'KM50316386', 100, N'1/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|10|KM50316386|50|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'10', N'KM50316386', 50, N'2/2', NULL, '20190426 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|20|KM51107451|100|1/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'20', N'KM51107451', 100, N'1/3', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|20|KM51107451|100|2/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'20', N'KM51107451', 100, N'2/3', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|30|KM249098|100|1/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'30', N'KM50082339', 100, N'1/3', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|30|KM249098|100|2/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'30', N'KM249098', 100, N'2/3', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|30|KM249098|100|3/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'30', N'KM249098', 100, N'3/3', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|40|KM51073187|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'40', N'KM51073187', 100, N'1/1', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|10|KM50316387|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'10', N'KM50316387', 100, N'1/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|10|KM50316387|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'10', N'KM50316387', 100, N'2/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|20|KM51252504|100|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'20', N'KM51252504', 100, N'1/1', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|20|KM51134990|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'20', N'ZK11192', 100, N'2/2', NULL, '20190502 13:24:14.503', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|40|KM50316504|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'40', N'KM50316504', 100, N'1/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|40|KM50316504|50|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'40', N'KM50316504', 50, N'2/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|50|KM50316460|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'50', N'KM50316460', 100, N'1/2', NULL, '20190428 22:01:33', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|30|KM51073208|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'30', N'KM51073208', 100, N'2/2', NULL, '20190502 13:24:32.750', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|40|KM51196853|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'40', N'KM51196853', 100, N'1/2', NULL, '20190502 13:24:42.277', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|30|KM1332437|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'30', N'KM1332437', 100, N'2/2', NULL, '20190429 21:44:19.850', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537174|50|KM50316460|30|1/1', N'C01', NULL, NULL, NULL, NULL, N'4525537174', N'50', N'KM50316460', 30, N'1/1', NULL, '20190430 22:44:49.267', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537175|20|KM51107451|50|3/3', N'C01', NULL, NULL, NULL, NULL, N'4525537175', N'20', N'KM51107451', 50, N'3/3', NULL, '20190501 10:44:21.947', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537178|40|KM51196853|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537178', N'40', N'KM51196853', 100, N'2/2', NULL, '20190502 13:24:49.267', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537176|50|KM50316460|50|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537176', N'50', N'KM50316460', 50, N'2/2', NULL, '20190429 16:13:39.497', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|10|KM50080448|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'10', N'KM50080448', 100, N'1/2', NULL, '20190502 13:24:59.573', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|10|KM50080448|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'10', N'KM50080448', 100, N'2/2', NULL, '20190502 13:25:10.260', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|30|KM928444|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'30', N'KM928444', 100, N'1/2', NULL, '20190502 13:25:41.787', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|30|KM928444|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'30', N'KM928444', 100, N'2/2', NULL, '20190502 13:25:47.210', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|40|KM50080428|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'40', N'KM50080428', 100, N'2/2', NULL, '20190502 13:25:59.330', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|50|KM50080436|100|1/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'50', N'KM50080436', 100, N'1/2', NULL, '20190502 13:26:04.570', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|50|KM50080436|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'50', N'KM50080436', 100, N'2/2', NULL, '20190502 13:26:12.997', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|60|KM50080436|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'60', N'KM50080436', 100, N'2/2', NULL, '20190503 13:14:35.830', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (N'C01|4525537179|70|KM50080436|100|2/2', N'C01', NULL, NULL, NULL, NULL, N'4525537179', N'70', N'KM50080436', 100, N'2/2', NULL, '20190505 14:12:49.210', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 6, N'14+A+1+HMC_bei', NULL, NULL, N'ZK10734', -3, N'10/25', NULL, '20190507 10:04:11.857', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 7, N'14+A+2E', NULL, NULL, N'KM50082349', -9, N'11/25', NULL, '20190507 10:04:13.243', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 8, N'14+A+2', NULL, NULL, N'KM51442537', -2, N'13/25', NULL, '20190507 10:04:14.553', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 9, N'14+A+3E', NULL, NULL, N'KM51068232', -8, N'17/25', NULL, '20190507 10:04:16.007', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 9, N'14+A+3E', NULL, NULL, N'KM51068219', -2, N'17/25', NULL, '20190507 10:04:16.007', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 10, N'14+A+1', NULL, NULL, N'KM51073219', -8, N'03/24', NULL, '20190507 10:04:23.230', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 10, N'14+A+1', NULL, NULL, N'KM50080432', -4, N'03/24', NULL, '20190507 10:04:23.230', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 11, N'14+A+2+HMC_nan', NULL, NULL, N'KM51073215', -8, N'09/24', NULL, '20190507 10:04:26.750', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 11, N'14+A+2+HMC_nan', NULL, NULL, N'KM51073202', -12, N'09/24', NULL, '20190507 10:04:26.750', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 11, N'14+A+2+HMC_nan', NULL, NULL, N'KM50082342', -2, N'09/24', NULL, '20190507 10:04:26.750', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 11, N'14+A+2+HMC_nan', NULL, NULL, N'ZK11182', -4, N'09/24', NULL, '20190507 10:04:26.750', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 12, N'14+A+2+HMC_nan', NULL, NULL, N'KM51073219', -3, N'10/24', NULL, '20190507 10:04:28.350', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 12, N'14+A+2+HMC_nan', NULL, NULL, N'KM51442534', -12, N'10/24', NULL, '20190507 10:04:28.350', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 12, N'14+A+2+HMC_nan', NULL, NULL, N'ZK11062', -8, N'10/24', NULL, '20190507 10:04:28.350', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 13, N'14+A+4+HMC_nan', NULL, NULL, N'KM50029769', -4, N'16/24', NULL, '20190507 10:04:30.327', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 14, N'14+A+5+HMC_bei', NULL, NULL, N'KM51073217', -6, N'22/24', NULL, '20190507 10:04:32.513', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 14, N'14+A+5+HMC_bei', NULL, NULL, N'KM51442882', -3, N'22/24', NULL, '20190507 10:04:32.513', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 15, N'14+A+5+HMC_bei', NULL, NULL, N'KM50082344', -4, N'20/24', NULL, '20190507 13:08:38.930', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 16, N'14+A+5+HMC_bei', NULL, NULL, N'KM50082341', -1, N'21/24', NULL, '20190507 13:08:41.810', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 18, N'14+A+5+HMC_bei', NULL, NULL, N'KM51073219', -14, N'24/24', NULL, '20190507 13:08:55.717', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 17, N'14+A+5+HMC_bei', NULL, NULL, N'KM51073200', -16, N'23/24', NULL, '20190507 13:08:47.277', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 26, N'14+A+2', NULL, NULL, N'KM51168662', -21, N'07/24', NULL, '20190509 09:25:31.203', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51541010', -8, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51541040', -2, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51108335', -20, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51108431', -5, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51107483', -2, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 27, N'14+A+4E', NULL, NULL, N'KM51108148', -2, N'25/25', NULL, '20190509 09:25:40.607', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 28, N'14+A+1', NULL, NULL, N'KM51073202', -7, N'07/25', NULL, '20190509 09:25:54.440', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 28, N'14+A+1', NULL, NULL, N'KM50002752', -6, N'07/25', NULL, '20190509 09:25:54.440', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 1, N'14+A+1', NULL, NULL, N'KM50082345', -4, N'01/24', NULL, '20190505 16:48:04.340', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 1, N'14+A+1', NULL, NULL, N'KM50082338', -1, N'01/24', NULL, '20190505 16:48:04.340', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 2, N'14+A+1', NULL, NULL, N'KM50002753', -2, N'02/24', NULL, '20190505 16:48:06.903', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 3, N'14+A+1E', NULL, NULL, N'KM50082349', -10, N'01/25', NULL, '20190505 16:48:15.417', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 4, N'14+A+1E', NULL, NULL, N'KM51108373', -5, N'02/25', NULL, '20190505 16:48:17.510', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 4, N'14+A+1E', NULL, NULL, N'KM51108371', -3, N'02/25', NULL, '20190505 16:48:17.510', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 19, N'14+A+3+HMC_bei', NULL, NULL, N'KM50029769', -4, N'12/24', NULL, '20190507 13:17:16.343', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 20, N'14+A+3+HMC_bei', NULL, NULL, N'KM50082346', -16, N'13/24', NULL, '20190507 13:17:21.683', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 21, N'14+A+3+HMC_bei', NULL, NULL, N'KM51442535', -43, N'14/24', NULL, '20190507 13:17:23.633', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'A', 19, 22, N'14+A+4+HMC_nan', NULL, NULL, N'KM50029769', -10, N'15/24', NULL, '20190507 13:17:28.517', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 23, N'14+A+3+HMC_bei', NULL, NULL, N'KM50009448', -1, N'20/25', NULL, '20190507 13:17:53.617', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 23, N'14+A+3+HMC_bei', NULL, NULL, N'KM50029824', -1, N'20/25', NULL, '20190507 13:17:53.617', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 24, N'14+A+3+HMC_bei', NULL, NULL, N'KM50082349', -13, N'21/25', NULL, '20190507 13:17:55.640', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 24, N'14+A+3+HMC_bei', NULL, NULL, N'KM50316446', -3, N'21/25', NULL, '20190507 13:17:55.640', NULL, N'Administrator')
GO

INSERT INTO [dbo].[Store] ([ID], [Code], [Line], [YearID], [DelivID], [Lot], [PO], [Item], [Rawsheet], [Qty], [PackID], [NeedQty], [InputTime], [Memo], [UserID])
VALUES 
  (NULL, N'C02', N'M', 19, 25, N'14+A+3+HMC_bei', NULL, NULL, N'KM51382833', -10, N'22/25', NULL, '20190507 13:17:57.870', NULL, N'Administrator')
GO

--
-- Data for table dbo.StoreBar2  (LIMIT 0,500)
--

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1', N'A', N'01/24', 1, N'C02|A|01/24|19|14+A+1|KM50082345|4|14+A+1|KM50082338|1')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1', N'A', N'02/24', 2, N'C02|A|02/24|19|14+A+1|KM50002753|2')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1E', N'M', N'01/25', 3, N'C02|M|01/25|19|14+A+1E|KM50082349|10')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1E', N'M', N'02/25', 4, N'C02|M|02/25|19|14+A+1E|KM51108373|5|14+A+1E|KM51108371|3')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1+HMC_bei', N'M', N'10/25', 6, N'C02|M|10/25|19|14+A+1+HMC_bei|ZK10734|3')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+2E', N'M', N'11/25', 7, N'C02|M|11/25|19|14+A+2E|KM50082349|9')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+2', N'M', N'13/25', 8, N'C02|M|13/25|19|14+A+2|KM51442537|2')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3E', N'M', N'17/25', 9, N'C02|M|17/25|19|14+A+3E|KM51068232|8|14+A+3E|KM51068219|2')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1', N'A', N'03/24', 10, N'C02|A|03/24|19|14+A+1|KM51073219|8|14+A+1|KM50080432|4')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+2+HMC_nan', N'A', N'09/24', 11, N'C02|A|09/24|19|14+A+2+HMC_nan|KM51073215|8|14+A+2+HMC_nan|KM51073202|12|14+A+2+HMC_nan|KM50082342|2|14+A+2+HMC_nan|ZK11182|4')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+2+HMC_nan', N'A', N'10/24', 12, N'C02|A|10/24|19|14+A+2+HMC_nan|KM51073219|3|14+A+2+HMC_nan|KM51442534|12|14+A+2+HMC_nan|ZK11062|8')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+4+HMC_nan', N'A', N'16/24', 13, N'C02|A|16/24|19|14+A+4+HMC_nan|KM50029769|4')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+5+HMC_bei', N'A', N'22/24', 14, N'C02|A|22/24|19|14+A+5+HMC_bei|KM51073217|6|14+A+5+HMC_bei|KM51442882|3')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+5+HMC_bei', N'A', N'20/24', 15, N'C02|A|20/24|19|14+A+5+HMC_bei|KM50082344|4')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+5+HMC_bei', N'A', N'21/24', 16, N'C02|A|21/24|19|14+A+5+HMC_bei|KM50082341|1')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+5+HMC_bei', N'A', N'24/24', 18, N'C02|A|24/24|19|14+A+5+HMC_bei|KM51073219|14')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+5+HMC_bei', N'A', N'23/24', 17, N'C02|A|23/24|19|14+A+5+HMC_bei|KM51073200|16')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'A', N'12/24', 19, N'C02|A|12/24|19|14+A+3+HMC_bei|KM50029769|4')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'A', N'13/24', 20, N'C02|A|13/24|19|14+A+3+HMC_bei|KM50082346|16')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'A', N'14/24', 21, N'C02|A|14/24|19|14+A+3+HMC_bei|KM51442535|43')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+4+HMC_nan', N'A', N'15/24', 22, N'C02|A|15/24|19|14+A+4+HMC_nan|KM50029769|10')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'M', N'20/25', 23, N'C02|M|20/25|19|14+A+3+HMC_bei|KM50009448|1|14+A+3+HMC_bei|KM50029824|1')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'M', N'21/25', 24, N'C02|M|21/25|19|14+A+3+HMC_bei|KM50082349|13|14+A+3+HMC_bei|KM50316446|3')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+3+HMC_bei', N'M', N'22/25', 25, N'C02|M|22/25|19|14+A+3+HMC_bei|KM51382833|10')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+2', N'A', N'07/24', 26, N'C02|A|07/24|19|14+A+2|KM51168662|21')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+4E', N'M', N'25/25', 27, N'C02|M|25/25|19|14+A+4E|KM51541010|8|14+A+4E|KM51541040|2|14+A+4E|KM51108335|20|14+A+4E|KM51108431|5|14+A+4E|KM51107483|2|14+A+4E|KM51108148|2')
GO

INSERT INTO [dbo].[StoreBar2] ([YearID], [Lot], [Line], [PackID], [DelivID], [Bar2ID])
VALUES 
  (19, N'14+A+1', N'M', N'07/25', 28, N'C02|M|07/25|19|14+A+1|KM51073202|7|14+A+1|KM50002752|6')
GO

--
-- Data for table sys.trace_xe_action_map  (LIMIT 0,500)
--

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (3, N'sqlserver', N'database_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (4, N'sqlserver', N'transaction_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (5, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (6, N'sqlserver', N'nt_username')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (7, N'sqlserver', N'nt_username')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (8, N'sqlserver', N'client_hostname')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (9, N'sqlserver', N'client_pid')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (10, N'sqlserver', N'client_app_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (11, N'sqlserver', N'server_principal_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (12, N'sqlserver', N'session_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (26, N'sqlserver', N'server_instance_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (35, N'sqlserver', N'database_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (41, N'sqlserver', N'server_principal_sid')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (49, N'sqlserver', N'request_id')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (50, N'sqlserver', N'transaction_sequence')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (51, N'package0', N'event_sequence')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (60, N'sqlserver', N'is_system')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (61, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (63, N'sqlserver', N'tsql_frame')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (64, N'sqlserver', N'session_server_principal_name')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (65, N'sqlserver', N'plan_handle')
GO

INSERT INTO [sys].[trace_xe_action_map] ([trace_column_id], [package_name], [xe_action_name])
VALUES 
  (66, N'sqlserver', N'session_resource_group_id')
GO

--
-- Data for table sys.trace_xe_event_map  (LIMIT 0,500)
--

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (10, N'sqlserver', N'rpc_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (11, N'sqlserver', N'rpc_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (12, N'sqlserver', N'sql_batch_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (13, N'sqlserver', N'sql_batch_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (14, N'sqlserver', N'login')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (15, N'sqlserver', N'logout')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (16, N'sqlserver', N'attention')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (17, N'sqlserver', N'existing_connection')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (18, N'sqlserver', N'server_start_stop')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (19, N'sqlserver', N'dtc_transaction')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (21, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (22, N'sqlserver', N'errorlog_written')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (23, N'sqlserver', N'lock_released')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (24, N'sqlserver', N'lock_acquired')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (25, N'sqlserver', N'lock_deadlock')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (26, N'sqlserver', N'lock_cancel')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (27, N'sqlserver', N'lock_timeout')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (28, N'sqlserver', N'degree_of_parallelism')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (33, N'sqlos', N'exception_ring_buffer_recorded')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (34, N'sqlserver', N'sp_cache_miss')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (35, N'sqlserver', N'sp_cache_insert')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (36, N'sqlserver', N'sp_cache_remove')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (37, N'sqlserver', N'sql_statement_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (38, N'sqlserver', N'sp_cache_hit')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (40, N'sqlserver', N'sql_statement_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (41, N'sqlserver', N'sql_statement_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (42, N'sqlserver', N'module_start')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (43, N'sqlserver', N'module_end')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (44, N'sqlserver', N'sp_statement_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (45, N'sqlserver', N'sp_statement_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (46, N'sqlserver', N'object_created')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (47, N'sqlserver', N'object_deleted')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (50, N'sqlserver', N'sql_transaction')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (51, N'sqlserver', N'scan_started')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (52, N'sqlserver', N'scan_stopped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (53, N'sqlserver', N'cursor_open')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (54, N'sqlserver', N'transaction_log')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (55, N'sqlserver', N'hash_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (58, N'sqlserver', N'auto_stats')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (59, N'sqlserver', N'lock_deadlock_chain')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (60, N'sqlserver', N'lock_escalation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (61, N'sqlserver', N'oledb_error')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (67, N'sqlserver', N'execution_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (68, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (69, N'sqlserver', N'sort_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (70, N'sqlserver', N'cursor_prepare')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (71, N'sqlserver', N'prepare_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (72, N'sqlserver', N'exec_prepared_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (73, N'sqlserver', N'unprepare_sql')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (74, N'sqlserver', N'cursor_execute')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (75, N'sqlserver', N'cursor_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (76, N'sqlserver', N'cursor_implicit_conversion')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (77, N'sqlserver', N'cursor_unprepare')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (78, N'sqlserver', N'cursor_close')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (79, N'sqlserver', N'missing_column_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (80, N'sqlserver', N'missing_join_predicate')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (81, N'sqlserver', N'server_memory_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (82, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (83, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (84, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (85, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (86, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (87, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (88, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (89, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (90, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (91, N'sqlserver', N'user_event')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (92, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (93, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (94, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (95, N'sqlserver', N'database_file_size_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (96, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (97, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (98, N'sqlserver', N'query_post_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (100, N'sqlserver', N'rpc_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (119, N'sqlserver', N'oledb_call')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (120, N'sqlserver', N'oledb_query_interface')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (121, N'sqlserver', N'oledb_data_read')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (122, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (124, N'sqlserver', N'broker_conversation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (125, N'sqlserver', N'deprecation_announcement')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (126, N'sqlserver', N'deprecation_final_support')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (127, N'sqlserver', N'exchange_spill')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (136, N'sqlserver', N'broker_conversation_group')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (137, N'sqlserver', N'blocked_process_report')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (138, N'ucs', N'ucs_connection_setup')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (139, N'sqlserver', N'broker_forwarded_message_sent')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (140, N'sqlserver', N'broker_forwarded_message_dropped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (141, N'sqlserver', N'broker_message_classify')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (142, N'sqlserver', N'broker_transmission_exception')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (143, N'sqlserver', N'broker_queue_disabled')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (144, N'sqlserver', N'broker_mirrored_route_state_changed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (146, N'sqlserver', N'query_post_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (148, N'sqlserver', N'xml_deadlock_report')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (149, N'sqlserver', N'broker_remote_message_acknowledgement')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (151, N'ucs', N'ucs_connection_setup')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (155, N'sqlserver', N'full_text_crawl_started')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (156, N'sqlserver', N'full_text_crawl_stopped')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (157, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (160, N'sqlserver', N'broker_message_undeliverable')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (161, N'sqlserver', N'broker_corrupted_message')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (162, N'sqlserver', N'error_reported')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (163, N'sqlserver', N'broker_activation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (164, N'sqlserver', N'object_altered')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'query_cache_removal_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'query_pre_execution_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (165, N'sqlserver', N'uncached_sql_batch_statistics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (166, N'sqlserver', N'sql_statement_recompile')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (167, N'sqlserver', N'database_mirroring_state_change')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (168, N'sqlserver', N'query_post_compilation_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (169, N'sqlserver', N'query_post_compilation_showplan')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (181, N'sqlserver', N'begin_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (182, N'sqlserver', N'begin_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (183, N'sqlserver', N'promote_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (184, N'sqlserver', N'promote_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (185, N'sqlserver', N'commit_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (186, N'sqlserver', N'commit_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (187, N'sqlserver', N'rollback_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (188, N'sqlserver', N'rollback_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (189, N'sqlserver', N'lock_timeout_greater_than_0')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (190, N'sqlserver', N'progress_report_online_index_operation')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (191, N'sqlserver', N'save_tran_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (192, N'sqlserver', N'save_tran_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (193, N'sqlserver', N'background_job_error')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (194, N'sqlserver', N'oledb_provider_information')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (196, N'sqlserver', N'assembly_load')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (198, N'sqlserver', N'xquery_static_type')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (199, N'sqlserver', N'qn_subscription')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (200, N'sqlserver', N'qn_parameter_table')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (201, N'sqlserver', N'qn_template')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (202, N'sqlserver', N'qn_dynamics')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (212, N'sqlserver', N'bitmap_disabled_warning')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (213, N'sqlserver', N'database_suspect_data_page')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (214, N'sqlserver', N'cpu_threshold_exceeded')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (215, N'sqlserver', N'preconnect_starting')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (216, N'sqlserver', N'preconnect_completed')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (217, N'sqlserver', N'plan_guide_successful')
GO

INSERT INTO [sys].[trace_xe_event_map] ([trace_event_id], [package_name], [xe_event_name])
VALUES 
  (218, N'sqlserver', N'plan_guide_unsuccessful')
GO

--
-- Data for table dbo.UserRights  (LIMIT 0,500)
--

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'发料', N'buttonc2deliv', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'发料查询', N'buttonc2query', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'管理员', N'no', 1)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'今日状态', N'buttonc1today', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'库存查询', N'buttonrawquery', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'权限设定', N'buttonrightsetting', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'收货', N'buttonc1', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'收货查询', N'buttonc1query', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'Administrator', N'数据维护', N'buttondatamaintain', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'发料', N'buttonc2deliv', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'发料查询', N'buttonc2query', 1)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'管理员', N'no', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'今日状态', N'buttonc1today', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'库存查询', N'buttonrawquery', 1)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'权限设定', N'buttonrightsetting', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'收货', N'buttonc1', 0)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'收货查询', N'buttonc1query', 1)
GO

INSERT INTO [dbo].[UserRights] ([UserID], [ControlTag], [ControlName], [IsRight])
VALUES 
  (N'guest', N'数据维护', N'buttondatamaintain', 0)
GO

--
-- Data for table dbo.Users  (LIMIT 0,500)
--

INSERT INTO [dbo].[Users] ([UserID], [Password], [Functions])
VALUES 
  (N'Administrator', N'e10adc3949ba59abbe56e057f20f883e', NULL)
GO

INSERT INTO [dbo].[Users] ([UserID], [Password], [Functions])
VALUES 
  (N'guest', N'25f9e794323b453885f5181f1b624d0b', NULL)
GO

--
-- Data for table dbo.VendorList  (LIMIT 0,500)
--

INSERT INTO [dbo].[VendorList] ([VendorID], [Descript], [ShortDes], [GreenTime])
VALUES 
  (N'7100', N'test', N'test', N'15:20')
GO

INSERT INTO [dbo].[VendorList] ([VendorID], [Descript], [ShortDes], [GreenTime])
VALUES 
  (N'710000000', N'浙江物产金属集团有限公司', N'浙江物产金属集团有限公司', N'19:30')
GO

--
-- Definition for indices : 
--

ALTER TABLE [dbo].[C01]
ADD CONSTRAINT [PK_C01] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Purdoc]
ADD CONSTRAINT [PK_Purdoc] 
PRIMARY KEY CLUSTERED ([PurchDoc], [Item])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Rack]
ADD CONSTRAINT [PK_Rack] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[RackLayout]
ADD CONSTRAINT [PK_RackLayout] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[RackRaw]
ADD CONSTRAINT [PK_RackRaw] 
PRIMARY KEY CLUSTERED ([ID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Raw]
ADD CONSTRAINT [PK_Raw] 
PRIMARY KEY CLUSTERED ([Rawsheet])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[UserRights]
ADD CONSTRAINT [PK_UserRights] 
PRIMARY KEY CLUSTERED ([UserID], [ControlTag])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users] 
PRIMARY KEY CLUSTERED ([UserID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



ALTER TABLE [dbo].[VendorList]
ADD CONSTRAINT [PK_VendorList] 
PRIMARY KEY CLUSTERED ([VendorID])
WITH (
  PAD_INDEX = OFF,
  IGNORE_DUP_KEY = OFF,
  STATISTICS_NORECOMPUTE = OFF,
  ALLOW_ROW_LOCKS = ON,
  ALLOW_PAGE_LOCKS = ON)
ON [PRIMARY]
GO



