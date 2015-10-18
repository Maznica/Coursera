
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

# Plot 4

png(file="plot4.png",width=480,height=480) # width and height doesn't have to be specified as it is default
par(mfrow=c(2,2))
with(subdata,{
        # 1. Figure
        plot(Time,Global_active_power,
             ylab="Global Active Power",
             xlab="",
             type="l")
        # 2. Figure
        plot(Time,Voltage,
             ylab="Voltage",
             xlab="datetime",
             type="l")
        # 3. Figure
        plot(Time,Sub_metering_1,col="black",type="l",xlab="",ylab="Energy sub metering")
        lines(Time,Sub_metering_2,col="red")
        lines(Time,Sub_metering_3,col="blue")
        legend("topright",lty=c(1,1),bty="n",
               col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        # 4. Figure
        plot(Time,Global_reactive_power,
             xlab="datetime",
             type="l")
        axis(2,at=c(0,0.1,0.2,0.3,0.4,0.5))
        
})
dev.off()















