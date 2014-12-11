corr <- function(directory, threshold = 0) {
        cor_vector <- numeric()
        for(i in 1:332){
                
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
                x_complete <- x[cc,c(2,3)]
                ncc <- nrow(x_complete)
                
               if(ncc > threshold){
                       cor_complete <- cor(x_complete)[1,2]
                       cor_vector <- append(cor_vector, cor_complete)
               }
        }
        return(cor_vector)
}