# Declare function
complete <- function(directory, id = 1:332)  {
  
  # obtain list of sensor files in specdata directory
  files_full <- list.files("specdata", full.names = T)
  
  # create empty data frame
  collectordf <- data.frame()
  
  # subset list of sensor files
  df_subset <- files_full[id]
  
  # Declare column names
  columns <- c("Date", "sulfate", "nitrate", "ID")
  
  # Loop over files
  for (i in 1: length(df_subset)) {
    temp <- read.csv(df_subset[i]) # read current input file
    
    ok <- complete.cases(temp) # create vector of T/F where complete obs are TRUE
    numOK <- sum(ok) # sum number of True in ok.  True = 1, False = 0.
    
    # Collectordf starts as an empty data frame.  the ID number and the number of complete obs in the file are 
    # appended to collectordf.
    collectordf <- rbind(collectordf, c(temp$ID[1], numOK))
    
  }
  
  # the column headings "ID" and "nobs" are added to the collectordf dataframe and returned.
  colnames(collectordf) <- c("ID", "nobs")
  return(collectordf)
}