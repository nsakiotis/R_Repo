corr <- function(directory, threshold = 0){
    data <- numeric(0)
    for(file in list.files(path = directory, pattern = "*.csv", full.names = TRUE)){
        df <- read.csv(file, header = TRUE)
        cc <- complete.cases(df$sulfate, df$nitrate)
        if(sum(cc) > threshold){
            data <- append(data, cor(df[cc,"sulfate"], df[cc,"nitrate"]))
        }
    }
    data
}