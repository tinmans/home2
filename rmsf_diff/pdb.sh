#!/bin/bash
module load gromacs
#ac5_1cjk_c1c2pbock
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md_1500_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md-2.tpr -o ac5_1cjk_c1c2_col.pdb -n /home/tamans/home2/ac5_1cjk_c1c2pbock/index_pbock.ndx  -b 400000 -e 400001 << EOF 
#1
#1
#EOF

# ac5_1cjk_c2c2_gi_n2
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md_1500.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_col.pdb -n /home/tamans/home2/ac5_1cjk_c2c2_gi_n2/index.ndx  -b 400000 -e 400001 << EOF 
#1
#1
#EOF

# ac5_1azs_c2c2_gi_n2
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -o ac5_1azs_c2c2_gi_n2_col.pdb -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx  -b 400000 -e 400001 << EOF 
1
1
EOF
