# Load the full data set
datafull <- read.csv('household_power_consumption.txt',header=T,sep=";",
                     na.strings="?",quote="\"'",
                     colClasses=c("character","character",rep("numeric",7)))

# Subset the data based on Date
small <- subset(datafull,subset=(datafull$Date=="1/2/2007"|datafull$Date=="2/2/2007"))

# Convert Date/Time Format
small$datetime <- strptime(paste(small$Date,small$Time),format="%d/%m/%Y %H:%M:%S")

# Generate Base Graph
with(small,plot(datetime,Sub_metering_1,type="l",
                xlab="",
                ylab="Energy sub metering"))
#Add line
with(small,lines(datetime,Sub_metering_2,type="l",col="red"))
with(small,lines(datetime,Sub_metering_3,type="l",col="blue"))
legend("topright",
       text.font=16,
       cex=0.6,
       lty=1,
       lwd=1,
       col=c("black","red","blue"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# Save as PNG file
dev.copy(png,filename="plot3.png",width=480,height=480,units="px",bg="transparent")
dev.off()
