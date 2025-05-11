#' Lancaster's Method for Pooled P-values
#'
#' @description
#' The function, "lancaster.pool", reads in the p-values for a specific biomarker and the number of observations which generated each of these p-values, which we store into variable 'n'.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, I generate pooled p-value by transforming our p-values to chi-square variables using inverse chi-square transformation with the degrees of freedom equal to the sum of the observations of the p-values we read in.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values All the p-values for a specific biomarker
#' @param n A vector which contains the number of observations of the data set we used to generate each respective p-value
#'
#' @return Returns pooled p-value using Lancaster’s method.
#' @export
#'
#' @references Zaykin, D. V. (2011). Optimally weighted Z-test is a powerful method for combining probabilities in meta-analysis. Journal of Evolutionary Biology, 24(8), 1836–1841.
#' https://doi.org/10.1111/j.1420-9101.2011.02297.x
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' n <- c(50, 100, 200)
#' pooled.pval <- lancaster.pool(pval, n)
#' print(pooled.pval)

lancaster.pool <- function(p.values, n)
{
  stat <- sum(qchisq(p.values, n) * (1 - p.values))
  p.pooled <- pchisq(stat, sum(n))
  return(p.pooled)
}
