source("load.R")

# Helper function for drawing the plot
do_plot3 <- function(hpc,frame=TRUE){
        # Main plot and first series
        plot(hpc$datetime,hpc$Sub_metering_1,type='l',xlab ="",ylab="Energy sub metering")
        # Second series
        lines(hpc$datetime,hpc$Sub_metering_2,col='red')
        # Third series
        lines(hpc$datetime,hpc$Sub_metering_3,col='blue')
        
        # Add legend
        if(frame==TRUE)
                bty = 'y'
        else
                bty = 'n'
        
        legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1),col=c('black','red','blue'),bty=bty)
}

# Wrapper function for taking care of loading data, output device, ...
# This is what you should call to view the result
plot3 <- function(hpc=NULL){
        # Load Plot data
        if(is.null(hpc)){
                hpc<-load_data()
        }
        
        # Create PNG output device
        png("plot3.png",width = 480, height = 480)
        
        # Draw plot
        do_plot3(hpc)
        
        # Release output device
        dev.off()
}