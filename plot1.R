# the local file is read
localFile <- "./household_power_consumption.txt"
fullData <- read.table(localFile, sep = ";", na.strings = "?", header = TRUE)

# data of interest are selected
myData <- fullData[fullData$Date == "1/2/2007" | fullData$Date == "2/2/2007",]

# plot1 is produced on the screen device
gap <- as.numeric(as.character(myData$Global_active_power))
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# plot1 is produced on the png device
png(file = "plot1.png")
hist(gap, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
