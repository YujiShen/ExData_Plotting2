setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

baltimore <- NEI[NEI$fips == "24510", ]
sub <- ddply(baltimore, .(year = baltimore$year, type = baltimore$type), summarize, Emissions = sum(Emissions))

png("plot3.png", 800, 480)
qplot(year, Emissions, data=sub, facets = .~type, geom = c("point", "line"), xlab='Year', ylab='Emissions(ton)', main='4 types PM2.5 emissions in Baltimore')
dev.off()