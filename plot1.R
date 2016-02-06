  f <- "household_power_consumption.txt"

  power <- read.table(f, header=T, sep=";")
  power$Date <- as.Date(power$Date, format="%d/%m/%Y")

  data <- power[(power$Date=="2007-02-01") | (power$Date=="2007-02-02"),]

  data$Global_active_power <- as.numeric(as.character(data$Global_active_power))

  png(filename = "plot1.png",width = 480, height = 480, units = "px",bg = "white")

  hist(data$Global_active_power,main="Global Active Power",
       xlab="Global Active Power (Killowats)",col="red")
  dev.off()

