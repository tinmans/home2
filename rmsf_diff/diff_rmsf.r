argvfile<-"/home/tamans/home2/rmsf_diff/argvfile_diff_rmsf.txt"
argv<-read.csv(file=argvfile,sep=":",header=FALSE,row.names=1,colClasses=NA)
i=0
for(name in rownames(argv))
{
	i<-i+1
        if(grepl("^#",name)==TRUE)
        {
		print(paste("la ligne", i," est une ligne de commentaire", sep=""))
	}
	else
	{
		if(grepl("chainA",argv[name,1])==TRUE)
		{
			chain_name=".A"
		}
		else if(grepl("chainB",argv[name,1])==TRUE)
		{
			chain_name=".B"
		}
		else
		{
			chain_name=""
		}
		rmsf1<-read.table(file=toString(argv[name,2]),skip=as.numeric(as.character(argv[name,3])))
		rmsf2<-read.table(file=toString(argv[name,4]),skip=as.numeric(as.character(argv[name,5])))
		difference<-rmsf2$V2-rmsf1$V2
		residus_position<-rmsf2$V1
		filename<-paste("rmsfdiffinput_", name,".txt", sep="")
		pas<-paste("\t",":",residus_position,chain_name,sep="")
		is.atomic(pas)
		table<-data.frame(pas,difference)
		sink(filename)
			cat("# \n")
			cat("#  PDB entry 121p (H-ras) residue sidechain percent exposure \n")
			cat("#  (solvent-accessible area relative to Gly-X-Gly state \n")
			cat("#  courtesy of Getarea server, http://curie.utmb.edu/getarea.html \n")
			cat("# \n")
			cat("#  Use this file to assign the attribute in Chimera with the \n")
			cat("#  Define Attribute tool or the command defattr. \n")
			cat("# \n")
			cat("attribute: bfactor \n")
			cat("match mode: 1-to-1 \n")
			cat("recipient: residues \n")
			table2<-write.table(table,row.names=FALSE, col.names=FALSE, sep="\t", quote=FALSE)
		sink()
}	}
