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

SELECT * FROM tesla_stocks;
SELECT * FROM tweets_data_2011_2021;

-- Merge two tables
SELECT tesla_stocks.date,
	tweets_data_2011_2021.text,
	tweets_data_2011_2021.tokenized_text,
	tweets_data_2011_2021.like_count,
	tweets_data_2011_2021.reply_count,
	tweets_data_2011_2021.retweet_count,
	tesla_stocks.volume,
	tesla_stocks.change
INTO twitter_vs_stocks
FROM tesla_stocks
INNER JOIN tweets_data_2011_2021
ON tesla_stocks.date = tweets_data_2011_2021.date;

SELECT * FROM twitter_vs_stocks;