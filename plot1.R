## Plot 1

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Plot
png("plot1.png", width=480, height=480)

totalEmissions<-tapply(NEI$Emissions, NEI$year, sum)
barplot(totalEmissions,main=expression("United States PM"[2.5]*" Emissions, 1999-2008 "),
     xlab="Year", ylab=expression("PM"[2.5]*" Emissions"))

dev.off()