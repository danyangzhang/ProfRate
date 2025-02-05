% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ratings_info.R
\name{ratings_info}
\alias{ratings_info}
\title{Ratings Extractor}
\usage{
ratings_info(url, y = 2018)
}
\arguments{
\item{url}{A character value indicating the URL of the professor's webpage.}

\item{y}{A numeric value to filter ratings after a certain year.}
}
\value{
A list of 1 total number of ratings and 2 data frames
\itemize{
  \item n - Number of ratings after filtering
  \item ratings - All rating information after a given year
  \item summary - Summary statistics
}
}
\description{
Extracts and summarizes all rating information on an professor.
}
\examples{
url <- 'https://www.ratemyprofessors.com/ShowRatings.jsp?tid=2036448'
ratings_info(url = url)
}
