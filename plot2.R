setwd("/Users/Yuji/Downloads/exdata-data-NEI_data")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- NEI[NEI$fips == "24510", ]

baltimore.year <- tapply(baltimore$Emissions, baltimore$year, sum)

png("plot2.png", width = 480, height = 480)
plot(names(baltimore.year), baltimore.year, axes = F, type = 'b', xlab = "Year", ylab = "Emissions(ton)", main = "Total PM2.5 emission in Baltimore")
axis(side = 1, at = c(1999, 2002, 2005, 2008))
axis(side = 2, at = NULL)
box()
dev.off()