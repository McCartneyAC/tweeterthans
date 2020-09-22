## install rtweet from CRAN
install.packages("rtweet")

## load rtweet package
library(rtweet)



setwd("C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans")

consumerKey<-"gcvgy"
consumerSecret<-"vgy"
accessToken<-"1308167758245396483-nmi"
accessTokenSecret<-" hgy"


# setup_twitter_oauth(consumerKey,consumerSecret,accessToken,accessTokenSecret)


## authenticate via web browser
token <- create_token(
  app = "thetweeterthans",
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = accessToken,
  access_secret = accessTokenSecret)

token


post_tweet(status = "I can't remember the sound you found for me", token = token)
get_token()


library(geniusr)
fallow <- genius_album(artist = "The Weakerthans", album = "Fallow")
leftleaving<-genius_album(artist = "The Weakerthans", album = "Left and Leaving")
reconstruction<-genius_album(artist = "The Weakerthans", album = "Reconstruction Site")
reunion<-genius_album(artist = "The Weakerthans", album = "Reunion Tour")
provincial<-genius_album(artist = "John K Samson", album = "Provincial")
winter<-genius_album(artist = "John K Samson", album = "Winter Wheat")
tangles<-genius_album(artist = "John K Samson", album = "Slips and Tangles")


samson<-bind_rows(
  tangles, fallow, leftleaving, reconstruction, reunion, provincial, winter
)
samson
write_csv(samson, "samson.csv")
