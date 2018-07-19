# This is a tutorial for R from a Computerworld article
# https://www.computerworld.com/article/2497143/business-intelligence/business-intelligence-beginner-s-guide-to-r-introduction.html?page=1

# Set working directory
# setwd("~/mydirectory")

# See installed packages already installed on your system
installed.packages()

# update your packages to stay up to date
update.packages()

# If you no longer need or want a package on your system, use the function:
# remove.packages("thepackagename")

# Some test data (pre-loaded data sets)
data()

# Look at Motor Trends car dataset
mtcars

# Import data and assign it into a variable (data frame) and make it so that the string
# columns are not set as factors
mydata <- read.table("filename.txt", sep="\t", header=TRUE, stringsAsFactor=FALSE)

# The command below handles clipboard data with a header row that's separated by tabs, 
# and stores the data in a data frame (x):
x <- read.table(file = "clipboard", sep="\t", header=TRUE)

# read.csv() and read.table() work pretty much the same to access files from the Web
# as they do for local data. For example, Pew Research Center data about mobile shopping 
# are available as a CSV file for download. You can store the data in a variable called 
# pew_data like this:
pew_data <- read.csv("http://bit.ly/11I3iuU")

# Install the Quantmod package (financial analysis package) that retrieves a company's 
# stock price and charts them using the barChart function
install.packages("quantmod")
library(quantmod)
getSymbols("AAPL")
barChart(AAPL)
barChart(AAPL, subset = "last 14 days")
chartSeries(AAPL, subset = "last 14 days")
barChart(AAPL["2013-04-01::2013-04-12"])

# Remove objects from memory
rm(x)

# You can also save your entire workspace. While you're in R, use the function:
save.image()

# You can also save an individual R object for later loading with the save function:
save(variablename, file="filename.rda")

# Reload it at any time with:
load("filename.rda")

# Load mtcars into a variable called mydata
mydata <- mtcars

# See the first 10 rows
head(mydata, n=10)

# See the last 10 rows
tail(mydata, 10)

# To see the structure of the data
str(mydata)

# To see just the column names
colnames(mydata)

# To see row names...in essence, all the values in the first column of your data frame
rownames(mydata)

# Pull som basic stats from the data frame
summary(mydata)

# If you'd like even more statistical summaries from a single command, 
# install and load the psych package. Install it with this command:
install.packages("psych")
library(psych)

describe(mydata)

# "mad" (mean absolute deviation), skew (measuring whether or not the data 
# distribution is symmetrical) and kurtosis (whether the data have a sharp 
# or flatter peak near its mean).

# See the correlation
cor(mydata)

# You don't always need a data set to do some stats
# How many ways can you select a committee of 4 people from a group of 15?
# You can pull out your calculator and find 15 divided by 4 times 11!
choose(15,4)

# How about out of 5 people, how may can you pair up?
mypeople <- c("Bob", "Joanne", "Sally", "Tim", "Neal")
combn(mypeople, 2)
# Put the two commands together to make it a little more streamlined
combn(c("Bob", "Joanne", "Sally", "Tim", "Neal"),2)

# See the names of the columns
names(mydata)

# Get cars with just columns 1 - 4
mtcars[,2:4]

# Get cars with mpg greater than 20
mtcars[mtcars$mpg>20,]

library(dplyr)
select(mtcars, mpg, hp)
filter(mtcars, mpg>20)

# Using dplyr, you can combine filter and subset with %>% "chaining" operations
# that allows you to string together multiple commands on a data frame
mtcars %>%
  filter(mpg > 20) %>%
  select(mpg, hp) %>%
  arrange(desc(mpg))

library(ggplot2)

# Slice and dice the data
table(diamonds$cut)
table(diamonds$cut, diamonds$color)


