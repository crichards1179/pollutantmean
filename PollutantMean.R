# WK 2, #1

pollutantmean <- function(directory, pollutant, id) {
  
  # obtain list of sensor files in specdata directory
  files_full <- list.files("specdata", full.names = T)
  
  # create empty data frame
  collectordf <- data.frame()
  
  # subset list of sensor files
  df_subset <- files_full[id]
  #df_subset
  
  # loop through files in subset list and
  #    * read the csv file
  #    * bind to "collector" data frame
  for(i in 1:length(df_subset)) {
    collectordf <- rbind(collectordf, read.csv(df_subset[i]))
  }
  
  #tail(collectordf)
  # calculate mean and return to parent environment
  mean(collectordf[, pollutant], na.rm = TRUE)
  
}