#task scheduling

install.packages("taskscheduleR")
library(taskscheduleR)

taskscheduler_create(taskname = "tweet_samson", 
                     rscript = "C:\\Users\\Andrew\\Desktop\\Statistics and Data Analysis\\tweeterthans\\tweet_runfile.R", 
                     schedule = "DAILY", 
                     startdate = "09/22/2020",
                     starttime = format(Sys.time() + 550, "%H:%M"))

