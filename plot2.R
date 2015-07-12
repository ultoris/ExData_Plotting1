source("load.R")

# Helper function for drawing the plot
do_plot2 <- function(hpc,shortylab=FALSE){
        if(shortylab==TRUE)
                ylab="Global Active Power"
        else
                ylab="Global Active Power (kilowatts)"
        plot(hpc$datetime,hpc$Global_active_power,type='l',ylab=ylab,xlab ="")
}

# Wrapper function for taking care of loading data, output device, ...
# This is what you should call to view the result
plot2 <- function(hpc=NULL){
        # Load Plot data
        if(is.null(hpc)){
                hpc<-load_data()
        }
        
        # Create PNG output device
        png("plot2.png",width = 480, height = 480)
        
        # Draw plot
        do_plot2(hpc)
        
        # Release output device
        dev.off()
}