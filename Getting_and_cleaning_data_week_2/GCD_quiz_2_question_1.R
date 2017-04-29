#Getting and cleaning data quiz 2 question 2
library(httr)
library(xml2)
library(httpuv)
library(jsonlite)

# 1. Find OAuth settings for github:
#    http://developer.github.com/v3/oauth/
oauth_endpoints("github")

# 2. To make your own application, register at at
#    https://github.com/settings/applications. Use any URL for the homepage URL
#    (http://github.com is fine) and  http://localhost:1410 as the callback url
#
#    Replace your key and secret below.
myapp <- oauth_app("R_Getting_Cleaning_Data_Quiz_2",
                   key = "6e6660f44bc30fa3fdd2",
                   secret = "d7a975149d2bc7a45ad1c32283054ebdec06e64e")

# 3. Get OAuth credentials
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

# 4. Use API
gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
cont <- content(req)
jsonData <- fromJSON(toJSON(cont))
print(jsonData[jsonData$name =="datasharing", "created_at"])
