#loading the dataset 
setwd("C:/Users/ahilal/Desktop/Explanatory data analytics/Week 1 project/exdata%2Fdata%2Fhousehold_power_consumption")
dataset <- read.csv("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)

#converting to numeric 
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))

#converting to the proper date format and subsetting for the 2 dates
dataset$Date <- strptime(paste(dataset$Date), format="%d/%m/%Y")
dataset2 <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

#adding a new column datetime
dataset2$Date <- as.Date(dataset2$Date, format="%d/%m/%Y")
dataset2$datetime <- paste(as.Date(dataset2$Date), dataset2$Time)
dataset2$datetime <- as.POSIXct(datetime)

#drawing the plot
with(dataset2, {
  plot(Global_active_power~datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})

#copying to a PNG file
dev.copy(png,file="Plot2.png")
dev.off()     

#######
Above code is working
########

library(lubridate)
dataset$datetime <- paste(dataset$Date,dataset$Time,)

dataset$datetime <- as.POSIXct(datetime)

#

with(dataset2,plot(datetime,Global_active_power))

#Could be used for times also!

library(lubridate)
dataset$datetime <- paste(dataset$Date,dataset$Time)
dmy_hms(datetime)


dataset$Date <- strptime(paste(dataset$Date), format="%d/%m/%Y")

dataset$DateTime <- strptime(paste(dataset$Date,dataset$Time), format="%d/%m/%Y %H:%M:%S")
install.packages("lubridate")


dataset2 <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

str(dataset2)

with(dataset2,hist(Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red"))
dataset2

dev.copy(png,file="Plot1.png")
dev.off()     