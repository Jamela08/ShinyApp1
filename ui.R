library(shiny)
library(ggplot2)
library(dplyr)
data <- read.csv("Juice.csv", stringsAsFactors = FALSE)
shinyUI(
  pageWithSidebar(
    # Application title
    headerPanel("Juice Recovery Prediction"),
    

    sidebarPanel(
      h6('This App will calculate Juice Recovery using the regression
       equation for the actual Juice Brix inputted
         in the text box below.
         Also given the actual incoming materials (liters per metric ton)
         it will query the historical data and will inform you the yield
         and the Juice brix of days with similar LPT.'),
      numericInput('JuiceBrix', 'Brix deg', "", min = 0.00, max = 20.00, step = 0.01
      ),
      
      submitButton('Calculate'),
      br(),
      sliderInput("LPT", "LPT:", 0, 800, c(300, 400), pre = "LitersPerTon")
      
    ),
    mainPanel(
      h3('Results of prediction'),
      h4('You entered'),
      verbatimTextOutput("inputValue"),
      h4('Which resulted in a prediction of '),
      verbatimTextOutput("prediction"),
      h4('Summary Based on Historical LPT Data'),
      verbatimTextOutput("summary")
      
    )
  )
)




