source("load.R")

source("plot1.R")
source("plot2.R")
source("plot3.R")

# Helper function for drawing the plot
do_plots <- function(hpc){
        # Setup multiple plots
        par(mfrow=c(2,2))
        
        # Draw plot2
        do_plot2(hpc,shortylab = TRUE)
        
        # Draw plot 4a
        do_plot4a <- function(){
                plot(hpc$datetime,hpc$Voltage,type='l',ylab ="Voltage",xlab ="datetime")   
        }
        do_plot4a()
        
        # Draw plot3
        do_plot3(hpc,frame = FALSE)
        
        # Draw plot4b
        do_plot4b <- function(){
                plot(hpc$datetime,hpc$Global_reactive_power,type='l',ylab ="Global_reactive_power",xlab ="datetime")   
        }
        do_plot4b()
        
        # Restore mfrow
        par(mfrow=c(1,1))
}

# Wrapper function for taking care of loading data, output device, ...
# This is what you should call to view the result
plot4 <- function(hpc=NULL){
        # Load Plot data
        if(is.null(hpc)){
                hpc<-load_data()
        }
        
        # Create PNG output device
        png("plot4.png",width = 480, height = 480)
        
        # Draw plot
        do_plots(hpc)
        
        # Release output device
        dev.off()
}