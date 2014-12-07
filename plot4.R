data <- read.csv(file = "household_power_consumption.txt", sep = ";", )
data$Time <- strptime(paste(data$Date,  data$Time), "%d/%m/%Y %H:%M:%S")
lowerBound <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
upperBound <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
limitedData <- data[data$Time > lowerBound, ]
limitedData <- limitedData[limitedData$Time < upperBound, ]
limitedData <- limitedData[!is.na(limitedData$Time), ]

#converting data
limitedData$Global_active_power <- as.numeric(as.character(limitedData$Global_active_power))
limitedData$Voltage <- as.numeric(as.character(limitedData$Voltage))
limitedData$Sub_metering_1 <- as.numeric(as.character(limitedData$Sub_metering_1))
limitedData$Sub_metering_2 <- as.numeric(as.character(limitedData$Sub_metering_2))
limitedData$Sub_metering_3 <- as.numeric(as.character(limitedData$Sub_metering_3))
limitedData$Global_reactive_power <- as.numeric(as.character(limitedData$Global_reactive_power))

png(file="plot4.png", width = 480, height = 480)
par(mfrow=c(2, 2))


#Global Active Power
plot(x = limitedData$Time, y = limitedData$Global_active_power, type="l",  ylab = "Global Active Power", xlab="")

#Voltage
plot(x = limitedData$Time, y = limitedData$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

#Energy sub metering
maxy = max(max(limitedData$Sub_metering_3), max(limitedData$Sub_metering_2), max(limitedData$Sub_metering_1))

plot(x = limitedData$Time, y = limitedData$Sub_metering_1, type="l", ylim = c(0, maxy), ylab = "Energy sub metering", xlab = "")
lines(x = limitedData$Time, y = limitedData$Sub_metering_2, col="red")
lines(x = limitedData$Time, y = limitedData$Sub_metering_3, col="blue")
legend("topright", pch =  1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#reactive

plot(x = limitedData$Time, y = limitedData$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab = "datetime")
dev.off() 