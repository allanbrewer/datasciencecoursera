rankhospital <- function(state, outcome, num = "best") {
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

	## Ranking
	x <- as.numeric(nrow(stateTrue))
	if(tolower(num) == "best") {
		num <- 1
	} else if(tolower(num) == "worst") {
		num <- x
	} 

	if(x < num) {
		num <- NA
        print(num)
	} else {

	## Print num value
	## print(num)

	## Get Hospital List
	hospitals <- stateTrue[,2]

	## Order Hospital List
	ii <- order(outcomeValue, hospitals)
	ranking <- rbind(outcomeValue,hospitals)[,ii]

	## Get Hospital Name
	hospitalName <- ranking[[2,num]]

	## Print Hospital Name
	print(hospitalName)

}
}