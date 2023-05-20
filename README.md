# Crowfunding_ETL---group-7

## Project Aim
This is a mini project that aims to build an ETL pipeline by using Python, Pandas, and either Python dictionary methods or regular expressions to extract and transform the data.
The data created would be in the form of CSV files, and would be used to create ERD and a table schema. Finally, the data would be uploaded into Postgres database

## Project Description
This mini project is separated into 2 sections. One is data extraction and transformation using Jupyter notebook. Another is data storage using PgAdmin4.
 - The first part of the project would be to process 2 raw data in Excel forms, and extract 4 required information into dataframes and export them each as CSV files. 
 - The second part of the project would then sketch ERD of the tables to identify the relationships of these tables by identifying primary and foreign keys. Subsequently, CSV files would be imported into Postrgres database.  

## Project Method
### Data Extraction and Transformation
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

### Data Storage
#### Create the Crowdfunding Database
