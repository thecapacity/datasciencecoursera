library(shiny)

#Do Once
data <- read.csv("treadmill_conversions.csv", stringsAsFactors=FALSE)
data$Incline <- as.factor(data$Incline)
fit <- lm(Adjusted.MPH ~ MPH + Incline - 1, data)
df <- data.frame(fit$coef, row.names=names(fit$coef))
row.names(df)[2] <- "Incline0.00"
row.names(df)[12] <- "Incline0.10"

shinyServer( 
    function(input, output) {
        #Reactive Input, used for individual calculations/output later...
        est.MPH <- reactive({
            (input$speed * df['MPH',1]) + df[paste0("Incline0.", formatC(input$incline, width=2, flag=0)),1]   
        })
            
        output$newEst.mph <- renderText( round(est.MPH(),1) )
        
        output$newEst.pace <- renderText(
            paste0("00:", formatC(floor(60 /est.MPH()), width=2, flag=0), ":", 
                   formatC(round(60*((60/est.MPH())-floor(60/est.MPH())),0), width=2, flag=0))
        )
    } 
)