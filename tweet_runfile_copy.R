library(rtweet)
library(dplyr)
library(taskscheduleR)
library(readr)


samson <- read_csv("C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans\\samson.csv")

# ORIGINAL VERSION 
# this version allows lyrics to pass from the end of one song to the beginning of the next. 
# gen_samson<-function() {
#  
#  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
#  plusone <- RandomNum + 1
#  samson %>% 
#    filter(count %in% RandomNum:plusone) %>% 
#    select(lyric) %>% 
#    summarise(vector=paste(lyric, collapse=" ")) %>% 
#    as.character() 
#}

gen_samson2 <-function() { 
  
  # generate random number, and then a range of lines above it. 
  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
  plusone <- RandomNum + 1
  plustwo <- RandomNum + 2
  
  # find the specific observation of the random number. 
  samson %>% 
    filter(count == RandomNum) -> specs
  
  # find the album and track for that random number. 
  album_spec <- specs$album
  track_n_spec<-specs$track_n
  
  # filter only that one song containing the chosen line, then grab the line (and the next after it) and convert them to text. 
  samson %>% 
    filter(album == album_spec) %>% 
    filter(track_n == track_n_spec) %>% 
    filter(count %in% RandomNum:plusone)%>% 
    select(lyric)  %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() -> sam1
  # do the same thing again, but for three total lines. 
  samson %>% 
    filter(album == album_spec) %>% 
    filter(track_n == track_n_spec) %>% 
    filter(count %in% RandomNum:plustwo)%>% 
    select(lyric)  %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() -> sam2
  
  # check to see if three lines can fit on a tweet; if not, run with only two lines of poetry. 
  if (nchar(sam2)<280) {
    return(sam2)     
  }
  else {
    return(sam1)
  }
  }
  
# lol get your own. 
consumerKey<-""
consumerSecret<-""
accessToken<-"-"
accessTokenSecret<-""


# create a token. 
token <- create_token(
  app = "thetweeterthans",
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = accessToken,
  access_secret = accessTokenSecret)

# generate the lines, and post them. 
gen_samson2() %>% 
  post_tweet(token = token)

