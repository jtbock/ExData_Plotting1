# Exploratory Data Analysis July-August 2014 Project 1
#
# This code reproduces plot 4. The fonts are monospaced; setting font family and 
# type had no effect.  The spacing for the legend in the third plot shows up ok 
# on the screen, but encroaches a bit on the graph in the png file. 
# I assume these discrepancies are because I am using Linux.

# Set the dates of interest
startDate<-as.Date("2007-02-01")
stopDate<-as.Date("2007-02-02")

# Read in the file
original<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

# Add a column with the converted Date object
original$Date2<-as.Date(original$Date,"%d/%m/%Y")

# Create a dataframe with only the dates of interest
subOrig<-subset(original,Date2>=startDate&Date2<=stopDate)

# Extract character dates/times and paste together
cdatetime<-paste(subOrig$Date,subOrig$Time)

# Create a vector of datetime objects
# This is to simplify time-series plotting
DateTime<-strptime(cdatetime,"%d/%m/%Y %H:%M:%S")

# Remove the unused Dat and Time columns.  Not necessary, just did it as an exercise
subOrig<-subset(subOrig,select=-c(Date,Time))
# Add in the column with the newly created DateTime objects
subDate<-cbind(DateTime,subOrig)

legend.txt<-c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
legend.ltys<-c(1,1)
legend.colors<-c("black","red","blue")
# Set the graphics device
png(file="plot4.png")

# Set the number of combine plots
# Using mfrow for row-major order
par(mfrow=c(2,2))
# Make plot 1
plot(subDate$DateTime,subDate$Global_active_power,xlab="",ylab="Global Active Power",type="l")

# Make plot 2
plot(subDate$DateTime,subDate$Voltage,xlab="datetime",ylab="Voltage",type="l")

# Make plot 3
plot(subDate$DateTime,subDate$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(subDate$DateTime,subDate$Sub_metering_2,col="red")
lines(subDate$DateTime,subDate$Sub_metering_3,col="blue")
legend("topright",legend=legend.txt,lty=legend.ltys,col=legend.colors,bty="n")

# Make plot 4
plot(subDate$DateTime,subDate$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")

# Reset the graphics device
dev.off()
