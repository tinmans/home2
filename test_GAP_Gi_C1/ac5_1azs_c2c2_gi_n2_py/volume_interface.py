from glob import glob
import copy
import shutil
import subprocess
import os
import re
import string
import struct
import math

subprocess.call('module load chimera/current',shell=True)
subprocess.call('module load SURFNET/current',shell=True)

Listnch=['A','B','C','D']
filedat=open('interface_volume.dat','w')
filetrj=open('/home/tamans/home2/test_angle/ac5_1azs_c2c2_gi_n2_dt40_BC.pdb','r')
k=0

for line in filetrj:

    if line[0:5]=='MODEL':
        filepdb=open('test.pdb',"w")
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
            stringa=line[0:21]+Listnch[lc]+line[22:80]
            filepdb.write(stringa)

    elif line[0:6]=='ENDMDL':
        filepdb.close()  
        subprocess.call('/software/mobi/chimera/1.10.1/bin/chimera -n interface.py',shell=True)
        file1=open('a.pdb','r')
        fileint=open('int.pdb','w')
        lll=0
        for line2 in file1:
            if(line2[0:4]=='ATOM' or line2[0:6]=='HETATM'):
                lll=lll+1
                #print line2
                natom=line2[6:12]
                fileint.write(line2)
                if(lll==1):
                    natom1s=natom
        natom1e=natom
        file1=open('c.pdb','r')
        lll=0
        for line2 in file1:
            if(line2[0:4]=='ATOM' or line2[0:6]=='HETATM'):
                lll=lll+1  
                fileint.write(line2)
                #print line2
                natom=line2[6:12]
                if(lll==1):
                    natom2s=natom
        natom2e=natom
        fileint.close()
	filein=open('surfnet_template.par','r')
        fileinnew=open('surfnet.par','w')
        for line2 in filein:
            #print line2
            if (line2[0:7]=='protein'):
                print line2
                stringa=line2[0:16]+natom1s+'  '+natom1e+line2[30:75]
                fileinnew.write(stringa)
            elif(line2[0:9]=='inhibitor'):
                stringa=line2[0:16]+natom2s+'  '+natom2e+line2[30:75]        
                fileinnew.write(stringa)
            else:
                fileinnew.write(line2)
        
	fileinnew.close()
        subprocess.call('/software/mobi/SURFNET/20150330/bin/surfnet',shell=True)

        filevol=open('gaps.pdb','r')
        sumv=0
        
        for line2 in filevol:
            sumv=sumv+float(line2[70:80])
        tt="%10.2f"% ((k-1)*4.0)
        svol="%12.5f"% (sumv)
        filevol.close()
        stringa=tt+' '+svol
        filedat.write(stringa+'\n')
       


