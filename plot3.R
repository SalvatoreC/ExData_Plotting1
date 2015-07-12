# the local file is read
localFile <- "./household_power_consumption.txt"
fullData <- read.table(localFile, sep = ";", na.strings = "?", header = TRUE)

# data of interest are selected
myData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007",]

# plot3 is produced on the screen device
tmp <- paste(myData$Date, myData$Time)
asseX <- strptime(tmp, format = "%d/%m/%Y %H:%M:%S", tz = " ")

asseY1 <- as.numeric(as.character(myData$Sub_metering_1))
asseY2 <- as.numeric(as.character(myData$Sub_metering_2))
asseY3 <- as.numeric(as.character(myData$Sub_metering_3))


plot(asseX, asseY1, type = "l", col = "black", xlab = "datetime", ylab = "Energy sub metering")
points(asseX, asseY2, type = "l", col = "red")
points(asseX, asseY3, type = "l", col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       lwd = c(2.5,2.5,2.5))

# plot3 is produced on the png device
png(file = "plot3.png", width = 480, height = 480)
plot(asseX, asseY1, type = "l", col = "black", xlab = "datetime", ylab = "Energy sub metering")
points(asseX, asseY2, type = "l", col = "red")
points(asseX, asseY3, type = "l", col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty = c(1,1,1),
       col = c("black", "red", "blue"),
       lwd = c(2.5,2.5,2.5))
dev.off()
