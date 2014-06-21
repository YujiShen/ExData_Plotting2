setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

scc.sub <- subset(SCC, grepl('Comb.*Coal', Short.Name), select = "SCC")
CombCoal <- subset(NEI, SCC %in% scc.sub[[1]])

total <- tapply(CombCoal$Emissions, CombCoal$year, sum)

png('plot4.png', 480, 480)
plot(names(total), total, axes = F, type='b', xlab='Year', ylab='Emissions(ton)', main='PM2.5 emissions from coal combustion-related sources')
axis(side=1, at=c(1999,2002,2005,2008))
axis(side=2, at=NULL)
box()
dev.off()