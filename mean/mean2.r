argfilepath="/home/tamans/home2/mean/argvfilemean.txt"
path<-list()
i=0
j=0
cpath=""
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
listmean<-c("name file and mean value")
sink("mean_file.txt", append=TRUE)
for (name in rownames(argv))
{
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
		nskip<-as.numeric(as.character(unlist(argv[name,2])))
		pathfile<-paste(cpath,argv[name,1],sep="")
		rmsd<-read.table(file=pathfile,skip=nskip)
		moyenne<-mean(rmsd$V2)
		squaredeviation<-sd(rmsd$V2)
		value<-paste(pathfile,"mean",moyenne,"sd",squaredeviation, sep=":")
		listmean<-c(listmean,value)
	}
}
cat(paste0(listmean,"\n")) # to avoid presence of ligne numerotation inthe output file
sink()
