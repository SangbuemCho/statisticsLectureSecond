# covariance and correlation

library(tidyverse)
?faithful
df = faithful

# data visualization
df %>%
  ggplot(aes(eruptions, waiting)) + 
  geom_point() +
  geom_smooth(method = 'lm', formula = y~ x, se = FALSE)

#covariance calculation
df %>%
  mutate(eruption_ = eruptions - mean(eruptions),
         waiting_ = waiting - mean(waiting)) -> df

df %>%
  mutate(z = eruption_ * waiting_) -> df

sum(df$z) / (nrow(df) - 1)

# covariance computation
var(df$eruptions, df$waiting)

# correlation calculation
nom = var(df$eruptions, df$waiting)
denom = sqrt(var(df$eruptions)*var(df$waiting))
nom / denom

# correlation computation
cor(df$eruptions, df$waiting)
cor(df[1:2])

# pearson correlation analysis
## Null hypothesis: correlation is 0
## Alternative hypothesis: correlation is not 0
cor.test(df$eruptions, df$waiting)

# summary
# data 
df = faithful
head(df)
# pearson correlation analysis
cor.test(df$eruptions, df$waiting)


# Application
## data
df2 = iris
cor(df2[-5])
head(df2)
head(df2[-5]) # to cut Species column (categorical vars)

## multiple features correlations with pearson probability
library(psych)
?corr.test
corr.test(df2[-5])

# Application 2
## data
df2 = iris
cor(df2[-5])
head(df2)
head(df2[-5]) # to cut Species column (categorical vars)

# Normal distribution test 
lapply(df2[-5], shapiro.test)

## Sepal.Length, Petal.Length, Petal.Width are not in normal distribution
corOut <- corr.test(df2[-5], method = "kendall", adjust = 'none') 
corOut[["p"]] %>% round(., digits = 3)
corOut[["r"]] %>% round(., digits = 3)
