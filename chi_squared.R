# Chi-squared cross table
library(tidyverse)
install.packages('gmodels')
library(gmodels)
install.packages('vcd')
library(vcd)

# Data 
?Arthritis
dat <- Arthritis
head(dat, 3)
str(dat)
dim(dat)

# Cross Table
CrossTable(dat$Treatment, 
           dat$Improved, 
           expected = TRUE, chisq = TRUE) 
