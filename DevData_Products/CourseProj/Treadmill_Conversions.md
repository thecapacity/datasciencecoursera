Slide 1. Developing Data Products: Treadmill Conversion
========================================================
author: thecapacity
date: March 22nd, 2015

Slide 2. Introduction
========================================================

An outdoor runner, even on relatively flat terrain, must still account for factors such as wind resistance. 

Therefore, runners training indoors on a treadmill must convert indoor variables for outdoor performance.

Utilizing data from [Hill Runner](http://www.hillrunner.com/training/tmillchart.php) and a linear model, [this app](https://thecapacity.shinyapps.io/CourseProj/) allows users to predict outdoor performance, based on indoor treadmill settings for speed and incline/elevation.        

Slide 3. Methodology
========================================================

- The Hill Runner data was pulled in a `csv` file then loaded in to using the command: `data <- read.csv("treadmill_conversions.csv", stringsAsFactors=FALSE)`
- A linear model was built to extract coefficiencs, particular the Incline data, and a standrd multiplier for MPH, with: `fit <- lm(Adjusted.MPH ~ MPH + Incline - 1, data)`
- That data is then used with user inputs `speed` (in mph) an `incline` (as a %) to calculate an outdoor estimated speed (MPH) and pace (time per mile).

Slide 4. Example Estimate
========================================================

For example, with speed of 6 (mph) and incline of 5 (%).
The estimated outdoor speed (mph) would be:

```r
est.MPH <- (speed * df['MPH',1]) + df[paste0("Incline0.",formatC(incline, width=2, flag=0)),1]

round(est.MPH,1)
```

```
[1] 7.2
```


Resuilting in an outdoor pace of 00:08:19.

*Note: Code for loading the data and the model is included in this slide with echo=FALSE*
Slide 5. Links, including Live Demo
========================================================
A live demo can be found at: https://thecapacity.shinyapps.io/CourseProj/

Sourcecode, including this presentation is available [via Github](https://github.com/thecapacity/datasciencecoursera/tree/master/DevData_Products/CourseProj).

Thanks!
