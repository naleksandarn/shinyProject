library(shiny)


# Rely on the 'chickwts' dataset in the datasets
# package (which generally comes preloaded).
library(datasets)


shinyServer(function(input, output) {
  
  # Subset dataset based on the selected variables
  # (feed type)
  chicData <- reactive({
    chickwts[chickwts$feed %in% input$feedType, ]
  })
  
  # Make boxplot based on the selection
  output$boxplot <- renderPlot({
    plotData <- chicData()
    boxplot(plotData$weight ~ plotData$feed)
  })
  
  # Generate a summary of the data based on the selection
  output$summary <- renderPrint({
    sumData <- chicData()
    tapply(sumData$weight, sumData$feed, summary)
  })
  
  
})