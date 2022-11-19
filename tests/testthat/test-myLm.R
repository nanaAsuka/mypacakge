test_that("myLm works", {


  expect_equal(myLm(formula = Murder~Rape+Assault, data = USArrests)$Multiple.Rsquared, 0.6446)

  expect_equal(myLm(formula = Murder~Rape+Assault, data = USArrests)$Adjusted.Rsquared, 0.6295)


  expect_equal(myLm(formula = Murder~Rape+Assault,data = USArrests)$residuals, (lm(formula = Murder~Rape+Assault, data = USArrests))$residuals)


  expect_equal(as.matrix(myLm(formula = Murder~Rape+Assault, data = USArrests)$Coefficients),
               as.matrix(summary(lm(formula =  Murder~Rape+Assault, data = USArrests))$coefficients))






})
