## Plot 1: base plot function

## set up the working directory after download files into ExploData folder in Desktop
setwd("~/Desktop/ExploData") 
data<-read.csv("household_power_consumption.txt", header = T, sep=";")

## Create subset within the date range
mydt<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))

png(filename ="~/Desktop/ExploData/plot1.png", width=480, height=480)
## Plot the basic plot using hist
hist(as.numeric(as.character(mydt$Global_active_power)), 
     xlab = "Global Active Power (Kilowatts)", ylab = "Frequency",
     main ="Global Active Power" , col = "Red")

dev.off()

