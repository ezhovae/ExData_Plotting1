
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

##Plot4

 par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(data, {
    plot(Global_active_power~DateTime, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~DateTime, type="l", 
         ylab="Voltage", xlab="")
    plot(Sub_metering_1~DateTime, type="l", 
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~DateTime,col='Red')
    lines(Sub_metering_3~DateTime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
 plot(Global_reactive_power~DateTime, type="l", 
         ylab="Global_reactive_power",xlab="")

  })



