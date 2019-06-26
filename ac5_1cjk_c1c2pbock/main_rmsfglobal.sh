#!/bin/bash
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md
path_output=/home/tamans/home2/ac5_1cjk_c1c2pbock
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock.ndx -o $path_output/rmsf_chaintotalpbock_res.xvg -ox $path_output/rmsf_chaintotalpbock_res.pdb -b 400000 -res <<-EOF
4
EOF
#you can use -b 1000000 to compare with  elisa
