argfilepath="/home/tamans/home2/test_gap/argvfilemean.txt"
path<-list()
i=0
j=0
cpath=""
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
print(argv)
listmean<-c("name file and mean value")
for (name in rownames(argv))
{
	print(argv[name,1])
        j<-j+1
        if (grepl("^#",name)==TRUE)
        {
                print(paste("the line",j,"is a comment",sep=" "))
        }
        if (grepl("^path",name)==TRUE)
        {
                i<-i+1
                path<-c(path,list(argv[name,1]))
                cpath<-as.character(unlist(path[i]))
        }
        if (grepl("^file",name)==TRUE)
        {
                pathfile<-paste(cpath,argv[name,1],sep="")
                gap_volume<-read.table(file=pathfile)
                #moyenne<-mean(gap_volume$V3)
                moyenne<-mean(gap_volume$V2)
		#squaredeviation<-sd(gap_volume$V3)
                squaredeviation<-sd(gap_volume$V2)
		value<-paste(pathfile,"mean",moyenne,"sd",squaredeviation, sep=":")
                listmean<-c(listmean,value)
        }
}
sink("mean_file.txt", append=TRUE)
cat(paste0(listmean,"\n")) # to avoid presence of ligne numerotation inthe output file
sink()
