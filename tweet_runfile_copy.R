library(rtweet)
library(dplyr)
library(taskscheduleR)
library(readr)


samson <- read_csv("C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans\\samson.csv")

gen_samson<-function() {
  
  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
  plusone <- RandomNum + 1
  samson %>% 
    filter(count %in% RandomNum:plusone) %>% 
    select(lyric) %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() 
}

consumerKey<-""
consumerSecret<-""
accessToken<-"-"
accessTokenSecret<-""



token <- create_token(
  app = "thetweeterthans",
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = accessToken,
  access_secret = accessTokenSecret)


gen_samson() %>% 
  post_tweet(token = token)

