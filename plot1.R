setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

total <- tapply(NEI$Emissions, NEI$year, sum)

png("plot1.png", width = 480, height = 480)
plot(names(total), total, axes = F, type = 'b', xlab = "Year", ylab = "Emissions(ton)", main = "Total PM2.5 emission from all sources")
axis(side = 1, at = c(1999, 2002, 2005, 2008))
axis(side = 2, at = NULL)
box()
dev.off()
