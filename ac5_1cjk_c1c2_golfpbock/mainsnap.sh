[tamans@arwen ac5_1azs_c1c2_snapshot]$ vim main_part1.sh

#!/bin/bash
module load gromacs
#generated pdb
#ac5_1cjk_c1c2golf
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/md_15000_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/md-2.tpr -o ac5_1cjk_c1c2_golf_pbock_dt10.pdb -n /home/tamans/home2/ac5_1cjk_c1c2_golfpbock/index.ndx  -b 400000 -e 400001 << EOF 
4
4
EOF
