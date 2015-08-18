library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("Simulation To Compare Exponential Distribution and Central Limit Theorem"),
  
  sidebarPanel(
    
    h4("The Slider determines the number of sample."),
    sliderInput('sampleSize', 'Sample Size', min=500, max=10000,
                value=min(500, 10000), step=500, round=0),

    h4("Tick the following box to show the corresponding distribution graph."),
    checkboxInput('sample', 'Show Sample Distribution'),
    checkboxInput('normal', 'Show Normal Distribution')
    
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)
