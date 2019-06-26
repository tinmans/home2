#!/bin/bash
module load gromacs
#generated pdb
#ac5_1azs_c1c2
gmx trjconv -sep -pbc mol -f /mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/md_1500_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/md-2.tpr -o ac5_1azs_c1c2_pbock_snap.pdb -n /home/tamans/home2/ac5_1azs_c1c2pbock/index_pbock.ndx  -center -b 400000 -e 400001 << EOF 
1
1
EOF
