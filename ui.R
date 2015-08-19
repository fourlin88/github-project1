library(shiny)
library(ggplot2)

dataset <- diamonds

fluidPage(
  
  titlePanel("Simulation To Compare Exponential Distribution and Central Limit Theorem"),
  
  sidebarPanel(
    h4("Introduction: this simple simulation will try to show that if we have enough sample, the sample distribution will be close to the theoretical distribution."),
    h4("To use this application, please specify the number of sample by moving the slider to a specific number between 500 to 10000."),
    
    h4("There are two check boxes, the first one corresponds to the sample distribution and the second one corresponds to the theoretical distribution."),
    h4("Specify the sampleSize using the slider below."),
    sliderInput('sampleSize', 'Sample Size', min=500, max=10000,
                value=1000, step=500, round=0),

    h4("Tick the following box to show the corresponding distribution graph."),
    checkboxInput('sample', 'Show Sample Distribution'),
    checkboxInput('normal', 'Show Theoretical Distribution'),
    
    h5("Note that the source code can be found on https://github.com/fourlin88/github-project1/")
  ),
  
  mainPanel(
    plotOutput('plot')
  )
)
