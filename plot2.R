dat <- read.table("household_power_consumption.txt",  sep = ";", na.strings = "?", skip = (grep("1/2/2007", readLines("power.txt"))-1), nrow = 2880) 
names(dat) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
dat$Datetime <- paste(dat$Date, dat$Time, sep = " ")
dat$Datetime <- strptime(dat$Datetime, "%d/%m/%Y %H:%M:%S", tz = "GMT")

png(file = "plot2.png", bg = "transparent")
plot(dat$Datetime, dat$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab ="")
dev.off()