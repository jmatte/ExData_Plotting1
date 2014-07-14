# Plot 4

Assignment_1 <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
colnames(Assignment_1) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
Assignment_1$"DateTime" <- strptime(paste(Assignment_1$Date, Assignment_1$Time), "%d/%m/%Y %H:%M:%S")
col_idx <- grep("DateTime", names(Assignment_1))
Assignment_1 <- Assignment_1[, c(col_idx, (1:ncol(Assignment_1))[-col_idx])]
Assignment_1$Date <- NULL
Assignment_1$Time <- NULL
png(file = "plot4.png", height=480, width=480, bg = "transparent")
par(mfrow=c(2, 2))
with(Assignment_1, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))
with(Assignment_1, plot(DateTime, Voltage, type="l", xlab="datetime", ylab="Voltage"))
with(Assignment_1, {
  plot(DateTime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
  lines(DateTime, Sub_metering_2, type="l", col="red")
  lines(DateTime, Sub_metering_3, type="l", col="blue")
  legend("topright", lwd = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")})
with(Assignment_1, {plot(DateTime, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")})
dev.off()
