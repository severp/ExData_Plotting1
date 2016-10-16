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
png(file = "plot2.png")
	## plot Global_active_power vs. datetime, type line
	with(x, plot(datetime, Global_active_power, type = "l",
	ylab = "Global Active Power (kilowatts)"))
## close graphic device
dev.off()
