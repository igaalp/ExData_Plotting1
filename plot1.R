library(lubridate)
dt<-read.table(file.choose(), sep=";", header=TRUE,  na.strings = "?")

#setting Date as a Date class
dt$Date<-dmy(dt$Date)
#subsetting to 2007-02-1 --> 2007-02-02
dt<-dt[dt$Date>= "2007-02-01" & dt$Date<= "2007-02-02", ]
#setting time as Time class
dt$Time<-hms(dt$Time)

#set PNG device and plot histogram of global Active Power
png(filename = "plot1.png", width = 480, height = 480)
with(dt, hist(Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency"))
dev.off() 
dev.set(which=2)


