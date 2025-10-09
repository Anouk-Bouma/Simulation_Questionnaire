### Author: Anouk Bouma
### File: data cleaning questionnaire


### Version control
renv::restore()

library(tidyr)
library(dplyr)
library(readxl)


##### Initial data cleaning #####

### Loading the data into R 
data <- read_excel("simulation_survey_testdata.xlsx")

# Removing irrelevant and identifying columns:
# StartDate, EndDate, Status, RecordedDate, ResponseId, DistributionChannel
# UserLanguage
data <- data %>% select(-StartDate, -EndDate, -Status, -RecordedDate, 
                        -ResponseId, -DistributionChannel, -UserLanguage)
# Removing the first row as this contains a second header instead of data
data <- data[-1,]

# Saving the new anonymous data file
save(data, file = "simulation_survey_testdata.RData")


##### Data analysis #####




