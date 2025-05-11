# biomMetaTartamella

`biomMetaTartamella` is a custom R package built for conducting meta-analyses across multiple datasets containing biomarker or gene expression data. This project was developed as part of a graduate-level statistical computing course at Stony Brook University.

---

## 📦 Package Overview

This package includes:
- Statistical tests for biomarker group comparisons (ANOVA, Kruskal-Wallis, t-tests)
- Functions to pool p-values across studies using various methods:
  - Fisher’s method
  - Stouffer’s method (weighted & unweighted)
  - Lancaster’s method
  - Min/Max p-value combination
  - Weighted Fisher
- Multiple testing corrections using Bonferroni and FDR
- Custom S3 classes to structure input and output cleanly

---

## 🧪 Repository Contents
├── biomMetaTartamella/ # Fully structured R package\
├── biomMetaTartamella_0.0.0.9000.tar.gz # Compressed version of the package\
├── Project_Functions.docx # Summary of implemented functions\
├── function_definitions.Rmd # RMarkdown for function development\
├── function_testing_environment.Rmd # RMarkdown for testing functions\
├── README.md # This file

---

## 🛠️ Installation

You can install this package locally by using:

```r
devtools::install_local("biomMetaTartamella_0.0.0.9000.tar.gz")
```
## 🚀 Example Usage
```r
library(biomMetaTartamella)

# Run ANOVA on a dataset with 3+ groups
result <- pvals.manyGroups.anova.kw(dataset)
print(result)

# Pool p-values using Stouffer's method
stouffer_result <- poolP.stouffer(result$p.values)
```
## 📄 License

This project is licensed for academic and personal use. MIT License recommended if publishing more broadly.

## 📬 Contact

Michael Tartamella\
📧 mtartamella117@gmail.com\
🔗 linkedin.com/in/michael-tartamella
