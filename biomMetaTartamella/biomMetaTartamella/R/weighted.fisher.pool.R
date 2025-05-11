#' Weighted Fisher's Method for Pooled P-values
#'
#' @description
#' The function, "weighted.fisher.pool", reads in the p-values for a specific biomarker.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, we set a variable "weight" equal to \eqn{\sqrt{k}}.  Then, I use gamma distribution to find values for our test statistic and gamma to generate our pooled p-value.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values All the p-values for a specific biomarker
#'
#' @return Returns pooled p-value using Maximum p-value method.
#' @export
#'
#' @references Li, J., & Tseng, G. C. (2011). An adaptively weighted statistic for detecting differential gene expression when combining multiple transcriptomic studies. The Annals of Applied Statistics, 5(2A).
#' https://doi.org/10.1214/10-aoas393
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' pooled.pval <- weighted.fisher.pool(pval)
#' print(pooled.pval)

weighted.fisher.pool <- function(p.values)
{
  k <- length(p.values)
  weight <- sqrt(k)
  stat <- qgamma(p.values, shape = weight, scale = 2)
  p.pooled <- dgamma(sum(stat), shape = sum(weight), scale = 2)
  return(p.pooled)
}
