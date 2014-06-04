

# loading data
data <- read.table("household_power_consumption.txt", sep = ";")
# get only data from the two days of interest
dataFiltered <- data[(data$V3 != "?" & data$V4 != "?" & data$V5 != "?" & data$V6 != "?" & data$V7 != "?" & data$V8 != "?" & data$V9 != "?") & (data$V1 == "1/2/2007" | data$V1 == "2/2/2007"), ]
# convert time and date format
times <- paste(dataFiltered[, 1], dataFiltered[, 2])
datetime <- strptime(times, "%d/%m/%Y %H:%M:%S")
# plot the fourth graph
png(filename = 'plot4.png', width = 480, height = 480)
par(mfcol = c(2, 2))
with(dataFiltered, {
  # get multiple graphs on one page
  plot(datetime, as.numeric(as.character(dataFiltered$V3)), xlab = "", ylab = "Global Active Power", pch = 26)
  lines(datetime, as.numeric(as.character(dataFiltered$V3)), type = "l") 
  # get multiple data plots on one graph
  plot(datetime, as.numeric(as.character(dataFiltered$V7)), xlab = "", ylab = "Energy sub metering", pch = 26)
  lines(datetime, as.numeric(as.character(dataFiltered$V7)), type = "l", col = "black")
  lines(datetime, as.numeric(as.character(dataFiltered$V8)), type = "l", col = "red")
  lines(datetime, as.numeric(as.character(dataFiltered$V9)), type = "l", col = "blue")
  legend("topright", lwd = 1, pch = 26, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n")
  plot(datetime, as.numeric(as.character(dataFiltered$V5)), xlab = "datetime", ylab = "Voltage", pch = 26)
  lines(datetime, as.numeric(as.character(dataFiltered$V5)), type = "l")
  plot(datetime, as.numeric(as.character(dataFiltered$V4)), xlab = "datetime", ylab = "Global_reactive_power", pch = 26)
  lines(datetime, as.numeric(as.character(dataFiltered$V4)), type = "l")
})
dev.off()


