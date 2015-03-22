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
        p("An outdoor runner, even on relatively flat terrain, must still account for factors such as wind resistance.
          Therefore, runners training indoors on a treadmill must convert indoor variables for outdoor performance."),
        p("This app allows users to predict outdoor performance, based on indoor treadmill settings for speed and incline/elevation."),
        strong("Please adjust the sliders to provide input speed (MPH) and Incline (%)."),
        br(),
        br(),
        p("Our estimate of your equivalent outdoor speed in MPH is: "),
        textOutput('newEst.mph'),
        br(),
        p("Our estimate of your equivalent outdoor pace (time per mile) is: "),
        textOutput('newEst.pace'),
        br(),
        code("The application backend utilizes a linear model, developed utilizing data from"),
        a(href="http://www.hillrunner.com/training/tmillchart.php","Hill Runner"),
        code("to extraploate performance."),
        br(),
        code("Source Code is available at"),
        a(href="https://github.com/thecapacity/datasciencecoursera/tree/master/DevData_Products/CourseProj", " Github.")
        
        
    )
))