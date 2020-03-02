library(readxl)
library(janitor)
library(tidyverse)
library(lubridate)

# originally it did not read the excel dates, so I had to manually set col_types
# other code is just cleaning data and getting it into a usable format
# I added a house column so I can combine data from multiple houses


###########################################################################################################


# starting with old Adams data

adams_fall_17 <- read_excel("raw-data/AdamsFall2017.xlsx", skip = 1,
                       col_types = c("date", "text", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Adams") %>% 
  fill(date)

adams_spring_18 <- read_excel("raw-data/AdamsSpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric", 
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Adams") %>% 
  fill(date)

adams_1718 <- bind_rows(adams_fall_17, adams_spring_18)

# new Adams data

adams_fall_18 <- read_excel("raw-data/AdamsFall2018.xlsx", skip = 1,
                       col_types = c("date", "text", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric", "numeric", "numeric",
                                     "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Adams") %>% 
  fill(date)

adams_spring_19 <- read_excel("raw-data/AdamsSpring2019.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Adams") %>% 
  fill(date)

adams_1819 <- bind_rows(adams_fall_18, adams_spring_19)


###########################################################################################################


# old Annenberg data

berg_fall_17 <- read_excel("raw-data/AnnenbergFall2017.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Annenberg") %>% 
  fill(date)

berg_spring_18 <- read_excel("raw-data/AnnenbergSpring2018.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Annenberg") %>% 
  fill(date)

berg_1718 <- bind_rows(berg_fall_17, berg_spring_18)

# new Annenberg data

berg_fall_18 <- read_excel("raw-data/AnnenbergFall2018.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Annenberg") %>% 
  fill(date)

berg_spring_19 <- read_excel("raw-data/AnnenbergSpring2019.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Annenberg") %>% 
  fill(date)

berg_1819 <- bind_rows(berg_fall_18, berg_spring_19)


###########################################################################################################


# old Cabot data

cabot_fall_17 <- read_excel("raw-data/CabotFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Cabot") %>% 
  fill(date)

cabot_spring_18 <- read_excel("raw-data/CabotSpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Cabot") %>% 
  fill(date)

cabot_1718 <- bind_rows(cabot_fall_17, cabot_spring_18)

# new Cabot data

cabot_fall_18 <- read_excel("raw-data/CabotFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Cabot") %>% 
  fill(date)

cabot_spring_19 <- read_excel("raw-data/CabotSpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Cabot") %>% 
  fill(date)

cabot_1819 <- bind_rows(cabot_fall_18, cabot_spring_19)


###########################################################################################################


# old Currier data

currier_fall_17 <- read_excel("raw-data/CurrierFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Currier") %>% 
  fill(date)

currier_spring_18 <- read_excel("raw-data/CurrierSpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Currier") %>% 
  fill(date)

currier_1718 <- bind_rows(currier_fall_17, currier_spring_18)

# new Currier data

currier_fall_18 <- read_excel("raw-data/CurrierFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Currier") %>% 
  fill(date)

currier_spring_19 <- read_excel("raw-data/CurrierSpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Currier") %>% 
  fill(date)

currier_1819 <- bind_rows(currier_fall_18, currier_spring_19)


###########################################################################################################


# old Dunster data

dunster_fall_17 <- read_excel("raw-data/DunsterFall2017.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Dunster") %>% 
  fill(date)

dunster_spring_18 <- read_excel("raw-data/DunsterSpring2018.xlsx", skip = 1,
                                col_types = c("date", "text", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric","numeric", 
                                              "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Dunster") %>% 
  fill(date)

dunster_1718 <- bind_rows(dunster_fall_17, dunster_spring_18)

# new Dunster data

dunster_fall_18 <- read_excel("raw-data/DunsterFall2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Dunster") %>% 
  fill(date)

dunster_spring_19 <- read_excel("raw-data/DunsterSpring2019.xlsx", skip = 1,
                                col_types = c("date", "text", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Dunster") %>% 
  fill(date)

dunster_1819 <- bind_rows(dunster_fall_18, dunster_spring_19)


###########################################################################################################


# old Eliot data

eliot_fall_17 <- read_excel("raw-data/EliotFall2017.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Eliot") %>% 
  fill(date)

eliot_spring_18 <- read_excel("raw-data/EliotSpring2018.xlsx", skip = 1,
                                col_types = c("date", "text", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric","numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Eliot") %>% 
  fill(date)

eliot_1718 <- bind_rows(eliot_fall_17, eliot_spring_18)

# new Eliot data

eliot_fall_18 <- read_excel("raw-data/EliotFall2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Eliot") %>% 
  fill(date)

eliot_spring_19 <- read_excel("raw-data/EliotSpring2019.xlsx", skip = 1,
                                col_types = c("date", "text", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric", "numeric", "numeric",
                                              "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Eliot") %>% 
  fill(date)

eliot_1819 <- bind_rows(eliot_fall_18, eliot_spring_19)


###########################################################################################################


# old FlyBy data

flyby_fall_17 <- read_excel("raw-data/FlyByFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "FlyBy") %>% 
  fill(date)

flyby_spring_18 <- read_excel("raw-data/FlyBySpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "FlyBy") %>% 
  fill(date)

flyby_1718 <- bind_rows(flyby_fall_17, flyby_spring_18)

# new FlyBy data

flyby_fall_18 <- read_excel("raw-data/FlyByFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "FlyBy") %>% 
  fill(date)

flyby_spring_19 <- read_excel("raw-data/FlyBySpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "FlyBy") %>% 
  fill(date)

flyby_1819 <- bind_rows(flyby_fall_18, flyby_spring_19)


###########################################################################################################


# old Hillel data

hillel_fall_17 <- read_excel("raw-data/HillelFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Hillel") %>% 
  fill(date)

hillel_spring_18 <- read_excel("raw-data/HillelSpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Hillel") %>% 
  fill(date)

hillel_1718 <- bind_rows(hillel_fall_17, hillel_spring_18)

# new Hillel data

hillel_fall_18 <- read_excel("raw-data/HillelFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Hillel") %>% 
  fill(date)

hillel_spring_19 <- read_excel("raw-data/HillelSpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Hillel") %>% 
  fill(date)

hillel_1819 <- bind_rows(hillel_fall_18, hillel_spring_19)


###########################################################################################################


# old Kirkland data

kirk_fall_17 <- read_excel("raw-data/KirklandFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Kirkland") %>% 
  fill(date)

kirk_spring_18 <- read_excel("raw-data/KirklandSpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric","numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Kirkland") %>% 
  fill(date)

kirk_1718 <- bind_rows(kirk_fall_17, kirk_spring_18)

# new Kirkland data

kirk_fall_18 <- read_excel("raw-data/KirklandFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Kirkland") %>% 
  fill(date)

kirk_spring_19 <- read_excel("raw-data/KirklandSpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Kirkland") %>% 
  fill(date)

kirk_1819 <- bind_rows(kirk_fall_18, kirk_spring_19)


###########################################################################################################


# old Leverett data

lev_fall_17 <- read_excel("raw-data/LeverettFall2017.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Leverett") %>% 
  fill(date)

lev_spring_18 <- read_excel("raw-data/LeverettSpring2018.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric","numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Leverett") %>% 
  fill(date)

lev_1718 <- bind_rows(lev_fall_17, lev_spring_18)

# new Leverett data

lev_fall_18 <- read_excel("raw-data/LeverettFall2018.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Leverett") %>% 
  fill(date)

lev_spring_19 <- read_excel("raw-data/LeverettSpring2019.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Leverett") %>% 
  fill(date)

lev_1819 <- bind_rows(lev_fall_18, lev_spring_19)


###########################################################################################################


# old Lowell data

lowell_fall_17 <- read_excel("raw-data/LowellFall2017.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Lowell") %>% 
  fill(date)

lowell_spring_18 <- read_excel("raw-data/LowellSpring2018.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric","numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Lowell") %>% 
  fill(date)

lowell_1718 <- bind_rows(lowell_fall_17, lowell_spring_18)

# new Lowell data

lowell_fall_18 <- read_excel("raw-data/LowellFall2018.xlsx", skip = 1,
                           col_types = c("date", "text", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric", "numeric", "numeric",
                                         "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Lowell") %>% 
  fill(date)

lowell_spring_19 <- read_excel("raw-data/LowellSpring2019.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Lowell") %>% 
  fill(date)

lowell_1819 <- bind_rows(lowell_fall_18, lowell_spring_19)


###########################################################################################################


# old Mather data

mather_fall_17 <- read_excel("raw-data/MatherFall2017.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Mather") %>% 
  fill(date)

mather_spring_18 <- read_excel("raw-data/MatherSpring2018.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric","numeric",
                                             "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Mather") %>% 
  fill(date)

mather_1718 <- bind_rows(mather_fall_17, mather_spring_18)

# new Mather data

mather_fall_18 <- read_excel("raw-data/MatherFall2018.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Mather") %>% 
  fill(date)

mather_spring_19 <- read_excel("raw-data/MatherSpring2019.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Mather") %>% 
  fill(date)

mather_1819 <- bind_rows(mather_fall_18, mather_spring_19)


###########################################################################################################


# old Pforzheimer data

pfoho_fall_17 <- read_excel("raw-data/PfohoFall2017.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Pforzheimer") %>% 
  fill(date)

pfoho_spring_18 <- read_excel("raw-data/PfohoSpring2018.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric","numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Pforzheimer") %>% 
  fill(date)

pfoho_1718 <- bind_rows(pfoho_fall_17, pfoho_spring_18)

# new Pforzheimer data

pfoho_fall_18 <- read_excel("raw-data/PfohoFall2018.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Pforzheimer") %>% 
  fill(date)

pfoho_spring_19 <- read_excel("raw-data/PfohoSpring2019.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Pforzheimer") %>% 
  fill(date)

pfoho_1819 <- bind_rows(pfoho_fall_18, pfoho_spring_19)


###########################################################################################################


# old Quincy data

quincy_fall_17 <- read_excel("raw-data/QuincyFall2017.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Quincy") %>% 
  fill(date)

quincy_spring_18 <- read_excel("raw-data/QuincySpring2018.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric","numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Quincy") %>% 
  fill(date)

quincy_1718 <- bind_rows(quincy_fall_17, quincy_spring_18)

# new Quincy data

quincy_fall_18 <- read_excel("raw-data/QuincyFall2018.xlsx", skip = 1,
                            col_types = c("date", "text", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric", "numeric", "numeric",
                                          "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Quincy") %>% 
  fill(date)

quincy_spring_19 <- read_excel("raw-data/QuincySpring2019.xlsx", skip = 1,
                              col_types = c("date", "text", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric", "numeric", "numeric",
                                            "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Quincy") %>% 
  fill(date)

quincy_1819 <- bind_rows(quincy_fall_18, quincy_spring_19)


###########################################################################################################


# old Winthrop data

winthrop_fall_17 <- read_excel("raw-data/WinthropFall2017.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Winthrop") %>% 
  fill(date)

winthrop_spring_18 <- read_excel("raw-data/WinthropSpring2018.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric","numeric",
                                             "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Winthrop") %>% 
  fill(date)

winthrop_1718 <- bind_rows(winthrop_fall_17, winthrop_spring_18)

# new Winthrop data

winthrop_fall_18 <- read_excel("raw-data/WinthropFall2018.xlsx", skip = 1,
                             col_types = c("date", "text", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric", "numeric", "numeric",
                                           "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Winthrop") %>% 
  fill(date)

winthrop_spring_19 <- read_excel("raw-data/WinthropSpring2019.xlsx", skip = 1,
                               col_types = c("date", "text", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric", "numeric", "numeric",
                                             "numeric")) %>% 
  rename(date = ...1,
         meal = ...2) %>% 
  clean_names() %>% 
  filter(!is.na(meal)) %>% 
  mutate(house = "Winthrop") %>% 
  fill(date)

winthrop_1819 <- bind_rows(winthrop_fall_18, winthrop_spring_19)


###########################################################################################################


# now I will combine all individual house dataframes by year and then combine those into one dataframe with all of 
# the data
# adding a column to the main dataframe with day of the week so I can analyze weekdays vs weekends

all_1718 <- bind_rows(adams_1718, berg_1718, cabot_1718, currier_1718, dunster_1718, eliot_1718, flyby_1718, 
                      hillel_1718, kirk_1718, lev_1718, lowell_1718, mather_1718, pfoho_1718, quincy_1718, 
                      winthrop_1718) %>% 
  mutate(year = "1718")

all_1819 <- bind_rows(adams_1819, berg_1819, cabot_1819, currier_1819, dunster_1819, eliot_1819, flyby_1819, 
                      hillel_1819, kirk_1819, lev_1819, lowell_1819, mather_1819, pfoho_1819, quincy_1819, 
                      winthrop_1819) %>% 
  mutate(year = "1819")

all_data <- rbind(all_1718, all_1819) %>% 
  mutate(day = wday(date, label = TRUE, abbr = TRUE))

tidy_int_reg_bag <- all_data %>% 
  select(date, day, year, meal, house, reg, int, bag, grand_total) %>% 
  pivot_longer(reg:grand_total, names_to = "type", values_to = "count")

write.csv(tidy_int_reg_bag, "raw-data/all_tidy.csv", row.names = FALSE)
  
