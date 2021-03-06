library(shiny)
library(rCharts)
# define UI
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel(list(tags$head(tags$style(".span12")),
                   "Wine Sommelier", 
              HTML("<p style='float:right;
                              font-size:14px;
                              font-weight:normal;
                              text-align:right;
                              line-height:normal;'>
                    <a href='http://www.github.com/timabe/sommelieR' target='_blank'> source code <br>
                    <a href='http://picklesanddata.com/data/?p=161' target='_blank'> how it works </a> <br></p>"))
               ),


  # Sidebar to control date range
  sidebarPanel(
    #   add tags to custom css for styling
    tags$head(
      tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css')
    ),
    
    
     textInput('w', label = 'Describe your ideal wine and the chart updates with the best varietals!', value = ""),          
  
    actionButton('button', "I need help thinking of descriptive words")
  ),
#   sidebarPanel(
#     div(h1("First level title"), p('developed by timabe, for more info see www.github.com'), class='span12')
#   ),
  # mainpanel to show chart
  mainPanel(
    showOutput('Plot', 'nvd3'),verbatimTextOutput('words')
  )  
))
