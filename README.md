# tweeterthans
let's try to make a tweet bot in R.

https://mobile.twitter.com/tweeterthans



```
samson = read_csv("samson.csv")


gen_samson<-function() {
  
  RandomNum <- round(runif(1, 1, max(samson$count)), 0)
  plusone <- RandomNum + 1
  samson %>% 
    filter(count %in% RandomNum:plusone) %>% 
    select(lyric) %>% 
    summarise(vector=paste(lyric, collapse=" ")) %>% 
    as.character() 
}
```

```
> gen_samson()
[1] "What will I do now? What will I do now?"
```
