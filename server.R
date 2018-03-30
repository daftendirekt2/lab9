# server.R

source("helpers.R")
counties <- readRDS("data/counties.rds")
library(maps)
library(mapproj)

shinyServer(
  function(input, output) {
    
    output$map <- renderPlot({
      
      switch(input$var,
             "Percent White" = percent_map(var = counties$white, color = "brown1", legend.title = "Percentage White", max = input$range[[2]], min = input$range[[1]]),
             "Percent Black" = percent_map(var = counties$black, color = "brown1", legend.title = "Percentage Black", max = input$range[[2]], min = input$range[[1]]),
             "Percent Hispanic" = percent_map(var = counties$hispanic, color = "brown1", legend.title = "Percentage Hispanic", max = input$range[[2]], min = input$range[[1]]),
             "Percent Asian" = percent_map(var = counties$asian, color = "brown1", legend.title = "Percentage Asian", max = input$range[[2]], min = input$range[[1]]))
    })
      
  }
)
    