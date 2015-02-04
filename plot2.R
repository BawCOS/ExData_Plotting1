# I know from plot1.R to only read in the first 100000 rows
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",nrows=100000,na.strings="?")
# Now subset
data<-subset(household_power_consumption,Date=="1/2/2007"|Date=="2/2/2007")
# Check the class of each
lapply(data,class)
# Check that I have the right data
table(as.Date(data$Date,"%d/%m/%Y"))
#Now combine Date and Time into one time variable
DateTime<-paste(data$Date,data$Time)
DateTime<-strptime(DateTime,"%d/%m/%Y %H:%M:%S")
#Check the first 10 values
DateTime[1:10]
#Now add back to dataframe
data<-cbind(data,DateTime)
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
# Print to png file
png("plot2.png")
with(data,plot(DateTime,Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab=""))
dev.off()
