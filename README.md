
# Social Media Impacts on Stock Market
* Datalogy Team Final Project, UofT Data Analytics Bootcamp, April-Sept 2021.

## Overview - Selected Topic and Reason for Selection

In this analysis we are trying to implement a machine learning model to predict trends in segments of stock market based on the effects of certain celebrities' interaction with the market through their social media feeds. To do so, we are going to feed the model with an API from [Twitter](https://twitter.com/?lang=en) to collect [all posts made by Elon Musk in 2021](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/elon_musk_tweets_2011-2021.csv) along with data of likes, replies and retweets.
We merged it with another dataset for Elon Musk tweets for 2011 to 2020 from [Kaggle](https://www.kaggle.com/ayhmrba/elon-musk-tweets-2010-2021). All Elon's reposts and replies were excluded from analysis.

We got historical Tesla stock data for the same period from [Yahoo_fin](http://theautomatic.net/yahoo_fin-documentation/). Stocks Market values encompassing a more than ten years time interval. 

We selected Twitter feeds and Yahoo_fin data as they are real world big data with a noticeable complexity in their nature, which could be regarded appropriate to use for a machine learning model created to statistically verify any significant correlation between the two entities.
To pragmatically carry out the analysis, we need to be more specific and select a segment of the stock market and focus on Twitter feeds from a world-renowned entrepreneur to minimize any confounding factors. 

To discard or minimize any probable similarities with any other project, we will be using Yahhoo_fin stock market dataset with a time interval of our choosing that is unique to this project, and statistical approach most fit for this dataset and case. 

We are using LDA and Text Classification (Logistic Regression) models to analyse datasets.


## Project Outline
1.	[Getting and storing data](https://github.com/Gobi1616/Datalogy_Final/blob/main/Cleaning_preprocessing_data.ipynb)
    - Twitter data
      - Pull data from Twitter API and clean it
      - Pull tweets data from [Kaggle for 2011-2020](https://www.kaggle.com/ayhmrba/elon-musk-tweets-2010-2021) and clean it
      - Merge 2 datasets and export to [tweets_data_2010_2020_ungrouped.csv](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/tweets_data_2011_2021_ungrouped.csv) for Tableau dashboard
      - Preprocess data for machine learning (ML)
      - Upload cleaned data to PostgreSQL database and export to [tweets_data_2011_2021.csv](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/tweets_data_2011_2021.csv)
    - Stocks data
      - Pull data from Yahoo fin library
      - Clean data
      - Upload cleaned data to PostgreSQL database and export to [tesla_stocks.csv](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/tesla_stocks.csv)
2.	SQL Database
    - Create [ERD schema](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/ERD_Tweets_TESLA.png?raw=true)
    - Create [tables](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/twitter_vs_stocks_db.sql) to store tweets and stock data
    - Merge 2 tables and export to [twitter_vs_stocks.csv](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/twitter_vs_stocks.csv)
3.	Machine Learning Model
    - [Latent Dirichlet Allocation (LDA) Modelling](https://github.com/Gobi1616/Datalogy_Final/blob/main/LDA.ipynb)
      - Preprocess data
      - Build LDA model
    - [Classification](https://github.com/Gobi1616/Datalogy_Final/blob/main/Classification_model.ipynb)
      - Preprocess data
      - Build classification model
4.	[Tableau dashboard](https://public.tableau.com/app/profile/yuvraj.bhati/viz/DatalogyProjectDashboard/TweetsImpactonStockPrices?publish=yes)
5.	Create presentation in [Google Slides](https://docs.google.com/presentation/d/1SMZks9DhKcfHfKG1b-hhtxhehmgnIdvkM5ZcL8o6TMQ/edit#slide=id.gefdb924201_0_726)

## Data Sources and Description

   ### Yahoo_fin   
Yahoo_fin library was used to get historical historical data for (TSLA) Tesla Stock price from 2011 till date. 

   ### Twitter API
This project streams real-time data from Twitter, performs natural language processing on the contents of the tweet, and displays the results. The Twitter data is filtered by a query word and processed to determine sentiment of the tweet.
In this study, we will use data from such a powerful microblogging platform to examine how a digital behemoth, a global icon, may influence the emotions of millions of people connected to it, and how these feelings, in turn, affect the rise and fall of an organization's stock price. Aside from being a fantastic communication tool, Twitter is a gold mine for text and social web analysis.

   ### Kaggle
We also used Kaggle to get historical Elon Musk tweets data from 2011 to 2020.

## Questions we hope to answer with the data
We strive to answer the following questions through the implementation of the proposed machine learning model:

     1- How do tweets impact the stock prices? 
     2- Are there any keywords which actually make an impact on Tesla stock price?
     3- What are the greatest increase and decrease in the stock volumes related to this condition?
     4- Are an individual's tweets significant enough to influence a specific segment of the market?
          
## Data Exploration
Newer posts were pulled from Twitter API directly for the period Jan 1 - Sep 4, 2021. We extended the dataset by adding tweets from 2011 till 2020 found on [Kaggle]( https://www.kaggle.com/ayhmrba/elon-musk-tweets-2010-2021). All reposts and replies were excluded, so only 4,700 tweets were included for analysis.

During analysis we found that Elon Musk posted significantly higher tweets since 2018.

![Tweets Count](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Tweets%20Count%20by%20Years%20and%20Months.PNG?raw=true)

"Tesla" (629 times) was the most commonly tweeted word, followed by "model" (260 times).

![Most Tweeted Words](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Most%20Tweeted%20Words.PNG?raw=true)

Tesla stock prices soared since September 2019 and reached a peak in January 2021.

![Tesla Stock Closing Price](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Tesla%20Stock%20Closing%20Price%202011-2021.PNG?raw=true)

The most Tesla shares were traded on February 4th 2020.

![Tesla Shares Traded](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Tesla%20Shares%20Traded%202011-2021.PNG?raw=true)

The greatest increase in closing price was seen on March 9th 2021, while the greatest decrease was seen on September 8th 2020. Elon Musk posted a few tweets during these days.

![Change in Tesla Stock_closing_price](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Change%20in%20Tesla%20Stock%20Closing%20Price.PNG?raw=true)

A positive correlation between the number of likes and stock trading volume can be seen at some periods of time.

![ Like_count_and trading volume](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Correlation%20Likes%20Count%20and%20Stocks%20Trading%20Volume%202021.PNG?raw=true)

## Database
We have used Postgres SQL database to upload datasets. We uploaded two datasets *tesla_stocks* and *tweets_data_2011_2021* than usign the 'INNER JOIN', we merged the two datasets to create a third dataset *twitter_vs_stocks*. The [twitter_vs_stocks](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/twitter_vs_stocks.csv) combines the data from both datasets using the 'date' as ID as shown in [ERD](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/ERD_Tweets_TESLA.png?raw=true). This table displays the 'tokenized_text' versus the 'close' amount fo each date. In addition, the 'change' column shows, for each date, whether the stock price has increased or decreased compared to the previous day's amount after Elon Musk has tweeted. We established a connection string using SQLAlchemy to upload dataset to [SQL Databse](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/twitter_vs_stocks_db.sql). We have also linked our Postgres SQL database to cloud platform through AWS RDS database, [AWS_twitter_vs_stocks_db](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Data/AWS_twitter_vs_stocks_db) so that every project team member has access to the database and any future changes and new data can be included in the database.

## Analysis - Machine Learning Models and Tools

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

# Technologies, languages, tools, and algorithms

![image](https://github.com/Gobi1616/Datalogy_Final/blob/main/Resources/Images/Tech%20and%20Tools.png?raw=true)

## Dashboard Webpages and Heroku Website Deployment
We created several HTML pages to display the project's main dashboard. We are trying to deploy the dashboard on Heroku website as we earlier did for [pet_pals](https://petpals1969.herokuapp.com/). 


# Visualization - Dashboard and Slides

We created an interactive [Dashboard](https://public.tableau.com/app/profile/yuvraj.bhati/viz/DatalogyProjectDashboard/TweetsImpactonStockPrices?publish=yes) in Tableau and a Story board for the presentation. It showcase the exploratory analysis of the twitter and stock datasets and interactive components like filters, sliders and hover effects.
Users can filter the graphs by year and months to show the changes in tweets over time. Similarly stock closing prices and correlation between tweet likes and stock trading volume can also be seen for different time periods.

The presentation slide deck was created on [Google Slides](https://docs.google.com/presentation/d/1SMZks9DhKcfHfKG1b-hhtxhehmgnIdvkM5ZcL8o6TMQ/edit#slide=id.gefdb924201_0_726). The images used in the slides were created along different stages of the process and are mainly Google Colab and local jupyter file outputs and also from Tableau.

## Result of Analysis

*Twitter*, a microblogging and social networking service which enables users to post their thoughts and interact with messages known as *“tweets”* ranging from 140 to 280 characters (2021) with around 206 million daily active users as of Q2 2021, has become a widely used platform for many prominent individuals to engage with the world.  

*Elon Musk*, the founder and CEO of *Tesla* and *SpaceX*, is an active Twitter user (*@elonmusk*) and has consistently increased the number of tweets he posts each year, increasing since 2015. 

The purpose of our project was to try and *find a correlation between Elon Musk’s tweets and the change of tesla stock price and the influence of Elon Musk’s tweets*, and test whether or not they influence the stock market. This was tested by gathering data on Elon’s tweets from 2011 to Sept 2021 and Tesla’s stock data for the same time frame. 
This data was used to train a machine learning model to test for a correlation between Musk’s tweets, and any positive or negative change in stock. Also, we tested to see if the classification - machine learning model was able to understand tweets and learn if they were positive based on the fluctuation in stock value.

The results of the machine learning model demonstrate a weak correlation between Elon Musk’s tweets and the fluctuation of stock price, as shown by the **55% accuracy result**. As expected from the stock market, it is a system that is influenced by an number of factors ranging from demand and supply, interest rates, dividends, investors, financial reports, forecasts and many more. The results further reinforce that this relationship is weak, as they are not isolated events. For Elon Musk’s tweets, we ran an LDA model that showed they are mainly focused on his interests on subjects regarding SpaceX, Tesla, and related topics. While the world becomes more heavily influenced by social media, it’s also getting overloaded with data, as we saw from most of Elon Musk’s tweets, which were found to have no significant impact on stock prices. 

## Recommendations for Future Analysis
Based on our findings, it is recommended to use the Logistic Regression ML model to assess the influence of likes and retweets on changes in stocks, as they appeared to show some positive correlation with trading volumne during our exploratory analysis. Furthermore, as in recent past articles have indicated Elon Musk's influence on cryptocurrencies, we could use ML to predict whether Musk's tweets have an influence on cryptocurrencies instead of Tesla stock prices. Finally, this model could be applied to other individuals with greater public influence to determine whether their tweets are more strongly correlated with stocks.

## What the Team Would Do Differently
The team did well in meeting the deadlines and deliverables but could improve on the clear distribution of tasks to avoid any duplication or rework. Team could have done more research prior to choosing the ML model as we started working on Spacy model initially but found that is not solving our purpose and later switched to Classification and LDA models. By doing more research, collaboration and clear distribution of responsibilities for each task, work could be more efficient.

Also, the team had to wait for Twitter API permission initially during data collection phase as it takes a couple of days to get permission from twitter. Knowing this team will be more prepared for future where similar sort of APIs are required for data collection. Team also tried to utilize the AWS RDS cloud platform and connected the Postgres Database with AWS RDS but did not use that much in code and otherwise due to restriction of free usage. Likewise, the team should have used a database more compatible with text data, such as MongoDB, versus using SQL Alchmey and postgres.

Finally, the team had an opportunity to collaborate and learnt a lot from each other. We would have liked more variety and involvement in all the aspects of project. As some individuals had more exposure to code while others on visualization. Although all the concepts and stages were timely discussed and accepted by the group but having each team member work in all aspects of the project would have provided more exposure and understanding.

### Datalogy - Project Team
* Behnam Hashemi 
* Mohammad Ahmed Jilani
* Gobinath Thangaiya
* Yuvraj Singh Bhati
