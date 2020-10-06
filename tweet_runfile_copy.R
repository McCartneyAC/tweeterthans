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

gen_samson2 <-function() { 
  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
  plusone <- RandomNum + 1
  
  
  samson %>% 
    filter(count == RandomNum) -> specs
  
  album_spec <- specs$album
  track_n_spec<-specs$track_n
  
  samson %>% 
    filter(album == album_spec) %>% 
    filter(track_n == track_n_spec) %>% 
    filter(count %in% RandomNum:plusone)%>% 
    select(lyric)  %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() %>% 
    cat()
  
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


gen_samson2() %>% 
  post_tweet(token = token)

