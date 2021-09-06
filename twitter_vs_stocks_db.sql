-- Create tables
CREATE TABLE tesla_stocks (
    date DATE NOT NULL,
	open FLOAT NOT NULL,
	high FLOAT NOT NULL,
	low FLOAT NOT NULL,
	close FLOAT NOT NULL,
	volume INT NOT NULL,
    change FLOAT,
    PRIMARY KEY (date)
);

CREATE TABLE tweets_data_2011_2021 (
    date DATE NOT NULL,
	text VARCHAR NOT NULL,
	tokenized_text VARCHAR NOT NULL,
	like_count INT NOT NULL,	
	reply_count INT NOT NULL,
	retweet_count INT NOT NULL
);

