import chimera
from chimera import runCommand

model = chimera.openModels.open('test.pdb')
mol = model[0]

print 'Molecule Name %s\n' % mol.name
for res in mol.residues:
    print "%s%s " % (res.type, res.id)

# run a command

#detect protein interface chimera

runCommand("zonesel #0:.a 15 #0:.b  ")
runCommand("write selected  #0   b.pdb")
runCommand("zonesel #0:.b 15 #0:.a  ")
runCommand("write selected  #0   a.pdb")
#runCommand("write relative #0 #1 aligned.pdb ")

