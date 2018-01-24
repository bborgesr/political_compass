library(shiny)
source("helpers.R", local = TRUE)

ui <- fluidPage(
  tags$head(tags$style(HTML("
      @import url('https://fonts.googleapis.com/css?family=Cutive');
      body { font-family: 'Cutive', serif; }
    "))),
  titlePanel("Political Compass results"),
  tags$hr(),
  tags$i(helpText("You can take the test ", 
    a("here", href = "https://www.politicalcompass.org/test"), ".")),
  fluidRow(
    column(10, p("Here are the results I've collected so far:")),
    plotOutput("plt", width = "100%", height = "800px")
  )
)

server <- function(input, output, session) {
  output$plt <- renderPlot({
    getPlot()
  })
}

shinyApp(ui, server)