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

# Plot 3
png( filename = "./Plot3.png", width = 480, height = 480)
with(febpwr, plot(Time, Sub_metering_1,  type = "l" ,xlab="",ylab="Energy sub metering"))
with(febpwr, points(Time, Sub_metering_2, col = "red", type ="l")) 
with(febpwr, points(Time, Sub_metering_3, col = "blue", type = "l"))
legend("topright",  col = c("black","red", "blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)

dev.off()
