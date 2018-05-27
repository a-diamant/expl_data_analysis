##exploatory data analysis.
##week1
###plot4

library(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")

list.files()

power_consumption <- fread("household_power_consumption.txt", sep = ";", header = T)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")


#subset the data required 2007-02-01 and 2007-02-02

power_consumption1 <- power_consumption[(power_consumption$Date=="2007-02-01") | 
                                          (power_consumption$Date=="2007-02-02"),]

#transform data
power_consumption1 <- transform(power_consumption1, 
                                time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

power_consumption1$Global_active_power <- 
  as.numeric(power_consumption1$Global_active_power)

power_consumption1$Voltage <- as.numeric(power_consumption1$Voltage)

power_consumption1$Sub_metering_1 <- as.numeric(power_consumption1$Sub_metering_1)

power_consumption1$Sub_metering_2 <- as.numeric(power_consumption1$Sub_metering_2)

power_consumption1$Sub_metering_3 <- as.numeric(power_consumption1$Sub_metering_3)


#plot the graphs on one page
attach(power_consumption1)
par(mfrow=c(2,2))

#1
plot(power_consumption1$time, power_consumption1$Global_active_power, type="l", xlab="", ylab="Global Active Power")

#2
plot(power_consumption1$time, power_consumption1$Voltage,
     type="l", xlab="datetime", ylab="Voltage")

#3
plot(power_consumption1$time,power_consumption1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_consumption1$time,power_consumption1$Sub_metering_2,col="red")
lines(power_consumption1$time,power_consumption1$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),lty=c(1,1), bty="n", cex=.5) 

#4
plot(power_consumption1$time,power_consumption1$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

#save plot to png
dev.copy(png, file="plot4.png", width=480, height=480)
dev.off()