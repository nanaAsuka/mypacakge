
# mypackage

<!-- badges: start -->
[![R-CMD-check](https://github.com/nanaAsuka/mypacakge/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nanaAsuka/mypacakge/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/nanaAsuka/mypacakge/branch/master/graph/badge.svg)](https://app.codecov.io/gh/nanaAsuka/mypacakge?branch=master)
<!-- badges: end -->

The goal of mypackage is to  perform linear model fitting and achieve efficient simple analysis. It has one fucntion called `myLm()`.  Comparing to `lm()` function in the `stats` package. `myLm()` is more beginner-friendly and easier to use with. And more importantly, achives better performace for simple analysis than `lm()`.  

## Installation

You can install the development version of mypackage from [GitHub](https://github.com/) with:

``` r
install.packages("devtools")
devtools::install_github("nanaAsuka/mypacakge", build_vignettes = T)
library(mypackage)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(mypackage)

model_example = myLm(Sepal.Width~ Petal.Length , data = iris)


names(model_example) #this will gives you what's inside model_example
#>[1] "residuals"         "fitted.values"     "Residuals"         "df.residual"       "Coefficients"      "Multiple.Rsquared" "Adjusted.Rsquared" "F.statistic"      
#>[9] "Ftest"



```

This shows how to access the descriptions for specific function

``` r

?myLm


```

To access more usage examples, please use
``` r

browseVignettes(package = 'mypackage')

```


