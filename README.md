
# Social Media Impacts on Stock Market
* Datalogy Final Project, UofT Data Analytics Bootcamp, April-Sept 2021.

## Overview

In this analysis we are trying to implement a machine learning model to predict trends in segments of stock market based on the effects of certain celebrities' interaction with the market through their social media feeds. To do so, we are going to feed the model with an API from [Twitter](https://twitter.com/?lang=en) to collect [all posts made by Elon Musk in 2021](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/elon_musk_tweets_2011-2021.csv) along with data of likes, replies and retweets.
We merged it with another dataset for Elon Musk tweets for 2011 to 2020 from [Kaggle](https://www.kaggle.com/ayhmrba/elon-musk-tweets-2010-2021). All Elon's reposts and replies were excluded from analysis.

We got historical Tesla stock data for the same period from [Yahoo_fin](http://theautomatic.net/yahoo_fin-documentation/). Stocks Market values encompassing a more than ten years time interval. 

We selected Twitter feeds and Yahoo_fin data as they are real world big data with a noticeable complexity in their nature, which could be regarded appropriate to use for a machine learning model created to statistically verify any significant correlation between the two entities.
To pragmatically carry out the analysis, we need to be more specific and select a segment of the stock market and focus on Twitter feeds from a world-renowned entrepreneur to minimize any confounding factors. 

To discard or minimize any probable similarities with any other project, we will be using Yahhoo_fin stock market dataset with a time interval of our choosing that is unique to this project, and statistical approach most fit for this dataset and case. 

We are using LDA and Text Classification (Spacy) models to analyse datasets.

## Data Sources

   ### Yahoo_fin   
Yahoo_fin library was used to get historical historical data for (TSLA) Tesla Stock price from 2011 till date. 

   ### Twitter API
This project streams real-time data from Twitter, performs natural language processing on the contents of the tweet, and displays the results. The Twitter data is filtered by a query word and processed to determine sentiment of the tweet.
In this study, we will use data from such a powerful microblogging platform to examine how a digital behemoth, a global icon, may influence the emotions of millions of people connected to it, and how these feelings, in turn, affect the rise and fall of an organization's stock price. Aside from being a fantastic communication tool, Twitter is a gold mine for text and social web analysis.

   ### Kaggle
We also used Kaggle to get historical Elon Musk tweets data from 2011 to 2020.

## Study Questions we hope to answer with the data
We strive to answer the following questions through the implementation of the proposed machine learning model:

     1- How do tweets impact the stock prices? 
     2- Are there any keywords which actually make an impact on Tesla stock price?
     3- What are the greatest increase in the stock price related to this condition?
     4- What are the greatest decrease in the stock price related to this condition?
     5- Are an individual's tweets significant enough to move a specific segment of the market?
      
## Analytical Model and Tools
The Analysis will be based on Elon Musk's Twitter feeds and Tesla Stock Prices over the period under consideration.
The method of feature extraction - bag-of-words will be used for the Machine Learning model.
We used the pandas library to clean the data and join twitter datasets.
Further we used Principal Component Analysis(PCA), train_test_split method from sklearn library 
For ML we used two models [Text Classification](https://github.com/Gobi1616/Datalogy_Final/blob/main/Spacy%20Text%20Classification%20Modelling.ipynb) using Spacy library and
Latent Dirichlet Allocation [LDA](https://github.com/Gobi1616/Datalogy_Final/blob/main/LDA.ipynb) 

## Database
We have used Postgres SQL database to upload datasets. We uploaded two datasets *tesla_stocks* and *tweets_data_2011_2021* than usign the 'INNER JOIN', we merged the two datasets to create a third dataset *twitter_vs_stocks*. The [twitter_vs_stocks](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/twitter_vs_stocks.csv) combines the data from both datasets using the 'date' as ID as shown in [ERD](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/ERD-TESLA.png?raw=true). This table displays the 'tokenized_text' versus the 'close' amount fo each date. In addition, the 'change' column shows, for each date, whether the stock price has increased or decreased compared to the previous day's amount after Elon Musk has tweeted. We established a connection string using SQLAlchemy to upload dataset to SQL Databse. We have also linked our Postgres SQL database to cloud platform through AWS RDS database, [AWS_twitter_vs_stocks_db](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/AWS_twitter_vs_stocks_db) so that every project team member has access to the database and any future changes and new data can be included in the database.

## Machine Learning Models

### Latent Dirichlet Allocation (LDA) Modelling

In this project, we utilized Latent Dirichlet Allocation for topic modelling (LDA). There are four stages to the modelling process of clean the data, create a bag of words, identify the number of subjects, run the LDA algorithm.The LDA model maintains a significant number of features, however it doesn't take into account the position of a word in the sentence. It's hard to define the right number of topics as the coherence score will vary from tiny changes in the dataset. Words are often mixed between a few topics and this makes the LDA model less trusted.

### Tweet Classification Modelling

For this supervised learning model, we used the preprocessed data from the SQL database found in the tables tesla_stocks and tweets_data_2011_2021.csv. We used a SQL query to assemble a dataframe called tweets_price. In this dataframe, we have the tweet, tokens of the tweet, prev_day_close, next_day_close columns, where the data can be easily viewed. One last column called close_price_diff was created. It is the calculation between the day before and the day of closing stock price for the date the tweet was posted. This column takes into consideration weekends for which we do not have a closing stock price value in the dataset, and the randomness of Elon Musk's posting of tweets. 

## Dashboard Webpages and Heroku Website Deployment
We created several HTML pages to display the project's main dashboard. We are trying to deploy the dashboard on Heroku website as we earlier did for [pet_pals](https://petpals1969.herokuapp.com/). 


## Presentation
We created an interactive Dashboard in Tableau and a Storyline for the presentation. [Dashboard](https://public.tableau.com/app/profile/yuvraj.bhati/viz/DatalogyProjectDashboard/TweetsvsStockPrices?publish=yes)


The presentation slide deck was created on **Google Slides** website that is [accessible from here](https://docs.google.com/presentation/d/1SMZks9DhKcfHfKG1b-hhtxhehmgnIdvkM5ZcL8o6TMQ/edit?usp=sharing). The images used in the slides were created along different stages of the process and are mainly Google Colab and local jupyter file outputs and also from Tableau Public.

## Communication Protocol
There are four members in our team. The role of each team member will vary every week to ensure that everyone can gain experience in different areas of the project. A slack channel was created to support communication amongst the team, and will be used to assign tickets, provide updates, and discuss any issues. The team will additionally have zoom meetings everyday to go over project progress and next steps.
We also created a WhatsApp group to follow up with the team and a shared folder in google drive to save the resources.

### Project Team
* Behnam Hashemi 
* Mohammad Ahmed Jilani
* Gobinath Thangaiya
* Yuvraj Singh Bhati

## Segment 2 Task Deliverables Completed

We worked on top of the segment one deliverables and for segment two we completed:
   
    1- Pull data from Twitter API, Kaggle for Elon Musk tweets from 2011 to 2021
    2 - Pull data from Yahoo Fin library for Tesla Stocks from 2011 to 2021
    3 - Create two datasets for tweets and stocks data and create SQL database
    4 - Join two datasets to create a third dataset in Postgres SQL database
    5 - Establish connection string using SQLAlchemy to upload dataset to SQL database
    6 - Connect PostgreSQL database to cloud platform using AWS RDS
    7 - Included ERD of the schema to show relationships between datasets
    8 - ML models selected and worked upon to analyze the data, create datasets and implement Machine Learning
    9- Two models chosen for our analysis Text Classification using Spacy library and Latent Dirichlet Allocation (LDA) 
    10- Slides prepared using Tableau and google slides and uploded in Resources
    11- Worked on initial set up for the Dashboard and presentation
    
