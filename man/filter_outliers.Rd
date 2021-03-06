% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/filter_outliers.R
\name{filter_outliers}
\alias{filter_outliers}
\title{Filter lowly abundant features}
\usage{
filter_outliers(data, target = NULL, percent = 1, k = 1.5, lower_limit = NULL)
}
\arguments{
\item{data}{data to filter featuers from.}

\item{target}{columns to base the filtering on, supports \code{\link[tidyselect]{tidyselect-package}}.}

\item{percent}{A feature gets filtered out if it is lowly abundant or missing
in \code{percent} columns.}

\item{k}{Parameter for the lower limit of Tukey's fence, any value bellow this
will be considered an outlier.}

\item{lower_limit}{a user defined lower limit at which a measurement is
considered an outlier.}
}
\value{
data with outliers removed
}
\description{
Function for filtering lowly abundant features.
By default, it uses all numerical columns.
Missing values are always considered as outliers.
}
\examples{
# Since Tukey's fences are not ideal for raw proteomics data one could use
# the e.g., the tenth percentile as a indicator of lower abundance
filter_outliers(yeast, lower_limit = stats::quantile(yeast[-1], .1, na.rm = TRUE))

# We recommend normalizing the data before filtering outliers with Tukey's fences.
# This way we ensure that no peptides are considered outliers as an effect
# of a set of samples, one average, have lower quantification or that the
# lower fence is smaller then the smallest value in the dataset
yeast <- psrn(yeast, "identifier")
filter_outliers(yeast, -1, 1, 1.5)
}
