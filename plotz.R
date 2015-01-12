# library(dplyr)
# Unable to get the dates to filter correctly :#
# First download and unzip https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Read table data
epc <- read.table('household_power_consumption.txt', header=TRUE,
                  sep=';', na.strings='?')

#Convert Dates to classes 
epc$DateTime <- paste(epc$Date, epc$Time) 
epc$DateTime <- as.Date(epc$DateTime, format = "%d/%m/%Y")

#Subset and filter correct date range
subsetted <- filter(epc, DateTime >= as.Date("2007-02-01"), DateTime <= as.Date("2007-02-02"))

# Open png device and change plot name for new plots below
png(filename='plot1.png')

# plot1.png
 hist(epc$Global_active_power, main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')
# plot2.png
# plot(epc$DateTime, epc$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')
# plot3.png
# plot4.png

# Shutdown device
dev.off()       

