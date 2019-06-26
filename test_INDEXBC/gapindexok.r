argfilepath="/home/tamans/home2/test_INDEXBC/argvfileindex.txt"
gap_path<-list()
asa_path<-list()
i=0
j=0
k=0
value=""
cpath=""
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
#print(argv)
listmean<-c("name file and mean value")
for (name in rownames(argv))
{
        #print(argv[name,1])
        j<-j+1
        if (grepl("^#",name)==TRUE)
        {
                print(paste("the line",j,"is a comment",sep=" "))
        }
        if (grepl("^gap",name)==TRUE)
        {
                i<-i+1
                gap_path<-c(gap_path,list(argv[name,1]))
                gappath<-as.character(unlist(gap_path[i]))
		print("gap")
		print(gappath)
		print(i)
        }
        if (grepl("^asa",name)==TRUE)
        {
                k<-k+1
                asa_path<-c(asa_path,list(argv[name,1]))
                asapath<-as.character(unlist(asa_path[k]))
		print("asa")
		print(asapath)
		print(k)
	}
	if(i==k)
	{
		gap_file<-read.table(file=gappath)
		asa_file<-read.table(file=asapath)
		#gap_moyenne<-mean(gap_file$V2)
		#asa_moyenne<-mean(asa_file$V2) #buried_surface
		#print(gap_moyenne)
		#print(asa_moyenne)
		#gap_index<-gap_moyenne/asa_moyenne
		gap_index<-gap_file$V2/asa_file$V2
		print(gap_index)
		gap_index_moyenne<-mean(gap_index)
		gap_index_sd<-sd(gap_index)
		value<-paste(gappath,"_",asapath,":","mean_gap_index",":",gap_index_moyenne,":sd_gap_index",gap_index_sd,sep="")
                listmean<-c(listmean,value)
        }
}
sink("index_file.txt", append=TRUE)
cat(paste0(listmean,"\n")) # to avoid presence of ligne numerotation inthe output file
sink() 
