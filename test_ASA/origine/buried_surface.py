from glob import glob
import copy
import shutil
import subprocess
import os
import re
import string
import struct
import math


Listnch=['A','B','C','D']
Listc=[]
Listnchp=[]
filenew=[]

filetrj=open('traj.pdb','r')
filedat=open('burried_surf_area.dat','w')
for i in range(0,5):
    filenew.append('')
k=0
for i in range(0,2): #pourquoi faire que de 0 a 2 ce qui fait en realité en python i=0 puis i+1 avec un 2 exclusif, cela veut dire que lon peut faire que deux chaines par deux chaines donc , oui cest logique
    ind= raw_input("last chain:") #demande a lutilisateur de choisir une chaine et prend son input en chaine de caractere 
    if(ind=='A'):
        Listc.append(0)
    elif(ind=='B'):
        Listc.append(1)
    elif(ind=='C'):
        Listc.append(2)
    elif(ind=='D'):
        Listc.append(3)    



#ressemble au script volume_surface.py voir si du cout on peut s'affranchir de refaire cette partie 
for line in filetrj:

    if line[0:5]=='MODEL': #si c'est le debut de dune structure sahcant quil y a plusieurs structure vu que lon est avec une trajectoire 
        filepdb=open('complex.pdb',"w")
        k=k+1
        lc=-1
        newchain=True
    elif line[0:4]=='ATOM': 
        if(line[13:15] != "MC" and line[12:15] != "1MN" and line[12:15] != "2MN" ):

            if(line[17:20]=='ACE' and newchain==True): #si c'est le debut de la chaine
                lc=lc+1
                newchain=False
            elif(line[17:20]=='NME'): # si c'est la fin de la chaine 
                newchain=True
                print newchain
            Listnchp.append(lc) #compte le nombre de chaine differente avec une liste de type list=1,1,1,1,2,2,2,2,3,3,3  
            stringa=line[0:21]+Listnch[lc]+line[22:80]
            filepdb.write(stringa)

    elif line[0:6]=='ENDMDL': #si fin du fichier 
        filepdb.close()  
        subprocess.call('/mobi/group/AC5_Trajectories_code/f90/accpdb <in_acc',shell=True) #ai modifier le nom du chemin calcul du ASA grace au script binaire issu du script en fortran je ne comprend pas dou vient le fichier in_acc commment indique que lon veut calculer sur tel ou tel chaine ou complexe ouets largument etant donne que le int_acc sort de null part 
        filen=open('complex.pdb',"r")
        filenew[0]=open('A.pdb','w')
        filenew[1]=open('B.pdb','w')
        kfile=0
        letch=Listc[0] #liste des chaine ici la premiere chaine selectionne par lutilisateur 
        kat=-1
        for line2 in filen: # on fait a partir dici un fichier par chaine 
            kat=kat+1
            if(Listnchp[kat]<=letch): #si le nombre de chaine comptabilise en lisant le pdb est plus petit ou egale a la chaine selectionne apr lutilisateur alors continuer , sassure que lutilisateur a saisie des chaines qui existent dans le fichier pdb de trajectoire
                filenew[kfile].write(line2)
            else:
                kfile=kfile+1
                #print kfile
                letch=Listc[kfile] 
                filenew[kfile].write(line2)
        filenew[1].close() #pourquoi faire filenew[1] si juste avat on a utiliser uen methode automatise avec filenew[variable]
        filenew[0].close()
        filep=open('fort.2','r') #ha bien je ne sais pas d'ou il sort celui la mais permet de resuperer la surface total apparement --> totarea jai trouve dou il pouvais sortir /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi/md/interface_properties/AB_C/fort.2 ou encore /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi/md/interface_properties/A_B/fort.2 cest docn le ficheir fort.2 qui permet de dire sur quoi on trvaail sur quel chaine ce fichier contient les calcul d'accecibilite pour une chaine donnéesont til genere par naccess alors 
        for line2 in filep: 
            if(line2[0:11] =='  Total sac'):
                #print line2
                totarea=float(line2[33:43]) 
        filep.close()
        subprocess.call('/mobi/group/AC5_Trajectories_code/f90/accpdb <in_acc1',shell=True)
        filep=open('fort.2','r')
        for line2 in filep:
            if(line2[0:11] =='  Total sac'):
                #print line2
                totA=float(line2[33:43])
        filep.close()
        subprocess.call('/mobi/group/AC5_Trajectories_code/f90/accpdb <in_acc2',shell=True)
        filep=open('fort.2','r')
        for line2 in filep:
            if(line2[0:11] =='  Total sac'):
                print line2
                totB=float(line2[33:43])

        filep.close()
        burried=(totA+totB-totarea)/2.0
        print burried
        tt="%10.2f"% ((k-1)*4.0) #k le noimbre de structure dans la trajectoire 
        sbur="%12.5f"% (burried) #ne faut il pas diviser apr deux la 
        stringa=tt+' '+sbur
        filedat.write(stringa+'\n')
        
        
        
