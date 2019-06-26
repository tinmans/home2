#!/bin/bash
#use bash version 4.2.46(1)
module load gromacs
#split in three part chainB, in function of the pic observed around 0.7 ms
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainB_splitonpic_part1.xvg -ox chainB_splitonpic_part1.pdb -b 400000 -e 687499 <<-EOF
14
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainB_splitonpic_part2.xvg -ox chainB_splitonpic_part2.pdb -b 687500 -e 775000 <<-EOF
14
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainB_splitonpic_part3.xvg -ox chainB_splitonpic_part3.pdb -b 775001 <<-EOF
14
EOF
#split in two part chainB
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainB_splitintwo_part1.xvg -ox chainB_splitintwo_part1.pdb -b 400000 -e 731250 <<-EOF
14
EOF
gmx rmsf -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -n /home/tamans/home2/ac5_1azs_c2c2_gi_n2/index.ndx -o chainB_splitintwo_part2.xvg -ox chainB_splitintwo_part2.pdb -b 731251 <<-EOF
14
EOF
