# Polynomial Regression

# Importing the dataset
dataset = read.csv('Machine-Learning/datasets/Position_Salaries.csv')
dataset = dataset[2:3] # The position has no relevance here

# Splitting the dataset into the Training set and Test set
# install.packages('caTools')
# library(caTools)
# set.seed(123)
# split = sample.split(dataset$DependentVariable, SplitRatio = 0.8)
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)

# Fitting the SVR to the dataset
# install.packages('e1071')
library(e1071)
regressor = svm(formula = Salary ~ .,
             data = dataset,
             type = 'eps-regression' # gaussian kernel
             )
summary(regressor)

# Predicting a new result
y_pred = predict(regressor, data.frame(Level = 6.5))
y_pred

# Visualizing LR line
library(ggplot2) # the R's "matplotlib"
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary), # scatter
             color = 'red') +
  geom_line((aes(x = dataset$Level, y= predict(regressor, newdata = dataset))), # plot
            color = 'blue') +
  ggtitle('Truth or Bluff (SVR)') +
  xlab('Level') +
  ylab('Salary')
