
setwd("C:/Users/mmasika/Dropbox/Coursera/Data_Science/Exploratory Data Analysis/Quizes")

econsumption <- read.csv("household_power_consumption.txt",sep=";",header=TRUE, stringsAsFactors=FALSE,dec=".")

# Formating the variables
econsumption$Date <- as.Date(econsumption$Date,"%d/%m/%Y")
econsumption$Time <- strptime(paste(econsumption$Date,econsumption$Time), "%Y-%m-%d %H:%M:%S")
econsumption$Global_active_power <- as.numeric(econsumption$Global_active_power)
econsumption$Global_reactive_power <- as.numeric(econsumption$Global_reactive_power)
econsumption$Sub_metering_1 <- as.numeric(econsumption$Sub_metering_1)
econsumption$Sub_metering_2 <- as.numeric(econsumption$Sub_metering_2)
econsumption$Sub_metering_3 <- as.numeric(econsumption$Sub_metering_3)
econsumption$Voltage <- as.numeric(econsumption$Voltage)

# Subseting
subdata <- subset(econsumption, Date=="2007-02-01" | Date=="2007-02-02")


# Plot 1


png(file="plot1.png",width=480,height=480) # width and height doesn't have to be specified as it is default
with(subdata,hist(Global_active_power,
                  main="Global Active Power",
                  xlab="Global Active Power (kilowatts)", 
                  col="red"))
dev.off()















