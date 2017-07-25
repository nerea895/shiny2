library(shiny)
library(maps)
library(mapproj)
source("~/tutoShiny/lesson5/helpers.R")

shinyServer(function(input, output) {
  output$map <- renderPlot({
    data <- switch(input$select, 
                   "Percent White" = counties$white,
                   "Percent Black" = counties$black,
                   "Percent Hispanic" = counties$hispanic,
                   "Percent Asian" = counties$asian)
    coleur <- switch(input$select, 
                    "Percent White" = "darkgreen",
                    "Percent Black" = "black",
                    "Percent Hispanic" = "darkorange",
                    "Percent Asian" = "darkviolet")
    titre <- switch(input$select, 
                     "Percent White" = "% White",
                     "Percent Black" = "% Black",
                     "Percent Hispanic" = "% Hispanic",
                     "Percent Asian" = "% Asian")
    percent_map(var=data, 
                color=coleur, 
                legend.title=titre, 
                max=input$slider1[2], 
                min=input$slider1[1])
    })
})
