pollutantmean <- function (directory="C:\\Z_Nitin\\13.R\\Coursera\\01.Assignments\\rprog_data_specdata\\specdata", pollutant="sulfate", id = 1:332){
  ### Create a vector to hold mean of all the csv files..
  ##print(length(id))
  mean_vector = numeric(length(id))
  data_vector_combined <- c()
  j <- 1
  print( "Read the required csv files in for loop")
  for(i in id){
   ## print(i)
    ## Change the id value to 3 digit format . Ex id =1 should be formatted as 001.
    if (i < 10){ csvname <- paste("00",i,sep="")}
    else if (i>9 & i<100){csvname <- paste("0",i,sep="")}
    else { csvname <- i}
    ### Create complete path for csv files. Add directory path and .csv extension.
    x <- paste(paste(directory,csvname,sep="\\"),".csv",sep="")
    print(x)
    ### Read csv file with first row as the header.
    data <- read.table(x, header=TRUE, sep=",") ##,nrows=2)
    ##print(">>>> Read the data from csv file")
    
    #### Subset.. pick only the required pollutant column from data
    data_vector_individual <- subset.data.frame(data,select= pollutant)
    data_vector_combined <- c(data_vector_combined,data_vector_individual[!is.na(data_vector_individual)])
    ##print(data_vector_individual)
    ##print(names(data_vector_combined))
    #### get mean of csv file.
    mean_vector[j] = mean(data_vector_individual[!is.na(data_vector_individual)])
    j <- j+1
  }## For loop over..
  print(">>> mean of each csv file")
  print(mean_vector)
  print(">>> combined mean of all the csv files")
  print(mean(data_vector_combined))
  
}## pollutantmean function over ..