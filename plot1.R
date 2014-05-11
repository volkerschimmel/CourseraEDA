data<-read.table("household_power_consumption.txt", header=T, sep=";")
datetime<-as.character(data$Date)
datetime<-strptime(datetime, format=("%d/%m/%Y"))
datetime<-as.Date(datetime, format=("%Y/%m/%d"))
data$Date=datetime
get.rows<-data$Date >= as.Date("2007/02/01", format="%Y/%m/%d") & data$Date <= as.Date("2007/02/02", format="%Y/%m/%d")
data<-data[get.rows, ]
data$Global_active_power<-as.numeric(as.character(data$Global_active_power))
png(filename="plot1.png", width = 480, height = 480)
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()