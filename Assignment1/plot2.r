# Load the full data set
datafull <- read.csv('household_power_consumption.txt',header=T,sep=";",
                     na.strings="?",quote="\"'",
                     colClasses=c("character","character",rep("numeric",7)))

# Subset the data based on Date
small <- subset(datafull,subset=(datafull$Date=="1/2/2007"|datafull$Date=="2/2/2007"))

# Convert Date/Time Format
small$datetime <- strptime(paste(small$Date,small$Time),format="%d/%m/%Y %H:%M:%S")

# Plot 2
with(small,plot(datetime,Global_active_power,
                ylab="Global Active Power(kilowatts)",xlab="",
                type="l"))

# Save as PNG file
dev.copy(png,filename="plot2.png",width=480,height=480,units="px",bg="transparent")
dev.off()