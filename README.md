
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

 - Ignoring case; We made all words lowercase.
 - Ignoring punctuation; We tokenized text.
 - Ignoring words that don’t contain much information; We used the nltk library to get English stop words and extended the list based on available data.
 - Reducing words to their stem; We used the PorterStemmer algorithm.

Below the cleaning process, the bag of words stage was used to extract the most popular words in tweets with their counts.

![image](https://user-images.githubusercontent.com/82549869/134828289-01789af4-e683-4e51-9488-61ad61c9e49c.png)

Elon Musk used words in his tweets, which means there are a lot of details to look over. LDA, on the other hand, is a probabilistic conversion of bag-of-words counts to a lower-dimensional topic space. It categorises text data on a topic-by-topic basis, ignoring the content's original place while keeping its frequency. The degree of semantic similarity between a topic's high scoring words is utilised to evaluate its coherence when calculating the coherence score. The most commonly occurring words in each topic are chosen by the algorithm. The coherence score for a given topic is then derived by adding all of the pairwise scores for each of the terms together.

Below is the average coherence score per topic for a range of models trained with varied amounts of topics. The optimum balance we seek is the number of topics for which the average score reaches a peak point.

![image](https://user-images.githubusercontent.com/82549869/134828324-f105926e-aa59-4d4a-a086-cf4b31796086.png)

In conclusion, we estimate that there will be roughly two subjects. It's important to remember that a corpus of very brief documents (like Elon Musk's tweets) is more difficult to apply to coherent models than a corpus of lengthy documents.

![image](https://user-images.githubusercontent.com/82549869/134828418-6f6e927f-4567-424c-9fd5-fe53b45a28c0.png)

Despite the presence of the term "Tesla" in subject 0, the remaining words are all related to SpaceX and its many components. The first topic shows how Tesla and its components are grouped together. As a result, we can agree that Elon Musk primarily posts about two topics: Tesla and SpaceX.

### Tweet Classification Modelling

For this supervised learning model, we used the preprocessed data from the SQL database found in the tables tesla_stocks and tweets_data_2011_2021.csv. We used a SQL query to assemble a dataframe called tweets_price. In this dataframe, we have the tweet, tokens of the tweet, prev_day_close, next_day_close columns, where the data can be easily viewed. One last column called close_price_diff was created. It is the calculation between the day before and the day of closing stock price for the date the tweet was posted. This column takes into consideration weekends for which we do not have a closing stock price value in the dataset, and the randomness of Elon Musk's posting of tweets. 

![image](https://user-images.githubusercontent.com/82549869/134828453-f7846d98-3048-4f12-b328-f8fbf28a2f6e.png)

For something like the Classification model, we choose LogisticRegression to predict the likelihood that Elon Musk's tweet will have an influence on Tesla stock or the likelihood that this event will occur. The LogisticRegression model has the advantage of providing statistical information on the significance of tweets in relation to stock price movement. The assumption that there is LogisticRegression between the data is a drawback of this model, and it is prone to overfitting.
The model's overall performance indicates that it cannot accurately forecast a correlation between a tweet and a change in Tesla stock price. This is an expected conclusion, given the amount of variables that drive stock price movement and the fact that not all of Elon Musk's tweets directly influence investors.

It's worth noting, however, that the model can accurately identify the most favourable tweets when looking at the results test data frame. This demonstrates that the model can make appropriate token deduction calls using Natural Language Processing (NLP) and can learn from the data.

![image](https://user-images.githubusercontent.com/82549869/134828481-5cf003ba-352a-423a-8a42-83055b7be295.png)

## Dashboard Webpages and Heroku Website Deployment
We created several HTML pages to display the project's main dashboard. We are trying to deploy the dashboard on Heroku website as we earlier did for [pet_pals](https://petpals1969.herokuapp.com/). 


# Presentation

We created an interactive [Dashboard](https://public.tableau.com/app/profile/yuvraj.bhati/viz/DatalogyProjectDashboard/TweetsImpactonStockPrices?publish=yes) in Tableau and a Story board for the presentation. It showcase the exploratory analysis of the twitter and stock datasets and interactive components like filters, sliders and hover effects.
Users can filter the graphs by year and months to show the changes in tweets over time. Similarly stock closing prices and correlation between tweet likes and stock trading volume can also be seen for different time periods.

The presentation slide deck was created on **Google Slides** website that is [accessible from here](https://docs.google.com/presentation/d/1SMZks9DhKcfHfKG1b-hhtxhehmgnIdvkM5ZcL8o6TMQ/edit?usp=sharing). The images used in the slides were created along different stages of the process and are mainly Google Colab and local jupyter file outputs and also from Tableau Public.

### Project Team
* Behnam Hashemi 
* Mohammad Ahmed Jilani
* Gobinath Thangaiya
* Yuvraj Singh Bhati

## Segment 3 Task Deliverables Completed

We worked on top of the segment two deliverables and for segment 3 we completed:
  
      1- Presentation - It is drafted in Google Slides and tells a story about the project
      2- Git Hub Repository - The repository has been updated with the work done this week on segment 3
         *  Main Branch - Includes all code necessary to perform exploratory analysis and to complete the machine learning portion of the project
         *  README.md - Includes Cohesive, structured outline of the project (with images, links and tables) and link to Google Slides draft presentation
         *  Individual Branches - Every project team member created and merged individual branches
      3- Machine Learning Model - Includes working code for machine learning models and explanation of various phases of data processing, feature engineering, decision making,  
      train and test sets, model choice, accuracy score etc.
      4- Dashboard - Interactive Tableau Dashboard is included which shows a data story with images from intial analysis, data images/report from machine learning task
    
