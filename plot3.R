## read data from working directory
x <- read.table("household_power_consumption.txt", sep = ";",
	na.strings = "?", header = TRUE)
## convert Data to date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
## select the required records
x <- subset(x, (x$Date == "2007-02-01")|(x$Date == "2007-02-02"))
## creates a new variable datetime
x$datetime <- as.POSIXct(paste(x$Date, x$Time, sep=" "))
## open graphic device png
png(file = "plot3.png")
	## plot Energy sub, by calling annotation functions
	with(x, plot(datetime, Sub_metering_1, ylab="Energy sub metering", type = "l"))
	with(x, lines(datetime, Sub_metering_2, col = "red"))
	with(x, lines(datetime, Sub_metering_3, col = "blue"))
	## add legend
	legend("topright", lty=c(1,1,1), col=c("black","red","blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## close graphic device
dev.off()
