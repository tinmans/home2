argv2<-read.table(file="/home/tamans/home2/argvfilemean.txt",row.names=1,sep=":",colClasses=NA)
library(ggplot2)
vskip<-list()
path<-list()
file_name<-list()
i=0
j=0
l=0
k=0
m=0
for (name in rownames(argv2))
{
        print("boucle")
        print(paste("name",name,sep=""))
        if (grepl("^#",name)==TRUE)
        {
                i<-i+1
                print(paste("le ligne",i,"est un commentaire"))
        }
        if (grepl("^path",name)==TRUE)
        {
                m<-m+1
                path<-c(path,list(argv2[name,1]))
                vpath<-as.character(unlist(path[m]))
        }       
        #if (grepl("^skip",name)==TRUE)
        #{
        #        j<-j+1
        #        vskip<-c(vskip,list(argv2[name,1]))
        #        print(paste("vskip",vskip,sep=""))
        #}
        #
        #if(grepl("^file_name",name)==TRUE)
        #{
#               l<-l+1
#               file_name<-c(file_name,list(argv2[name,1]))
#       }
        if (grepl("^file",name)==TRUE)
        {
                k<-k+1
                print("yes")
                if(is.na(vskip[k]) !=TRUE)
                {
                        v1skip<-as.numeric(as.character(unlist(argv2[name,2])))
                        #name_F=toString(unlist(file_name[k]),width=0)
                        pathfile<-paste(vpath,argv2[name,1],sep="")
                        rmsd<-read.table(file=pathfile,skip=v1skip)
                        #name_file_pdf<-paste("rmsf_pbdistribution_chain",argv2[name,1],".pdf",sep="")
                        name_file_pdf<-paste("rmsf_pbdistribution",name,".pdf",sep="")
                        #pdf(file=name_file_pdf)
                        laby<-paste("rmsd_",argv2[name,1],sep="")
                        main<-paste(laby,"by atom ",sep=" ")
                        #print("echo")
			#denst<-density(rmsd$V2)
                        #maxi<-max(rmsd$V2)+1
                        #hist(rmsd$V2,probability=TRUE,main=main,xlab="rmsd",ylab=laby)
                        p<-ggplot(rmsd,aes(x=V2))
			p+geom_histogram(aes(y=..density..), colour="black", fill="white")+geom_density(alpha=.2, fill="#FF6666")+geom_vline(aes(xintercept=mean(V2)),color="blue", linetype="dashed", size=1)+labs(title=main,x="rmsd(nm)", y = "Density")
			#lines(density(rmsd$V2), col='blue',lwd=3)
                        #dev.off()
			ggsave(name_file_pdf)
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
print(paste("k",k,sep=""))
