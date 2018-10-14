#loading the dataset
setwd("C:/Users/ahilal/Desktop/Explanatory data analytics/Week 1 project/exdata%2Fdata%2Fhousehold_power_consumption")
dataset <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

#converting to the proper date format and subsetting for the 2 dates
dataset$Date <- strptime(paste(dataset$Date), format="%d/%m/%Y")
dataset2 <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

#converting to numeric 
dataset2$Global_active_power <- as.numeric(as.character(dataset2$Global_active_power))
dataset2$Sub_metering_1 <- as.numeric(as.character(dataset2$Sub_metering_1))
dataset2$Sub_metering_2 <- as.numeric(as.character(dataset2$Sub_metering_2))
dataset2$Sub_metering_3 <- as.numeric(as.character(dataset2$Sub_metering_3))

#adding a new column datetime
dataset2$Date <- as.Date(dataset2$Date, format="%d/%m/%Y")
dataset2$datetime <- paste(as.Date(dataset2$Date), dataset2$Time)
dataset2$datetime <- as.POSIXct(dataset2$datetime)

#drawing the plot
with(dataset2, {
  plot(Sub_metering_1 ~ datetime, type="l", ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~datetime,col='Red')
  lines(Sub_metering_3~datetime,col='Blue')  
  
  })
legend("topright", col=c("black", "red", "blue"), lwd=1, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),cex = 0.7)

#copying to a PNG file
dev.copy(png,file="Plot3.png")
dev.off()
