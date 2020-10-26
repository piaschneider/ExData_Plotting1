
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
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)
data_subset$Voltage <- as.numeric(data_subset$Voltage)
data_subset$Sub_metering_1 <- as.numeric(data_subset$Sub_metering_1)
data_subset$Sub_metering_2 <- as.numeric(data_subset$Sub_metering_2)
data_subset$Sub_metering_3 <- as.numeric(data_subset$Sub_metering_3)
data_subset$Global_reactive_power <- as.numeric(data_subset$Global_reactive_power)

# preparing for saving the plot as png
png(file = "plot4.png", width = 480, height = 480)

# drawing the graph
par(mfrow = c(2,2), mar = c(5,4,2,1))
with(data_subset, plot(date_time, Global_active_power, type = "l", lty = 1, xlab = "", ylab = "Global Active Power (kilowatts)"))
with(data_subset, plot(date_time, Voltage, type = "l", lty = 1, xlab = "datetime", ylab = "Voltage"))
with(data_subset, plot(date_time, Sub_metering_1, type = "l", lty = 1, xlab = "", ylab = "Energy sub metering"))
with(data_subset, lines(date_time, Sub_metering_2, type = "l", lty = 1, col = "red"))
with(data_subset, lines(date_time, Sub_metering_3, type = "l", lty = 1, col = "blue"))
with(data_subset, plot(date_time, Global_reactive_power, type = "l", lty = 1, xlab = "datetime", ylab = "Global_reactive_power"))


dev.off()


