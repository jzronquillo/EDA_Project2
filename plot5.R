## Plot 5

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset Motor Vehicles Sources (On-Road Vehicles) Emissions in Baltimore
BaltiMotor<-subset(NEI,type=="ON-ROAD" & fips == "24510")

#Plot
png("plot5.png", width=480, height=480)

ggplot(data=BaltiMotor,aes(factor(year),Emissions,fill=year))+geom_bar(stat="identity")+
    theme_bw() +guides(fill=FALSE)+
    labs(x="Year", y=expression("PM"[2.5]*" Emission (Tons)")) + 
    ggtitle(expression("Baltimore City PM"[2.5]*" Motor Vehicles Emissions, 1999-2008 "))

dev.off()