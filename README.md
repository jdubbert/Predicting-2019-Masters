# Predicting-2019-Masters
This project will seek to predict the 2019 Masters tournament results by using OLS, lasso regression, GAM, Random Forest, bagging and boosting models.

The following files are needed in this repository:

1. WorldGolfRank_Pull.R : Scraper for pulling World Golf Rankings for Week 13; the week prior to the Masters Tournament
2. PGA_Scrape_Data.Rmd : Scraper for pulling all the needed variables for analysis
3. Data_expooration.Rmd : Exploratory analysis of the PGA data
4. PGA Modling : Modeling work to predict Masters tournament
5. wgr_golf_rank.csv : WGR Rankings Excel
6. pga_data_final.csv : Excel with all data

Goals
The following are the goals of the project:

1. Build a model to predict Masters tournament outcomes 
2. Train the model on historical data from past tournaments/years from years 2005-2018
3. Validate the model and evaluate performance by making predictions based on historical data from years witheld from the       training data set (testing data).
4. Use the model to predict the outcome of the 2019 Masters tournament
5. Evaluate the models performance based on the prediction accuracy of the actual 2019 tournament results.


Dataset
The data is from https://www.pgatour.com/stats.html and consists of yearly PGA Tour player summary statistics. Since the website doesnt allow you to download data, I created a scraper to scrape the desired data from the website. The code for this scaper is documented in "PGA_Tour_scraper.Rmd".

Variables
For analysis, we start with the following 18 variables with data over the years 2005 - 2018.

Top 10 Finishes:
Strokes Gained Total:
Strokes Gained Putting:
Strokes Gained Tee to Green:
Scoring Average:
Rounds played:
Driving Distance:
Fairway %:
Greens in Regulation (GIR) %:
Ranking (can get ranking week leading up to masters): Categorical
Wins
Putts per Round
Scrambling
Par 5 scoring average
Times played in Masters
Bounce Back Percentage
Driving Accuracy: 
Proximity to Hole: 