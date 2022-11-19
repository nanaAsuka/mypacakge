#'myLm
#'
#'mimic the lm() function in R, used to fit linear modals. output according statistics given the data and formula being provided
#'
#'@param formula an object of class "formula": a symbolic expression of the model being fitted.
#'
#'@param data data frame containing variables in the modal being fitted.
#'
#'
#'@return a list consisting of Coefficients and their corresponding standard error, t statistic and p-value. R squared and f statistic.
#'
#'@examples
#'fit <- myLm(formula = Murder ~ Rape, data = USArrests)
#'
#'fit$Coefficients
#'fit$F.statistic
#'
#'@export
#'
myLm = function(formula, data) {
  #### first drop missing value and obtain response variable and covariates
  data = na.omit(data)
  vars = all.vars(formula)


  #### define design matrix, outcome, dimensions ####
  X = model.matrix(formula, data = data)

  Y = as.matrix(data[,which(colnames(data) == vars[1])])
  n = nrow(X)
  p = ncol(X)

  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X)%*%X)%*%t(X)%*%Y
  Yhat = X%*%betahat
  epsilonhat = Y - Yhat ## residual

  res = as.vector(epsilonhat)
  names(res) <- row.names(data)

  residuals = quantile(epsilonhat)
  names(residuals) = c("Min", "1Q", "Median", "3Q", "Max")


  ## estimated sigma^2
  sigma_squared = t(epsilonhat)%*%epsilonhat/(n-p)

  ## variance of beta_hat
  var_betahat = diag( solve(t(X)%*%X) )*c(sigma_squared)
  se_betahat = sqrt(var_betahat) ## se of betahat


  #### Inference: t statistic and p val for H0: beta=0 ####
  t_statistic = c(betahat/se_betahat)
  p_value = c(2*( 1-pt(q=abs(t_statistic),df=n-p) ))


  ## calculate F statistics and corresponding p-value
  Ybar = mean(Y)
  SSE = sum((Y-Yhat)^2)
  SSR= sum((Yhat-Ybar)^2)

  dfSSR = p - 1
  dfSSE = n - p

  MSE = SSE/dfSSE
  MSR = SSR/dfSSR

  Fstat = round(MSR/MSE, digits = 2)

  F_pval = 1-pf(q=Fstat,df1=dfSSR,df2=dfSSE)

  Ftest = noquote(sprintf("%.2f on %d and %d DF,  p-value: %e", Fstat, dfSSR, dfSSE, F_pval))

  ## calculate R squared
  SSY = sum((Y-Ybar)^2)

  Rsquared = round(SSR/SSY, digits = 4)

  adj_Rsquared = round(1-(SSE/(dfSSE))/(SSY/(n-1)), digits = 4)


  #combine parameter estimate and inferences into a vector

  result <- data.frame("Estimate" = c(betahat), "Std. Error" = se_betahat,
                      "t value" = t_statistic, "Pr(>|t|)" =p_value, check.names = FALSE)


  #return a list to include everything
  ret = list(X, res, residuals, result, Rsquared, adj_Rsquared, Ftest)

  names(ret) = c("model","residuals","Residuals", "Coefficients", "Multiple.Rsquared", "Adjusted.Rsquared", "F.statistic")

  return(ret)

}
