## read data from working directory
x <- read.table("household_power_consumption.txt", sep = ";",
	na.strings = "?", header = TRUE)
## convert Data to date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
## select the required records
x <- subset(x, (x$Date == "2007-02-01")|(x$Date == "2007-02-02"))
## creates a new variable datetime
x$datetime <- as.POSIXct(paste(x$Date, x$Time, sep=" "))
## set graphical device to png
png(file = "plot4.png")
## set panel
par(mfrow = c(2,2))
## make the plots
	with(x, {plot(datetime, Global_active_power, type = "l",
	ylab = "Global Active Power (kilowatts)")
	plot(datetime, Voltage, type = "l",
	xlab = "datetime", ylab = "Voltage")
	{plot(datetime, Sub_metering_1, ylab="Energy sub metering", type = "l")
	lines(datetime, Sub_metering_2, col = "red")
	lines(datetime, Sub_metering_3, col = "blue")
	legend("topright", lty=c(1,1,1), col=c("black","red","blue"),
	legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
	cex=0.7, bty = "n")}
	plot(datetime, Global_reactive_power, type = "l")})
## close graphical device
dev.off()

