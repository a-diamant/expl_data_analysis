##exploatory data analysis.
##week1
###plot1

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

power_consumption1$Global_active_power <- as.numeric(power_consumption1$Global_active_power)
#plot1. Global active power

hist(power_consumption1$Global_active_power, 
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)",
     col="red", xlim = c(0, 6), axis = F)
axis(side=2, at=seq(0, 6, by=2), labels = seq(0, 6, by=2))

#save plot to png
dev.copy(png, file="plot1.png", width=480, height=480)
dev.off()
     
