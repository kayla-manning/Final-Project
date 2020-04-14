
library(shiny)
library(shinythemes)

# using the basic ui setup example from the textbook; will modify to fit my
# unique project

# first I need to load data and packages

library(tidyverse)
library(gganimate)
library(lubridate)
library(gt)

tidy_int_reg_bag <- read_csv("pages/all_tidy.csv",
                             col_types = cols(col_date(format = ''),
                                              col_character(),
                                              col_character(),
                                              col_character(),
                                              col_character(),
                                              col_character(),
                                              col_double()))
anim_data <- read_csv("pages/anim_data.csv")

# this is the data I will use for my gt table

my_table <- function(x) {
  anim_data %>% 
  filter(house == x) %>% 
  select(month_year, house, avg_int, avg_total, distance) %>% 
    ungroup() %>% 
    mutate(avg_int = round(avg_int),
           avg_total = round(avg_total),
           distance = paste(round(distance), "feet from John Harvard Statue"),
           month_year = month_year %>% 
             as_factor() %>% 
             fct_relevel("8/2017", "9/2017", "9/2018", "10/2017", 
                         "10/2018", "11/2017", "11/2018", "12/2017", "12/2018")) %>% 
    group_by(house, distance) %>% 
    gt() %>% 
    cols_label(distance = "Distance from John Harvard", 
               month_year = "Month",
               avg_int = "Interhouse Swipes per Meal",
               avg_total = "Total Swipes per Meal") %>% 
    tab_header(title = "Monthly Average Interhouse and Total Swipes per Meal")
}


ui <- navbarPage(
  "HUDS Traffic Patterns in 2017-2018 and 2018-2019 Academic Years",
  tabPanel("Change in Percentage of Interhouse Swipes by Meal",
           fluidPage(theme = shinytheme("simplex"),
             titlePanel("Change in Percentage of Interhouse Swipes by Meal"),
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
                   imageOutput("pct_interhouse"),
            ))
           )),
  tabPanel("Change in Interhouse Swipes by Meal",
           fluidPage(theme = shinytheme("simplex"),
                     titlePanel("Change in Interhouse Swipes by Meal"),
                     sidebarLayout(
                       sidebarPanel(
                         verticalLayout(
                           selectInput(
                             "meals",
                             "Meal",
                             c("Breakfast" = "bfast", "Lunch" = "lunch", "Dinner" = "dinner")
                           ),
                           p("Unlike the plots in the previous window, this plot just
                             subtracts the median interhouse swipe counts in the 2017-2018
                             academic year from the median interhouse swipe counts in the
                             2018-2019 academic year."))),
                       mainPanel(
                         imageOutput("interhouse")
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
                           p("This plot displays the median swipes for each 
                             house in the 2017-2018 academic year alongside
                             the median counts for the 2018-2019 academic
                             year. You can filter for interhouse, residents,
                             or both categories if you would like to take
                             a closer look. You can see that the interhouse
                             and resident swipes decreased in River Central
                             Houses such as Quincy and Adams while they 
                             increased in Lowell. This makes sense if many
                             students were opting out of eating in Adams and
                             Quincy in favor of dining in the Lowtell swing
                             housing dining hall."))),
                       mainPanel(
                         imageOutput("house_lunch")
                       ))
                         )),
  tabPanel("Change in Monthly Average Swipes per Meal",
           fluidPage(theme = shinytheme("simplex"),
                     titlePanel("Change in Average Monthly Swipes per Meal"),
                     sidebarLayout(
                       sidebarPanel(
                         verticalLayout(
                           selectInput(
                             "house",
                             "House",
                             c(tidy_int_reg_bag %>% 
                                 filter(house != "Annenberg",
                                        house != "Hillel") %>% 
                                 pull(house))
                           ),
                           p("For a closer look at the monthly median swipe counts
                             per meal by house, select the house of interest from 
                             the drop-down bar."))),
                       mainPanel(
                         splitLayout(
                          imageOutput("my_plot", width = "700px", height = "600px"),
                          gt_output("table")
                       )))
                         )),
  tabPanel("Simulated Distributions of Interhouse Swipes",
           includeHTML(file.path("pages/boot_int_pct.html"))),
  tabPanel("Discussion",
           includeHTML(file.path("pages/discussion.html"))),
  tabPanel("About", 
           includeHTML(file.path("pages/about.html"))))

# for now I'm just copying and pasting the server example from the textbook
# as well, but this will likely have to change a lot more than the ui template

server <- function(input, output, session) {

    # send a pre-rendered image, and don't delete the image after sending it

    output$pct_interhouse <- renderImage({
 
         # will display appropriate image for input
 
         filename <- normalizePath(file.path('./change-interhouse-meal',
                                        paste('change_int_', input$meal, '.png', sep='')))
    
    # return a list containing the filename
  
          list(src = filename)
    
  }, deleteFile = FALSE)
    
    output$interhouse <- renderImage({
      
      # will display appropriate image for input
      
      filename <- normalizePath(file.path('./raw-change-interhouse-meal',
                                          paste('raw_change_int_', input$meals, '.png', sep='')))
      
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
  
  # now trying to get my animation and gt table on the same page
  
  output$my_plot <- renderImage({
    list(src = "pages/my_anim.gif",
         contentType = 'image/gif')
  },
    deleteFile = FALSE)
  
  output$table <-  render_gt(
      expr = my_table(input$house),
      width = 500,
      height = 600
    )
  
  }

# Run the application 
shinyApp(ui = ui, server = server)

