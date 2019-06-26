#http://www.cgl.ucsf.edu/chimera/current/docs/ProgrammersGuide/Examples/Main_ObjectModel.html
import chimera
from chimera import runCommand

model = chimera.openModels.open('test.pdb')
mol = model[0]

print 'Molecule Name %s\n' % mol.name
for res in mol.residues: #molresidus=liste des residus situé dans l'objet molecule
    print "%s%s " % (res.type, res.id) #type et id situé dans l'objet residus

# run a command

#detect protein interface chimera

#https://www.cgl.ucsf.edu/chimera/docs/UsersGuide/midas/frameatom_spec.html

runCommand("zonesel #0:.a,.b 15 #0:.c  ") #tous les r�sidus de la chaine A,B et C  du model 0 par contre le 15 je ne sais pas ce qu'il signifi est ce une cutofff distance????
runCommand("write selected  #0   c.pdb")
runCommand("zonesel #0:.c 15 #0:.a,.b  ")
runCommand("write selected  #0   a.pdb")
#runCommand("write relative #0 #1 aligned.pdb ")

