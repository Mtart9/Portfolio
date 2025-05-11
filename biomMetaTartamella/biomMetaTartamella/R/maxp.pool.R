#' Maximum P-value Method for Pooled P-values
#'
#' @description
#' The function, "max.p.pool", reads in the p-values for a specific biomarker.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, we find the maximum value out of all of our p-values.  Then, we find our pooled p-value using a beta distribution with degrees of freedom \eqn{\alpha = k} and \eqn{\beta = 1}.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values
#'
#' @return Returns pooled p-value using Weighted Fisher’s method.
#' @export
#'
#' @references Chang, L., Lin, H., Sibille, E., & Tseng, G. C. (2013). Meta-analysis methods for combining multiple expression profiles: comparisons, statistical characterization and an application guideline. BMC Bioinformatics, 14(1).
#' https://doi.org/10.1186/1471-2105-14-368
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' pooled.pval <- maxp.pool(pval)
#' print(pooled.pval)

maxp.pool <- function(p.values)
{
  k <- length(p.values)
  p.max <- max(p.values)
  p.pooled <- pbeta(p.max, k, 1)
  return(p.pooled)
}
