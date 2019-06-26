argfilepath="/home/tamans/home2/test_angle/argvfilemean.txt"
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
                angl<-read.table(file=pathfile)
                moyenne_a1<-mean(angl$V2)
                squaredeviation_a1<-sd(angl$V2)
                moyenne_a2<-mean(angl$V3)
                squaredeviation_a2<-sd(angl$V3)
                value<-paste(pathfile,"mean_a1",moyenne_a1,"sd_a1",squaredeviation_a1,"mean_a2", moyenne_a2, "sd_a2", squaredeviation_a2,sep=":")
                listmean<-c(listmean,value)
        }
}
sink("mean_file.txt", append=TRUE)
cat(paste0(listmean,"\n")) # to avoid presence of ligne numerotation inthe output file
sink()
