#Run via Console `runApp()`
#Doesn't end when I close the opened tab (i.e. console is still blocked)
#I have to hit the <Stop> Button to get back command.

#Shiny with inputs
library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Illustrating inputs"),
    sidebarPanel(
        numericInput('id1', "Numeric input, labeled id1", 0, min=0, max=10, step=1),
        checkboxGroupInput("id2", "Checkbox", 
                        c("Value 1" = "1",
                          "Value 2" = "2",
                          "Value 3" = "3")
                        ),
        dateInput("date", "Date:")
        ),
    mainPanel(
            
    )
))

