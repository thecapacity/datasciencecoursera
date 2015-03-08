#Run via Console `runApp()`
# runApp(display.mode='showcase') #Shows Server code executing with UI entries!!

#Doesn't end when I close the opened tab (i.e. console is still blocked)
#I have to hit the <Stop> Button to get back command.

#shinyapps.io
# library(shinyapps)
# shinyapps::deployApp('path/to/your/app')

#Shiny with inputs
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Example plot"), 

    sidebarPanel( 
        sliderInput('mu', 'Guess at the mean', value = 70, min = 62, max = 74, step = 0.05,)
    ), 

    mainPanel( 
        plotOutput('newHist')) 
    )
)