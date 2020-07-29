library(dplyr)

plot3 <- function(){
    df <- read.table("./household_power_consumption.txt", sep=";", header=TRUE)
    
    df1 <- subset(df, Date== "1/2/2007" | Date=="2/2/2007")
    df1 <- mutate(df1, FullTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))
    
    png(file="plot3.png", width=480, height=480)
    
    df1$Sub_metering_1 <- as.numeric(df1$Sub_metering_1)
    df1$Sub_metering_2 <- as.numeric(df1$Sub_metering_2)
    df1$Sub_metering_3 <- as.numeric(df1$Sub_metering_3)
    
    with(df1, plot(FullTime, Sub_metering_2, type="l", col="red", ylab = "Energy sub metering", xlab="Day", ylim=c(0,40)))
    axis(2, seq(0,30,by=10))
    points(df1$FullTime, df1$Sub_metering_1, type="l")
    points(df1$FullTime, df1$Sub_metering_3, type="l", col="blue")
    
    legend("topright",lty=1, col=c("black", "red", "blue") ,legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
    dev.off()
}