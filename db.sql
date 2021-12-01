-- phpMyAdmin SQL Dump
-- version 4.0.10.7
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 20, 2015 at 01:43 AM
-- Server version: 5.5.34-cll-lve
-- PHP Version: 5.4.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `wrpracti_bookinfo`
--

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

create table REGIONS (
	REGION_ID INT(7) primary key auto_increment,
	REGION_NAME VARCHAR(50) not null) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `countries`
-- Establish COUNTRY_ID to INT for foreign key relationship
-- Added new column COUNTRY_CODE

create table COUNTRIES(COUNTRY_ID INT(7) primary key auto_increment,
	REGION_ID INT(7) not null,
	COUNTRY_NAME VARCHAR(50) not null,
	COUNTRY_CODE VARCHAR(2) not null,
	foreign key(REGION_ID) references REGION(REGION_ID) ON UPDATE CASCADE ON DELETE RESTRICT) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;


--
-- Table structure for table `locations`
--

create table LOCATIONS (
	LOCATION_ID INT(7) primary key auto_increment,
	COUNTRY_ID INT(7) not null,
	STREET_ADDRESS VARCHAR(50) not null,
	POSTAL_CODE INT(10) not null,
	CITY VARCHAR(50) not null,
	STATE_PROVINCE VARCHAR(50) not null,
	foreign key(COUNTRY_ID) references COUNTRY(COUNTRY_ID) ON UPDATE CASCADE ON DELETE RESTRICT) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `jobs`
--

create table JOBS (
	JOB_ID INT(7) primary key auto_increment,
	JOB_TITLE VARCHAR(50) not null,
	MIN_SALARY DECIMAL(7,2) not null,
	MAX_SALARY DECIMAL(7,2) not null) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
--
-- Table structure for table `departments`
--

create table DEPARTMENTS (
	DEPARTMENT_ID INT(7) primary key auto_increment,
	LOCATION_ID INT(7) not null,
	DEPARTMENT_NAME VARCHAR(50) not null,
	foreign key(LOCATION_ID) references LOCATION(LOCATION_ID))
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	

--
-- Table structure for table `employees`
--

create table EMPLOYEES (
	EMPLOYEE_ID INT(7) not null primary key auto_increment,
	FIRST_NAME VARCHAR(50),
	LAST_NAME VARCHAR(50),
	EMAIL VARCHAR(50) unique key,
	PHONE VARCHAR(50) unique key) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Table structure for table `job_history`
-- Added STATUS column for SOFT DELETE Purposes

create table JOB_HISTORY (
	JOB_HISTORY_ID INT(7) not null primary key auto_increment,
	JOB_ID INT(7) not null,
	EMPLOYEE_ID INT(7) not null,
	DEPARTMENT_ID INT(7) not null,
	START_DATE DATE not null,
	END_DATE DATE not null,
	HIRE_DATE DATE not null,
	SALARY DECIMAL(7,2) not null,
	COMMISSION_PCT INT(3), 
	STATUS BOOLEAN not null,
	foreign key(EMPLOYEE_ID) references EMPLOYEE(EMPLOYEE_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
	foreign key(DEPARTMENT_ID) references DEPARTMENT(DEPARTMENT_ID) ON UPDATE CASCADE ON DELETE RESTRICT,
	foreign key(JOB_ID) references JOB(JOB_ID) ON UPDATE CASCADE ON DELETE RESTRICT) 
	ENGINE=MyISAM DEFAULT CHARSET=latin1;
	
-- Create index

CREATE INDEX EMP_PID ON employees (employee_id);

CREATE INDEX JHIST_PID ON JOB_HISTORY (JOB_HISTORY_ID);

CREATE INDEX DEPT_PID ON DEPARTMENTS (DEPARTMENT_ID);
	
CREATE INDEX JOB_PID ON JOBS (JOB_ID);

CREATE INDEX LOC_PID ON LOCATIONS (LOCATION_ID);
	
CREATE INDEX CNTRY_PID ON COUNTRIES (COUNTRY_ID);

CREATE INDEX RGN_PID ON REGIONS (REGION_ID);
	
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

