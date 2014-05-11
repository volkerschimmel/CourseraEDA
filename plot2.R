data<-read.table("household_power_consumption.txt", header=T, sep=";")
datetime<-as.character(data$Date)
datetime<-strptime(datetime, format=("%d/%m/%Y"))
datetime<-as.Date(datetime, format=("%Y/%m/%d"))
data$Date=datetime
get.rows<-data$Date >= as.Date("2007/02/01", format="%Y/%m/%d") & data$Date <= as.Date("2007/02/02", format="%Y/%m/%d")
data<-data[get.rows, ]
date<-as.character(data$Date)
time<-as.character(data$Time)
datetime=paste(date,time,sep=" ")
datetime<-strptime(datetime, format=("%Y-%m-%d %H:%M:%S"))
data$Time=datetime
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
png(filename="plot2.png", width = 480, height = 480)
plot(data$Time,data$Global_active_power,type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()