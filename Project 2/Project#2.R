# Project 2
#===============================================================================
#Extract 10000 tweets from Twitter using twitteR package including retweets.
#Subset the retweets and the original tweets into a separate file
#Plot the retweets and the original tweets using bar graph in vertical manner.
#Include legends

#Extract 10000 tweets from Twitter using twitteR package including retweets.

library(wordcloud)
library(plotly)
library(tm)
library(dplyr)
library(RColorBrewer)
library(ggplot2)
library(twitteR)

#SET-UP CREDENTIALS
CONSUMER_SECRET <- "laGMDCfJUSOReAgyw0Wbpxsw5mgbzb8lqo7cC2WU6tB4vrCrpB"
CONSUMER_KEY <- "3vdJJj4emRTPkNuNrp8dStj49"
ACCESS_SECRET <- "RNH4qsyvtRawmwH11qUargkQCKxf5tjvbsmZEQlYsF5Ud"
ACCESS_TOKEN <- "1592858497888444417-3jUbZnrov2hNroXf5KGV1M5rxIQIL0"

#CONNECT TO TWITTER APP
setup_twitter_oauth(consumer_secret = CONSUMER_SECRET,
                    consumer_key = CONSUMER_KEY,
                    access_secret = ACCESS_SECRET,
                    access_token = ACCESS_TOKEN
)

#Get 10000 observations "excluding retweets.
trendTweets <- searchTwitter("Philippines", 
                             n = 10000,
                             lang = "en",
                             since = "2022-11-24",
                             until = "2022-12-30",
                             retryOnRateLimit=120)

#twitter list to data frame
philippinesDF <- twListToDF(trendTweets)

#Save and Load Data frame files

save(philippinesDF, file = "philippinesDF.Rdata")
load(file = "philippinesDF.Rdata")


#Checking for missing values in data frame
saple_data <- sapply(philippinesDF, function(x) sum(is.na(x)))
saple_data

#==========================================================================
#Tweets

# Subsetting using the dplyr() PACKAGE.
philippines_tweets <- philippinesDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == FALSE)
philippines_tweets

# Grouping the data created. 
philippines_tweets %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

philippines_data <- philippines_tweets %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
philippines_data

mn <- philippines_tweets %>% pull(created) %>% min()
mn 
mx <- philippines_tweets %>% pull(created) %>% max()
mx


# Plot tweets using the library(plotly) and ggplot().
philData_plotting <- ggplot(philippines_data, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

philData_plotting %>% ggplotly()

#======================================================================
#Retweets

philippines_tweets2 <- philippinesDF %>%
  select(screenName,text,created, isRetweet) %>% filter(isRetweet == TRUE)
philippines_tweets2


# Grouping the data created
philippines_tweets2 %>%  
  group_by(1) %>%  
  summarise(max = max(created), min = min(created))

philippines_data2 <- philippines_tweets2 %>%  mutate(Created_At_Round = created %>% round(units = 'hours') %>% as.POSIXct())
philippines_data2

mn <- philippines_tweets2 %>% pull(created) %>% min()
mn 
mx <- philippines_tweets2 %>% pull(created) %>% max()
mx

# Plot retweets using the library(plotly) and ggplot().
philData_plotting2 <- ggplot(philippines_data2, aes(x = Created_At_Round)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")

philData_plotting2 %>% ggplotly()



