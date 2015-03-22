#Run via Console `runApp()`
# runApp(display.mode='showcase') #Shows Server code executing with UI entries!!

#Deploy to shinyapps.io
# library(shinyapps)
# shinyapps::deployApp('path/to/your/app')

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Outdoor Pace Estimator"),

    sidebarPanel(
        sliderInput('speed', "Treadmill Speed (MPH)", value = 6, min = 5, max = 10, step = 0.1),
        sliderInput('incline', "Treadmill Incline (%)", value = 2, min = 0, max = 10, step = 1)
    ),
    
    mainPanel(
        p("An outdoor runnder, even on relatively flat terrain, must still account for factors such as wind resistance.
          Therefore, runners training indoors on a treadmill must simulate the conversion for outdoor performance."),
        p("This app allows users to predict outdoor performance, based on indoor treadmill settings."),
        strong("Please adjust the sliders to provide input speed (MPH) and Incline (%)."),
        br(),
        br(),
        p("Our estimate of your equivalent outdoor speed in MPH is: "),
        textOutput('newEst.mph'),
        br(),
        p("Our estimate of your equivalent outdoor pace (time per mile) is: "),
        textOutput('newEst.pace'),
        br(),
        a(href="http://www.hillrunner.com/training/tmillchart.php","Based on data from: Hill Runner")
    )
))