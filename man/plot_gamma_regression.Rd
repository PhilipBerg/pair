% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_gamma_regression.R
\name{plot_gamma_regression}
\alias{plot_gamma_regression}
\title{Function for plotting the mean-variance gamma regressions}
\usage{
plot_gamma_regression(data, design, id_col = "id")
}
\arguments{
\item{data}{The data to use for producing the plots.}

\item{design}{A design matrix as produced by \code{\link[stats]{model.matrix}}.}

\item{id_col}{A character for the name of the column containing the
name of the features in data (e.g., peptides, proteins, etc.).}
}
\value{
a plot with the mean-variance trend used for the precision
weights on the left side, and the trend lines used for the imputation on the
right side.
}
\description{
Generates a scatter plot with the gamma regressions of the mean-variance
trends for the precision weights and imputation.
}
\examples{
# Produce a design matrix
design <- model.matrix(~ 0 + factor(rep(1:2, each = 3)))
colnames(design) <- paste0("ng", c(50, 100))

# Normalize and log transform the data
yeast <- psrn(yeast, "identifier")

# Generate the plots
plot_gamma_regression(yeast, design, "identifier")
}
