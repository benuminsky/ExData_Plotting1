 require('sqldf')
 mySql <- "SELECT * from file WHERE Date = '1/2/2007' OR Date = '2/2/2007'"
epc <- read.csv.sql("./data/household_power_consumption.txt",sql=mySql, sep=";")
hist(epc$Global_active_power, main="Global Activer Power",col="red",xlab="Global Active Power (kilowatts)")
 dev.copy(png,file="plot1.png")
 dev.off()