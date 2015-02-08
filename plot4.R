data <- read.table("household_power_consumption.txt", header = TRUE, sep=";" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
plot(data$Time, data1$Global_active_power,
         type="l",
         xlab="",
         ylab="Global Active Power")
plot(data1$Time, data1$Voltage, type="l",
         xlab="datetime", ylab="Voltage")
plot(data1$Time, data1$Sub_metering_1, type="l", col="black",
         xlab="", ylab="Energy sub metering")
lines(data1$Time, data1$Sub_metering_2, col="red")
lines(data1$Time, data1$Sub_metering_3, col="blue")
legend("topright",
           col=c("black", "red", "blue"),
           c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
           lty=1,
           box.lwd=0)
plot(data1$Time, data1$Global_reactive_power, type="n",
         xlab="datetime", ylab="Global_reactive_power")
lines(data1$Time, data1$Global_reactive_power)


dev.copy(png,filename="plot4.png",width = 480, height = 480, units = "px")
dev.off ()
