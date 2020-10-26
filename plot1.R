
setwd("./ExData_Plotting1")
# reading the data
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

library(lubridate)
# changing the format of the date-column to date
data$Date <- parse_date_time(data$Date, c("dmY"))

# subsetting the data
data_subset <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# changinge the format of the data to numeric
data_subset$Global_active_power <- as.numeric(data_subset$Global_active_power)

# preparing for saving the plot as png
png(file = "plot1.png", width = 480, height = 480)

# drawing the histogram
with(data_subset, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))

dev.off()


