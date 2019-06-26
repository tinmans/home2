#!/bin/bash
#use md_1500_solute_ok.trr and not md_1500.xtc
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1cjk_c1c2_golf/md
path_output=/home/tamans/home2/ac5_1cjk_c1c2_golfpbock
#generated xtc
gmx trjconv -f $path_input/md_1500_solute_ok.trr -s $path_input/md-2.tpr -o $path_output/atp14_pbock.xtc <<-EOF
14
q
EOF
gmx trjconv -f $path_input/md_1500_solute_ok.trr -s $path_input/md-2.tpr -o $path_output/atp19_pbock.xtc <<-EOF
20
q
EOF
#generated rmsf
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_solute_ok.trr  -o $path_output/rmsf_atp14pbock.xvg -ox $path_output/rmsf_atp14pbock.pdb -b 400000 <<-EOF
14
q
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_solute_ok.trr -o $path_output/rmsf_atp19pbock.xvg -ox $path_output/rmsf_atp19pbock.pdb -b 400000 <<-EOF
20
q
EOF
#generated rmsf residu
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_solute_ok.trr -o $path_output/rmsf_atp14pbock_res.xvg -ox $path_output/rmsf_atp14pbock_res.pdb -b 400000 -res <<-EOF
14
q
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_solute_ok.trr  -o $path_output/rmsf_atp19pbock_res.xvg -ox $path_output/rmsf_atp19pbock_res.pdb -b 400000 -res <<-EOF
20
q
EOF
#generated rmsd 
gmx rms -s $path_output/rmsf_atp14pbock.pdb -f $path_output/atp14_pbock.xtc -o $path_output/rmsd_atp14pbock.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
gmx rms -s $path_output/rmsf_atp19pbock.pdb -f $path_output/atp19_pbock.xtc -o $path_output/rmsd_atp19pbock.xvg -b 400000 <<-EOF
        0
        0
        q
        EOF
