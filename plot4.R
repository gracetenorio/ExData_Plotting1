# -----------------------------------------------------------------------------
#
# plot4.R: Reads in data from the Electric Power Consumption dataset.
#          Creates 4 plots for exploratory analysis using data from  
#          February 1-2, 2007.
#
# -----------------------------------------------------------------------------


df <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?",
                 colClasses = c(rep("character",2),rep("numeric",7)))


# Create a new datetime field and subset dataframe to include records between
# February 1-2, 2007
df$newdate <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
sub <- subset(df, as.Date(df$newdate) %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')))


# Create 4 plots for exploration
png("plot4.png")
par(mfrow=c(2,2))

# plot 1
plot(sub$newdate, sub$Global_active_power, 
     type="l", xlab="", ylab="Global Active Power")

# plot 2
plot(sub$newdate, sub$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")

# plot 3
plot(sub$newdate, sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub$newdate, sub$Sub_metering_2, col="red")
lines(sub$newdate, sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"),bty="n")

# plot 4
plot(sub$newdate, sub$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_power")

dev.off()



