

# Reading data and put them into an array:
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")

# Select a portion of the data that satisfies the dates below:
small.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# A useful object for dates:
date.set <- strptime(paste(small.data$Date, small.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Plot the data:
png("plot2.png", width=480, height=480)
plot(date.set,
     as.numeric(small.data$Global_active_power) ,
     type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off()



