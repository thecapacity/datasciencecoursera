## Introductin

This application is for the Course Project assignment for the Developing Data Products Course, of the Data Science Specialization.

For context of the assignment, please refer to the *Guidance* section, but if you're looking for immediate background on the application and how to deploy please see the *Problem Definition* and *Application Deployment* sections for those details.

#### Guidance

I have been asked to write a Shiny application, and supporting documentation to assist a user in getting starting using the aplication.

The application will be:
    1. Deployed on Rstudio's shiny server: [http://shinyapps.io](shinyapps.io)
    2. Shared via pasting a link into the text submission box
    3. Hosted documentation and code, including server.R and ui.R, on github

The application must include the following:
    * Some form of input (widget: textbox, radio button, checkbox, ...)

    * Some operation on the ui input in sever.R

    * Some reactive output displayed as a result of server calculations

    It will include enough guidance and documentation so that a intorductory user could use your application.  This guidance will be within the Shiny website itself, and not posted to an external link.

The scope fo the Shiny application is entirely up for individual interpretation. We were directed to make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate the application. The final instruction was to emphasize a simple project given the short time frame.  

## Problem Definition

## Application Deployment

To run the application it is possible to download the ui.R and server.R files directly from the github repository and run them in RStudio. 

For a more web-assessable deployment, you will need to:
* Sign up for a shinyapps.io account: https://www.shinyapps.io/admin/#/signup

* Then, at the RStudio Console try: `library(shinyapps)` followed by `shinyapps::deployApp()`
