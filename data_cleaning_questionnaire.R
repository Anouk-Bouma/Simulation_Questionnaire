### Author: Anouk Bouma
### File: data cleaning questionnaire


### Version control
renv::restore()

### Loading the data into R 
data <- read.csv("simulation_survey_testdata.csv", header = TRUE)
# Removing the first two rows, as these contain headers and not data
data <- data[-c(1,2),]

