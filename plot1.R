data <- read.csv(file = "household_power_consumption.txt", sep = ";", )
data$Date <- as.Date(data$Date, "%d/%m/%Y")
lowerBound <- as.Date("01/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
upperBound <- as.Date("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S")
limitedData <- data[data$Date >= lowerBound, ]
limitedData <- limitedData[limitedData$Date < upperBound, ]

png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(as.character(limitedData$Global_active_power)), col = "RED", xlab = "Global Active Power (kilowats)", main = "Global Active Power")
dev.off()