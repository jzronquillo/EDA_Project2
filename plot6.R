## Plot 6

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Motor Vehicles Sources (On-Road Vehicles) Emissions in Baltimore & Los Angeles
BaltiMotor<-subset(NEI,type=="ON-ROAD" & fips == "24510")
BaltiMotor$City<-c("Baltimore City")

LAMotor<- subset(NEI,type=="ON-ROAD" & fips == "06037")
LAMotor$City<-c("Los Ageles County")

Motor<-rbind(BaltiMotor,LAMotor)

#Plot
library("ggplot2")
png("plot6.png", width=480, height=480)

ggplot(data=Motor,aes(factor(year),Emissions,fill=year))+geom_bar(stat="identity")+
    theme_bw() +facet_grid(scales="free", space="free",.~City) + guides(fill=FALSE)+
    labs(x="Year", y=expression("PM"[2.5]*" Emission (Tons)")) + 
    ggtitle(expression("Baltimore & LA PM"[2.5]*" Motor Vehicles Emissions, 1999-2008"))

dev.off()