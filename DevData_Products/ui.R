#Run via Console `runApp()`
#Doesn't end when I close the opened tab (i.e. console is still blocked)
#I have to hit the <Stop> Button to get back command.

library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Illustrating markup"),
    sidebarPanel(
        h1("Sidebar panel tex"),
        h1("H1 text"),
        h2("H2 text"),
        h3("H3 text"),
        h4("H4 text")
    ),
    mainPanel(
            h3("Main Panel text"),
            code("some code"),
            p("some ordinary text")
    )
))

