# Read the data set
# The data in the file is sorted by date. Reading only up to February 2, 2007.
source <- read.table("household_power_consumption.txt", sep=";", na.strings="?", header=TRUE, nrows=69517)

# Add time stamp column
source["TimeStamp"] <- NA
source$TimeStamp <- strptime(paste(source$Date, source$Time, sep="_"), "%d/%m/%Y_%H:%M:%S")

# Filter by target time range
target <- source[source$TimeStamp >= "2007-02-01 00:00" & source$TimeStamp < "2007-02-03 00:00",]

# Plot
png(file="plot2.png")
plot(target$TimeStamp, target$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
