pollutantmean <- function(directory, pollutant, id = 1:332) {
        mierdero <- numeric(0)
        for(i in id){
                
                if(i<=9){
                       archivo <- paste("00",i,".csv",sep="")
                } else if(i>=10 && i<=99){
                        archivo <- paste("0",i,".csv",sep="")
                } else {
                        archivo <- paste(i,".csv",sep="")
                }
                # print(archivo)
                
                x <- read.csv(paste(directory,"/",archivo,sep=""),header=TRUE)
                
                mierdero <- append(mierdero, x[,pollutant])
                # mymean <- mean(x[,pollutant], na.rm=TRUE)
                # means <- append(means,mymean)
        }
        y <- mean(mierdero, na.rm=T)
        print(y)
}