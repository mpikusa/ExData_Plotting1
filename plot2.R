data <- read.csv(file = "household_power_consumption.txt", sep = ";", )
data$Time <- strptime(paste(data$Date,  data$Time), "%d/%m/%Y %H:%M:%S")
lowerBound <- strptime("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
upperBound <- strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
limitedData <- data[data$Time > lowerBound, ]
limitedData <- limitedData[limitedData$Time < upperBound, ]
limitedData <- limitedData[!is.na(limitedData$Time), ]
limitedData$Global_active_power <- as.numeric(as.character(limitedData$Global_active_power))

png(file="plot2.png", width = 480, height = 480)
plot(x = limitedData$Time, y = limitedData$Global_active_power, type="l",  ylab = "Global Active Power (kilowatts)", xlab="")
dev.off()

