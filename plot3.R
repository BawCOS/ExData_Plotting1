# Again using code from plot2.R to read in data, subset, and add date/time stamp
household_power_consumption <- read.csv("./household_power_consumption.txt", sep=";",nrows=100000,na.strings="?")
# Now subset
data<-subset(household_power_consumption,Date=="1/2/2007"|Date=="2/2/2007")
#Now combine Date and Time into one time variable
DateTime<-paste(data$Date,data$Time)
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")
#Now add back to dataframe
data<-cbind(data,DateTime)
#Now plot
with(data,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data,points(DateTime,Sub_metering_2,type="l",col="red"))
with(data,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=names(data)[7:9],col=c("black","red","blue"),lty=1)
# Print to png file
png("plot3.png")
with(data,plot(DateTime,Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
with(data,points(DateTime,Sub_metering_2,type="l",col="red"))
with(data,points(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",legend=names(data)[7:9],col=c("black","red","blue"),lty=1)
dev.off()
