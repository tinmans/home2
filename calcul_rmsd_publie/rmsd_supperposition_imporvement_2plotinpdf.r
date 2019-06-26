######library########
#install.packages("cowplot")
library(ggplot2)
library(scales)
#library(cowplot)
library(gridExtra)
###################################chain A###################################
######data frame###############
rmsd1<-read.table(file="/home/tamans/home2/ac5_1azs_c2c2_gi_n2/rmsd_chainA.xvg", skip=18)
rmsd2<-read.table(file="/home/tamans/home2/ac5_1cjk_c2c2_gi_n2/rmsd_chainA.xvg", skip=18)
rmsd3<-read.table(file="/home/tamans/home2/ac5_1cjk_c1c2pbock/rmsd_chainApbock.xvg", skip=18)
rmsd4<-read.table(file="/home/tamans/home2/ac5_1azs_c1c2pbock/rmsd_chainApbock.xvg",skip=18)
rmsd5<-read.table(file="/home/tamans/home2/ac5_1azs_c1c2_golfpbock/rmsd_chainApbock.xvg", skip=18)
rmsd6<-read.table(file="/home/tamans/home2/ac5_1cjk_c1c2_golfpbock/rmsd_chainApbock.xvg", skip=18)
#######nm in amstrong#########
rmsdV2_1<-rmsd1$V2*10
rmsdV2_2<-rmsd2$V2*10
rmsdV2_3<-rmsd3$V2*10
rmsdV2_4<-rmsd4$V2*10
rmsdV2_5<-rmsd5$V2*10
rmsdV2_6<-rmsd6$V2*10
########plot creation###########
p1=ggplot()
p2=ggplot()

#add density courbe
p1<-p1+geom_density(aes(rmsdV2_2,color="AC5+Gi+ATP",linetype="AC5+Gi+ATP"))
p1<-p1+geom_density(aes(rmsdV2_3,color="AC5+ATP",linetype="AC5+ATP"))
p1<-p1+geom_density(aes(rmsdV2_6,color="AC5+Gs+ATP",linetype="AC5+Gs+ATP"))
#p1<-p1+xlim(0,2)
p2<-p2+geom_density(aes(rmsdV2_1,color="AC5+Gi",linetype="AC5+Gi"))
p2<-p2+geom_density(aes(rmsdV2_4,color="AC5",linetype="AC5"))
p2<-p2+geom_density(aes(rmsdV2_5,color="AC5+Gs",linetype="AC5+Gs"))
#p2<-p2+xlim(0,2)

#ad legende
p1<-p1+labs(title="Probability of density of RMSD with ATP for C1",x="RMSD(A)", y = "Probability of density")
p1<-p1+scale_linetype_manual("Density", values=c("solid","solid","solid"))
p1<-p1+scale_colour_manual("Density", values =c("blue","pink2","orange"))

p2<-p2+labs(title="Probability of density of RMSD without ATP for C1",x="RMSD(A)", y = "Probability of Density")
p2<-p2+scale_linetype_manual("Density", values=c("solid","solid","solid"))
p2<-p2+scale_colour_manual("Density", values =c("blue","pink2","orange"))

#####pdf file############
pdf("RMSD_2plot_C1.pdf")
#plot<-plot_grid(p1, p2, labels=c("ATP", "Without ATP"),scale=1,nrow=2)
plot<-grid.arrange(p2,p1,nrow=2)
print(plot)
dev.off()


################################chainB#########################################
######data frame###############
rmsd7<-read.table(file="/home/tamans/home2/ac5_1azs_c2c2_gi_n2/rmsd_chainB.xvg", skip=18)
rmsd8<-read.table(file="/home/tamans/home2/ac5_1cjk_c2c2_gi_n2/rmsd_chainB.xvg", skip=18)
rmsd9<-read.table(file="/home/tamans/home2/ac5_1cjk_c1c2pbock/rmsd_chainBpbock.xvg", skip=18)
rmsd10<-read.table(file="/home/tamans/home2/ac5_1azs_c1c2pbock/rmsd_chainBpbock.xvg",skip=18)
rmsd11<-read.table(file="/home/tamans/home2/ac5_1azs_c1c2_golfpbock/rmsd_chainBpbock.xvg", skip=18)
rmsd12<-read.table(file="/home/tamans/home2/ac5_1cjk_c1c2_golfpbock/rmsd_chainBpbock.xvg", skip=18)
#######nm in amstrong#########
rmsdV2_7<-rmsd7$V2*10
rmsdV2_8<-rmsd8$V2*10
rmsdV2_9<-rmsd9$V2*10
rmsdV2_10<-rmsd10$V2*10
rmsdV2_11<-rmsd11$V2*10
rmsdV2_12<-rmsd12$V2*10
########plot cretion###########@
p3=ggplot()
p4=ggplot()

#add density courbe
p3<-p3+geom_density(aes(rmsdV2_7,color="AC5+Gi",linetype="AC5+Gi"))
p3<-p3+geom_density(aes(rmsdV2_10,color="AC5",linetype="AC5"))
p3<-p3+geom_density(aes(rmsdV2_11,color="AC5+Gs",linetype="AC5+Gs"))
#p3<-p3+xlim(0,2)
p4<-p4+geom_density(aes(rmsdV2_8,color="AC5+Gi+ATP",linetype="AC5+Gi+ATP"))
p4<-p4+geom_density(aes(rmsdV2_9,color="AC5+ATP",linetype="AC5+ATP"))
p4<-p4+geom_density(aes(rmsdV2_12,color="AC5+Gs+ATP",linetype="AC5+Gs+ATP"))
#p4<-p4+xlim(0,2)

#ad legende
p3<-p3+labs(title="Probability of density  of RMSD without ATP for C2",x="RMSD(B)", y = "Probability of density")
p3<-p3+scale_linetype_manual("Density", values=c("solid","solid","solid"))
p3<-p3+scale_colour_manual("Density", values =c("blue","pink2","orange"))
#p3<-p3+scale_x_continuous(labels = scientific)
p4<-p4+labs(title="Probability of density of RMSD with ATP for C2",x="RMSD(B)", y = "Probability of density")
p4<-p4+scale_linetype_manual("Density", values=c("solid","solid","solid"))
p4<-p4+scale_colour_manual("Density", values =c("blue","pink2","orange"))


#####pdf file############
pdf("RMSD_2plot_C2.pdf")
#plot<-plot_grid(p3, p4, labels=c("ATP", "Without ATP"),scale=1,nrow=2)
plot<-grid.arrange(p3,p4,nrow=2)
print(plot)
dev.off()
