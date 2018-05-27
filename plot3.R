##exploatory data analysis.
##week1
###plot3

library(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")


power_consumption <- fread("household_power_consumption.txt", sep = ";", header = T)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

head(power_consumption1)


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

#build the plot
plot(power_consumption1$time,power_consumption1$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(power_consumption1$time,power_consumption1$Sub_metering_2,col="red")
lines(power_consumption1$time,power_consumption1$Sub_metering_3,col="blue")
legend("topright", col=c("black","red","blue"), 
       c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  "),
       lty=c(1,1), lwd=c(1,1))

#save the plot
dev.copy(png, file="plot3.png", width=480, height=480)
dev.off()