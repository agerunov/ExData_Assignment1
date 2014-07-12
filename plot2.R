# Read data and set variables
elcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
sub <- elcon[elcon$Date=="1/2/2007" | elcon$Date=="2/2/2007", ]
sub$datetime <- strptime(paste(sub$Date, sub$Time), format="%d/%m/%Y %H:%M:%S")

# Create plot
plot(sub$datetime, as.numeric(sub$Global_active_power), ylab="Global Active Power (kilowatts)", type="l", xlab="")

# Save to png
dev.copy(png, "plot2.png", width=480, height=480)
dev.off()