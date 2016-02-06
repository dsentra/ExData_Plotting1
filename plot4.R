f <- "household_power_consumption.txt"

power <- read.table(f, header=T, sep=";")
power$Date <- as.Date(power$Date, format="%d/%m/%Y")

data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

data$Sub_metering_1 <- as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <- as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <- as.numeric(as.character(data$Sub_metering_3))
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Global_reactive_power <- as.numeric(as.character(data$Global_reactive_power))
data$Voltage <- as.numeric(as.character(data$Voltage))

data <- transform(data, timestamp=as.POSIXct(paste(Date, Time)), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",width = 480, height = 480, units = "px", bg = "white")
par(mfrow=c(2,2))



#plot 1
plot(data$timestamp,data$Global_active_power,type="l",
     xlab="",ylab="Global Active Power")

#plot 2
plot(data$timestamp,data$Voltage,type="l",
     xlab="datetime",ylab="Voltage")

#plot 3
plot(x=data$timestamp,y=data$Sub_metering_1,type="l",
     xlab="",ylab="Energy Sub Meetering")
lines(x=data$timestamp,y=data$Sub_metering_2, type="l",col="red")
lines(x=data$timestamp,y=data$Sub_metering_3, type="l",col="blue")
legend("topright",c("Sub Metering 1","Sub Metering 2", "Sub Metering 3"),lty=c(1,1,1),lwd=c(1,1,1),col=c("black","blue","red"))

#plot 4
plot(data$timestamp,data$Global_reactive_power,type="l",
     xlab="datetime",ylab="Global_reactive_power")

dev.off()
