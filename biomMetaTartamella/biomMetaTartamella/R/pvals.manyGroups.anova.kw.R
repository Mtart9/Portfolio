#' Extracts p-values from a data set with many groups
#'
#' @description
#' The function, "pvals.manyGroups.anova.kw", generates p-values for each biomarker in the situation where we have more than 2 groups.  Our function first reads in the data and next we find the total number of biomarkers our data contains.  We then preallocate this amount of p-values.  Next, I use a "For" loop which runs from 1 to the number of biomarkers we have.  Inside this loop we iterate through all the biomarkers of our data and for each one we first preform Shapiro test to check if we can assume data to be normal.  If the value of the p-value we get from Shapiro test is greater than .05, we assume data is normally distributed and we then use one-way Anova test to generate our p-value for the biomarker.  If the value of the p-value we get from Shapiro test is less or equal to .05, we do not assume data is normally distributed and we use Kruskal Wallis test to generate our p-value for the biomarker.  After we do this for every biomarker we then return both the p-values for each biomarker and the total number of observations for each biomarker in the form of a list.
#'
#' @param data The data set with biomarkers which you want to extract p-values
#'
#' @return Returns p-values for each biomarker by choosing between ANOVA and Kruskal Wallis test and number of observations of the data set.
#' @export
#'
#' @examples
#' p <- 100
#' data1 <- data.frame(group = sample(1:3, 200, replace = TRUE), matrix(rnorm(p * 200), ncol = p))
#' colnames(data1) <- c("group", paste("gene", 1:p, sep = ""))
#' pval1 <- pvals.manyGroups.anova.kw(data1)
#' print(pval1)

pvals.manyGroups.anova.kw <- function(data)
{
  k <- ncol(data) - 1
  p.values <- numeric(k)
  for (i in 1:k)
  {
    nam <- paste("gene", i, sep = "")
    result <- shapiro.test(data[[nam]])
    if (result$p.value > .05)
    {
      anova.test <- aov(data[[nam]] ~ as.factor(data$group))
      p.values[i] <- summary(anova.test)[[1]][["Pr(>F)"]][1]
    }
    else
    {
      kw.test <- kruskal.test(data[[nam]] ~ as.factor(data$group))
      p.values[i] <- kw.test$p.value
    }
  }
  return(list(p.value=p.values, n=nrow(data)))
}
