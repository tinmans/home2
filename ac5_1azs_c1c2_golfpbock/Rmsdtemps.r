#verifier pour le rmsd total
library(ggplot2)
argfilepath="/home/tamans/home2/ac5_1azs_c1c2_golfpbock/arg_file_r.txt"
lskip<-list()
file_name<-list()
j=0
k=0
l=0
i=0
p=ggplot()
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
for (name in rownames(argv))
{
	i<-i+1
	print("boucle")
	print(name)
        if (grepl("^#",name)==TRUE)
        {
		print(paste("the line",i,"is a comment",sep=" "))
        }
	if (grepl("skip",name)==TRUE)
	{
		j<-j+1
		lskip<-c(lskip,list(argv[name,1]))
	}
	if(grepl("file_name",name)==TRUE)
	{
		l<-l+1
		file_name<-c(file_name,list(argv[name,1]))
	}
	if (grepl("chain_name",name)==TRUE)
	{
		k<-k+1
		print("yes")
		if(is.na(lskip[k]) !=TRUE)
		{
			nskip<-as.numeric(as.character(unlist(lskip[k])))
			name_F=toString(unlist(file_name[k]),width=0)
			rmsd<-read.table(file=name_F,skip=nskip) 
			name_file_pdf<-paste("rmsd_chain",argv[name,1],".pdf",sep="")
			pdf(file=name_file_pdf)
			#laby<-paste("rmsd_chain",argv[name,1],sep="")
			main<-paste("RMSD time series of domain",argv[name,1],"of AC5",sep=" ")
			rmsd$V2<-rmsd$V2*10
			rmsd$V1<-rmsd$V1/1000000
			moyenne<-mean(rmsd$V2)
			#p<-ggplot(rmsd,aes(x=rmsd$V1,y=rmsd$V2,color=V1)) #to color only one part of the graph here between x values: 0.4 and 0.95for chainB for AC5 in the complexe AC5+Gi for example
			#p<-p+scale_color_gradientn("split",colours=c("green"),limits=c(0.4,0.95)) 
                        p<-ggplot(rmsd,aes(x=rmsd$V1,y=rmsd$V2))+geom_line()+geom_hline(aes(yintercept=moyenne),color="blue", linetype="dashed", size=1)+labs(title=main,x="time(micro-seconde)", y = "RMSD")
			#p<-geom_vline(aes(xintercept=0.575),color="blue", linetype="dashed", size=1)+geom_vline(aes(xintercept=1.35),color="blue", linetype="dashed", size=1)+geom_vline(aes(xintercept=0.95),color="blue", linetype="dashed", size=1)#to add vertical ligne in function of the xvalue (xintercept), here it's an example for A chain of AC5 in the complexe AC5+Gi
			print(p)
			dev.off()
			moyenne<-mean(rmsd$V2)
			name_file_txt<-paste("rmsd_chain",argv[name,1],"_mean.txt",sep="")
			sink(name_file_txt)
			cat(moyenne)
			sink()
		}
	}
}
if (j==0)
{
print("You have not indicated skip parameters")
}
if (k==0)
{
print("you have not indicated chain parameters")
}

