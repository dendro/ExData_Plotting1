workingdir <- dirname(parent.frame(2)$ofile)
setwd(workingdir)
print(workingdir)
#thezip <- tempfile()

#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", thezip)

#data <- read.table(unz(thezip, "household_power_consumption.txt"), header = TRUE, sep=";")
#unlink(thezip)

x <- read.csv("household_power_consumption.csv", sep=";")

x <- x[x$Date == "1/2/2007" | x$Date == "2/2/2007",]

## alternatively I'm using a truncated csv, containing only the relevant values for the dates
## gawk -F";" 'NR==1 {print > "h_c_s.csv"};$1 == "1/2/2007" || $1 == "2/2/2007" {print > "h_c_s.csv"}' household_power_consumption.txt
#x <- read.csv("h_c_s.csv", sep=";") #reading the data

png(file="plot1.png")
with (x, hist(Global_active_power, xlab="Global Active Power (kilowatts)", 
              col="red", main="Global Active Power"))
dev.off()
