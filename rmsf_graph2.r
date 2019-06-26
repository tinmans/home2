library(ggplot2)
argfilepath="/home/tamans/home2/arg_rmsf_r.txt"
lskip<-list()
path<-list()
file_name<-list()
i=0
j=0
l=0
k=0
m=0
p=ggplot()
argv<-read.table(file=argfilepath,row.names=1,sep=":",colClasses=NA)
for (name in rownames(argv))
{ 
	p=ggplot()
	if (grepl("^skip",name)==TRUE)
	{
		j<-j+1
		lskip<-c(lskip,list(argv[name,1]))
	}
	if(grepl("^file_name",name)==TRUE)
        {
                l<-l+1
                file_name<-c(file_name,list(argv[name,1]))
        }
        if (grepl("^chain_name",name)==TRUE)
        {
                k<-k+1
                print("yes")
                if(is.na(lskip[k]) !=TRUE)
                {
                        nskip<-as.numeric(as.character(unlist(lskip[k])))
                        name_F=toString(unlist(file_name[k]),width=0)
                        rmsd<-read.table(file=name_F,skip=nskip)
                        name_file_pdf<-paste("rmsf_chain",argv[name,1],".pdf",sep="")
                        pdf(file=name_file_pdf)
                        main<-paste("RMSF time series of domain",argv[name,1],"of AC5",sep=" ")
			rmsd$V1<-rmsd$V1/1000000
                        moyenne<-mean(rmsd$V2)
                        p<-ggplot(rmsd,aes(x=rmsd$V1,y=rmsd$V2))+geom_line()+geom_hline(aes(yintercept=moyenne),color="blue", linetype="dashed", size=1)+labs(title=main,x="time(micro-seconde)", y = "RMSF")
			print(p)
                        dev.off()
			name_file_txt<-paste("rmsf_chain",argv[name,1],"_mean.txt",sep="")
                        sink(name_file_txt)
                        cat(moyenne)
                        sink()
                }
        }
}
if (j==0)
{
print("vosu n'avez pas indique le parametre skip")
}
if (k==0)
{
print("vous n'avez pas indique de parametre chain")
}
