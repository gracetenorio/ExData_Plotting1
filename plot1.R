# -----------------------------------------------------------------------------------------------
#
# plot1.R: Reads in data from the Electric Power Consumption dataset 
#          and plots the distribution of Global Active Power from
#          February 1-2, 2007.
#
# -----------------------------------------------------------------------------------------------


df <- read.table("household_power_consumption.txt",
                  header = TRUE,
                  sep = ";",
                  na.strings = "?",
                  colClasses = c(rep("character",2),rep("numeric",7)))


# Create a new datetime field and subset dataframe to include records from
# February 1-2, 2007
df$newdate <- strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")
sub <- subset(df, as.Date(df$newdate) %in% c(as.Date('2007-02-01'),as.Date('2007-02-02')))


# Plot the distribution of Global Active Power for these 2 days
png("plot1.png")
hist(sub$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)",
     col="red")
dev.off()



