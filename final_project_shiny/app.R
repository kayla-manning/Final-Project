
library(shiny)
library(shinythemes)

# using the basic ui setup example from the textbook; will modify to fit my
# unique project


ui <- navbarPage(
  "HUDS Traffic Patterns in 2017-2018 and 2018-2019",
  tabPanel("Change in Interhouse Swipes by Meal",
           fluidPage(theme = shinytheme("simplex"),
             titlePanel("Change in Interhouse Swipes by Meal"),
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   "meal",
                   "Meal",
                   c("Breakfast" = "bfast", "Lunch" = "lunch", "Dinner" = "dinner")
                 )),
               mainPanel(imageOutput("interhouse")))
           )),
  tabPanel("Daily Distributions of Fly-By Traffic",
           fluidPage(theme = shinytheme("simplex"),
                     titlePanel("Daily Distributions of Fly-By Traffic"),
                     sidebarLayout(
                       sidebarPanel(
                         selectInput(
                           "variable",
                           "Year",
                           c("2017-2018" = "1718", "2018-2019" = "1819",
                             "2017-2018 and 2018-2019" = "both",
                             "Increase" = "increase")
                         )),
                       mainPanel(imageOutput("daily_fly")))
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

    # send a pre-rendered image, and don't delete the image after sending it

    output$interhouse <- renderImage({
 
         # will display appropriate image for input
 
         filename <- normalizePath(file.path('./change-interhouse-meal',
                                        paste('change_int_', input$meal, '.png', sep='')))
    
    # return a list containing the filename
  
          list(src = filename)
    
  }, deleteFile = FALSE)


    # send a pre-rendered image, and don't delete the image after sending it
    
    output$daily_fly <- renderImage({

      # will display appropriate image for input

      filename <- normalizePath(file.path('./flyby-daily-counts',
                                          paste(input$variable, '.png', sep='')))

      # return a list containing the filename and alt text

      list(src = filename)

    }, deleteFile = FALSE)

}

# Run the application 
shinyApp(ui = ui, server = server)

