# Creating a script that transforms data into a Tidy Dataset

## Synopsis

The [processing script](./run\_analysis.R) combines all the Train and Test data from the University of California at Irvine, Machine Learning Repository, Center for Machine Learning and Intelligent Systems. This script combines the data, extracts only the variables that measure mean and standard deviaton, adds descriptive activity names to the dataset, labels the variables with a descriptive name and lastly creates a tidy data set with the average of each variable by activity and subject.

The script requires the **dplyr** package, if it is not installed the script will try to install it and load it.

Read the [codebook](./CodeBook.md) to understand each variable of the [tidy dataset](./tidydataset.txt).

The [tidy dataset](./tidydataset.txt) can be read into R with the following command:

```{r}
> tidydata <- read.table("tidydataset.txt", header = TRUE)
```
The tidy dataset includes 68 variables and 180 observations (30 users and 6 activities per user). This variables have been selected from the original complete data set of 563 variables (subject, activity and 561 features) and 10,299 observations. 

Only variables with the **mean()** and **std()** functions in their names where selected from the features list, variables with **meanFreq()** and **angle()** functions where excluded from the tidy dataset variables.

## run_analysis.R dry-run

- Previous Steps
  1. Check to see if the data set file is in the repository.
  2. Check to se if the dplyr package is installed for later use, if it is not the script will install and load into the environment.

- Step 1. Merge the train and test dataset
  1. Read the activity labels for later use.
  2. Read the features table and turn into a vector so it can be used later to name the variables.
  3. Read the activity, subject, and measurement values for each of the training and testing datasets, apply the features vector to the attribute **names()** and combine the data using **cbind()**. This way the subject, activity and measurements are combined correctly.
  4. Combine row-wise the training and testing into one single dataset using **rbind()** function.
  5. Remove from the environment all the data sets that are not needed to free memory space using **rm()** function.

- Step 2. Extract only the measurements on the mean and standard deviation
  1. Using the **grep()** function create a logical vector to extract only the measurements of the mean and standard deviation variables. This function extracts only 66 variables with the exact words "**mean()**" and "**std()**". The rest of the variables that contain the Mean string in it are not extracted, they are not considered to be measurement of a mean since they are part of a **FreqMean()** and an **angle()** function.

- Step 3. Add descriptive activity names for each activity
  1. Remove underscores from the existing activity names before converting them to lowercase.
  2. Do a for loop that runs a **gsub()** function to replace the sctivity code with activity descriptive names from the activities table read in the beginning of the script.

- Step 4. Label the data set with descriptive variable names
  1. Normalize the variable names
  2. A series of **gsub()** functions are applied to the variable strigs to rename them. 
    * Variable names will have no spaces or other symbols.
    * The variable names are transformed into descriptive replacing for example, *acc* with *Accelerometer*
    * Some lower case are introduced in the variable name to allow for easier reading.

- Step 5.  Creates a second, independent tidy dataset with the mean of each variable by each activity and subject
  1. Create a tidy dataset for subsequent analysis using the **dplyr** package loaded at the beginning.
  2. Use the **tbl_df()** to turn the data into table data frame format.
  3. Since the mean will be calculated for subject and activity use the **group_by()** function to group by this variables when summarizing.
  4. Use the **summarise_each()** function to create the tidy data summarized table by the groups created in the previous step. The _each part of the function calculates the mean for all the other variables.
  5. Save tidy dataset to file using the **write.table()** function.


To execute run\_analysis.R make the current folder your R working directory and run the following command:

```{r}
> source("run_analysis.R")
```

## Refenrence

Human Activity Recognition Using Smartphones Data Set. University of California at Irvine,  Center for Machine Learning and Intelligent Systems, [Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Retrieved 20 March 2015.