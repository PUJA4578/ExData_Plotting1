# plot2.R

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   na.strings="?", colClasses=c("character", "character", rep("numeric", 7)))

data$DateTime <- strptime(paste(data$Date, data$Time), "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

subset_data <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

png("plot2.png", width=480, height=480)
plot(subset_data$DateTime, subset_data$Global_active_power, type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
