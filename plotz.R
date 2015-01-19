# First download and unzip https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# Read table data from local setwd
epc <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings='?')

#Subset and filter correct date range
subsetted <- subset(epc, (Date=='1/2/2007' | Date=='2/2/2007'))

#Convert Dates to classes 
datetime <- as.POSIXct(strptime(paste(subsetted$Date, subsetted$Time), '%d/%m/%Y %H:%M:%S'))

#epc$DateTime <- paste(epc$Date, epc$Time) 
#epc$DateTime <- as.Date(epc$DateTime, format = "%d/%m/%Y")

#subsetted <- filter(epc, DateTime >= as.Date("2007-02-01"), DateTime <= as.Date("2007-02-02"))
#subsetted$datetime <- as.POSIXct(paste(epc, subsetted$Time))

# Open png device and change plot number based on the new plots below.
png(filename='plot4.png')

# the visualizations in order 1-4

# plot1.png
# hist(as.numeric(subsetted$Global_active_power), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

# plot2.png epc$Global_active_power, 
# plot(datetime, subsetted$Global_active_power, ylab='Global Active Power (kilowatts)', xlab='', type='l')

# plot3.png
# plot(datetime, subsetted$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
# lines(datetime, subsetted$Sub_metering_2, col='red')
# lines(datetime, subsetted$Sub_metering_3, col='blue')
# legend('topright', legend= c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=c(1,1,1))

# plot4.png
par(mfrow=c(2,2))
plot(datetime, subsetted$Global_active_power, type='l', xlab='', ylab='Global Active Power')
plot(datetime, subsetted$Voltage, type='l', xlab='datetime', ylab='Voltage')
plot(datetime, subsetted$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering')
lines(datetime, subsetted$Sub_metering_2, col='red')
lines(datetime, subsetted$Sub_metering_3, col='blue')
legend('topright', legend= c('Sub_metering_1', 'Sub_metering_2','Sub_metering_3'), col=c('black','red','blue'), lty=c(1,1,1), bty='n')
plot(datetime, subsetted$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')

# Shutdown device
dev.off()       

