pollutantmean <- function(directory, pollutant, id = 1:332){
    data <- vector("numeric")
    for(i in id){
        file
        fileUrl <- paste(directory,"/",formatC(i, width = 3, flag = "0"), ".csv", sep = "") 
        #print(fileUrl)
        df <- read.csv(fileUrl, header = TRUE)
        df <- df[!is.na(df[,pollutant]), pollutant]
        data <- append(data, df)
    }
    mean(data)
}