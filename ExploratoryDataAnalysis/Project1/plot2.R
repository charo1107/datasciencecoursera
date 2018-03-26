
## Set working directory with Dataset (household_power_consumption.txt)
## Read dataset
Dataset <- read.table("household_power_consumption.txt", skip=1, sep=";")
names(Dataset) <- c("Date","Time","Global_active_power", "Global_reactive_power", "Voltage", 
                    "Global_intensity","Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

## Subset from 2007-02-01 to 2007-02-02
Data <- subset(Dataset, Dataset$Date=="1/2/2007" | Dataset$Date =="2/2/2007")

## Date and Time variables from characters into objects of type Date and POSIXlt 
Data$Date <- as.Date(Data$Date, format="%d/%m/%Y")
Data$Time <- strptime(Data$Time, format="%H:%M:%S")
Data[1:1440,"Time"] <- format(Data[1:1440,"Time"], "2007-02-01 %H:%M:%S")
Data[1441:2880,"Time"] <- format(Data[1441:2880,"Time"], "2007-02-02 %H:%M:%S")

## Plot and save
png("plot2.png", width=480, height=480)
plot(Data$Time,as.numeric(as.character(Data$Global_active_power)),type="l",xlab="",
     ylab="Global Active Power (kilowatts)") 
title(main="Global Active Power Vs Time")
dev.off()
