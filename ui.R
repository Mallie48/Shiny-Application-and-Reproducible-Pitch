#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
dataset<- mtcars

# Define UI for application that plot
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Predict Mile/Gallon from Horsepower"),
  
  # Sidebar with a slider input for hp and mpg
  sidebarLayout(
    sidebarPanel(
       sliderInput("sliderHP", "hp:", min = 0, max = 350, 50),
       sliderInput("sliderMPG", "mpg:", min = 10, max = 35, 10),
       selectInput("CylindarInput", "cyl:",choices=c(2,4,8)),
       selectInput("GearInput", "gear:",choices=c(3, 4, 5)),
       selectInput("AmInput", "am:",choices=c("Automatic", "Manual")),
       submitButton("Submit")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("hpPlot"),
      h4("Predicted Horsepower:"),
      textOutput("model1"),
      h4("Predicted Miles/Gallon:"),
      textOutput("model2")
      )
  )
))
