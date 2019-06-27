#!/bin/bash
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 0-10:00 # Runtime in D-HH:MM
#SBATCH -p medium # Partition to submit to
#SBATCH --qos medium # Partition to submit to
module load gromacs
module load naccess
module load pymol/current
module load SURFNET/current
#module load chimera/current


printenv

WORKDIR=/home/tamans/home2/test_ASA/ac5_1azs_c2c2_gi_n2
SLURM_SUBMIT_DIR=/mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md
SLURM_SUBMIT=/home/tamans/home2/ac5_1azs_c2c2_gi_n2
TPR_FILE=/mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr
COMPUTE_FILE=/home/tamans/home2/test_ASA
cd $WORKDIR

if [ ! -e $WORKDIR/snap_ac5_1azs_c2c2_gi_n2999.pdb ]
then
echo "workdir $WORKDIR"
echo "slurm $SLURM_SUBMIT_DIR"
#write frames every 1 ns
gmx trjconv -sep  -pbc mol -f $SLURM_SUBMIT_DIR/md_1500.xtc -o snap_ac5_1azs_c2c2_gi_n2.pdb -n $SLURM_SUBMIT/index.ndx  -center -s $TPR_FILE  -skip 100 -b 400000 << EOF 
1
1
EOF
echo "----"
ls
echo "----"


i=0
if [ ! -e snap_ac5_1azs_c2c2_gi_n2$i.pdb ]
then
echo "something went wrong with trjconv, cannot find snap$i.pdb"
exit 1
fi


while [ -e snap_ac5_1azs_c2c2_gi_n2$i.pdb ] 
do
if [ ! -e $WORKDIR/chain$CHAIN1.pdb ] && [ ! -e $WORKDIR/chain$CHAIN2.pdb ]
then
echo snap$i.pdb
export SRC_DIR=/mobi/group/PIPELINE_COMPLEX_2016/src
export PDB_FILE=snap_ac5_1azs_c2c2_gi_n2$i
export CHAIN1=A
export CHAIN2=B
export DIST=5 #a voir #########

ASA=`$COMPUTE_FILE/compute_ASA.sh snap_ac5_1azs_c2c2_gi_n2$i.pdb $CHAIN1 $CHAIN2 `
mv naccess.log naccess_t$i.log
mv chain$CHAIN1.pdb chain$CHAIN1\_t$i.pdb
mv chain$CHAIN2.pdb chain$CHAIN2\_t$i.pdb
mv temp.pdb temp_t$i.pdb
mv chain$CHAIN1.rsa chain$CHAIN1\_t$i.rsa
mv chain$CHAIN2.rsa chain$CHAIN2\_t$i.rsa
mv complex.rsa complex_t$i.rsa
mv chain$CHAIN1.asa chain$CHAIN1\_t$i.asa
mv chain$CHAIN2.asa chain$CHAIN2\_t$i.asa
mv complex.asa complex_t$i.asa
mv chain$CHAIN1.log chain$CHAIN1\_t$i.log 
mv chain$CHAIN2.log chain$CHAIN2\_t$i.log
mv complex.log complex_t$i.log
mv complex.pdb complex_t$i.pdb


echo $i $ASA >> result.txt 
fi

i=`expr $i + 1`
done

if [ ! -d $WORKDIR/ASA ]
then
mkdir $WORKDIR/ASA
fi

cat result.txt >>  $WORKDIR/ASA/asa.txt 
rm result.txt
#cp chain_$CHAIN1.pdb $WORKDIR/ASA
#rm chain_$CHAIN2.pdb
#cp $WORKDIR/ASA/asa.txt ./input.txt 

else 
echo $WORKDIR/snap_ac5_1azs_c2c2_gi_n2999.pdb already exists, nothing to do. 
fi
