plot1 <- function(){
    df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)
    start <- strptime("20070201", "%Y%m%d", tz="UTC")
    end <- strptime("20070202", "%Y%m%d", tz="UTC")
    df$Date <- strptime(df$Date, "%d/%m/%Y", tz="UTC")
    df1 <- subset(df, Date== start | Date==end)
    
    png(file="plot1.png", width=480, height=480)
    df1$Global_active_power <- as.numeric(df1$Global_active_power, na.rm = TRUE)
    hist(df1$Global_active_power, col="red", main = "Global Active Power", 
         xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
    dev.off()

}