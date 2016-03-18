library(shiny)
library(ggplot2)
library(dplyr)
#data(Juice)
data<-read.csv("Juice.csv")
JuiceRec <- function(JuiceBrix) 11.04+(1.57239*JuiceBrix)

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({input$JuiceBrix})
    output$prediction <- renderPrint({JuiceRec(input$JuiceBrix)})

    output$summary <- renderPrint({
      filtered<-
        data %>%
        filter(LPT >=input$LPT[1],
               LPT <= input$LPT[2])
      
      summary(filtered)
    })
  }
  
)



    




    
  





