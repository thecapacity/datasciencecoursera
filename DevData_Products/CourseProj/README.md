## Introduction

This application is for the Course Project assignment for the Developing Data Products Course, of the Data Science Specialization.

The application leverages data from [http://www.hillrunner.com/training/tmillchart.php](Hill Runner's Treadmill Pace Conversions) and allows a user to input known factors, such as treadmill speed and incline and receive a predicted outdoor pace.

The live URL for the app is located at: https://thecapacity.shinyapps.io/CourseProj/

And the Source Code is hosted at Github: https://github.com/thecapacity/datasciencecoursera/tree/master/DevData_Products/CourseProj

For context of the assignment, please refer to the *Guidance* section, but if you're looking for immediate background on the application and how to deploy please see the *Problem Definition* and *Application Deployment* sections for those details.

#### Guidance

I have been asked to write a Shiny application, and supporting documentation to assist a user in getting starting using the application.

The application will be:

1. Deployed on Rstudio's shiny server: [http://shinyapps.io](shinyapps.io)

2. Shared via providing a link into the text submission box
    
3. Hosted documentation and code, including server.R and ui.R, on github

The application must include the following:

* Some form of input (widget: textbox, radio button, checkbox, sider, ...)

* Some operation on the ui input in server.R

* Some reactive output displayed as a result of server calculations

It will include enough guidance and documentation so that a introductory user could use your application.  This guidance will be within the Shiny website itself, and not posted to an external link.

The scope of the Shiny application was left entirely up for individual interpretation. We were directed to make the package simple for the end user, so that they don't need a lot of your prerequisite knowledge to evaluate the application. The final instruction was to emphasize a simple project given the short time frame.  

## Problem Definition

Thanks to technology, there is a prevalence of fitness trackers and a renewed focus on individual attainment and statistical tracking of endeavors, such as running trackers. This project attempts to bridge the divide between two factors of performance and training: (1) empirical data measurement, such as pace (distance/time) and predictability, such as transference of indoor treadmill workouts to outdoor performance (assuming a flat course and adjusting for factors such as wind resistance).

The background data was collected based on the [http://www.hillrunner.com/training/tmillchart.php](Hill Runner Treadmill Pace Conversions) and allows an application user to input known factors, such as treadmill speed and incline and receive a predicted outdoor pace.

In the background, the app utilizes a linear regression model, and outputs a predicted outdoor pace based in user input.

## Application Deployment

The most direct way to utilize the application is via the published URL.

However, it is also possible to download the repository files directly from the github repository and run them in RStudio.

If you would like to deploy a more web-assessable deployment, you will need to:

* Sign up for a shinyapps.io account: https://www.shinyapps.io/admin/#/signup

* Then, at the RStudio Console try: `library(shinyapps)` followed by `shinyapps::deployApp()`

#### Note:

The shinyapps packages requires the devtools package from CRAN. To install devtools run the following code in your R console: `install.packages('devtools')`

Then, with devtools installed, you can install the shinyapps package directly from the GitHub via the following command at the RStudio console: `devtools::install_github('rstudio/shinyapps')`

**Shiny is undergoing continual development so these commands are subject to change. For the best results please review the documentation after you sign up for a shinyapps.io account.**