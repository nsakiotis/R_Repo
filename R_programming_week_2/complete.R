complete <- function(directory, id=1:332){
    data <- data.frame(id = character(0), nobs = numeric(0))
    for(i in id){
        file
        fileUrl <- paste(directory,"/",formatC(i, width = 3, flag = "0"), ".csv", sep = "") 
        #print(fileUrl)
        df <- read.csv(fileUrl, header = TRUE)
        df <- df[complete.cases(df$sulfate, df$nitrate), "ID"]
        data <- rbind(data, data.frame(id = i, nobs = length(df)))
    }
    data
}