##Plot 3
require('sqldf')
mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
epc <- read.csv.sql("./data/household_power_consumption.txt",sql=mySql, sep=";")
datetime<-paste(epc$Date,epc$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
epc<-data.frame(epc,datetime)
plot(Sub_metering_1~datetime,epc, type="l", xlab="", ylab="Energy sub metering", cex.lab=.70, cex.axis=.80)
lines(Sub_metering_2~datetime,epc, type="l", col="red")
lines(Sub_metering_3~datetime,epc, type="l", col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1), col=c("black","red","blue"),cex=.75)
dev.copy(png,file="plot3.png")
dev.off()