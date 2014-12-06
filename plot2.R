# -----------------------------------------------------------------------------
#
# plot2.R: Reads in data from the Electric Power Consumption dataset 
#          and plots Global Active Power by day (from February 1-2, 2007)
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


# Plot Global Active Power by day from February 1-2, 2007
png("plot2.png")
plot(sub$newdate, sub$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
dev.off()



