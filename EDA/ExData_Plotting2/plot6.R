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
                nei        <- readRDS("summarySCC_PM25.rds") 
        }
} else {
        ## Read the National Emissions Inventory data set for 1999, 2002, 2005, 2008 if it does not exist
        nei        <- readRDS("summarySCC_PM25.rds")
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

## Determine de SCC code for Motor Vehicles Related Sources
## SCC with the word Vehicle on its description
mv.rows <- grep("Vehicle" , scc$SCC.Level.Two)
## Extract SCC code
scc.codes <- as.vector(scc[mv.rows,1][[1]])

## Filter NEI data set by SCC codes for Movile Vehicles
nei.mv <- filter(nei, SCC %in% scc.codes)

## Subset data frame to only the Baltimore City and Los Angeles County observations
nei.mv.bc.la <- filter(nei.mv, fips == "24510" | fips == "06037")

## Group and Summarize the data by adding all of the Emissions per year by county
nei.mv.bc.la.sum <- summarise(group_by(nei.mv.bc.la, year, fips), total_emissions = sum(Emissions))

##############################################
## Step #3 - Create the plot to PNG
##############################################

## Open png Graphics Device with width and height of 480 px
png(file = "plot6.png", width = 600, height = 1000, units = "px", bg = "transparent")
## Create the plot in current graphic device
plot6 <- ggplot(nei.mv.bc.la.sum, aes(x = year, y = total_emissions, group = fips, colour = fips))
plot6 <- plot6 + labs(title = "Emissions from Motor Vehicle Sources per Year", x = "Years", y = "Total Emissions (tons)")
plot6 <- plot6 + geom_point(size = 4) + geom_line(size = 1.5) + scale_colour_discrete(name  ="County", breaks=c("06037", "24510"), labels=c("Los Angeles", "Baltimore City"))
plot6 <- plot6 + geom_smooth(col = "grey22", method = "lm", se = FALSE)
print(plot6)
## Turn off graphic device
dev.off()