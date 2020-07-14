## Plot 2: base plot function

## set up the working directory after download files into ExploData folder in Desktop
setwd("~/Desktop/ExploData") 
data<-read.csv("household_power_consumption.txt", header = T, sep=";")

## Create subset within the date range
mydt<- subset(data, data$Date %in% c("1/2/2007","2/2/2007"))
## set/format date and time for subdataset
mydt$day <-as.Date(mydt$Date, format="%d/%m/%Y")
mydt$time <- strptime(mydt$Time, format = "%H:%M:%S")
datetime <-paste(as.Date(mydt$day), mydt$Time)
mydt$DT <- as.POSIXct(datetime)

##plot data
png(filename = "plot2.png", width=480, height=480)
with(mydt, {
 plot(DT, as.numeric(as.character(Global_active_power)), type="l",
     ylab="Global Active Power (kilowatts)", xlab="", main = "Global Active Power verus Day/Time")
})

dev.off()
