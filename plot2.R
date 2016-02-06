
f <- "household_power_consumption.txt"

power <- read.table(f, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")


png(filename = "plot2.png",width = 480, height = 480, units = "px", bg = "white")

plot(data$timestamp,data$Global_active_power,type="l",
     xlab="",ylab="Global Active Power (kilowatts)")

dev.off()
