best <- function(state, outcome) {
	## Read Outcome file data
	data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")

	## Check if sate is valid
	stateList <- data[,7]
	stateTrue <- data[(toupper(state)==stateList),]
	if (nrow(stateTrue) == 0){
		stop("invalid state")
	}
	## Print number of rows with the state name
	## print(nrow(stateTrue))

	## Check if outcome is valid
	## If TRUE assign column nomber
	if(tolower(outcome) == "heart attack") {
		outcome <- 11
	} else if(tolower(outcome) == "heart failure") {
		outcome <- 17
	} else if(tolower(outcome) == "pneumonia") {
		outcome <- 23
	} else {
		stop("invalid outcome")
	}
	## Check if outcome column is correct
	## print(outcome)

	## Coerce column to be numeric
	stateTrue[,outcome] <- as.numeric(stateTrue[,outcome])

	## List with 30-day mortality rate values
	outcomeValue <- stateTrue[,outcome]

	## Remove NA
	noNA <- !is.na(outcomeValue)

	stateTrue <- stateTrue[noNA,]

	outcomeValue <- outcomeValue[noNA]

	## Find minimun value
	minimunVal <- min(outcomeValue)
	
	## Check minimun value
	## print(minimunVal)

	hospitalName <- stateTrue[outcomeValue==minimunVal,2]

	print(hospitalName)


}