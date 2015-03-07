
download.file("https://dl.dropboxusercontent.com/u/7710864/data/gaData.rda", destfile="./data/gaData.rda", method="curl")
load("./data/gaData.rda")
gaData$julian<-julian(gaData$date)
head(gaData)

plot(gaData$julian,gaData$visits,pch=19,col="darkgrey",xlab="Julian",ylab="Visits")
lm1<-lm(gaData$visits~gaData$julian)
abline(lm1,col="red",lwd=3)

glm1<-glm(gaData$visits~gaData$julian,family="poisson")
lines(gaData$julian,glm1$fitted,col="blue",lwd=3)

glm2<-glm(gaData$visits~gaData$julian,family="quasipoisson")
lines(gaData$julian,glm2$fitted,col="green",lwd=3)

#plot(glm1$fitted,glm1$residuals,pch=19,col="grey",ylab="Residuals",xlab="Fitted")

#Model Agnostic Standard Errors
# Slides P 204 from Binder1.pdf
#SO Q: http://stackoverflow.com/questions/3817182/vcovhc?and?confidence?interval

library(sandwich)

confint.agnostic<-function(object,parm,level=0.95,...) {
    cf<-coef(object);pnames<-names(cf)
    
    if(missing(parm))
        parm<-pnames
    else if(is.numeric(parm))
        parm<-pnames[parm]
    
    a<-(1-level)/2;a<-c(a,1-a)
    pct<-stats:::format.perc(a,3)
    
    fac<-qnorm(a)    
    ci<-array(NA,dim=c(length(parm),2L),dimnames=list(parm, pct))

    ses<-sqrt(diag(sandwich::vcovHC(object)))[parm]
    ci[]<-cf[parm]+ses%o%fac

    ci
}

confint(glm1)
confint.agnostic(glm1)

# Rates - Lecture 03_03_c around time 10:50
# You want your offset to be the long of whatever you want to be in the denom of your rate equation
# e.g. offset vitis+1, or 24 hrs in a day => rate of hits per hour

# ZIP models - zero inflation models in poission - if there are lots of 0's near the origin
