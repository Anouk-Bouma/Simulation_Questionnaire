### Author: Anouk Bouma
### File: data cleaning questionnaire


### Version control
renv::restore()

### Loading the data into R 
data <- read.csv("simulation_survey_testdata.csv", header = TRUE)
# Removing the first two rows, as these contain headers and not data
data <- data[-c(1,2),]

# Defining the questions for which multiple answer options per participant
# are possible:
questions_to_split <- c("Q4", "Q7a", "Q7b", "Q10a", "Q10b", "Q13a", "Q13b", 
                        "Q16a", "Q16b", "Q18a", "Q18b", "Q19", "Q20", "Q22",
                        "Q23", "Q24", "Q25")


# Reshape to long format
# - pivot_longer() stacks all multiple-response questions into two columns:
#   "question" = the question name, "answer" = the selected answers (comma-separated).
data_long <- data %>%
  pivot_longer(all_of(questions_to_split),
               names_to = "question",
               values_to = "answer") %>%
  # separate_rows() splits answers like "1,6,10" into multiple rows
  separate_rows(answer, sep = ",") %>%
  # trim whitespace and drop empty cells
  mutate(answer = trimws(answer)) %>%
  filter(answer != "" & !is.na(answer))

# Create dummy variables
# - unite() makes column names like "Q4_option1"
# - pivot_wider() spreads answers back into wide format, filling missing with 0
data_wide <- data_long %>%
  mutate(value = 1) %>%
  unite("question_answer", question, answer, sep = "_") %>%
  pivot_wider(names_from = question_answer,
              values_from = value,
              values_fill = 0)






