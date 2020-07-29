library(dplyr)

plot4 <- function(){
    df <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
    
    df1 <- subset(df, Date== "1/2/2007" | Date=="2/2/2007")
    df1 <- mutate(df1, FullTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
    
    png(file="plot4.png", width=480, height=480)
    
    df1[,3:9] <- lapply(df1[,3:9], as.numeric)
    
    par(mfrow=c(2,2))
    with(df1, plot(FullTime, Global_active_power, ylab="Global Active Power", xlab="", type="l"))
    
    with(df1, plot(FullTime, Voltage, xlab = "Voltage", ylab="datetime", type="l"))
    
    with(df1, plot(FullTime, Sub_metering_2, type="l", col="red", ylab = "Energy sub metering", xlab="", ylim=c(0,40)))
    axis(2, seq(0,30,by=10))
    points(df1$FullTime, df1$Sub_metering_1, type="l")
    points(df1$FullTime, df1$Sub_metering_3, type="l", col="blue")
    legend("topright",lty=1, col=c("black", "red", "blue") ,legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    
    with(df1, plot(FullTime, Global_reactive_power, xlab = "datetime", type="l"))
    dev.off()
}