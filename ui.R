
#This program predicts whether if the person will be able to pass the data products course
# The user answers 3 questions and the program gives 3 possible outcomes
# outcome A - Pass with high confidence
# outcome B - Boderline
# outcome c - Fail

library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Developing Data Products"),
  sidebarPanel(
    h4('This program predicts whether if you are going to pass the data products course'),
        
    radioButtons("radDifficult", "Do you find the course difficult?",
                       c("Yes" = "Difficult",
                         "No" = "Not At All")),
    radioButtons("radProject", "Do you intend to do the course project?",
                 c("Yes" = "Yes",
                   "No" = "No")),
    numericInput('txtQuizScore', 'On average what is your quiz score (Normalize it to 1 - 10)', 10, min = 1, max = 10, step = 1)
  ),
  mainPanel(
    h3('Input Values'),
    h4('Perceived Course Difficulty'),
    verbatimTextOutput("txtDifficult"),
    h4('Intention to Complete Project'),
    verbatimTextOutput("txtProject"),
    h4('Average Quiz Score (Normalized)'),
    verbatimTextOutput("txtQuizScore"),
   h3('Prediction Results'),
    verbatimTextOutput("txtResults")
  )
))