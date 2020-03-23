
library(shiny)
library(shinythemes)

# using the basic ui setup example from the textbook; will modify to fit my
# unique project

ui <- navbarPage(
  "HUDS Traffic Patterns in 2017-2018 and 2018-2019",
  tabPanel("Model",
           fluidPage(theme = shinytheme("simplex"),
             titlePanel("Change in Interhouse Swipes by Meal"),
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   "meal",
                   "Meal",
                   c("Breakfast" = "bfast", "Lunch" = "lunch", "Dinner" = "dinner")
                 )),
               mainPanel(imageOutput("Image")))
           )),
  tabPanel("Discussion",
           titlePanel("Discussion Title"),
           p("Tour of the modeling choices you made and 
             an explanation of why you made them")),
  tabPanel("About", 
           includeHTML(file.path("../about.html"))))

# for now I'm just copying and pasting the server example from the textbook
# as well, but this will likely have to change a lot more than the ui template

server <- function(input, output, session) {

    # Send a pre-rendered image, and don't delete the image after sending it

    output$Image <- renderImage({
 
         # When input$n is 3, filename is ./images/image3.jpeg
 
         filename <- normalizePath(file.path('./change-interhouse-meal',
                                        paste('change_int_', input$meal, '.png', sep='')))
    
    # Return a list containing the filename and alt text
  
          list(src = filename)
    
  }, deleteFile = FALSE)
}

# Run the application 
shinyApp(ui = ui, server = server)

