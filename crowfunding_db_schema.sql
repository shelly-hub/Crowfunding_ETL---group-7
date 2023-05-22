DROP TABLE IF EXISTS campaign;
DROP TABLE IF EXISTS contacts;
DROP TABLE IF EXISTS subcategory;
DROP TABLE IF EXISTS category;

CREATE TABLE category(
			category_id VARCHAR (255) PRIMARY KEY,
			category VARCHAR (255));

CREATE TABLE subcategory (
			subcategory_id VARCHAR (255) PRIMARY KEY,
			subcategory VARCHAR (255));

CREATE TABLE contacts(
			contact_id INT PRIMARY KEY,
			first_name VARCHAR (255) NOT NULL,
			last_name VARCHAR (255) NOT NULL,
			email VARCHAR (255));

CREATE TABLE campaign(
			cf_id INT,
			contact_id INT NOT NULL,
			FOREIGN KEY(contact_id)REFERENCES contacts(contact_id),
			company_name VARCHAR (255) NOT NULL,
			description VARCHAR (255),
			goal FLOAT, 
			pledged FLOAT NOT NULL,
			outcome VARCHAR (255), 
			backers_count FLOAT NOT NULL,
			country VARCHAR,
			currency VARCHAR,
			launched_date DATE,
			end_date DATE,
			category_id VARCHAR NOT NULL,
			FOREIGN KEY(category_id)REFERENCES category(category_id),
			subcategory_id VARCHAR NOT NULL,
			FOREIGN KEY(subcategory_id)REFERENCES subcategory(subcategory_id));
	
ALTER DATABASE "crowfunding_db" SET datestyle = "ISO, YMD";

SELECT * FROM category;

SELECT * FROM subcategory;

SELECT * FROM contacts;

SELECT * FROM campaign;
