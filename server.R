## server.r 
require(shiny)
require(rCharts)
shinyServer(function(input, output) {
  values <- reactiveValues()
  updateData <- function() {
    values <- source('update.R')
  }
  
  updateData()

  
  datasetInput <- reactive({
    as.character(input$w)
  })
  
  dataInput <- reactive({  
    if (input$button == 0) return(cat(''))
    
    GetRandomWords()
  })

  output$words <- renderPrint({
    text <- dataInput()
    cat(text)
  })
  output$Plot <- renderChart({
    text <- datasetInput()
    result <- RankWineProbabilities(text)
    p <- nPlot(Probability ~ Wine, group = 'type', data = result, type = 'multiBarChart')    
    p$chart(color = c('#7F1734','#F7E7CE')) # map reds and whites to their correct colors.
    p$addParams(width = 1100, height = 400, dom = 'Plot')
    return(p)    
  })

})