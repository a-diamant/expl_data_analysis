##exploatory data analysis.
##week1
###plot2

library(data.table)

download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "power_consumption.zip")
unzip("power_consumption.zip")

list.files()

power_consumption <- fread("household_power_consumption.txt", sep = ";", header = T)
power_consumption$Date <- as.Date(power_consumption$Date, format="%d/%m/%Y")

head(power_consumption1)


#subset the data required 2007-02-01 and 2007-02-02

power_consumption1 <- power_consumption[(power_consumption$Date=="2007-02-01") | 
                                          (power_consumption$Date=="2007-02-02"),]

#transform data
power_consumption1$Global_active_power <- 
  as.numeric(power_consumption1$Global_active_power)

power_consumption1 <- transform(power_consumption1, time=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")



#buid the plot
plot(power_consumption1$time, power_consumption1$Global_active_power, main = "", xlab="", type="l", 
     ylab="Global Active Power (kilowatts)")

#save plot to png
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()
