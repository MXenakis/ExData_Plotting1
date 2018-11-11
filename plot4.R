## Author: Michael Xenakis
## File: plot4.R

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

##Plot 4
png("plot4.png", width=480, height=480)
par(bg=NA) ## For Transparent Background
par(mfrow=c(2,2)) ## 2x2 plotting

### Plot 1x1
plot(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Global_active_power, type='l', xlab = "", ylab = "Global Active Power (kilowatts)")

### Plot 1x2
plot(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Voltage, type='l', xlab = "datetime", ylab = "Voltage")

### Plot 2x1
plot(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Sub_metering_1, type='l', col = "black",xlab = "", ylab = "Energy sub metering")
lines(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Sub_metering_2, col = "red")
lines(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Sub_metering_3, col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lty=c(1,1), bty = "n", cex = 0.5, bg="transparent")

### Plot 2x2
plot(as.POSIXct(paste(subconsumption$Date, subconsumption$Time), format="%Y-%m-%d %H:%M:%S"), subconsumption$Global_reactive_power, type='l', xlab = "datetime", ylab = "Global_reactive_power")

## Close png file
dev.off()