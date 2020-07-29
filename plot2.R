library(dplyr)

plot2 <- function(){
  df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

  df1 <- subset(df, Date== "1/2/2007" | Date=="2/2/2007")
  df1 <- mutate(df1, FullTime = strptime(paste(Date, Time), "%d/%m/%Y %H:%M:%S"))

  png(file="plot2.png", width=480, height=480)
  
  df1$Global_active_power <- as.numeric(df1$Global_active_power, na.rm=TRUE)
  plot(df1$FullTime, df1$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab = "Date")
  
  dev.off()
}