# read the data file (assume the file has been extracted to the working directory)
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", strip.white = TRUE, stringsAsFactors = FALSE)

# convert dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# keep only dates that we are going to plot (2007-02-01 and 2007-02-02)
data <- filter(data, Date >= as.Date("2007-02-01", format = "%Y-%m-%d"), Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))

# Group the date/time fields into a single field in a new column
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

## make the plots
png("plot4.png", width = 480, height = 480, units = "px")
par(mfcol = c(2, 2)) # 2x2 plots, fill by column

# top left plot: same as plot 2
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

# bottom left plot: same as plot 3
plot(data$DateTime, data$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
lines(data$DateTime, data$Sub_metering_1, col = "black")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", lwd = 1, legend = colnames(data[,7:9]), col = c("black", "red", "blue"))

# top right plot
plot(data$DateTime, data$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

# bottom right plot
plot(data$DateTime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
