rankall <- function(outcome, num) {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("invalid outcome")
  }
  
  ## For each state, find the hospital of the given rank
  
  find_rank <- function(x){
    df <- df[df[x] != "Not Available",]
    df[, x] <- as.numeric(df[, x])
    list <- split(df, df$State)
    sapply(list, function(y) 
    {
      y <- y[order(y[x], y$Hospital.Name),c("Hospital.Name", "State")]
      #names(y) <- c("hospital", "state")
      if(num == "best")
        y[1,]
      else if(num == "worst")
        y[length(y),]
      else {
        if(num > length(y)) NA
        y[num,]
      }
  })
    
  }
  if(outcome == "heart attack"){
    find_rank(11)
  } else if(outcome == "heart failure"){
    find_rank(17)
  } else if(outcome == "pneumonia"){
    find_rank(23)
  } 
}