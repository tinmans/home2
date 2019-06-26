#!/bin/bash
#use bash version 4.2.46(1)
module load gromacs
#split in two part chainA 
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitintwo_part1.xvg -ox chainA_splitintwo_part1.pdb -b 400000 -e 950000 <<-EOF
13
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitintwo_part2.xvg -ox chainA_splitintwo_part2.pdb -b 950001 <<-EOF
13
EOF
#split in four part chainA
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitinfour_part1.xvg -ox chainA_splitinfour_part1.pdb -b 400000 -e 575000 <<-EOF
13
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitinfour_part2.xvg -ox chainA_splitinfour_part2.pdb -b 575001 -e 950000 <<-EOF
13
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitinfour_part3.xvg -ox chainA_splitinfour_part3.pdb -b 950001 -e 1350000 <<-EOF
13
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainA_splitinfour_part4.xvg -ox chainA_splitinfour_part4.pdb -b 1350001 <<-EOF
13
EOF
