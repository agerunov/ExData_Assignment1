# Read data and set variables
elcon <- read.table("household_power_consumption.txt", sep=";", header=TRUE, na.string="?")
sub <- elcon[elcon$Date=="1/2/2007" | elcon$Date=="2/2/2007", ]

# Create plot
hist(as.numeric(sub$Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

# Save to png
dev.copy(png, "plot1.png", width=480, height=480)
dev.off()