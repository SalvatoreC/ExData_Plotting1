# the local file is read
localFile <- "./household_power_consumption.txt"
fullData <- read.table(localFile, sep = ";", na.strings = "?", header = TRUE)

# data of interest are selected
myData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007",]

# plot2 is produced on the screen device
tmp <- paste(myData$Date, myData$Time)
asseX <- strptime(tmp, format = "%d/%m/%Y %H:%M:%S", tz = " ")

asseY <- as.numeric(as.character(myData$Global_active_power))

plot(asseX, asseY, type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")

# plot2 is produced on the png device
png(file = "plot2.png", width = 480, height = 480)
plot(asseX, asseY, type = "l", xlab = "datetime", ylab = "Global Active Power (kilowatts)")
dev.off()
