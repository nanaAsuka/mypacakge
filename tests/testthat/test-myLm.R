
test_that("return same residuals as lm", {
  expect_equal(myLm(formula = Murder~Rape+Assault,data = USArrests)$residuals, lm(formula = Murder~Rape+Assault, data = USArrests)$residuals)
})


test_that("return same fitted vvalue as lm", {
  expect_equal(myLm(formula = Murder~Rape+Assault,data = USArrests)$fitted.values, lm(formula = Murder~Rape+Assault, data = USArrests)$fitted.values)

})

test_that("return same coefficients as lm", {
  expect_equal(as.matrix(myLm(formula = Murder~Rape+Assault, data = USArrests)$Coefficients),
               as.matrix(summary(lm(formula =  Murder~Rape+Assault, data = USArrests))$coefficients))
})


test_that("return correct Multiple Rsquared", {
  expect_equal(myLm(formula = Murder~Rape+Assault, data = USArrests)$Multiple.Rsquared, 0.6446)

})

test_that("return correct Adjusted Rsquared", {
  expect_equal(myLm(formula = Murder~Rape+Assault, data = USArrests)$Adjusted.Rsquared, 0.6295)
})


test_that("return same df.residual as lm", {
  expect_equal(myLm(formula = Murder~Rape+Assault,data = USArrests)$df.residual, lm(formula = Murder~Rape+Assault, data = USArrests)$df.residual)
})


test_that("return same fstatistic as summary(lm)", {
  expect_equal(myLm(formula = Murder~Rape+Assault,data = USArrests)$F.statistic, summary(lm(formula = Murder~Rape+Assault, data = USArrests))$fstatistic)

})









