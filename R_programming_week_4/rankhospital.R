rankhospital <- function(state, outcome, num) {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!state %in% unique(df$State)){
    stop("invalid sate")
  } 
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
    stop("invalid outcome")
  }
  
  ## Return hospital name in that state with the given rank
  
  find_rank <- function(x){
    df <- df[df[x] != "Not Available",]
    df <- df[df$State == state,]
    df[, x] <- as.numeric(df[, x])
    df <- df[order(df[x], df$Hospital.Name),"Hospital.Name"]
    if(num == "best")
      df[1]
    else if(num == "worst")
    df[length(df)]
    else {
      if(num > length(df)) NA
      df[num]
    }
    
  }
  if(outcome == "heart attack"){
    find_rank(11)
  } else if(outcome == "heart failure"){
    find_rank(17)
  } else if(outcome == "pneumonia"){
    find_rank(23)
  } 
}