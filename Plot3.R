
##Upload and clean the data

getwd()
 setwd("C:/Users/d073728/OneDrive - SAP SE/Documents/Ekaterina/Data Science course/Assignment 4")
data <- read.table("household_power_consumption.txt", sep=";", na.strings = "?", colClasses = c('character','character','numeric','numeric','numeric','numeric','numeric','numeric','numeric'),header=TRUE)
data$Date <- as.Date(data$Date, "%d/%m/%Y") 
data<- subset(data,Date >= as.Date("2007-2-1") & Date <= as.Date("2007-2-2"))
DateTime <- paste(data$Date, data$Time)
DateTime <- setNames(DateTime, "DateTime")
data <- data[ ,!(names(data) %in% c("Date","Time"))]
data<- cbind(DateTime, data)
data$DateTime <- as.POSIXct(DateTime)

##Plot 3

with(data, {
    plot(Sub_metering_1~DateTime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
  })
  legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
