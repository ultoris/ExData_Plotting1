load_data <-function(url='https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip'){
        # Filename for download file
        filename<-"household_power_consumption.zip"
        # Filename for unzipped file
        text_filename<-"household_power_consumption.txt"
        
        # Download file if not downloaded yet
        if(!file.exists(filename)){
                download.file(url=url,destfile = filename,method="curl")
                unzip(filename)
        }
        
        # Read data
        hpc <- read.table(text_filename,sep=';',na.strings = '?',header=TRUE,quote="",dec='.',stringsAsFactors=FALSE)
        # Convert Dates
        hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
        # Subclass
        hpc <- hpc[(hpc$Date>="2007-02-01") & (hpc$Date<="2007-02-02"),,drop=FALSE]
        # Build datetime part
        hpc$datetime<-strptime(paste(hpc$Date,hpc$Time,sep=" "),"%Y-%m-%d %H:%M:%S")
        
        hpc
}