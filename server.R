library(shiny)
#Using a simple rule based system in which a point is given to each component
assessScore <-function(quizResults, projectScore, difficultyScore){
  results <- ""
  score <- 0
  if (difficultyScore == "Not At All"){
    score<- score +1
  }
  if (projectScore == "Yes"){
    score<- score +1
  }
  if (quizResults > 7){
    score<- score +1
  }
  if (score == 3){
    results <-'I am sure you will pass'
  }else if (score >= 1){
    results <- 'Work harder and you might pass'
  }else{
    results <- 'Hmm, Roger Peng will be upset'
  }
  
  results
  
}

shinyServer(
  function(input, output) {
    output$txtDifficult <- renderPrint({input$radDifficult})
    output$txtProject <- renderPrint({input$radProject})
    output$txtQuizScore <- renderPrint({input$txtQuizScore})
    
    
    output$txtResults <- renderPrint(assessScore(input$txtQuizScore, input$radProject, input$radDifficult))
    
  }
)