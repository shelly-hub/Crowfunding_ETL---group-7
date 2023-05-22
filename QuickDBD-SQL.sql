-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/7UOGmr
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [campaign] (
    [cf_id] INT  NOT NULL ,
    [contact_id] INT  NOT NULL ,
    [company_name] VARCHAR  NOT NULL ,
    [description] VARCHAR  NOT NULL ,
    [goal] INT  NOT NULL ,
    [pledged] INT  NOT NULL ,
    [outcome] VARCHAR  NOT NULL ,
    [backers_count] INT  NOT NULL ,
    [country] VARCHAR  NOT NULL ,
    [currency] VARCHAR  NOT NULL ,
    [launched_date] DATE  NOT NULL ,
    [end_date] DATE  NOT NULL ,
    [category_id] VARCHAR  NOT NULL ,
    [subcategory_id] VARCHAR  NOT NULL 
)

CREATE TABLE [category] (
    [category_id] VARCHAR  NOT NULL ,
    [category] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_category] PRIMARY KEY CLUSTERED (
        [category_id] ASC
    )
)

CREATE TABLE [subcategory] (
    [subcategory_id] VARCHAR  NOT NULL ,
    [subcategory] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_subcategory] PRIMARY KEY CLUSTERED (
        [subcategory_id] ASC
    )
)

CREATE TABLE [contacts] (
    [contact_id] INT  NOT NULL ,
    [email] VARCHAR  NOT NULL ,
    [first_name] VARCHAR  NOT NULL ,
    [last_name] VARCHAR  NOT NULL ,
    CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED (
        [contact_id] ASC
    )
)

ALTER TABLE [category] WITH CHECK ADD CONSTRAINT [FK_category_category_id] FOREIGN KEY([category_id])
REFERENCES [campaign] ([category_id])

ALTER TABLE [category] CHECK CONSTRAINT [FK_category_category_id]

ALTER TABLE [subcategory] WITH CHECK ADD CONSTRAINT [FK_subcategory_subcategory_id] FOREIGN KEY([subcategory_id])
REFERENCES [campaign] ([subcategory_id])

ALTER TABLE [subcategory] CHECK CONSTRAINT [FK_subcategory_subcategory_id]

ALTER TABLE [contacts] WITH CHECK ADD CONSTRAINT [FK_contacts_contact_id] FOREIGN KEY([contact_id])
REFERENCES [campaign] ([contact_id])

ALTER TABLE [contacts] CHECK CONSTRAINT [FK_contacts_contact_id]

COMMIT TRANSACTION QUICKDBD