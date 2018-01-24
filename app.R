library(shiny)
source("helpers.R", local = TRUE)

ui <- fluidPage(
  titlePanel("Political Compass results"),
  fluidRow(
    helpText("You can take the test ", 
      a("here", href = "https://www.politicalcompass.org/test"))
  ),
  fluidRow(
    plotOutput("plt", width = "100%", height = "800px")
  )
)

server <- function(input, output, session) {
  output$plt <- renderPlot({
    getPlot()
  })
}

shinyApp(ui, server)