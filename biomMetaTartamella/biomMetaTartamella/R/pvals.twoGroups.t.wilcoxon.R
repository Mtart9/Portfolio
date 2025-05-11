#' Extracts p-values from a data set with two groups
#'
#' @description
#' The function, "pvals.twoGroups.t.wilcoxon", generates p-values for each biomarker in the situation where we have only 2 groups.  Our function first reads in the data and next we find the total number of biomarkers our data contains.  We then preallocate this amount of p-values.  Next, I use a "For" loop which runs from 1 to the number of biomarkers we have.  Inside this loop we iterate through all the biomarkers of our data and for each one we first preform Shapiro test to check if we can assume data to be normal.  If the value of the p-value we get from Shapiro test is greater than .05, we assume data is normally distributed and then we use function "var.test" in order to check if we can use equal variance assumption.  If the p-value generated from "var.test" is greater than .05 we preform t-test with equal variance assumption to generate our p-value for the biomarker.  If the p-value generated from "var.test" is less or equal to .05 we preform t-test with unequal variance assumption to generate our p-value for the biomarker.  If the value of the p-value we get from Shapiro test is less or equal to .05, we do not assume data is normally distributed and we use Wilcoxon rank sum test to generate our p-value for the biomarker.  After we do this for every biomarker, we return both the p-values for each biomarker and the total number of observations for each biomarker in the form of a list.
#'
#' @param data The data set with biomarkers which you want to extract p-values
#'
#' @return Returns p-values for each biomarker by choosing between t-tests and Wilcoxon rank sum test and number of observations of the data set.
#' @export
#'
#' @examples
#' p <- 100
#' data2 <- data2 <- data.frame(group = sample(1:2, 150, replace = TRUE), matrix(rnorm(p * 150), ncol = p))
#' colnames(data2) <- c("group", paste("gene", 1:p, sep = ""))
#' pval2 <- pvals.twoGroups.t.wilcoxon(data2)
#' print(pval2)

pvals.twoGroups.t.wilcoxon <- function(data)
{
  k <- ncol(data) - 1
  p.values <- numeric(k)
  for (i in 1:k)
  {
    nam <- paste("gene", i, sep = "")
    result <- shapiro.test(data[[nam]])
    if (result$p.value > .05)
    {
      var.equal <- var.test(data[[nam]], data$group)
      if (var.equal$p.value > 0.05)
      {
        t <- t.test(data[[nam]], data$group, var.equal = TRUE)
        p.values[i] <- t$p.value
      }
      else
      {
        t <- t.test(data[[nam]], data$group, var.equal = FALSE)
        p.values[i] <- t$p.value
      }
    }
    else
    {
      wilcox <- wilcox.test(data[[nam]], data$group)
      p.values[i] <- wilcox$p.value
    }
  }
  return(list(p.value=p.values, n=nrow(data)))
}
