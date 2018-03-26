
## Set working directory with Dataset (household_power_consumption.txt)
## Read dataset
Dataset <- read.table("household_power_consumption.txt", stringsAsFactors = FALSE, header = TRUE, 
                      sep =";")

## Subset from 2007-02-01 to 2007-02-02
Data <- subset(Dataset, Dataset$Date=="1/2/2007" | Dataset$Date =="2/2/2007")

## Plot and save
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(Data$Global_active_power)), col="red", main="Global Active Power", 
     xlab="Global Active Power(kilowatts)")
dev.off()
