## install rtweet from CRAN
install.packages("rtweet")

## load rtweet package
library(rtweet)
library(dplyr)
library(readr)
library(geniusr)

setwd("C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans")


## authenticate via web browser
token <- create_token(
  app = "thetweeterthans",
  consumer_key = consumerKey,
  consumer_secret = consumerSecret,
  access_token = accessToken,
  access_secret = accessTokenSecret)


token
get_token() # wtf

# post_tweet(status = "Waking up each morning with confusion in my eyes Wind is biting through to wave hello", token = token)



fallow <- genius_album(artist = "The Weakerthans", album = "Fallow")
leftleaving<-genius_album(artist = "The Weakerthans", album = "Left and Leaving")
reconstruction<-genius_album(artist = "The Weakerthans", album = "Reconstruction Site")
reunion<-genius_album(artist = "The Weakerthans", album = "Reunion Tour")
provincial<-genius_album(artist = "John K Samson", album = "Provincial")
winter<-genius_album(artist = "John K Samson", album = "Winter Wheat")
tangles<-genius_album(artist = "John K Samson", album = "Slips and Tangles")
gifts<-genius_album(artist = "Propagandhi", album = "Less talk More rock") %>% 
  filter(track_title == "Gifts")
fantasy <- genius_lyrics(artist = "John K Samson", 
                         song = "Fantasy Baseball at the End of the World") %>% 
  mutate(track_n = 1) %>% 
  select(track_n, line, lyric, track_title)
fantasy

samson<-  bind_rows(
  tangles, gifts, fallow, leftleaving, reconstruction, 
  reunion, provincial, winter, fantasy,  
  .id = "album"
) %>% 
  mutate(count = row_number())




write_csv(samson, "samson.csv")
samson <- use("C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans\\samson.csv")


gen_samson<-function() {
  
  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
  plusone <- RandomNum + 1
  samson %>% 
    filter(count %in% RandomNum:plusone) %>% 
    select(lyric)  %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() 
}
gen_samson()
names(samson)
samson


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
gen_samson2()


