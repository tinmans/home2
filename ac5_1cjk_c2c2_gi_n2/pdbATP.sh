#!/bin/bash
module load gromacs
#ac5_1cjk_c2c2_gi_n2
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-0.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmd0.pdb << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-1.1.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmd11.pdb << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.1.part0001.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmd21.pdb << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.2.part0002.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atp.pdbmd22 << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.3.part0003.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmd23.pdb << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.4.part0004.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmd24.pdb << EOF
1
EOF
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/min.trr -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_atpmin.pdb << EOF
1
EOF
