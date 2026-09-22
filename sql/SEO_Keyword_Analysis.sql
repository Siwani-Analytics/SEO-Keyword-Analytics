-- ============================================================
-- SEO KEYWORD ANALYTICS
-- SQL SETUP & DATA MODEL
-- ============================================================
-- Purpose:
--   Create the keyword analytics database, define the main table,
--   load the source CSV, validate the data, and configure the
--   relationships to the lookup tables.
--
-- Source script reviewed:
--   SQL Codes.sql
--
-- Notes:
--   1. The source script references the following lookup tables:
--      topic_lookup, intent_lookup, searchvolume_lookup,
--      traffic_lookup, keyword_metrics_lookup.
--   2. Their CREATE TABLE statements are not present in the
--      supplied SQL script, so they are not recreated here.
--   3. The original DROP DATABASE internship statement was omitted
--      from the portfolio version because it is unrelated to the
--      keyword_database setup and is destructive.
-- ============================================================


-- ============================================================
-- 1. DATABASE SETUP
-- ============================================================

CREATE DATABASE keyword_database;

USE keyword_database;


-- ============================================================
-- 2. MAIN KEYWORD TABLE
-- ============================================================

CREATE TABLE Main_Table (
    Keyword_ID INT,
    Topic TEXT,
    Keyword TEXT,
    Position INT,
    Previous_position INT,
    Search_Volume BIGINT,
    Keyword_Difficulty DECIMAL(10,2),
    CPC DECIMAL(10,2),
    Traffic DECIMAL(15,2),
    Traffic_Percentage DECIMAL(15,6),
    Traffic_Cost DECIMAL(15,2),
    Competition DECIMAL(10,4),
    Number_of_Results BIGINT,
    Timestamp VARCHAR(50),
    Keyword_Intents VARCHAR(100),
    Position_Type VARCHAR(100)
);


-- ============================================================
-- 3. LOAD SOURCE DATA
-- ============================================================
-- Update the file path according to your local MySQL setup.

LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Parent_Table.csv"
INTO TABLE Main_Table
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- ============================================================
-- 4. BASIC DATA VALIDATION
-- ============================================================

SELECT COUNT(*) AS Total_Rows
FROM Main_Table;


-- ============================================================
-- 5. PRIMARY KEYS FOR LOOKUP TABLES
-- ============================================================
-- These lookup tables are referenced by the original project:
--   topic_lookup
--   intent_lookup
--   searchvolume_lookup
--   traffic_lookup
--   keyword_metrics_lookup

ALTER TABLE topic_lookup
ADD PRIMARY KEY (`Keyword ID`);

ALTER TABLE intent_lookup
ADD PRIMARY KEY (`Keyword ID`);

ALTER TABLE searchvolume_lookup
ADD PRIMARY KEY (`Keyword ID`);

ALTER TABLE traffic_lookup
ADD PRIMARY KEY (`Keyword ID`);

ALTER TABLE keyword_metrics_lookup
ADD PRIMARY KEY (`Keyword ID`);


-- ============================================================
-- 6. FOREIGN KEY RELATIONSHIPS
-- ============================================================

ALTER TABLE Main_Table
ADD CONSTRAINT FK_MainTable_Topic
FOREIGN KEY (`Keyword_ID`)
REFERENCES topic_lookup(`Keyword ID`);

ALTER TABLE Main_Table
ADD CONSTRAINT FK_MainTable_Intent
FOREIGN KEY (`Keyword_ID`)
REFERENCES intent_lookup(`Keyword ID`);

ALTER TABLE Main_Table
ADD CONSTRAINT FK_MainTable_SearchVolume
FOREIGN KEY (`Keyword_ID`)
REFERENCES searchvolume_lookup(`Keyword ID`);

ALTER TABLE Main_Table
ADD CONSTRAINT FK_MainTable_Traffic
FOREIGN KEY (`Keyword_ID`)
REFERENCES traffic_lookup(`Keyword ID`);

ALTER TABLE Main_Table
ADD CONSTRAINT FK_MainTable_KeywordMetrics
FOREIGN KEY (`Keyword_ID`)
REFERENCES keyword_metrics_lookup(`Keyword ID`);


-- ============================================================
-- 7. TABLE STRUCTURE VALIDATION
-- ============================================================

SHOW CREATE TABLE Main_Table;


-- ============================================================
-- END OF SCRIPT
-- ============================================================
