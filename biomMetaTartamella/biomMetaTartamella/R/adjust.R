#' Adjusts pooled p-values to Account for Multiple Hypothesis Testing
#'
#' @description
#' The function, "adjust", reads in all of our pooled p-values.  We make a decision based on the number of p-values being sent to the function.  If this number is less than or equal to 10, we use function "p.adjust" on our p-values using method "bonferroni".  If this number is greater than 10, we use function "p.adjust" on our p-values using method "fdr".  Finally, we return the adjusted p-values to the user.
#'
#' @param p.values All the pooled p-values for every biomarker
#'
#' @return Returns adjusted pooled p-values to account for multiple hypothesis testing.
#' @export
#'
#' @examples
#' pval <- c(.05, .5, .75)
#' adjusted.pval <- adjust(pval)
#' print(adjusted.pval)

adjust <- function(p.values)
{
  n <- length(p.values)
  if (n <= 10)
  {
    adjusted.pvalues <- p.adjust(p.values, method = "bonferroni")
  }
  else
  {
    adjusted.pvalues <- p.adjust(p.values, method = "fdr")
  }
  return(adjusted.pvalues)
}
