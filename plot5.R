setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

sub.scc <- subset(SCC, grepl('Highway Veh', Short.Name), select = "SCC")
Motor.baltimore <- subset(NEI, NEI$SCC %in% sub.scc[[1]] & NEI$fips == '24510')

total <- tapply(Motor.baltimore$Emissions, Motor.baltimore$year, sum)

png('plot5.png', 480, 480)
plot(names(total), total, axes = F, type = 'b', xlab='Year', ylab='Emissions(ton)', main='PM2.5 emissions from motor vehicle in Baltimore')
axis(side=1, at = c(1999, 2002, 2005, 2008))
axis(side=2, NULL)
box()
dev.off()