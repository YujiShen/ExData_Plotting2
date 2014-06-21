setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(lattice)

sub.scc <- subset(SCC, grepl("Motor", Short.Name), select = "SCC")
Motor <- subset(NEI, NEI$SCC %in% sub.scc[[1]] & (NEI$fips == '06037' | NEI$fips == "24510"))

total <- ddply(Motor, .(year = Motor$year, fips= Motor$fips), summarize, Emissions = sum(Emissions))
total$city <- as.factor(total$fips)
levels(total$city) <- c("Los Angeles County", "Baltimore City")

png('plot6.png', 600, 480)
xyplot(total$Emissions ~ total$year | total$city, type = 'b', xlab='Year', ylab='Emissions(ton)', main='Comparision of PM2.5 emissions from motor vehicle sources\nin Los Angeles County and Baltimore City')
dev.off()