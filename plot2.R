library(lubridate)
dt<-read.table(file="household_power_consumption.txt", sep=";", header=TRUE,  na.strings = "?")

#setting Date as a Date class
dt$Date<-dmy(dt$Date)
#subsetting to 2007-02-1 --> 2007-02-02
dt<-dt[dt$Date>= "2007-02-01" & dt$Date<= "2007-02-02", ]
#setting time as Time class
dt$Time<-as.POSIXct(paste(dt$Date, dt$Time), format="%Y-%m-%d %H:%M:%S")


#set PNG device and plot thursday to Friday Global Active Power
png(filename = "plot2.png", width = 480, height = 480)
with(dt, plot(Time, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab=""))
with(dt, lines(Time, Global_active_power))
dev.off() 
dev.set(which=2)
