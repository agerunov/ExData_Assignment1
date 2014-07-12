# Read data and set variables
elcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
sub <- elcon[elcon$Date=="1/2/2007" | elcon$Date=="2/2/2007", ]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot
legtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col <- c("black", "red", "blue")
plot(sub$datetime, as.numeric(sub$Sub_metering_1), ylab="Energy sub metering", type="l", xlab="")+
  +   lines(sub$datetime, as.numeric(sub$Sub_metering_2), col="red")
  +   lines(sub$datetime, as.numeric(sub$Sub_metering_3), col="blue")
legend("topright", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save to png
dev.copy(png, "plot3.png", width=480, height=480)
dev.off()