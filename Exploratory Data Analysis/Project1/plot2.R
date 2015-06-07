# get data from 1/2/2007 to 2/2/2007
data <- read.table("household_power_consumption.txt", header=T, sep=";")
data <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# convert to Date/Time class
data$dateTime = paste(data$Date, data$Time)
data$dateTime = strptime(data$dateTime, "%d/%m/%Y %H:%M:%S")

# plot the data
png("plot2.png", width=480, height=480, units="px")
plot(data$dateTime, as.numeric(as.character(data$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()