#' Weighted Stouffer's Method for Pooled P-values
#'
#' @description
#' The function, "weighted.stouffer.pool", reads in the p-values for a specific biomarker and the number of observations which generated each of these p-values, which we store into variable 'n'.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, we set variable, "weight" equal to the \eqn{\sqrt{n}}.  I use method that pooled p-value equals \eqn{\phi \left(\dfrac{\sum_{i=1}^{k}\text{weight}_i \times \phi^{-1}(p_i)}{\sqrt{\sum_{i=1}^{k}\text{weight}_i^2}} \right)}.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values All the p-values for a specific biomarker
#' @param n A vector which contains the number of observations of the data set we used to generate each respective p-value
#'
#' @return Returns pooled p-value using Weighted Stouffer’s method.
#' @export
#'
#' @references Zaykin, D. V. (2011). Optimally weighted Z-test is a powerful method for combining probabilities in meta-analysis. Journal of Evolutionary Biology, 24(8), 1836–1841.
#' https://doi.org/10.1111/j.1420-9101.2011.02297.x
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' n <- c(50, 100, 200)
#' pooled.pval <- weighted.stouffer.pool(pval, n)
#' print(pooled.pval)

weighted.stouffer.pool <- function(p.values, n)
{
  k <- length(p.values)
  weight <- sqrt(n)
  stat <- qnorm(p.values, lower.tail=FALSE)
  p.pooled <- pnorm(sum(weight * stat) / sqrt(sum(weight^2)), lower.tail=FALSE)
  return(p.pooled)
}
