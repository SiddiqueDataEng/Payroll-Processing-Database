/*
 * Payroll Processing Database
 * Project #5 - Complete Database Implementation
 * SQL Server 2008/2012
 * Technology: MSSQL, SSIS
 * Created: 2011
 */

USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'PayrollDB')
BEGIN
    ALTER DATABASE PayrollDB SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE PayrollDB;
END
GO

CREATE DATABASE PayrollDB
ON PRIMARY
(
    NAME = 'PayrollDB_Data',
    FILENAME = 'C:\SQLData\PayrollDB_Data.mdf',
    SIZE = 100MB,
    MAXSIZE = 5GB,
    FILEGROWTH = 10MB
)
LOG ON
(
    NAME = 'PayrollDB_Log',
    FILENAME = 'C:\SQLData\PayrollDB_Log.ldf',
    SIZE = 50MB,
    MAXSIZE = 1GB,
    FILEGROWTH = 5MB
);
GO

ALTER DATABASE PayrollDB SET RECOVERY SIMPLE;
ALTER DATABASE PayrollDB SET AUTO_UPDATE_STATISTICS ON;
GO

USE PayrollDB;
GO

PRINT 'Database PayrollDB created successfully';
PRINT 'Project: Payroll Processing Database';
PRINT 'Description: Automated payroll calculations with deductions and allowances';
GO
