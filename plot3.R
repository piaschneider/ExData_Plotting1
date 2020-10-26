
setwd("./ExData_Plotting1")
Sys.setlocale("LC_TIME","US")
# reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
data$date_time <- paste(data$Date, data$Time)


library(lubridate)
# changing the format of the date-column to date
data$Date <- parse_date_time(data$Date, c("dmY"))

# subsetting the data
data_subset <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# changing the format of the date_time column to date-time format
data_subset$date_time <- parse_date_time(data_subset$date_time, c("dmYHMS"))

# changing the format of the data to numeric
data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)

# preparing for saving the plot as png
png(file = "plot3.png", width = 480, height = 480)

# drawing the graph
with(data_subset, plot(date_time, Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering"))
with(data_subset, lines(date_time, Sub_metering_2, type = "l", lty = 1, col = "red"))
with(data_subset, lines(date_time, Sub_metering_3, type = "l", lty = 1, col = "blue"))
legend("topright", lwd = c(1,1), lty = c(1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()


