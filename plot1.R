# I will experiment to find the number of rows that I need 
# First I will only read in 100000 rows
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",nrows=100000,na.strings="?")
# Now table the results
table(as.Date(as.character(household_power_consumption$Date),"%d/%m/%Y"))
# This looks like it got those dates
# Now subset
data<-subset(household_power_consumption,Date=="1/2/2007"|Date=="2/2/2007")
# Now the histogram
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#Now to png file
png("plot1.png")
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
