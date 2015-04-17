##############################################
## Step #1 - Load Packages and Read the Data
##############################################

## Load the required packages
if (!require(dplyr)) { install.packages("dplyr") }
if (!require(ggplot2)) { install.packages("ggplot2") }

## Check if NEI already exists in the current environment
if (exists("nei")) {
	## Check if dimensions are correct
	if (!(nrow(nei) == 6497651 & ncol(nei) == 6)) { 
		## Read the National Emissions Inventory data set for 1999, 2002, 2005, 2008 if dimensions are incorrect
		nei	<- readRDS("summarySCC_PM25.rds") 
		}
} else {
	## Read the National Emissions Inventory data set for 1999, 2002, 2005, 2008 if it does not exist
	nei	<- readRDS("summarySCC_PM25.rds")
}

## Check if SCC already exists in the current environment
if (exists("scc")) {
	## Check if dimensions are correct
	if (!(nrow(scc) == 11717 & ncol(scc) == 15)) { 
		## Read the Source Classification Code Table if dimensions are incorrect
		scc	<- readRDS("Source_Classification_Code.rds") 
		}
} else {
	## Read the Source Classification Code Table if it does not exist
	scc	<- readRDS("Source_Classification_Code.rds")
}

##############################################
## Step #2 - Manipulate and modify the data as needed
##############################################

## Make nei and scc a data frame that can be manipulated with dplyr
nei <- tbl_df(nei)
scc <- tbl_df(scc)

## Group and Summarize the grouped data by adding all of the Emissions per year
nei.year.sum <- summarize(group_by(nei, year), total_emissions = sum(Emissions))

##############################################
## Step #3 - Create the plot to PNG
##############################################

## Open png Graphics Device with width and height of 480 px
png(file = "plot1.png", width = 600, height = 600, units = "px", bg = "transparent")
## Create the plot in current graphic device
with(nei.year.sum, plot(year, total_emissions, pch = 19, col = "grey22", xlab = "Years", ylab = "Total Emissions"))
lines(nei.year.sum, lwd = 2, col = "steelblue4")
title(main = "Total Emissions per Year")
## Turn off graphic device
dev.off()