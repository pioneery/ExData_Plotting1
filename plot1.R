data <- read.table("household_power_consumption.txt", header = TRUE, sep=";" )
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data1 <- subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
data1$Global_active_power <- as.numeric(as.character(data1$Global_active_power))
hist(data1$Global_active_power, col ="red",main= "Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.copy(png,filename="plot1.png")
dev.off ()
