library(shiny)
library(ggplot2)

function(input, output) {
  
  
  output$plot <- renderPlot({
    
    lambda <- 0.2 # lambda for rexp
    n <- 40 # number of exponentials
    nSimulation <- input$sampleSize # number of tests
    
    # set the seed to create reproducability
    set.seed(1125556665)
    
    # run the test resulting in n x nSimulation matrix
    expDist <- matrix(data=rexp(n * nSimulation, lambda), nrow=nSimulation)
    expDistMeans <- data.frame(means=apply(expDist, 1, mean))
    
    ## Sample Mean versus Theoretical Mean
    
    mu <- 1/lambda
    #print(mu)
    meanOfMeans <- mean(expDistMeans$means)
    sd <- 1/lambda/sqrt(n)
    #print(sd)
    Var <- sd^2
    #print(Var)
    sd_x <- sd(expDistMeans$means)
    #print(sd_x)
    
    Var_x <- var(expDistMeans$means)
    #print(Var_x)
    
#    gg <- ggplot(data = expDistMeans, aes(x = means)) + 
#     geom_histogram(binwidth=0.1, aes(y=..density..), alpha=0.2) + 
#      stat_function(fun = dnorm, arg = list(mean = mu , sd = sd), colour = "magenta", size=1) + 
#      geom_vline(xintercept = mu, size=1, colour="magenta") + 
#      geom_density(colour="blue", size=1) +
#      geom_vline(xintercept = meanOfMeans, size=1, colour="blue") + 
#      scale_x_continuous(breaks=seq(mu-3,mu+3,1), limits=c(mu-3,mu+3)) 
gg <- ggplot(data = expDistMeans, aes(x = means)) + 
  geom_histogram(binwidth=0.1, aes(y=..density..), alpha=0.2) + 
  scale_x_continuous(breaks=seq(mu-3,mu+3,1), limits=c(mu-3,mu+3)) 
    
    if (input$sample)
    { 
      gg <- gg + 
        geom_density(colour="blue", size=1) +
        geom_vline(xintercept = meanOfMeans, size=1, colour="blue")
    }
    
    if (input$normal)
    { 
      gg <- gg +  
        stat_function(fun = dnorm, arg = list(mean = mu , sd = sd), colour = "magenta", size=1) +
        geom_vline(xintercept = mu, size=1, colour="magenta")
    }
      #gg <- gg + geom_vline(xintercept = mu, size=1, colour="magenta")
    #if (input$sample)
      #gg <- gg + geom_vline(xintercept = meanOfMeans, size=1, colour="blue") 
      #gg <- gg + geom_density(colour="blue", size=1) +
    
    print(gg)
    
  }, height=700)
  
}
