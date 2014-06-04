

# loading data
data <- read.table("household_power_consumption.txt", sep = ";")
# get only data from the two days of interest
dataFiltered <- data[data$V3 != "?" & (data$V1 == "1/2/2007" | data$V1 == "2/2/2007"), ]
# convert time and date format
times <- paste(dataFiltered[, 1], dataFiltered[, 2])
datetime <- strptime(times, "%d/%m/%Y %H:%M:%S")
# extract global power data
cond1 <- ! is.na(as.numeric(as.character(dataFiltered$V3[dataFiltered$V3 != "?"])))
gp <- as.numeric(as.character(dataFiltered$V3[dataFiltered$V3 != "?"]))
gp <- gp[cond1]
datetime <- datetime[cond1]
# plot the second graph
png(filename = 'plot2.png', width = 480, height = 480)
plot(datetime, gp, xlab = "", ylab = "Global Active Power (kilowatts)", pch = 26)
lines(datetime, gp, type = "l")
dev.off()


