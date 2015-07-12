source("load.R")

# Helper function for drawing the plot
do_plot1 <-function(hpc){
        hist(hpc$Global_active_power,col='red',main="Global Active Power",xlab="Global Active Power (kilowatts)")
}

# Wrapper function for taking care of loading data, output device, ...
# This is what you should call to view the result
plot1<- function(hpc=NULL)
{
        # Load Plot data
        if(is.null(hpc)){
                hpc<-load_data()
        }
        
        # Create PNG output device
        png("plot1.png",width = 480, height = 480)
        
        # Call plotting function
        do_plot1(hpc)
        
        # Release output device
        dev.off()
}