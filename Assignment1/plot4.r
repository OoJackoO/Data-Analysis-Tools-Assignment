# Load the full data set
datafull <- read.csv('household_power_consumption.txt',header=T,sep=";",
                     na.strings="?",quote="\"'",
                     colClasses=c("character","character",rep("numeric",7)))

# Subset the data based on Date
small <- subset(datafull,subset=(datafull$Date=="1/2/2007"|datafull$Date=="2/2/2007"))

# Convert Date/Time Format
small$datetime <- strptime(paste(small$Date,small$Time),format="%d/%m/%Y %H:%M:%S")

# Change Global Setting
par(mfrow=c(2,2))
# Plot 1
with(small,plot(datetime,Global_active_power,type="l",
                ylab="Global Active Power",
                xlab=""))
# Plot 2
with(small,plot(datetime,Voltage,type="l",
                xlab="datetime",
                ylab="Voltage"))
# Plot 3
with(small,plot(datetime,Sub_metering_1,type="l",
                ylab="Energy sub metering",
                xlab=""))
with(small,lines(datetime,Sub_metering_2,type="l",col="red"))
with(small,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plot 4
with(small,plot(datetime,Global_reactive_power,type="l"))

# Save as PNG file
dev.copy(png,filename="plot4.png",width=480,height=480,units="px")
dev.off()