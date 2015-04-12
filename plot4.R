# Read the data set
# The data in the file is sorted by date. Reading only up to February 2, 2007.
source <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, nrows=69517)

# Add time stamp column
source["TimeStamp"] <- NA
source$TimeStamp <- strptime(paste(source$Date, source$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

# Filter by target time range
target <- source[source$TimeStamp >= "2007-02-01 00:00" & source$TimeStamp < "2007-02-03 00:00",]

png(file="plot4.png")

# Set multiple base plots
par(mfrow = c(2,2))

# 1st plot
plot(target$TimeStamp, target$Global_active_power, type="l", xlab="", ylab="Global Active Power")

# 2nd plot
plot(target$TimeStamp, target$Voltage, type="l", xlab="datetime", ylab="Voltage")

# 3rd plot
with(target, plot(target$TimeStamp, target$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering"))
with(target, points(target$TimeStamp, target$Sub_metering_2, type="l", col="red"))
with(target, points(target$TimeStamp, target$Sub_metering_3, type="l", col="blue"))
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# 4th plot
with(target, plot(target$TimeStamp, target$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()
