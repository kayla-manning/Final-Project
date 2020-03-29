
library(shiny)
library(shinythemes)

# using the basic ui setup example from the textbook; will modify to fit my
# unique project


ui <- navbarPage(
  "HUDS Traffic Patterns in 2017-2018 and 2018-2019 Academic Years",
  tabPanel("Change in Interhouse Swipes by Meal",
           fluidPage(theme = shinytheme("simplex"),
             titlePanel("Change in Interhouse Swipes by Meal"),
             sidebarLayout(
               sidebarPanel(
                 verticalLayout(
                 selectInput(
                   "meal",
                   "Meal",
                   c("Breakfast" = "bfast", "Lunch" = "lunch", "Dinner" = "dinner")
                 ),
                 p("To calculate the data along the x-axis, I calculated the median 
                    swipe counts for each category (interhouse, bagged meal, etc.), 
                    house, and academic year in the data set. Then, I divided the 
                    interhouse swipes for each house and year by the grand total of 
                    swipes for each house and year. In doing so, I found the average 
                    percentage of interhouse swipes out of total swipes for each house 
                    and year. Then, I subtracted the 2017-2018 percentage from the 
                    percentage in 2018-2019 to find the increase in percentage of 
                    interhouse swipes between the two academic years. Select which
                    meal you would like to view from the drop-down menu."))),
               mainPanel(
                   imageOutput("interhouse"),
            ))
           )),
  tabPanel("Daily Distributions of Fly-By Traffic",
           fluidPage(theme = shinytheme("simplex"),
                     titlePanel("Daily Distributions of Fly-By Traffic"),
                     sidebarLayout(
                       sidebarPanel(
                         verticalLayout(
                           selectInput(
                             "variable",
                             "Year",
                             c("2017-2018" = "1718", "2018-2019" = "1819",
                               "2017-2018 and 2018-2019" = "both",
                               "Increase" = "increase"
                             )),
                           p("The plot with the side-by-side swipe counts for the
                             two academic years reveals that prior to the schedule
                             change, Tuesdays and Thursdays were the most popular days
                             at Fly-By. Following the schedule change, however,
                             Wednesday and Thursday were the most popular. Wednesday
                             saw the biggest increase in swipes between the two
                             academic years."))),
                       mainPanel(
                         imageOutput("daily_fly")
            ))
           )),
  tabPanel("Comparing Interhouse and Resident Lunch Swipes",
           fluidPage(theme = shinytheme("simplex"),
                     titlePanel("Comparing Interhouse and Resident Lunch Swipes"),
                     sidebarLayout(
                       sidebarPanel(
                         verticalLayout(
                           selectInput(
                             "type",
                             "Type",
                             c("Interhouse and Residents" = "both", 
                               "Interhouse" = "int",
                               "Residents" = "reg"
                             )),
                           p(""))),
                       mainPanel(
                         imageOutput("house_lunch")
                       ))
                         )),
  tabPanel("Discussion",
           includeHTML(file.path("../discussion.html"))),
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



  # send a pre-rendered image, and don't delete the image after sending it
  
  output$house_lunch <- renderImage({
    
    # will display appropriate image for input
    
    filename <- normalizePath(file.path('./int-reg-lunch-houses',
                                        paste('house_lunch_', input$type, '.png', sep='')))
    
    # return a list containing the filename and alt text
    
    list(src = filename)
    
  }, deleteFile = FALSE)
  
  }

# Run the application 
shinyApp(ui = ui, server = server)

