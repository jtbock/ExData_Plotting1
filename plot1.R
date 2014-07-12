# Exploratory Data Analysis July-August 2014 Project 1
#
# This code reproduces plot 1. The fonts are monospaced; setting font family and 
# type had no effect.  I assume this is some discrepancy because I am using Linux.
 
# Set the dates of interest
startDate<-as.Date("2007-02-01")
stopDate<-as.Date("2007-02-02")

# Read in the file
original<-read.csv(file="household_power_consumption.txt",header=TRUE,sep=";",na.strings="?",stringsAsFactors=FALSE)

# Add a new column which contains a Date object
original$Date2<-as.Date(original$Date,"%d/%m/%Y")
# Subset so that only the required date period is in the data set
subOrig<-subset(original,Date2>=startDate&Date2<=stopDate)

# Set the graphics device
png(file="plot1.png")

#Make the plot
hist(subOrig$Global_active_power,xlab="Global Active Power (kilowatts)",col="red",main="Global Active Power",font.main=2,bty="n")

#Reset the graphics device
dev.off()
