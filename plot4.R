# Read data and set variables
elcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
sub <- elcon[elcon$Date=="1/2/2007" | elcon$Date=="2/2/2007", ]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Set plotting space for 4 plots
par(mfrow=c(2,2))

# Create plots
plot(sub$datetime, as.numeric(sub$Global_active_power), ylab="Global Active Power", type="l", xlab="")
plot(sub$datetime, as.numeric(sub$Voltage), ylab="Voltage", type="l", xlab="datetime")
legtext <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
col <- c("black", "red", "blue")
plot(sub$datetime, as.numeric(sub$Sub_metering_1), ylab="Energy sub metering", type="l", xlab="")+
  +   lines(sub$datetime, as.numeric(sub$Sub_metering_2), col="red")
+   lines(sub$datetime, as.numeric(sub$Sub_metering_3), col="blue")
legend("topright", cex=0.5, bty="n", col = c("black", "red", "blue"), lty= "solid", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(sub$datetime, as.numeric(sub$Global_reactive_power), xlab="datetime", ylab="Global_reactive_power", type="l")

# Save to png
dev.copy(png, "plot4.png", width=480, height=480)
dev.off()