% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/imputation.R
\name{single_imputation}
\alias{single_imputation}
\title{Single imputation}
\usage{
single_imputation(data, design, id_col = "id")
}
\arguments{
\item{data}{a \code{data.frame} to perform the imputation on, missing values should
be \code{NA}.}

\item{design}{a design or model matrix as produced by
\code{\link[stats]{model.matrix}} with column names corresponding to the
different conditions.}

\item{id_col}{a character for the name of the column containing the
name of the features in data (e.g., peptides, proteins, etc.).}
}
\value{
a \code{data.frame} with \code{NA} values replaced by imputed values.
}
\description{
Performs a single imputation run and returns the data with NA values replaced
by imputed values.
}
\examples{
# Generate a design matrix for the data
design <- model.matrix(~ 0 + factor(rep(1:2, each = 3)))

# Set correct colnames, this is important for fit_gamma_weights
colnames(design) <- paste0("ng", c(50, 100))

yeast \%>\%
  # Normalize and log-transform the data
  psrn("identifier") \%>\%
  # Run the imputation
  single_imputation(design, "identifier")
}
