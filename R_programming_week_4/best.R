best <- function(state, outcome) {
  ## Read outcome data
  df <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  
  ## Check that state and outcome are valid
  if(!state %in% unique(df$State)){
    stop("invalid sate")
  } 
  if(!outcome %in% c("heart attack","heart failure","pneumonia")){
     stop("invalid outcome")
  }
  
  ## Return hospital name in that state with lowest 30-day death rate
  
  find_best <- function(x){
    df <- df[df[x] != "Not Available",]
    df <- df[df$State == state,]
    df[, x] <- as.numeric(df[, x])
    df <- df[df[x] == min(df[x]),"Hospital.Name"]
    sort(df)[1]
    
  }
  if(outcome == "heart attack"){
    find_best(11)
  } else if(outcome == "heart failure"){
    find_best(17)
  } else if(outcome == "pneumonia"){
    find_best(23)
  } 
}