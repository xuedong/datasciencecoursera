# get data from 1/2/2007 to 2/2/2007
data <- read.table("household_power_consumption.txt", header=T, sep=";")
data <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# convert to Date/Time class
data$dateTime = paste(data$Date, data$Time)
data$dateTime = strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

# plot the data
png("plot4.png", width=480, height=480, units="px")
par(mfrow=c(2, 2))
# topleft
plot(data$dateTime, as.numeric(as.character(data$Global_active_power)), type="l", xlab="", ylab="Global Active Power")

# topright
plot(data$dateTime, as.numeric(as.character(data$Voltage)), type="l", xlab="datetime", ylab="Voltage")

# bottomleft
plot(data$dateTime, as.numeric(as.character(data$Sub_metering_1)), type="l", xlab="", ylab="Energy sub metering", ylim=c(0,40))
lines(data$dateTime, as.numeric(as.character(data$Sub_metering_2)), col="red")
lines(data$dateTime, as.numeric(as.character(data$Sub_metering_3)), col="blue")
legend("topright", lty=1, bty="n", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# bottomright
plot(data$dateTime, as.numeric(as.character(data$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()