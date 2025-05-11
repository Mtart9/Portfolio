#' Fisher's Method for Pooled P-values
#'
#' @description
#' The function, "fisher.pool", reads in the p-values for a specific biomarker.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  We then create a variable "stat" to hold the value \eqn{-2 \times \sum_{i=1}^{k}\log({p_i})}.  We generate our pooled p-value utilizing chi-squared distribution with degrees of freedom \eqn{2 \times k}.  Finally, we return the pooled p-value for the biomarker.
#'
#' @param p.values All the p-values for a specific biomarker
#'
#' @return Returns pooled p-value using Fisher’s method.
#' @export
#'
#' @references Chang, L., Lin, H., Sibille, E., & Tseng, G. C. (2013). Meta-analysis methods for combining multiple expression profiles: comparisons, statistical characterization and an application guideline. BMC Bioinformatics, 14(1).
#' https://doi.org/10.1186/1471-2105-14-368
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' pooled.pval <- fisher.pool(pval)
#' print(pooled.pval)

fisher.pool <- function(p.values)
{
  k <- length(p.values)
  stat <- -2 * sum(log(p.values))
  p.pooled <- pchisq(stat, df = 2 * k, lower.tail = FALSE)
  return(p.pooled)
}
