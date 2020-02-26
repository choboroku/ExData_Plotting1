
# Reading data and put them into an array:                                                                                            
data<-read.table("household_power_consumption.txt", sep=";", header=T, na.strings = "?")                                                                 
# Select a portion of the data that satisfies the dates below:
small.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Plot the data                                                                                                                        
png("plot1.png", width=480, height=480)
hist(as.numeric(small.data$Global_active_power), col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency"
     )
dev.off()                                                                   
