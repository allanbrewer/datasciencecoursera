complete <- function(directory, id = 1:332) {
        nobs_df <- data.frame("id"=id,"nobs"=id)
        count <- 1
        for(i in id){
                
                if(i<=9){
                       archivo <- paste("00",i,".csv",sep="")
                } else if(i>=10 && i<=99){
                        archivo <- paste("0",i,".csv",sep="")
                } else {
                        archivo <- paste(i,".csv",sep="")
                }
                # print(archivo)

                x <- read.csv(paste(directory,archivo,sep="/"),header=TRUE)

                cc <- complete.cases(x)
                ncc <- sum(cc)
                nobs_df[count,"nobs"] <- ncc
                count <- count + 1
        }
        print(nobs_df)
}