# Multiple Linear Regression

# Importing the dataset
dataset = read.csv(
  '/media/c/HD/Caio/Cursos/Udemy/Machine Learning/Machine+Learning+A-Z+(Codes+and+Datasets)/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 5 - Multiple Linear Regression/R/50_Startups.csv')

# Encoding Categorical Data
dataset$State = factor(dataset$State,
                       levels = c('New York', 'California', 'Florida'),
                       labels = c(1, 2, 3))

# Splitting the dataset into the Training set and Test set
install.packages('caTools')
library(caTools)
set.seed(123)
split = sample.split(dataset$Profit, SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

#Fitting MLR to the Training set
                                 # setting all the other columns as independent proportional variables
regressor = lm(formula = Profit ~ ., 
               data = training_set)

info = summary(regressor)
# R.D.Spend is the most significant variable, because its P-value is the lesser!

#Predicting the Test set results
y_pred = predict(regressor, newdata = test_set)
y_pred
