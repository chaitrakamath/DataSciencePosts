#FileName: createSmallerDataset.R
#Author: Chaitra Kamath
#Purpose: Create shiny app to display number of cab trips on a selected day within selected time window
#Source: http://datascienceplus.com/building-interactive-web-apps-with-shiny/
#Date: Jan 6th, 2016

#set working directory. Ensure that datafile, ui.R and server.R files are in the working directory
setwd('/Users/Jaan/Documents/gitHubCode/2016/DataSciencePlusPosts/BuildShinyApp')

#load required packages
library(dplyr)

#read data
taxiData <- read.csv('yellow_tripdata_2015.csv', stringsAsFactors = FALSE)

#randomly select only 1/10th of the rows of data 
sampTaxiData <- samp_frac(taxiData, 0.01)

#create new data file consisting of the small dataset
write.csv(sampTaxiData, 'tripData.csv', row.names = FALSE)