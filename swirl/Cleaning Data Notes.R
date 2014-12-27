library(swirl)
install_from_swirl("Getting and Cleaning Data")
swirl()

#dplyr supplies five 'verbs' that cover all fundamental data manipulation
## tasks: select(), filter(), arrange(), mutate(), and summarize()

#Remember: select() picks columns, "filter()" picks rows
# select can order columns, to order rows use arrange()

#mutate seems like conveniance function

########### Final SAT Example

sat %>%
    select(-contains("total")) %>%
    gather(part_sex, count, -score_range) %>%
    separate(part_sex, c("part", "sex")) %>%
    group_by(part, sex) %>%
    mutate(total = sum(count),
           prop = count / total
    ) %>% print

###############

#### Lubridate 

Sys.getlocale("LC_TIME")
## [1] "en_US.UTF-8"

help(package = lubridate)

"""
This is where things get a little tricky. Because of things like leap years, leap seconds, and daylight
| savings time, the length of any given minute, day, month, week, or year is relative to when it occurs. In
| contrast, the length of a second is always the same, regardless of when it occurs.

To address these complexities, the authors of lubridate introduce four classes of time related objects:
| instants, intervals, durations, and periods. These topics are beyond the scope of this lesson, but you can
| find a complete discussion in the 2011 Journal of Statistical Software paper titled 'Dates and Times Made
| Easy with lubridate'.

"""