library(shiny)

shinyUI(pageWithSidebar(
    headerPanel("Data science FTW!"),
    sidebarPanel(
            h3("Sidebar tex")
    ),
    mainPanel(
            h3("Main Panel text")
    )
))