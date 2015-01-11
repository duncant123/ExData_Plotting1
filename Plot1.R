# Exploring Data Assignment 1

# Download the zip file and extract it
# Read it in and convert the date to data and time to time

power <- read.csv(file = "./ExploreData/household_power_consumption.txt",sep=";",header = TRUE)
power$Date <- as.Date(power$Date,"%d/%m/%Y")
power$Time <- strptime(x = paste(power$Date, power$Time) ,format = "%d/%m/%Y %H:%M:%S")
library(dplyr)

q <- power[power$Date>="2007-01-01" & power$Date <= "2007-01-02",]
