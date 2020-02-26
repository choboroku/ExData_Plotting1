

# Reading data and put them into an array:
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")

# Select a portion of the data that satisfies the dates below:
small.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# A useful object for dates:
date.set <- strptime(paste(small.data$Date, small.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot the data
png("plot3.png", width=480, height=480)
# The Sub_metering_1 dataset:
plot(date.set, as.numeric(small.data$Sub_metering_1) ,type="l", xlab="", ylab="Energy sub metering")
# The Sub_metering_2 and Sub_metering_3 datasets:
lines(small.data$Sub_metering_2 ~ as.POSIXct(date.set), col = "Red")
lines(small.data$Sub_metering_3 ~ as.POSIXct(date.set), col = "Blue")
legend("topright", 
       lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       )
dev.off()



