#Run via Console `runApp()`
# runApp(display.mode='showcase') #Shows Server code executing with UI entries!!

#Deploy to shinyapps.io
# library(shinyapps)
# shinyapps::deployApp('path/to/your/app')

library(shiny)

shinyUI( pageWithSidebar(
    headerPanel("Example plot"), 

    sidebarPanel( 
        sliderInput('mu', 'Guess at the mean', value = 70, min = 62, max = 74, step = 0.05,)
    ), 

    mainPanel( 
        plotOutput('newHist')) 
    )
)
