library(shiny)
library(mermaidwidget)
ui <- fluidPage(
  column(
    width = 4,
    tabsetPanel(
      tabPanel(
        title = "Code",
        shinyAce::aceEditor(
          outputId = "diagram",
          mode = "dot",
          value = "flowchart LR \n id"
          )
      ),
      tabPanel(
        title = "Config",
        shinyAce::aceEditor(
          outputId = "config",
          mode = "dot",
          value = '{"theme": "forest"}'
          )
      )
    )
  ),
  column(
    width = 8,
    mermaidOutput("mermaid")
  )
)

server <- function(input, output, session) {

  output$mermaid <- renderMermaid({
    mermaid(input$diagram, input$config)
  })

}

shinyApp(ui, server)
