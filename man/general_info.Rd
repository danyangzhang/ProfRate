% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/general_info.R
\name{general_info}
\alias{general_info}
\title{General Info Extractor}
\usage{
general_info(url)
}
\arguments{
\item{url}{A character value indicating the URL of the professor's webpage.}
}
\value{
A list with three elements
\itemize{
  \item name - Complete name of the professor
  \item department - The department of the professor
  \item university - The university of the professor
}
}
\description{
Extracts general information on an professor.
}
\examples{
url <- 'https://www.ratemyprofessors.com/ShowRatings.jsp?tid=2036448'
general_info(url = url)
}
