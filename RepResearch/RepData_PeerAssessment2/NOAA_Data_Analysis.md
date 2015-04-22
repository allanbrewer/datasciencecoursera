# Data Analysis of the NOAA Storm Data set to determine Weather Event's Economic and Public Health consequences
Allan R. Brewer Cappellin  

## Synopsis

## Downloading and Processing the data

Data downloaded from the the web from this url [Data Set](https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2).


```r
## download.file(url = "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2", destfile = "./NOAA_StormData.csv.bz2")
```

### Loading Requiered Pacakges


```r
if (!require(dplyr)) { install.packages("dplyr") }
if (!require(ggplot2)) { install.packages("ggplot2") }
```
