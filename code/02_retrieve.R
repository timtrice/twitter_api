library(here)
library(dplyr)
library(purrr)
library(rtweet)

# https://jsta.rbind.io/blog/making-a-twitter-dashboard-with-r/

username <- 'timtrice'

token <- create_token(
  app             = Sys.getenv("twitter_app"),
  consumer_key    = Sys.getenv("twitter_consumer_key"),
  consumer_secret = Sys.getenv("twitter_consumer_secret"),
  access_token    = Sys.getenv("twitter_access_token"),
  access_secret   = Sys.getenv("twitter_access_secret")
)

retrieve_favorites <- function(username, n = 3000L, last_status_id = NA) {

  if (is.na(last_status_id)) {
    favorites <- get_favorites(username, n = n)
  } else {
    favorites <- get_favorites(username, n = n, max_id = last_status_id)
  }

  # Warn of rate limit if under 25%
  rate_limit <- rate_limit(token, "favorites/list")
  rate_limit <- rate_limit$remaining/rate_limit$limit

  if (is.nan(rate_limit)) {
    error("Rate limit exceeded", .call = FALSE)
  }

  if (rate_limit <= 0.25) {
    warning("Rate limit approaching")
  }

  favorites <- arrange(favorites, desc(created_at))

  if (nrow(favorites) < n) {
    return(favorites)
  }

  last_id <- max_id(favorites)

  return(rbind(favorites, retrieve_favorites(username, last_status_id = last_id)))
}

favorites <- retrieve_favorites(username)

save(favorites, file = here("./output/favorites.rds"))

head(favorites)
