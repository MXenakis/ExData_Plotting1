## Author: Michael Xenakis
## File: plot1.R

## Download the file from the corresponding URL
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption.zip")

## Unzip the file to the working directory
unzip("household_power_consumption.zip") 

## Read the file to construct the data frame. NAs are represented by "?" and the separator is ";"
consumption<-read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")

## Convert the column Date and Time to date and time types
consumption$Date<-as.Date(consumption$Date, format="%d/%m/%Y")
consumption$Time<-chron(times = consumption$Time)

## Subset according to two dates: "2007-02-01" and "2007-02-02" and pass this to the variable subconsumption
subconsumption<-subset(consumption,Date >= "2007-02-01" & Date <="2007-02-02")

##Plot 1
png("plot1.png", width=480, height=480)
par(bg=NA) ## For Transparent Background

with(subconsumption,hist(Global_active_power, col = "red", ylim = c(0,1200), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power"))

## Close png file
dev.off()
