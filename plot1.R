# load required libraries
library(dplyr)

# read the data file (assume it has been extracted to the working directory)
data <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", strip.white = TRUE, stringsAsFactors = FALSE)

# convert dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# keep only dates that we are going to plot (2007-02-01 and 2007-02-02)
data <- filter(data, Date >= as.Date("2007-02-01", format = "%Y-%m-%d"), Date <= as.Date("2007-02-02", format = "%Y-%m-%d"))


# make the plot
png("plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()
