## Plot 4: base plot function

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

## multiPlot data
png(filename = "plot4.png", width=480, height=480)
par(mfrow=c(2,2), mar=c(4,4,1,1), oma=c(0,0,1,0))
with(mydt, {
  plot(DT, as.numeric(as.character(Global_active_power)), type = "l",
       xlab="Date/time", ylab = "Global Active Power (Kilowatts)")
  plot (DT, as.numeric(as.character(Voltage)), type = "l",
        xlab = "Date/time", ylab = "Voltage (volt)")
  
  plot(DT, as.numeric(as.character(Sub_metering_1)), type="l",
       xlab ="Date/time", ylab="Global Active Power (kilowatts)")
  lines(DT, as.numeric(as.character(Sub_metering_2)), type="l",col="red")
  lines(DT, as.numeric(as.character(Sub_metering_3)), type="l",col="blue")
 
legend ("topright", col = c("black", "red","blue"), 
        legend= c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = 1, lwd = 2)
plot (DT, as.numeric(as.character(Global_reactive_power)), type = "l",
      xlab = "Date/time", ylab = "Global Reactive Power (Kilowatts)")
mtext ("Global Power vs Date-time", outer = TRUE)
})

dev.off()

