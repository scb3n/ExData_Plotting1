# read the data file (assume the file has been extracted to the working directory)
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", strip.white = TRUE, stringsAsFactors = FALSE)

# convert dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# keep only dates that we are going to plot (2007-02-01 and 2007-02-02)
data <- filter(data, Date >= as.Date("2007-02-01", format = "%Y-%m-%d"), Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))

# Group the date/time fields into a single field in a new column
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%Y-%m-%d %H:%M:%S")

# make the plot
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()