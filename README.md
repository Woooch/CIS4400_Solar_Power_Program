# CIS4400 Homework Assignment1

## Business Requirements
- What program is the best in each year providing deductions for solar system installments?
- Which neighborhood is growing in green energy usage?
- Can an application be built to provide information on the best programs to apply for your benefits and; primarily, the cost to energy generated?

## Data Requirements
- Data source
	-Solar Panel Programs Report by NYSERDA [https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j/about_data](https://data.ny.gov/Energy-Environment/Solar-Electric-Programs-Reported-by-NYSERDA-Beginn/3x8r-34rs/data_preview)

- Summary
	- Dataset includes information on completed and pipelined solar electric projects supported by the New York State Energy Research and Development Authority.
 - Probable problems
	- The dataset contains many zeros or blanks, which will require finding a solution so as not to cause problems for aggregations.
   
## Functional Requirements
- OLAP process
	- Allows for drill-down, roll-up, hierarchies, etc
- Business Intelligence:
	- Support business intelligence and decision-making through report generation, CSV files, dashboards, and visualizations.
- Friendly user interface that is easy to train on and easy to use.
- Security/Access
	- Grant proper access to the right people
- Scalability
	- In terms of a new table being added, the data warehouse should be able to support that with no conflicts

## Information Architecture
![Information Architecture](https://github.com/user-attachments/assets/a85ce65d-8e91-4441-919b-f7de645d8e99)


## Data Architecture
![Data Architecture](https://github.com/user-attachments/assets/612e01e7-28c9-4f7d-b9a1-35400d72c998)


## Dimensional Modeling
![image](https://github.com/user-attachments/assets/781b9401-7033-4075-ad67-c104a8893667)

# Homework Assignment 2

## Data Sourcing and Data Storage
Data was scrapped from OpenData NYC using Python and then stored within temporary storage inside Azure blob storage. After moving everything into the temp storage, I established a link between Snowflake and Azure blob storage, first staging all the files, readjusting the data types, compiling, and creating a raw table where my transformations can begin.

![image](https://github.com/user-attachments/assets/8f613b8a-0183-4fee-9c87-b8580b600dec)
![image](https://github.com/user-attachments/assets/c301c7fe-fbcb-4319-aaf5-d38ea552a23e)

## Transformation
Following the ELT process, all of the data transformation was created using DBT cloud. This portion took the majority of my time.

1. Equipment Dimension
![image](https://github.com/user-attachments/assets/026e5b20-4d07-4c21-8012-4e859ff2485b)
2. Geographic Location Dimension
![image](https://github.com/user-attachments/assets/e7503356-6980-4255-84f0-c199b8efe280)
3. Project Dimension
![image](https://github.com/user-attachments/assets/d6a6fa25-e3b6-4fe0-bac9-381746625db7)
4. Date Time Dimension
![image](https://github.com/user-attachments/assets/6ac0e226-2685-4546-a3b4-6c4b0acb30c4)
5. Fact Table (FUCK THIS)

## Modeling
All the dimension tables were built. However, the fact table was unable to be built in time before the assignment's due date, so my progress stopped here.
Geographic Location Dim
![image](https://github.com/user-attachments/assets/593bb3e6-1b0a-4256-92b2-d5318e85b8b7)
Equipment Dim
![image](https://github.com/user-attachments/assets/2d7319bd-3173-4040-858e-87066f7a2355)
Project Dim
![image](https://github.com/user-attachments/assets/2942defd-f1b3-4f61-b1d4-f42f4b2d539d)
Time Date Dim
![image](https://github.com/user-attachments/assets/16b51317-1a11-47cb-ad0b-f24d5d85d9df)



