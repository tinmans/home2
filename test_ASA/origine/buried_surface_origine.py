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
for i in range(0,2):
    ind= raw_input("last chain:")
    if(ind=='A'):
        Listc.append(0)
    elif(ind=='B'):
        Listc.append(1)
    elif(ind=='C'):
        Listc.append(2)
    elif(ind=='D'):
        Listc.append(3)    

for line in filetrj:

    if line[0:5]=='MODEL':
        filepdb=open('complex.pdb',"w")
        k=k+1
        lc=-1
        newchain=True
    elif line[0:4]=='ATOM':
        if(line[13:15] != "MC" and line[12:15] != "1MN" and line[12:15] != "2MN" ):

            if(line[17:20]=='ACE' and newchain==True):
                lc=lc+1
                newchain=False
            elif(line[17:20]=='NME'):
                newchain=True
                print newchain
            Listnchp.append(lc)  
            stringa=line[0:21]+Listnch[lc]+line[22:80]
            filepdb.write(stringa)

    elif line[0:6]=='ENDMDL':
        filepdb.close()  
        subprocess.call('/media/elisaf/disk1/HumanBrain/f90/accpdb <in_acc',shell=True)
        filen=open('complex.pdb',"r")
        filenew[0]=open('A.pdb','w')
        filenew[1]=open('B.pdb','w')
        kfile=0
        letch=Listc[0]
        kat=-1
        for line2 in filen:
            kat=kat+1
            if(Listnchp[kat]<=letch):
                filenew[kfile].write(line2)
            else:
                kfile=kfile+1
                #print kfile
                letch=Listc[kfile]
                filenew[kfile].write(line2)
        filenew[1].close()
        filenew[0].close()
        filep=open('fort.2','r')
        for line2 in filep:
            if(line2[0:11] =='  Total sac'):
                #print line2
                totarea=float(line2[33:43])
        filep.close()
        subprocess.call('/media/elisaf/disk1/HumanBrain/f90/accpdb <in_acc1',shell=True)
        filep=open('fort.2','r')
        for line2 in filep:
            if(line2[0:11] =='  Total sac'):
                #print line2
                totA=float(line2[33:43])
        filep.close()
        subprocess.call('/media/elisaf/disk1/HumanBrain/f90/accpdb <in_acc2',shell=True)
        filep=open('fort.2','r')
        for line2 in filep:
            if(line2[0:11] =='  Total sac'):
                print line2
                totB=float(line2[33:43])

        filep.close()
        burried=(totA+totB-totarea)/2.0
        print burried
        tt="%10.2f"% ((k-1)*4.0)
        sbur="%12.5f"% (burried)
        stringa=tt+' '+sbur
        filedat.write(stringa+'\n')
        
        
        
