argfilepath="/home/tamans/home2/test_ASA/argvfilemean.txt"
path<-list()
i=0
j=0
cpath=""
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
#print(argv)
listmean<-c("name file and mean value")
sink("mean_file.txt", append=TRUE)
for (name in rownames(argv))
{
	#print(argv[name,1])
        j<-j+1
        if (grepl("^#",name)==TRUE)
        {
                #print(paste("the line",j,"is a comment",sep=" "))
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
                asa<-read.table(file=pathfile)
                #moyenneasa_buriedsurface<-mean(asa$V4)
                #squaredeviation_buriedcsurface<-sd(asa$V4)
               	#moyenneasa_hydrophobicsurface<-mean(asa$V8)
                #squaredeviation_hydrophobicsurface<-sd(asa$V8)
		#moyenneglobale<-mean(asa$V4 + asa$V8)
		#sd_global<-sd(asa$V4 + asa$V8)
                #value<-paste(pathfile,"mean_buried_surface",moyenneasa_buriedsurface,"sd_buried_surface",squaredeviation_buriedcsurface,"mean_hydrophobic_surface", moyenneasa_hydrophobicsurface, "square_deviation_hydrophobic_surface", squaredeviation_hydrophobicsurface,"mean_global", moyenneglobale, "sd_global", sd_global, sep=":")
                moyenneasa_buriedsurface<-mean(asa$V2)
                squaredeviation_buriedcsurface<-sd(asa$V2)
		value<-paste(pathfile,"mean_buried_surface",moyenneasa_buriedsurface,"sd_buried_surface",squaredeviation_buriedcsurface,sep=":")
		listmean<-c(listmean,value)
        }
}
cat(paste0(listmean,"\n")) # to avoid presence of ligne numerotation inthe output file
sink()
