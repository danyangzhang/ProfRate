#' Sentiment Info Extractor
#'
#' Provides common positive words and negative words extracted from comments, and tags from the website.
#'
#' @param url A character value indicating the URL of the professor's webpage.
#' @param y A numeric value to filter ratings after a certain year.
#' @param word A character value indicating the user's interest in positive words, negative words, or tags. Choices among "Positive", "Negative", and "Tags" with default as "Positive".
#' @import rvest
#' @import stringr
#' @import tidytext
#' @import dplyr
#' @import polite
#' @export
#' @return A data frame with 2 columns
#' \itemize{
#'   \item word - Words or tags
#'   \item n - Count of words in comments or tags
#' }
#' @examples
#' url <- 'https://www.ratemyprofessors.com/ShowRatings.jsp?tid=2036448'
#' sentiment_info(url = url, y = 2018, word = "Negative")

sentiment_info <- function(url, y = 2018, word = "Positive") {
  # Reading the Webpage with polite
  session <- bow(url)
  webpage <- scrape(session)

  # Input Words to lower cases (all letters)
  word = tolower(word)

  comment_df <- comment_info(url = url, y = y)

  # Stop further analysis if fewer than 1 comment
  stopifnot("Fewer than 1 comment!" = nrow(comment_df) > 1)
  stopifnot("Incorrect input for argument words. Only 'Positive', 'Negative', and 'Tags' are allowed." = word %in% c('positive', 'negative', 'tags'))

  # Sentiment analysis of words in all comments, using sentiment lexicons "bing"
  # from Bing Liu and collaborators
  comments <- NULL
  comment_sentiment <- comment_df %>%
    unnest_tokens(word, comments, drop = FALSE) %>%
    inner_join(get_sentiments("bing"))

  # Filter and sort positive words by frequency
  sentiment <- NULL

  positive <- comment_sentiment %>%
    filter(sentiment == "positive") %>%
    group_by(word) %>%
    count(sort = TRUE)

  # Filter and sort negative words by frequency
  negative <- comment_sentiment %>%
    filter(sentiment == "negative") %>%
    group_by(word) %>%
    count(sort = TRUE)

  # Extract Tags
  tags <- data.frame(tags = html_text(html_nodes(webpage, ".hHOVKF"))) %>%
    group_by(tags) %>%
    count(sort = TRUE)

  if (word == "positive") {
    return(positive)
  } else if (word == "negative") {
    return(negative)
  } else {
    return(tags)
  }
}
