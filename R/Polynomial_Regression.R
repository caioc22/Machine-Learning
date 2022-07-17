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

# Fitting the LR to the dataset
lin_reg = lm(formula = Salary ~ .,
             data = dataset)
summary(lin_reg)

# Fitting the Polynomial Reg to the set
dataset$Level2 = dataset$Level ^ 2
dataset$Level3 = dataset$Level ^ 3
dataset$Level4 = dataset$Level ^ 4
poly_reg = lm(formula = Salary ~ .,
              data = dataset)
summary(poly_reg)

# Visualizing LR line
library(ggplot2) # the R's "matplotlib"
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary), # scatter
             color = 'red') +
  geom_line((aes(x = dataset$Level, y= predict(lin_reg, newdata = dataset))), # plot
             color = 'blue') +
  ggtitle('Truth or Bluff (LR)') +
  xlab('Level') +
  ylab('Salary')
              
# Visualizing PolyReg curve
ggplot() +
  geom_point(aes(x = dataset$Level, y= dataset$Salary), # scatter
             color = 'red') +
  geom_line((aes(x = dataset$Level, y= predict(poly_reg, newdata = dataset))), # plot
            color = 'blue') +
  ggtitle('Truth or Bluff (Poly Reg)') +
  xlab('Level') +
  ylab('Salary')

# Predicting a new value with Linear Reg
y_pred = predict(lin_reg, data.frame(Level = 6.5))
y_pred

# Predicting a new result wth Poly Reg
y_pred2 = predict(poly_reg, data.frame(Level = 6.5,
                                       Level2 = 6.5^2,
                                       Level3 = 6.5^3,
                                       Level4 = 6.5^4))
y_pred2

