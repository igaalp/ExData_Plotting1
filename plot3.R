library(lubridate)
dt<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE,  na.strings = "?")

#setting Date as a Date class
dt$Date<-dmy(dt$Date)
#subsetting to 2007-02-1 --> 2007-02-02
dt<-dt[dt$Date>= "2007-02-01" & dt$Date<= "2007-02-02", ]
#setting time as Time class
dt$Time<-as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")


#set PNG device and plot thursday to Saturday Energy sub metering
png(filename = "plot3.png", width = 480, height = 480)
with(dt, {
    plot(Time, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(Time, Sub_metering_1, col="black")
    lines(Time, Sub_metering_2, col="red")
    lines(Time, Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})


dev.off() 
dev.set(which=2)