##Plot 2
 require('sqldf')
 mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
epc <- read.csv.sql("./data/household_power_consumption.txt",sql=mySql, sep=";")
datetime<-paste(epc$Date,epc$Time)
datetime<-strptime(datetime,format="%d/%m/%Y %H:%M:%S")
epc<-data.frame(epc,datetime)
 plot(Global_active_power~datetime,epc, type="l", xlab="", ylab="Global Active Power (kilowatts)",cex.lab=.80)
 dev.copy(png,file="plot2.png")
 dev.off()