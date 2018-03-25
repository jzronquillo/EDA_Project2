## Plot 4

## Read Data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Filter Emissions from Coal Combustion-Related Sources
SCC_coalComb<-SCC[grepl("^Fuel Comb (.*?) Coal$", SCC[,"EI.Sector"],
                        ignore.case = TRUE ),]
c<-unique(SCC_coalComb$SCC)
NEI_coalComb<-subset(NEI, SCC==c)

#Plot
png("plot4.png", width=480, height=480)

ggplot(data=NEI_coalComb,aes(factor(year),Emissions,fill=year))+geom_bar(stat="identity")+
    theme_bw() +guides(fill=FALSE)+
    labs(x="Year", y=expression("PM"[2.5]*" Emission (Tons)")) + 
    ggtitle(expression("United States PM"[2.5]*" Coal Combustion-Related Emissions, 1999-2008 "))

dev.off()