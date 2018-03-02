#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

Data<- mtcars

# Define server logic required to draw a plot
shinyServer(
  function(input, output) {
  
    model1<- reactive({
      mpgInput<- input$sliderMPG
    })
    model2<- reactive({
      gearInput<- input$GearInput  
    })
    
    output$hpPlot <- renderPlot({
    
      mpgInput<- input$sliderMPG
      plot(Data$hp, Data$mpg,  col="darkblue", xlab="Horsepower", ylab="Miles/Gallon", main="hp vs. mpg", xlim=c(10, 350), ylim=c(8, 37))    
      points(input$sliderHP, model1(), col="red", pch=16, cex=1.5)     
      points(input$sliderHP, model2(), col="green", pch=16, cex=1.5)     
    
    })
    
    output$model1<- renderText({
      input$sliderHP
    })
    output$model2<- renderText({
      input$sliderMPG
    })
    
})



#plot(Data$hp, Data$mpg,  col="darkblue", xlab="Horsepower", ylab="Miles/Gallon")
#plot(input$sliderHP, input$sliderMPG,  col="red", xlab="Horsepower", ylab="Miles/Gallon",    main="hp vs. mpg", xlim=c(10, 350), ylim=c(8, 37)    
    


# generate bins based on input$bins from ui.R
    # draw the histogram with the specified number of bins
    # hist(x, breaks = sliderMPG, col = 'lighttblue', border = 'white',
     #    ylab="mpg")
    
  
