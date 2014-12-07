data <- read.csv(file = "household_power_consumption.txt", sep = ";", )
data$Time <- strptime(paste(data$Date,  data$Time), "%d/%m/%Y %H:%M:%S")
lowerBound <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
upperBound <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
limitedData <- data[data$Time > lowerBound, ]
limitedData <- limitedData[limitedData$Time < upperBound, ]
limitedData <- limitedData[!is.na(limitedData$Time), ]

#data conversion
limitedData$Sub_metering_1 <- as.numeric(as.character(limitedData$Sub_metering_1))
limitedData$Sub_metering_2 <- as.numeric(as.character(limitedData$Sub_metering_2))
limitedData$Sub_metering_3 <- as.numeric(as.character(limitedData$Sub_metering_3))

maxy = max(max(limitedData$Sub_metering_3), max(limitedData$Sub_metering_2), max(limitedData$Sub_metering_1))

#ploting
png(file="plot3.png", width = 480, height = 480)
plot(x = limitedData$Time, y = limitedData$Sub_metering_1, type="l", ylim = c(0, maxy), ylab = "Energy sub metering", xlab = "")
lines(x = limitedData$Time, y = limitedData$Sub_metering_2, col="red")
lines(x = limitedData$Time, y = limitedData$Sub_metering_3, col="blue")
legend("topright", pch =  1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()