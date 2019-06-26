#!/bin/bash
#SBATCH -n 1 # Number of cores
#SBATCH -N 1 # Ensure that all cores are on one machine
#SBATCH -t 0-3:00 # Runtime in D-HH:MM
#SBATCH -p medium # Partition to submit to
#SBATCH --qos medium # Partition to submit to
module load gromacs


#ac5_1azs_c1c2pbock
gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/md_1500_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md/md-2.tpr -o ac5_1azs_c1c2pbock_dt40.pdb -n /home/tamans/home2/test_angle/index_ac5_1azs_c1c2pbock.ndx  -b 400000 -dt 11000 << EOF 
1
EOF

#ac5_1azs_c1c2golf
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1azs_c1c2_golf/md/md_1500_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1azs_c1c2_golf/md/md-2.tpr -o ac5_1azs_c1c2_golfpbock_dt20.pdb -n /home/tamans/home2/test_angle/index_ac5_1azs_c1c2golf.ndx  -b 400000 -dt 20 << EOF 
#11
#EOF

#ac5_1azs_c2c2_gi_n2
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md_1500.xtc -s /mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md/md-2.tpr -o ac5_1azs_c2c2_gi_n2_dt40.pdb -n /home/tamans/home2/test_angle/index_ac5_1azs_c2c2_gi_n2.ndx -b 400000 -dt 40 << EOF 
#11
#EOF

#ac5_1cjk_c1c2pbock
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md_1500_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2/md/md-2.tpr -o ac5_1cjk_c1c2pbock_dt40.pdb -n /home/tamans/home2/ac5_1cjk_c1c2pbock/index_pbock.ndx  -b 400000 -dt 20 << EOF 
#1
#EOF

#ac5_1cjk_c1c2golf
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/md_15000_pbcok.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md/md-2.tpr -o ac5_1cjk_c1c2_golf_pbock_dt40.pdb -n /home/tamans/home2/ac5_1cjk_c1c2_golfpbock/index.ndx  -b 400000 -dt 20 << EOF 
#1
#EOF

# ac5_1cjk_c2c2_gi_n2
#gmx trjconv -f /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md_1500.xtc -s /mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md/md-2.tpr -o ac5_1cjk_c2c2_gi_n2_dt40.pdb -n /home/tamans/home2/test_angle/index_ac5_1cjk_c2c2_gi_n2.ndx -b 400000 -dt 40 << EOF 
#11
#EOF
