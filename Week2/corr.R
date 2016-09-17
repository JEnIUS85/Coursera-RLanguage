corr <- function(directory="C:\\Z_Nitin\\13.R\\Coursera\\01.Assignments\\rprog_data_specdata\\specdata",threshold = 0){
  
  ## call complete function to get all the csv complete cases count
  completecase_count <- complete(directory)
  print(">>> Got complete cases records for all csv")
  
  ## filtered out those IDs for which completecase counts above threshold
  logical_vector <-completecase_count$nobs > threshold
  ##print(logical_vector)
  filteredid_vector <- completecase_count$id[logical_vector]
  ##print(filteredid_vector)
  
  corr_vector <- numeric(length = length(filteredid_vector))
  iterator <- 1
  ## read all those CSv for which IDs are greater than threshold..
  for(i in filteredid_vector ){
    ##print (i)
    if (i < 10){ csvname <- paste("00",i,sep="")}
    else if (i>9 & i<100){csvname <- paste("0",i,sep="")}
    else { csvname <- i}
    ### Create complete path for csv files. Add directory path and .csv extension.
    x <- paste(paste(directory,csvname,sep="\\"),".csv",sep="")
    ##print(x)
    ### Read csv file with first row as the header.
    data <- read.table(x, header=TRUE, sep=",") ##,nrows=2)
    corr_vector[iterator] <- cor(data$sulfate,data$nitrate,use="na.or.complete")
    iterator<- iterator+1
  }## For loop over..
  
  ##print(">>> printing Corr vector ")
  ##print(corr_vector)
  return(corr_vector)
}## corr function over ..