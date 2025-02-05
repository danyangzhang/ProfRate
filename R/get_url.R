#' URL Extractor
#'
#' Extracts URL by the name, department and university of the professor.
#'
#' @param name A character value of the professor's full name (required).
#' @param department A character value of the professor's department (optional).
#' @param university A character value of the professor's university (required).
#'
#' @export
#'
#' @import stringr
#'
#' @return A vector of URL(s)
#' @examples
#' name <- "Brakor"
#' department <- "Biology"
#' university <- "California Berkeley"
#' get_url(name = name, university = university)
#' get_url(name = name, department = department, university = university)

get_url <- function(name, department = NULL, university = NULL) {
  out <- get_tid(name = name, department = department, university = university)

  ### output url
  str_c("https://www.ratemyprofessors.com/ShowRatings.jsp?tid=", out$tID)
}
