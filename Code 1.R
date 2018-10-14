#loading the dataset 
setwd("C:/Users/ahilal/Desktop/Explanatory data analytics/Week 1 project/exdata%2Fdata%2Fhousehold_power_consumption")
dataset <- read.table("household_power_consumption.txt",sep = ";",header = TRUE,stringsAsFactors = FALSE)
#converting to numeric 
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
#converting to the proper date format and subsetting for the 2 dates
dataset$Date <- strptime(paste(dataset$Date), format="%d/%m/%Y")
dataset2 <- subset(dataset, Date == "2007-02-01" | Date == "2007-02-02")

#drawing the histogram
with(dataset2,hist(Global_active_power,main="Global Active Power",xlab = "Global Active Power (kilowatts)",col="red"))
dataset2

#copying to a PNG file
dev.copy(png,file="Plot1.png")
dev.off()     

#Alternative coe
library("data.table")

setwd("~/Desktop/datasciencecoursera/4_Exploratory_Data_Analysis/project/data")

#Reads in data from file then subsets data for specified dates
powerDT <- data.table::fread(input = "household_power_consumption.txt"
                             , na.strings="?"
)

# Prevents histogram from printing in scientific notation
powerDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]

# Change Date Column to Date Type
powerDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
powerDT <- powerDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

png("plot1.png", width=480, height=480)

## Plot 1
hist(powerDT[, Global_active_power], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()