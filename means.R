# Descriptive statistics

## Arithmetic mean

A <- c(10, 20, 30, 40, 50)
mean(A)

B <- c(10, 20, 30, 40, 50, NA)
mean(B)
mean(B, na.rm = T)

# Geometric means
eRate = c(1000, 1100, 1980, 1881)

## for loop instance
for(x in 1:3) {
  print(x)
}

## run loop and return result as list
lapply(1:3, function(x) {
  eRate[x+1]/eRate[x]
}) -> a

## list to vector
b <- unlist(a)
b

## Arithmetic mean application
mean(b)
eRate
eRate[-4]
eRate[-4] * mean(b)
### MAE calculation
abs(exchangeRate[-4] * mean(b) - exchangeRate[-1]) -> c
mean(c)

## Geometric mean application
### Geometric mean function customizing
geometricFun <- function(x) {
  exp(mean(log(x)))
}
geometricFun(b)
eRate
eRate[-4]
eRate[-4] * geometricFun(b)
### MAE calculation
abs(exchangeRate[-4] * geometricFun(b) - exchangeRate[-1]) -> c1
mean(c1)

# Harminic mean
## data
vD = c(1, 2, 4, 1)

totalDistance = 2*4
eachTime = 2/vD
totalTime = sum(eachTime)

## Arithmetic mean application
b = mean(vD)
b
totalDistance/b

## Harmonic mean application
harmonic <- function(x) {
  1 / mean(1/x)
}

c = harmonic(vD)
totalDistance/c

