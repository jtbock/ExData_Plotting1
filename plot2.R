# Exploratory Data Analysis July-August 2014 Project 1
#
# This code reproduces plot 2. The fonts are monospaced; setting font family and 
# type had no effect.  I assume this is some discrepancy because I am using Linux.

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

# Set the graphics device
png(file="plot2.png")

# Plot the data of interest
plot(subDate$DateTime,subDate$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

# Reset the graphics device
dev.off()
