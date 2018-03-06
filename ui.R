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
  titlePanel("Finding a car based on desirable Horsepower and Miles/gallon. 
             The application is developed to help you find a car, if there is any, with seeking mpg and/or hp.")
             ("By changing the mpg and/or hp sliders from side to side, 
             the red dot will be moving around on the chart, gives you an idea if a car is available 
             with those conditions. For example, if you choose the hp=350 and mpg=35, you will see there is no option 
             available with that condition. But if you choose the hp=110 and mpg=21, you would have more than one choices."
             ),
  
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
     
      h4("Horsepower:"),
      textOutput("model1"),
      h4("Miles/Gallon:"),
      textOutput("model2"),
      h4("cyl:"),
      textOutput("model3"),
      h4("Gear:"),
      textOutput("model4"),
      h4("am:"),
      textOutput("model5")
      )
  )
))
