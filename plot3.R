# ---------------------------------------------------------------------------------------------
#
# plot3.R: Reads in data from the Electric Power Consumption dataset 
#          and plots Energy Sub Metering by day (from February 1-2, 2007)
#
# ---------------------------------------------------------------------------------------------


df <- read.table("household_power_consumption.txt",
                 header = TRUE,
                 sep = ";",
                 na.strings = "?",
                 colClasses = c(rep("character",2),rep("numeric",7)))


# Create a new datetime field and subset dataframe to include records between
# February 1-2, 2007
df$newdate <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
sub <- subset(df, as.Date(df$newdate) %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')))


# Plot Energy Sub Metering by day for these 2 days
png("plot3.png")
plot(sub$newdate, sub$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(sub$newdate, sub$Sub_metering_2, col="red")
lines(sub$newdate, sub$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red","blue"))
dev.off()


