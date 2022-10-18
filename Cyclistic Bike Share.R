#install and load packages
install.packages("tidyverse")
library(tidyverse)
library(readr)
library(ggplot2)
library(lubridate)

#set working directory
getwd()
setwd("/Users/bernice/Desktop/Cyclistic data") 

getwd() 

#import data into R
# read_csv() imports data from .csv files
df_apr20 <- read.csv("202004-divvy-tripdata.csv")
df_may20 <- read.csv("202005-divvy-tripdata.csv")
df_jun20 <- read.csv("202006-divvy-tripdata.csv")
df_jul20 <- read.csv("202007-divvy-tripdata.csv")
df_aug20 <- read.csv("202008-divvy-tripdata.csv")
df_sep20 <- read.csv("202009-divvy-tripdata.csv")
df_oct20 <- read.csv("202010-divvy-tripdata.csv")
df_nov20 <- read.csv("202011-divvy-tripdata.csv")
df_dec20 <- read.csv("202012-divvy-tripdata.csv")
df_jan21 <- read.csv("202101-divvy-tripdata.csv")
df_feb21 <- read.csv("202102-divvy-tripdata.csv")
df_mar21 <- read.csv("202103-divvy-tripdata.csv")

#check for columns consistency in the different dataframes of each month
colnames(df_apr20)
colnames(df_may20)
colnames(df_jun20)
colnames(df_jul20)
colnames(df_aug20)
colnames(df_sep20) 
colnames(df_oct20)
colnames(df_nov20)
colnames(df_dec20)
colnames(df_jan21)
colnames(df_feb21)
colnames(df_mar21)

# check for data structure
str(df_apr20)
str(df_may20)
str(df_jun20)
str(df_jul20)
str(df_aug20)
str(df_sep20) 
str(df_oct20)
str(df_nov20)
str(df_dec20)
str(df_jan21)
str(df_feb21)
str(df_mar21)



# Wrangle data; filter out the columns  not useful in this analysis: start_station_name, 
#start_station_id, end_station_name, end_station_id

df_apr20 <- df_apr20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_may20 <- df_may20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_jun20 <- df_jun20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_jul20 <- df_jul20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_aug20 <- df_aug20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_sep20 <- df_sep20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_oct20 <- df_oct20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_nov20 <- df_nov20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_dec20 <- df_dec20 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_jan21 <- df_jan21 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))
df_feb21 <- df_feb21 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id,))
df_mar21 <- df_mar21 %>% select(-c(start_station_name, start_station_id,
                                   end_station_name, end_station_id))


#merge data into a single data frame
df_trips <- bind_rows(df_apr20, df_may20, df_jun20, df_jul20, 
                      df_aug20, df_sep20, df_oct20, df_nov20,
                      df_dec20, df_jan21, df_feb21, df_mar21)

#check a few rows of what the merged data frame looks like
head(df_trips)
colnames(df_trips)
str(df_trips)
summary(df_trips)

#to ensure proper number of observations in the categorical data
table(df_trips$member_casual) 
table(df_trips$rideable_type)

View(df_trips)

# data clean up and add data to prepare for analysis

df_trips_cleaned <- drop_na(df_trips)

#the columns; started_at, ended_at, ride_length are in character
#data types instead of date-time and numeric type, hence they need to be converted
## Adding date, month, year, day of week columns

df_trips_1 <- df_trips_cleaned %>%
  separate(started_at, into = c("started_date", "started_time"), sep=" ", 
           extra = "merge")
         
View(df_trips_1)
str(df_trips_1)







































































































