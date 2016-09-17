complete <- function(directory="C:\\Z_Nitin\\13.R\\Coursera\\01.Assignments\\rprog_data_specdata\\specdata",id = 1:332){
  
  nobs_vector <- c()##<- numeric(length(id))
  
  print( "Read the required csv files in for loop")
  for(i in id){
    ##print(i)
    ## Change the id value to 3 digit format . Ex id =1 should be formatted as 001.
    if (i < 10){ csvname <- paste("00",i,sep="")}
    else if (i>9 & i<100){csvname <- paste("0",i,sep="")}
    else { csvname <- i}
    ### Create complete path for csv files. Add directory path and .csv extension.
    x <- paste(paste(directory,csvname,sep="\\"),".csv",sep="")
    #print(x)
    ### Read csv file with first row as the header.
    data <- read.table(x, header=TRUE, sep=",") ##,nrows=2)
    sulfate_vector <- data[,"sulfate"]
    ##print(class(sulfate_vector))
    nitrate_vector <- data[,"nitrate"]
    good <- complete.cases(sulfate_vector,nitrate_vector)
    sulfate_vector <- sulfate_vector[good]
    #print(sulfate_vector)
    nobs_vector <- c(nobs_vector,length(sulfate_vector))
    
  }## For loop completed...
  
  complete_dataframe <- data.frame(id=id,nobs=nobs_vector)
  ##print(complete_dataframe)
  return (complete_dataframe)
}## complete function over ..