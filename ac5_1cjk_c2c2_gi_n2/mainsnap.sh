#!/bin/bash
module load gromacs
#generated pdb
#ac5_1cjk_c2c2_gi_n2
gmx trjconv -sep -pbc mol -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md_1500.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_snap.pdb -n /home/tamans/home2/ac5_1cjk_c2c2_gi_n2/index.ndx -center -b 400000 -e 400001 << EOF 
1
1
EOF
#/home/tamans/home2/ac5_1cjk_c2c2_gi_n2/index.ndx 
