#FileName: ui.R
#Author: Chaitra Kamath
#Purpose: Create shiny app to display number of cab trips on a selected day within selected time window
#Source: http://datascienceplus.com/building-interactive-web-apps-with-shiny/
#Date: Jan 6th, 2016

shinyUI(
  pageWithSidebar(
    headerPanel('NYC Yello Cab Trips in Jan 2015'),
    sidebarPanel(
      selectInput(inputId = 'day', label = 'Choose a day', choices = c('Sun' = 1, 'Mon' = 2, 'Tue' = 3, 'Wed' = 4, 
                                             'Thu' = 5, 'Fri' = 6, 'Sat' = 7)),
      sliderInput(inputId = 'startHour', label = 'Choose start hour', min = 0, max = 23, value = 8),
      sliderInput(inputId = 'endHour', label ='Choose end hour', min = 0, max = 23, value = 17)
        ), 
    
    mainPanel(
      p('App displays number of cab trips on given day between selected hours'),
      h4('Showing data for day:'),
      verbatimTextOutput('day'),
      h4('Starting at:'),
      verbatimTextOutput('startHour'),
      h4('Ending at:'),
      verbatimTextOutput('endHour'), 
      h4('Number of taxi trip in selected time period'),
      plotOutput('cabPlot')
    )
  
    )
)