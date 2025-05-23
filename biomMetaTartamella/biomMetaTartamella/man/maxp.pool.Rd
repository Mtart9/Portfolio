% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/maxp.pool.R
\name{maxp.pool}
\alias{maxp.pool}
\title{Maximum P-value Method for Pooled P-values}
\usage{
maxp.pool(p.values)
}
\arguments{
\item{p.values}{}
}
\value{
Returns pooled p-value using Weighted Fisher’s method.
}
\description{
The function, "max.p.pool", reads in the p-values for a specific biomarker.  First, we find the total number of p-values sent to the function and store this information into a variable, 'k'.  Next, we find the maximum value out of all of our p-values.  Then, we find our pooled p-value using a beta distribution with degrees of freedom \eqn{\alpha = k} and \eqn{\beta = 1}.  Finally, we return the pooled p-value for the biomarker.
}
\examples{
pval <- c(.05, .5, .75)
pooled.pval <- maxp.pool(pval)
print(pooled.pval)
}
\references{
Chang, L., Lin, H., Sibille, E., & Tseng, G. C. (2013). Meta-analysis methods for combining multiple expression profiles: comparisons, statistical characterization and an application guideline. BMC Bioinformatics, 14(1).
https://doi.org/10.1186/1471-2105-14-368
}
