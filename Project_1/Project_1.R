# Project 1

#   Instructions:

#       Extract from twitter using your developer's credentials. Choose any keyword you want. 
#       Get 10000 observations "excluding retweets.
#       Plot the time series from the date created. with legends. 
#       Plot a graph (any graph you want)  based on the type of device - found in Source - that the user use. Include the legends.
#       Create a wordcloud from the screenName
library(twitteR)
library(rtweet)
library(tm)
library(dplyr)
library(plotly)
library(ggplot2)
library(RColorBrewer)
library(tidytext)
library(stringr)
library(tidyr)
library(magrittr)
library(wordcloud)
library(wordcloud2)
library(syuzhet)
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
trendTweets <- searchTwitter("Philippines -filter:retweets", 
                             n = 10000,
                             lang = "en",
                             since = "2022-11-24",
                             until = "2022-12-30",
                             retryOnRateLimit=120)


#twitter list to data.frame
philippinesDF <- twListToDF(trendTweets) 


save(philippinesDF,file = "philippinesDF.Rdata")
load(file = "philippinesDF.Rdata")

TweetsDF <- philippinesDF %>%
  select(screenName,text,created,statusSource)


save(TweetsDF,file = "TweetsDF.Rdata")
load(file = "TweetsDF.Rdata")


#plotting time series
library(rtweet)
ggplot(data = TweetsDF, aes(x = created)) +
  geom_histogram(aes(fill = ..count..)) +
  theme(legend.position = "right") +
  xlab("Time") + ylab("Number of tweets") + 
  scale_fill_gradient(low = "midnightblue", high = "aquamarine4")


#Plot a graph (any graph you want)  based on the type of device 
# - found in Source - that the user use. Include the legends.

encodeSource <- function(x) {
  if(grepl(">Twitter for iPhone</a>", x)){
    "iphone"
  }else if(grepl(">Twitter for iPad</a>", x)){
    "ipad"
  }else if(grepl(">Twitter for Android</a>", x)){
    "android"
  } else if(grepl(">Twitter Web Client</a>", x)){
    "Web"
  } else if(grepl(">Twitter for Windows Phone</a>", x)){
    "windows phone"
  }else if(grepl(">dlvr.it</a>", x)){
    "dlvr.it"
  }else if(grepl(">IFTTT</a>", x)){
    "ifttt"
  }else if(grepl(">Facebook</a>", x)){  
    "facebook"
  }else {
    "others"
  }
}

TweetsDF$tweetSource = sapply(TweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- TweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

TweetsDF$tweetSource = sapply(TweetsDF$statusSource, 
                              encodeSource)

tweet_appSource <- TweetsDF %>% 
  select(tweetSource) %>%
  group_by(tweetSource) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

# Plotting type of device 
ggplot(TweetsDF[TweetsDF$tweetSource != 'others',], aes(tweetSource, fill = tweetSource)) +
  geom_bar() +
  theme(legend.position="right",
        axis.title.x = element_blank(),
        axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylab("Number of tweets") +
  ggtitle("Tweets by Source")

# Create a wordcloud from the screenName

tweet_appScreen <- TweetsDF %>%
  select(screenName) %>%
  group_by(screenName) %>%
  summarize(count=n()) %>%
  arrange(desc(count)) 

#convert to Corpus
mynameCorpus <- Corpus(VectorSource(TweetsDF$screenName))  #using ScreenName
class(TweetsDF$screenName)
class(VectorSource(TweetsDF$screenName))
str(mynameCorpus)
mynameCorpus 


pal <- brewer.pal(8, "Dark2")
pal <- pal[-(1:4)]
set.seed(123)

par(mar = c(0,0,0,0), mfrow = c(1,1))

wordcloud(words = mynameCorpus, scale=c(3,0.5),
          max.words=500,
          random.order=FALSE,
          rot.per=0.5,
          use.r.layout=TRUE,
          colors=pal)

