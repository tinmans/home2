from glob import glob
import string
import re
import math
import os
import struct
import copy


file1=open('tt_a1.dat','r')

fileo=open('angles_h.dat','w')
Listang=[]
for line in file1:
    #time=line[0:16]
    #print line
    #print line[57:66]
    ang=180.0*math.acos(float(line[57:66]))/math.pi
    Listang.append(ang)
    
file1.close()

file1=open('tt_a2.dat','r')


k=-1
for line in file1:
    time=line[0:16]
    #print line
    #print line[57:66]
    ang=180.0*math.acos(float(line[57:66]))/math.pi
    k=k+1
    print k,Listang[k]

    a1='%10.2f'%(Listang[k])
    a2='%10.2f'%ang
    stringa=time+' '+a1+' '+a2
    print stringa
    fileo.write(stringa+'\n')
