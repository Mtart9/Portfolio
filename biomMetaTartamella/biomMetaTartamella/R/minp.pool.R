#' Minimum P-value Method for Pooled P-values
#'
#' @description
#' The function, "min.p.pool", reads in the p-values for a specific biomarker.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, we find the minimum value out of all of our p-values.  Then, we find our pooled p-value using a beta distribution with degrees of freedom \eqn{\alpha = 1} and \eqn{\beta = k}.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values All the p-values for a specific biomarker
#'
#' @return Returns pooled p-value using Minimum p-value method.
#' @export
#'
#' @references Chang, L., Lin, H., Sibille, E., & Tseng, G. C. (2013). Meta-analysis methods for combining multiple expression profiles: comparisons, statistical characterization and an application guideline. BMC Bioinformatics, 14(1).
#' https://doi.org/10.1186/1471-2105-14-368
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' pooled.pval <- minp.pool(pval)
#' print(pooled.pval)

minp.pool <- function(p.values)
{
  k <- length(p.values)
  p.min <- min(p.values)
  p.pooled <- pbeta(p.min, 1, k)
  return(p.pooled)
}
