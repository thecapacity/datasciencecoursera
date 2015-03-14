## Q1

library(manipulate)
myPlot <- function(s) {
    plot(cars$dist - mean(cars$dist), cars$speed - mean(cars$speed))
    abline(0, s)
}

# This function plots distance versus speed, each de-meaned and an associated line of slope s.
# Which of the following code will make a manipulate plot that creates a slider for the slope?

manipulate(myPlot   , s = slider(0, 2, step = 0.1))
manipulate(myPlot(s), slider = x(0, 2, step = 0.1))
## Yes
manipulate(myPlot(s), s = slider(0, 2, step = 0.1))
##
manipulate(myPlot(s), x.s = slider(0, 2, step = 0.1)) 

## Q2

# Which of the following code uses the rCharts package to create a sortable and searchable data 
# table for the airquality data set? Assume the rCharts package and the airquality data set 
# have already been loaded into R.

## YES
dTable(airquality, sPaginationType = "full_numbers")
#
d <- data.frame(airquality, stringsAsFactors = FALSE) print(d)
airquality
head(airquality) 

## Q3 A basic shiny data product requires:

# A ui.R and server.R file or a A server.R file and a directory called www containing the 
# relevant html files.

## Q4 

# What is incorrect about the followig syntax in ui.R? 

library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Data science FTW!"),
    sidebarPanel(
        h2('Big text') ##, # is missing
        h3('Sidebar')
    ),
    mainPanel(
        h3('Main Panel text')
    )
))

## Q5 

# ui.R

shinyUI(pageWithSidebar(
    headerPanel("Example plot"),
    sidebarPanel(
        sliderInput('mu', 'Guess at the mu',value = 70, min = 60, max = 80, step = 0.05,)
    ),
    mainPanel(
        plotOutput('newHist')
    )
))

# server.R

library(UsingR)
data(galton)

shinyServer(
    function(input, output) {
        output$myHist <- renderPlot({
            hist(galton$child, xlab='child height', col='lightblue',main='Histogram')
            mu <- input$mu
            lines(c(mu, mu), c(0, 200),col="red",lwd=5)
            mse <- mean((galton$child - mu)^2)
            text(63, 150, paste("mu = ", mu))
            text(63, 140, paste("MSE = ", round(mse, 2)))
        })
        
    }
)

# Why isn't it doing what we want?
