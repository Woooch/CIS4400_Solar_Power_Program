IF DB_ID('') IS NULL EXECUTE('CREATE DATABASE [];');
GO

USE [];
GO

IF SCHEMA_ID('SolarEnergyProgramDWH') IS NULL EXECUTE('CREATE SCHEMA [SolarEnergyProgramDWH];');
GO

CREATE  TABLE SolarEnergyProgramDWH.Dim_DateTime ( 
	Date_ID              INT      NOT NULL,
	Year_Num             INT      NULL,
	Quarter_Num          INT      NULL,
	Month_Num            INT      NULL,
	Day_Num              INT      NULL,
	Week_Of_Year         INT      NULL,
	Week_Of_Week         INT      NULL,
	CONSTRAINT pk_Dim_DateTime PRIMARY KEY  ( Date_ID ) 
 );
GO

CREATE  TABLE SolarEnergyProgramDWH.Dim_Equipment ( 
	Equipment_ID         INT      NOT NULL,
	Primary_PV_Module_Manufacturer VARCHAR(50)      NULL,
	PV_Module_Model_Number VARCHAR(50)      NULL,
	Primary_Inverter_Manufacturer VARCHAR(50)      NULL,
	Primary_Inverter_Model_Number VARCHAR(50)      NULL,
	CONSTRAINT pk_Dim_Equipment PRIMARY KEY  ( Equipment_ID ) 
 );
GO

CREATE  TABLE SolarEnergyProgramDWH.Dim_GeographicLocation ( 
	GeographicLocation_ID INT      NOT NULL,
	Street_Address       VARCHAR(100)      NULL,
	City                 VARCHAR(50)      NULL,
	County               VARCHAR(50)      NULL,
	State                VARCHAR(2)      NULL,
	Zipcode              VARCHAR(5)      NULL,
	Longtitude           VARCHAR(50)      NULL,
	Latitude             VARCHAR(50)      NULL,
	Incorporated_Municipality VARCHAR(50)      NULL,
	Municipality_Type    VARCHAR(50)      NULL,
	CONSTRAINT pk_Dim_GeographicLocation PRIMARY KEY  ( GeographicLocation_ID ) 
 );
GO

CREATE  TABLE SolarEnergyProgramDWH.Dim_Project ( 
	Project_ID           BIGINT      NOT NULL,
	Project_Number       INT      NULL,
	Purchase_Type        VARCHAR(50)      NULL,
	Sector               VARCHAR(50)      NULL,
	Program_Type         VARCHAR(50)      NULL,
	Contracter           VARCHAR(50)      NULL,
	Electric_Utility_Company VARCHAR(50)      NULL,
	CONSTRAINT pk_Dim_Project PRIMARY KEY  ( Project_ID ) 
 );
GO

CREATE  TABLE SolarEnergyProgramDWH.Dim_ProjectStatus ( 
	ProjectStatus        VARCHAR(50)      NULL,
	CONSTRAINT pk_ProjectStatus UNIQUE ( ProjectStatus ) ,
	CONSTRAINT pk_ProjectStatus_001 UNIQUE ( ProjectStatus ) 
 );
GO

CREATE  TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ( 
	Fact_ID              BIGINT      NOT NULL,
	Project_Cost         DECIMAL(10,2)      NULL,
	Affordable_Multifamily_Housing_Incentive DECIMAL(10,2)      NULL,
	Total_NYSERDA_Incentive DECIMAL(10,2)      NULL,
	Affordable_Solar_Residential_Adder DECIMAL(10,2)      NULL,
	[Brownfield/Landfill_Adder] DECIMAL(10,2)      NULL,
	Canopy_Added         DECIMAL(10,2)      NULL,
	Community_Adder      DECIMAL(10,2)      NULL,
	Expanded_Solar_For_All_Adder DECIMAL(10,2)      NULL,
	Inclusive_Community_Solar_Adder DECIMAL(10,2)      NULL,
	Prevailing_Wage_Adder DECIMAL(10,2)      NULL,
	Expected_kWH_Annual_Production DECIMAL(10,2)      NULL,
	Total_Nameplate_kW_DC DECIMAL(10,2)      NULL,
	Total_Inverter_Quantity INT      NULL,
	Total_PV_Module_Quantity INT      NULL,
	Project_Address_ID   INT      NOT NULL,
	Reporting_Date_ID    INT      NOT NULL,
	Date_Application_Recieved_ID INT      NOT NULL,
	Date_Completed_ID    INT      NOT NULL,
	Project_Status_ID    INT      NOT NULL,
	Project_ID           INT      NOT NULL,
	Equipment_Description_ID INT      NOT NULL,
	CONSTRAINT pk_Fact_SolarEnergyDevelopment PRIMARY KEY  ( Fact_ID ) 
 );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_ProjectStatus FOREIGN KEY ( Project_Status_ID ) REFERENCES SolarEnergyProgramDWH.Dim_ProjectStatus( ProjectStatus );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_Project FOREIGN KEY ( Project_ID ) REFERENCES SolarEnergyProgramDWH.Dim_Project( Project_ID );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_DateTime FOREIGN KEY ( Date_Completed_ID ) REFERENCES SolarEnergyProgramDWH.Dim_DateTime( Date_ID );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_DateTime_0 FOREIGN KEY ( Date_Application_Recieved_ID ) REFERENCES SolarEnergyProgramDWH.Dim_DateTime( Date_ID );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_GeographicLocation FOREIGN KEY ( Project_Address_ID ) REFERENCES SolarEnergyProgramDWH.Dim_GeographicLocation( GeographicLocation_ID );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_DateTime_1 FOREIGN KEY ( Reporting_Date_ID ) REFERENCES SolarEnergyProgramDWH.Dim_DateTime( Date_ID );
GO

ALTER TABLE SolarEnergyProgramDWH.Fact_SolarEnergyDevelopment ADD CONSTRAINT fk_Fact_SolarEnergyDevelopment_Dim_Equipment FOREIGN KEY ( Equipment_Description_ID ) REFERENCES SolarEnergyProgramDWH.Dim_Equipment( Equipment_ID );
GO
