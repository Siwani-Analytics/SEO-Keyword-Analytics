CREATE DATABASE keyword_database;

USE keyword_database;


SHOW DATABASES;

DROP DATABASE internship;


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

LOAD DATA INFILE
"C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Parent_Table.csv"
INTO TABLE Main_Table
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

select count(*) from Main_Table;

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

SHOW CREATE TABLE Main_Table;