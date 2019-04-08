# Predicting-2019-Masters
This project will seek to predict the 2019 Masters tournament results by using OLS, lasso regression, GAM, Random Forest, bagging and boosting models.

The following files are needed in this repository:

1. WorldGolfRank_Pull.R : Scraper for pulling World Golf Rankings for Week 13; the week prior to the Masters Tournament
2. PGA Modeling.RMD : Modeling work to predict Masters finishing positions with regression models
3. Classification Top_25 Models.RMD : Predicting if player placed in Top 25 or not with classification models
5. wgr_golf_rank1.csv : WGR Rankings Excel
6. pga_tour_data1.csv : Excel with all data
7. df2.csv : data for classification modeling
8. wgr_2019.csv : wgr and points_gained data from week before masters for prediction
7. PGADashboardFinal.Rmd : Dashboard displaying results

Goals
The following are the goals of the project:

1. Build a model to predict Masters tournament outcomes 
2. Train the model on historical data from past tournaments/years from years 2005-2018
3. Validate the model and evaluate performance by making predictions based on historical data from years witheld from the       training data set (testing data).
4. Use the model to predict the outcome of the 2019 Masters tournament
5. Evaluate the models performance based on the prediction accuracy of the actual 2019 tournament results.


Dataset
The data is from https://www.pgatour.com/stats.html and consists of yearly PGA Tour player summary statistics.

Variables
For analysis, we start with the following variables with data over the years 2005 - 2018.

Dependent Variables:

- Top 25
- Total Score (Masters)

Independent Variables:

- Played in Masters last year
- Top 10 Finishes
- Strokes Gained Total
- Strokes Gained Putting
- Strokes Gained Tee to Green
- Scoring Average
- Rounds played
- Driving Distance
- Driving Accuracy
- Greens in Regulation (GIR) %
- Ranking (ranking week leading up to masters)
- Wins
- Putts per Round
- Scrambling
- Par 5 scoring average
- Times played in Masters
- Bounce Back Percentage
- Proximity to Hole
- World Golf Ranking (WGR)