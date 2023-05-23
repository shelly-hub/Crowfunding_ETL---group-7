# Crowfunding_ETL---group-7

## Project Aim
This is a mini project that aims to build an ETL pipeline by using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data.
The data created would be in the form of CSV files, and would be used to create ERD and a table schema. Finally, the data would be uploaded into Postgres database

## Project Description
This mini project is separated into 2 sections. One is data extraction and transformation using Jupyter notebook. Another is data storage using PgAdmin4.
 - The first part of the project would be to process 2 raw data in Excel forms, and extract 4 required information into dataframes and export them each as CSV files. 
 - The second part of the project would then sketch ERD of the tables to identify the relationships of these tables by identifying primary and foreign keys. Subsequently, CSV files would be imported into Postrgres database.  

### Advantage of ETL:
- ETL pipeline has a huge library that can do many analysis in one notebook
- Able to extract data from different sources, and combine data into one table
- No need to create schema and can export data directly
- Able to transform data into readable format

### Disadvantage of ETL:
- Updated Collection/Database cannot get back to original document even after restarting the kernel, hence need to re-import the whole file again
- Constant update data is needed for context that is easily changeable

## Project Method
### I) Data Extraction and Transformation
#### Create the Category DataFrames
    1. First is to import dependencies such as Pandas library and Numpy
    2. Extract data from excel file named "crowfunding.xlsx" into pandas dataframe named as "crowfunding_info_df"
    3. The column of "category & subcategory" needs to be separated using df.str.split() function to extract category information
    4. Once a single category dataframe is made, additional column named "category_id" is created
    5. The column "category_id" is giving each unique category an id number with a string name "cat" attached with each number 
    6. Each id is created using numpy np.arange() function, and each string "cat" is attached to the id using for loop function
    7. Finally, this category dataframe (category_df) is exported as CSV file named as "category.csv"

#### Create the Subcategory DataFrames
    1. Same as above, with amendment start from no.4 method above
    2. Once a single subcategory dataframe is made, additional column named "subcategory_id" is created
    3. The column "category_id" is giving each unique subcategory an id number with a string name "subcat" attached with each number 
    4. Each id is created using numpy np.arange() function, and each string "subcat" is attached to the id using for loop function
    5. Subcategory dataframe (subcategory_df) is exported as CSV file named as "subcategory.csv" 

#### Create the Campaign DataFrame
    1. Using the raw extracted data above rename the dataframe as "campaign_df"
    2. Rename "blurb, launched_at, deadline" columns into "description", "launched_date", "end_date" separately
    3. Datatype for goal and pledged are changes to float data type using df.astype() function
    4. To convert Unixtimestamp (integer) into date format (year-month-day), import datetime from datetime library
    5. This processed campaign_df dataframe is then joined with above 2 dataframes (category_df, and subcategory_df) using merge() function on left join with "category" column, and "subcategory" column. 
    6. Once merged as "campaign_merged_df", unnenecassry columns are deleted using df.drop() function
    7. The final prcoessed data named as "campaign_cleaned" is then exported as CSV file named as "campaign.csv"

#### Create the Contacts DataFrame
    1. Copy the crowdfunding info_df into a campaign_df
    2. Rename the blurb, launch and deadline column
    3. Convert the goal and pledge column to 'float' data type
    4. Check the data types
    5. Format the launch date and end date columns to datetime format
    6. Create dataframe of data 
    7.Merge the campaign df with category df on category column 
    8. Drop unwanted columns
    9. Export contacts to csv file
    
#### Use Pandas to create Contacts data frame
    1. Import json and print dictionary values 
    2. Check the data types
    3. Create first name and last name column from the name column
    4. Re-order columns - contact id, first name, last name, email
    5. Check the data types
    6. Export data frame to csv file 

#### Use regex to create the contacts data frame 
    1. Read in data 
    2. Convert first row into column header
    3. Remove first row 
    4. Create list to extract values 
    5. Extract 4 digit ID number
    6. Create new contact ID column
    7. Check the data types
    8. Convert contact_id to INT data type
    9. Extract the name of the contact and add it to new column
    10. Create new name column and add it to data frame
    11. Extract the email from the contacts and add values to new column 
    12. Create a copy of the contact info df
    13. Create a first name and last name column \
    14. Drop the contact name column 
    15. Re-order the columns 
    16. Check the data types 
    17. Export the data frame to CSV 
 
### II) Data Storage
#### Create the Crowdfunding Database
    1. ERD sketch of the relationships of 4 tables made above
    2.  Using pgAdmin4 app, create database crowdfunding_db on the left tab
    3. From crowfunding_db right click to open a "query tool" and open the file "crowdfunding_db_schema.sql"
    4. Start to run subsequent codes to create tables and relationship made according to ERD sketch
    5. For "campaign" tables, ensure "outcome" column is not boolean but string (VARCHAR)
    6. For "campaign" tables, ensure to change database date format by using "SET datestyle"
    7. Refresh tables by right click on "crowdfunding_db"
    8. Import 4 CSV files separately from Resources folder by the order of tables are created
    9. In the Import tab, ensure "Options">"Header" is on so to match column names created
    10. Check if files are imported successfully by running the code SELECT * (table_name)
   


## References
	 - How to obtain a concise summary of a DataFrame in Pandas.(2023). Educative. Retrieved on 16/05/2023, from:< https://www.educative.io/answers/how-to-obtain-a-concise-summary-of-a-dataframe-in-pandas>
	 - pandas.Series.str.rsplit.(2023). pandas. Retrieved on 16/05/2023, from:<https://pandas.pydata.org/docs/reference/api/pandas.Series.str.rsplit.html>
	 - Get list from pandas dataframe column or row?.(6/01/2019). Stack Overflow. Retrieved on 16/05/2023, from:< https://stackoverflow.com/questions/22341271/get-list-from-pandas-dataframe-column-or-row>
	 - Python - List Comprehension.(2023). TutorialsTeacher. Retrieved on 16/05/2023, from:<https://www.tutorialsteacher.com/python/python-list-comprehension
	 - TypeError: 'list' object cannot be interpreted as an integer.(20/01/2015).StackOverflow. Retrieved on 17/05/2023, from:<https://stackoverflow.com/questions/28036309/typeerror-list-object-cannot-be-interpreted-as-an-integer>
	 - Python strftime(). (N.D.). Programiz.Retrieved on 17/05/2023, from:<https://www.programiz.com/python-programming/datetime/strftime>
	 - How to drop one or multiple columns in Pandas Dataframe.(N.D.). Geeksforgeeks. Retrieved on 18/05/2023, from:<https://www.geeksforgeeks.org/how-to-drop-one-or-multiple-columns-in-pandas-dataframe/>
	 - SQL CREATE DATABASE Statement.(2023). W3Schools. Retrieved on 22/05/2023, from:<https://www.w3schools.com/sql/sql_create_db.asp>
	 - Module 9: SQL(16/4/23).Monash University Bootcamp Tutorial, Retrieved on 17/05/2023
         - Module 12: NoSQL Databases (15/5/23). Monash University Bootcamp Tutorial, Retrieved on 17/05/2023
