

# loading data
data <- read.table("household_power_consumption.txt", sep = ";")
# get only data from the two days of interest
dataFiltered <- data[(data$V7 != "?" & data$V8 != "?" & data$V9 != "?") & (data$V1 == "1/2/2007" | data$V1 == "2/2/2007"), ]
# convert time and date format
times <- paste(dataFiltered[, 1], dataFiltered[, 2])
datetime <- strptime(times, "%d/%m/%Y %H:%M:%S")
# plot the third graph
png(filename = 'plot3.png', width = 480, height = 480)
# get multiple data plots on one graph
with(dataFiltered, plot(datetime, as.numeric(as.character(dataFiltered$V9)), pch = 26, axes = F))
with(dataFiltered, plot(datetime, as.numeric(as.character(dataFiltered$V8)), pch = 26, axes = F))
with(dataFiltered, plot(datetime, as.numeric(as.character(dataFiltered$V7)), xlab = "", ylab = "Energy sub metering", pch = 26, type = "n"))
lines(datetime, as.numeric(as.character(dataFiltered$V7)), type = "l", col = "black")
lines(datetime, as.numeric(as.character(dataFiltered$V8)), type = "l", col = "red")
lines(datetime, as.numeric(as.character(dataFiltered$V9)), type = "l", col = "blue")
legend("topright", lwd = 1, pch = 26, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


