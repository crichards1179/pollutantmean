# Declare function
corr <- function(directory, threshold = 0)  {
  
  # obtain list of sensor files in specdata directory
  files_full <- list.files("specdata", full.names = T)
  
  # create empty data frame
  correlations <- data.frame()

  # Loop over files
  for (f in files_full) {
    temp <- read.csv(f) # read current input file
    complete_cases <- temp[complete.cases(temp),]
    
    if (nrow(complete_cases) > threshold) {
      correlations <- c(correlations, cor(complete_cases$sulfate, complete_cases$nitrate))
    }
  }
  
  correlations
}