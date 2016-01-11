#FileName: server.R
#Author: Chaitra Kamath
#Purpose: Create shiny app to display number of cab trips on a selected day within selected time window
#Source: http://datascienceplus.com/building-interactive-web-apps-with-shiny/
#Date: Jan 6th, 2016

library(dplyr)
library(lubridate)

cabData <- read.csv('tripData.csv', stringsAsFactors = FALSE)

#convert tpep_pickup_datetime from string to date
cabData$tpep_pickup_datetime <- ymd_hms(cabData$tpep_pickup_datetime)

#extract day of week from pickup datetime
cabData$pickup_day <- wday(cabData$tpep_pickup_datetime)

#function to plot number of trips on given day in a given time window
tripsPlot <- function(day, startHour, endHour){
  #subset tripData to include data about the given day
  subData <- subset(cabData, pickup_day == day)
  
  #create frequency table of number of trips on a given day
  tripsFreq <- table(hour(subData$tpep_pickup_datetime))
  
  #include data about number of trips within a given time window
  tripsFreq <- as.table(tripsFreq[(startHour) : (endHour)])
  
  #plot the frequency of trips
  cabPlot <- plot(tripsFreq, type = 'o', xlab = 'Hour', xlim = c(startHour, endHour), 
                  ylab = 'Number of Trips')
  return(cabPlot)
}

shinyServer(
  function(input, output){
    output$day <- renderPrint({input$day})
    output$startHour <- renderPrint({input$startHour})
    output$endHour <- renderPrint({input$endHour})
    output$cabPlot <- renderPlot({tripsPlot(input$day, input$startHour, input$endHour)})
  }
)