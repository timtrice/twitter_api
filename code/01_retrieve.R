library(here)
library(dplyr)
library(rtweet)

# https://jsta.rbind.io/blog/making-a-twitter-dashboard-with-r/

username <- ''

token <- create_token(
  app             = Sys.getenv("twitter_app"),
  consumer_key    = Sys.getenv("twitter_consumer_key"),
  consumer_secret = Sys.getenv("twitter_consumer_secret"),
  access_token    = Sys.getenv("twitter_access_token"),
  access_secret   = Sys.getenv("twitter_access_secret")
)

my_likes <- get_favorites(username, n = 3000)
my_likes2 <- get_favorites(username, n = 3000, max_id = min(my_likes$status_id))
my_likes3 <- get_favorites(username, n = 3000, max_id = min(my_likes2$status_id))
my_likes4 <- get_favorites(username, n = 3000, max_id = min(my_likes3$status_id))

favorites <- rbind(my_likes, my_likes2, my_likes3, my_likes4)

save(favorites, file = here(".", "data", "favorites.rds"))
