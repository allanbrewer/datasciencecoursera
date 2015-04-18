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

## Subset data frame to only the Baltimore City observations
nei.bc <- filter(nei, fips == "24510")

## Subset data from Baltimore City by type
nei.bc.group <- group_by(nei.bc, year, type)

## Summarize the grouped data by adding all of the Emissions per year
nei.bc.sum <- summarize(nei.bc.group, total_emissions = sum(Emissions))
nei.bc.sum$type <- as.factor(nei.bc.sum$type)

##############################################
## Step #3 - Create the plot to PNG
##############################################

## Open png Graphics Device with width and height of 480 px
png(file = "plot3.png", width = 1200, height = 800, units = "px", bg = "transparent")
## Create the plot in current graphic device
plot3 <- ggplot(nei.bc.sum, aes(year, total_emissions))
plot3 <- plot3 + labs(title = "Emissions per Year by Type", x = "Years", y = "Total Emissions")
plot3 <- plot3 + geom_point(col = "gray22", size = 4) + geom_line(col = "steelblue3", size = 1.5)
plot3 <- plot3 + geom_smooth(col = "firebrick2", method = "lm", se = FALSE) + facet_grid(~type)
print(plot3)
## Turn off graphic device
dev.off()