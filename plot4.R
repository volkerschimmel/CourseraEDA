data<-read.table("household_power_consumption.txt", header=T, sep=";")
datetime<-as.character(data$Date)
datetime<-strptime(datetime, format=("%d/%m/%Y"))
datetime<-as.Date(datetime, format=("%Y/%m/%d"))
data$Date=datetime
get.rows<-data$Date >= as.Date("2007/02/01", format="%Y/%m/%d") & data$Date <= as.Date("2007/02/02", format="%Y/%m/%d")
data<-data[get.rows, ]

png(filename="plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
##GlobalActivePower
date<-as.character(data$Date)
time<-as.character(data$Time)
datetime=paste(date,time,sep=" ")
datetime<-strptime(datetime, format=("%Y-%m-%d %H:%M:%S"))
data$Time=datetime
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
plot(data$Time,data$Global_active_power,type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")


##Voltage
data$Voltage<-as.numeric(as.character(data$Voltage))
plot(data$Time,data$Voltage,type="l", main="", xlab="datetime", ylab="Voltage")

##Global_Reactive_Power
data$Global_reactive_power<-as.numeric(as.character(data$Global_reactive_power))
plot(data$Time,data$Global_reactive_power,type="l", main="", xlab="datetime", ylab="Global_reactive_power")

##Sub_Meter
data$Sub_metering_1<-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2<-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3<-as.numeric(as.character(data$Sub_metering_3))
par(mfcol=c(2,2),new=TRUE)
plot(data$Time,data$Sub_metering_1,type="l", main="", xlab="", ylab="Energy sub metering",ylim=c(0,40))
par(mfcol=c(2,2),new=TRUE)
plot(data$Time,data$Sub_metering_2,type="l", main="", xlab="", ylab="",ylim=c(0,40),col="red")
par(mfcol=c(2,2),new=TRUE)
plot(data$Time,data$Sub_metering_3,type="l", main="", xlab="", ylab="",ylim=c(0,40),col="blue")
par(mfcol=c(2,2),new=TRUE)
labels<-c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
legend("topright",labels,box.lwd=0,lwd=2,col=c("black","red","blue"))
dev.off()

