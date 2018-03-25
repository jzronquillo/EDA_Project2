## Plot 3

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## subset Baltimore Data
Balti<-subset(NEI,fips == "24510")

## Plot 
library("ggplot2")
png("plot3.png", width=480, height=480)

ggplot(data=Balti,aes(factor(year),Emissions,fill=year))+geom_bar(stat="identity")+
    theme_bw() +facet_grid(.~type) + guides(fill=FALSE)+
    labs(x="Year", y=expression("PM"[2.5]*" Emission (Tons)")) + 
    ggtitle(expression("Baltimore City PM"[2.5]*" Emissions by Source Type, 1999-2008 "))

dev.off()