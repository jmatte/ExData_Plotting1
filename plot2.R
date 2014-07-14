# Plot 2

Assignment_1 <- read.table(pipe('findstr /B /R ^[1-2]/2/2007 household_power_consumption.txt'),header=F, sep=';')
colnames(Assignment_1) <-names(read.table('household_power_consumption.txt', header=TRUE,sep=";",nrows=1))
Assignment_1$"DateTime" <- strptime(paste(Assignment_1$Date, Assignment_1$Time), "%d/%m/%Y %H:%M:%S")
col_idx <- grep("DateTime", names(Assignment_1))
Assignment_1 <- Assignment_1[, c(col_idx, (1:ncol(Assignment_1))[-col_idx])]
Assignment_1$Date <- NULL
Assignment_1$Time <- NULL
png(file = "plot2.png", height=480, width=480, bg = "transparent")
with(Assignment_1, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()