

# loading data
data <- read.table("household_power_consumption.txt", sep = ";")
# get only data from the two days of interest
dataFiltered <- data[data$V3 != "?" & (data$V1 == "1/2/2007" | data$V1 == "2/2/2007"), ]
# extract global power fields
cond1 <- ! is.na(as.numeric(as.character(dataFiltered$V3[dataFiltered$V3 != "?"])))
gp <- as.numeric(as.character(dataFiltered$V3[dataFiltered$V3 != "?"]))
gp <- gp[cond1]
# plot the first graph
png(filename = 'plot1.png', width = 480, height = 480)
hist(gp, ylab = "Frequency", xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")
dev.off()


