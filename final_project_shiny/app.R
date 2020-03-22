
library(shiny)

# using the basic ui setup example from the textbook; will modify to fit my
# unique project

ui <- navbarPage(
  "HUDS Traffic Patterns in 2017-2018 and 2018-2019",
  tabPanel("Model",
           fluidPage(
             titlePanel("Model Title"),
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   "plot_type",
                   "Plot Type",
                   c("Option A" = "a", "Option B" = "b")
                 )),
               mainPanel(plotOutput("line_plot")))
           )),
  tabPanel("Discussion",
           titlePanel("Discussion Title"),
           p("Tour of the modeling choices you made and 
             an explanation of why you made them")),
  tabPanel("About", 
           includeHTML(file.path("../about.html"))))

# for now I'm just copying and pasting the server example from the textbook
# as well, but this will likely have to change a lot more than the ui template

server <- function(input, output) {
  output$line_plot <- renderPlot({
    # Generate type based on input$plot_type from ui
    
    ifelse(
      input$plot_type == "a",
      
      # If input$plot_type is "a", plot histogram of "waiting" column 
      # from the faithful dataframe
      
      x   <- faithful[, 2],
      
      # If input$plot_type is "b", plot histogram of "eruptions" column
      # from the faithful dataframe
      
      x   <- faithful[, 1]
    )
    
    # Draw the histogram with the specified number of bins
    
    hist(x, col = 'darkgray', border = 'white')
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

