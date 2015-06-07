# get data from 1/2/2007 to 2/2/2007
data <- read.table("household_power_consumption.txt", header=T, sep=";")
data <- data[as.character(data$Date) %in% c("1/2/2007", "2/2/2007"),]

# plot the data
png("plot1.png", width=480, height=480, units="px")
hist(as.numeric(as.character(data$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()