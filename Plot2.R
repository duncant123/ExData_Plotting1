# Exploring Data Assignment 1
# Duncan Turnbull

# Assumptions
# Data file is in current working directory
# Output file will be in current working directory

# Overview
# Read in big file with conversions of the date
# Use read table to set ? to NA and colclasses to say whats coming in and convert date on the fly
# Use dplyr to get the wanted days
# Convert time on the smaller data set (not needed for plot 1)
# Plot the graph as a png

library(dplyr)
setClass('myDate')
setAs("character","myDate", function(from) as.Date(from,"%d/%m/%Y") )
cc <- c("myDate","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")
power <- read.table(file = "./household_power_consumption.txt",sep=";",header = TRUE,na.strings = c("?",""),quote = "", colClasses = cc)
febpwr <- filter(power, Date >= "2007-02-01" & Date <= "2007-02-02")
febpwr$Time <- strptime(x = paste(febpwr$Date, febpwr$Time) ,format = "%Y-%m-%d %H:%M:%S")

# Plot 2
png( filename = "./Plot2.png", width = 480, height = 480)
plot(febpwr$Time, febpwr$Global_active_power, type="l" , ylab="Global Active Power (kilowatts)",xlab="")
dev.off()
