## Plot 2

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset Baltimore Data
Balti<-subset(NEI,fips == "24510")

## Plot 
png("plot2.png", width=480, height=480)

Balti_Emissions<-tapply(Balti$Emissions, Balti$year, sum)
barplot(Balti_Emissions,main=expression("Baltimore City PM"[2.5]*" Emissions, 1999-2008 "),
        xlab="Year", ylab=expression("PM"[2.5]*" Emissions"))

dev.off()