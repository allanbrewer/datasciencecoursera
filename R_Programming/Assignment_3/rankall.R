rankall <- function(outcome, num = "best") {
	
	## Read Outcome file data
	data <- read.csv("data/outcome-of-care-measures.csv", colClasses = "character")

	## Create State List
	stateList <- data[,7]
	factorList <- as.factor(data[,7])
	states <- levels(factorList)

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

	dataFrame <- data.frame( hospital = character(), state = character(), stringsAsFactors = FALSE)


	## Start loop for each state
	for(i in 1:length(states)) {

		state <- states[i]

		stateTrue <- data[(state==stateList),]

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
			y <- 1
		} else if(tolower(num) == "worst") {
			y <- x
		} else {
			y <- num
		}

		if(x < y) {
			hospitalName <- NA
		} else if(x == 1){
			## Get Hospital List
			hospitals <- stateTrue[,2]
			
			hospitalName <- hospitals
		} else {

			## Get Hospital List
			hospitals <- stateTrue[,2]

			## Order Hospital List
			ii <- order(outcomeValue, hospitals)
			ranking <- rbind(outcomeValue,hospitals)[,ii]

			## Get Hospital Name
			hospitalName <- ranking[[2,y]]

		}
                
		dataFrame[i,1] <- hospitalName
		dataFrame[i,2] <- state

	}

	## Print Data Frame
	print(dataFrame)

}