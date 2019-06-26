#!/bin/bash
#use md_1500_pbcok.xtc and not md_1500.xtc
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1azs_c1c2_golf/md
path_output=/home/tamans/home2/ac5_1azs_c1c2_golfpbock
#index 
gmx make_ndx -f $path_input/start.gro -o $path_output/index_pbock.ndx <<-EOF
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc
gmx trjconv -f $path_input/md_1500_pbcok.xtc -s $path_input/start.gro -n $path_output/index_pbock.ndx -o $path_output/chainApbock.xtc <<-EOF
13
EOF
gmx trjconv -f $path_input/md_1500_pbcok.xtc -s $path_input/start.gro -n $path_output/index_pbock.ndx -o $path_output/chainBpbock.xtc <<-EOF
14
EOF
#generated rmsf
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock.ndx -o $path_output/rmsf_chainApbock.xvg -ox $path_output/rmsf_chainApbock.pdb -b 400000 <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock.ndx -o $path_output/rmsf_chainBpbock.xvg -ox $path_output/rmsf_chainBpbock.pdb -b 400000 <<-EOF
14
EOF
#generated rmsf residu
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock.ndx -o $path_output/rmsf_chainApbock_res.xvg -ox $path_output/rmsf_chainApbock_res.pdb -b 400000 -res <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock.ndx -o $path_output/rmsf_chainBpbock_res.xvg -ox $path_output/rmsf_chainBpbock_res.pdb -b 400000 -res <<-EOF
14
EOF
#generated rmsd 
gmx rms -s $path_output/rmsf_chainApbock.pdb -f $path_output/chainApbock.xtc -o $path_output/rmsd_chainApbock.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
gmx rms -s $path_output/rmsf_chainBpbock.pdb -f $path_output/chainBpbock.xtc -o $path_output/rmsd_chainBpbock.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
#rmsd in function of time
module load R
R CMD BATCH Rmsdtemps.r
