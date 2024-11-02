# CIS4400_Homework_Assignment

## Business Requirements
- What program is the best in each year providing deductions for solar system installments?
- Which neighborhood is growing in green energy usage?
- Can an application be built to provide information on the best programs to apply for your benefits and; primarily cost to energy generated?

## Data Requirements
- Data source
	-Solar Panel Programs Report by NYSERDA [https://data.cityofnewyork.us/Health/DOHMH-New-York-City-Restaurant-Inspection-Results/43nn-pn8j/about_data](https://data.ny.gov/Energy-Environment/Solar-Electric-Programs-Reported-by-NYSERDA-Beginn/3x8r-34rs/data_preview)

- Summary
	- Dataset includes information on completed and pipelined solar electric projects supported by the New York State Energy Research and Development Authority.
 - Probable problems
	- Dataset contains many zeros or blanks, will require to find a solution to not cause problems for aggregations.
   
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
![Info_arch](https://github.com/user-attachments/assets/b55c3a80-e496-4793-9834-8eec5dde71d9)


## Data Architecture
![Data_arch](https://github.com/user-attachments/assets/99dc6aca-4c86-43d7-bc26-e4766faeb3ca)
