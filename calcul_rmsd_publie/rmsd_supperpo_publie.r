######library########
library(ggplot2)
library(scales)
####################################chain A###################################
######data frame###############
rmsd1<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/rmsdA.xvg", skip=16)
rmsd2<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/rmsdA.xvg", skip=16)
rmsd3<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/rms_A.xvg", skip=16)
rmsd4<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/rms_A.xvg",skip=16)
rmsd5<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c1c2_golf/md/rms_A.xvg", skip=16)
rmsd6<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/rms_A.xvg", skip=16)
#######nm in amstrong#########
rmsdV2_1<-rmsd1$V2*10
rmsdV2_2<-rmsd2$V2*10
rmsdV2_3<-rmsd3$V2*10
rmsdV2_4<-rmsd4$V2*10
rmsdV2_5<-rmsd5$V2*10
rmsdV2_6<-rmsd6$V2*10

########plot creation###########
p=ggplot()
#add density courbe
p<-p+geom_density(aes(rmsdV2_1,color="AC5+Gs",linetype="AC5+Gi"))
p<-p+geom_density(aes(rmsdV2_2,color="AC5+Gs+ATP",linetype="AC5+Gi+ATP"))
p<-p+geom_density(aes(rmsdV2_3,color="AC5+ATP",linetype="AC5+ATP"))
p<-p+geom_density(aes(rmsdV2_4,color="AC5",linetype="AC5"))
p<-p+geom_density(aes(rmsdV2_5,color="AC5+Gi",linetype="AC5+Gs"))
p<-p+geom_density(aes(rmsdV2_6,color="AC5+Gi+ATP",linetype="AC5+Gs+ATP"))
p<-p+xlim(0,2)
#ad legende
p<-p+labs(title="probability distribution of RMSD for C1",x="RMSD(A)", y = "Distribution")
#p<-p+scale_linetype_manual(values=c("solid","solid","solid","solid","dashed","dashed"),guide=guide_legend( nrow=3, byrow= F, title =  "Density" ))
p<-p+scale_linetype_manual("Density", values=c("solid","solid","dashed","dashed","solid","solid"))
p<-p+scale_colour_manual("Density", values =c("blue","red","orange","black","orange","black"))
#####pdf file############
pdf("RMSD_C1_publi.pdf")
print(p)
dev.off()


################################chainB#########################################
######data frame###############
rmsd7<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/rmsdB.xvg", skip=16)
rmsd8<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/rmsdB.xvg", skip=16)
rmsd9<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/rms_B.xvg", skip=16)
rmsd10<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/rms_B.xvg",skip=16)
rmsd11<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1azs_c1c2_golf/md/rms_B.xvg", skip=16)
rmsd12<-read.table(file="/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/rms_B.xvg", skip=16)
#######nm in amstrong#########
rmsdV2_7<-rmsd7$V2*10
rmsdV2_8<-rmsd8$V2*10
rmsdV2_9<-rmsd9$V2*10
rmsdV2_10<-rmsd10$V2*10
rmsdV2_11<-rmsd11$V2*10
rmsdV2_12<-rmsd12$V2*10
########plot cretion###########@
p2=ggplot()
#add density courbe
p2<-p2+geom_density(aes(rmsdV2_7,color="AC5+Gs",linetype="AC5+Gi"))
p2<-p2+geom_density(aes(rmsdV2_8,color="AC5+Gs+ATP",linetype="AC5+Gi+ATP"))
p2<-p2+geom_density(aes(rmsdV2_9,color="AC5+ATP",linetype="AC5+ATP"))
p2<-p2+geom_density(aes(rmsdV2_10,color="AC5",linetype="AC5"))
p2<-p2+geom_density(aes(rmsdV2_11,color="AC5+Gi",linetype="AC5+Gs"))
p2<-p2+geom_density(aes(rmsdV2_12,color="AC5+Gi+ATP",linetype="AC5+Gs+ATP"))
p2<-p2+xlim(0,2)
#ad legende
p2<-p2+labs(title="probability distribution of RMSD for C2",x="RMSD(B)", y = "Distribution")
p2<-p2+scale_linetype_manual("Density", values=c("solid","solid","dashed","dashed","solid","solid"))
p2<-p2+scale_colour_manual("Density", values =c("blue","red","orange","black","orange","black"))
#p2<-p2+scale_x_continuous(labels = scientific)
#####pdf file############
pdf("RMSD_C2_publi.pdf")
print(p2)
dev.off()
