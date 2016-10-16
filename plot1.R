## read data from working directory
x <- read.table("household_power_consumption.txt", sep = ";",
	na.strings = "?", header = TRUE)
## convert Data to date
x$Date <- as.Date(x$Date, format = "%d/%m/%Y")
## select the required records
x <- subset(x, (x$Date == "2007-02-01")|(x$Date == "2007-02-02"))
## open graphic device png
png(file = "plot1.png")
	## plot histogram
	hist(x$Global_active_power, col = "red",
		main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
## close graphic device
dev.off()

