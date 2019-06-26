#!/bin/bash
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1cjk_c2c2_gi_n2/md
path_output=/home/tamans/home2/ac5_1cjk_c2c2_gi_n2
#generated index 
gmx make_ndx -f $path_input/start.gro -o $path_output/index.ndx <<-EOF 
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc
gmx trjconv -f $path_input/md_1500.xtc -s $path_input/start.gro -n $path_output/index.ndx -o $path_output/chainA.xtc <<-EOF
13
EOF
gmx trjconv -f $path_input/md_1500.xtc -s $path_input/start.gro -n $path_output/index.ndx -o $path_output/chainB.xtc <<-EOF
14
EOF
#generated rmsf
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index.ndx -o $path_output/rmsf_chainA.xvg -ox $path_output/chainA_av.pdb -b 400000 <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index.ndx -o $path_output/rmsf_chainB.xvg -ox $path_output/chainB_av.pdb -b 400000 <<-EOF
14
EOF
#generated rmsf residu
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index.ndx -o $path_output/rmsf_chainAres.xvg -ox $path_output/chainAres_av.pdb -b 400000 -res <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index.ndx -o $path_output/rmsf_chainBres.xvg -ox $path_output/chainBres_av.pdb -b 400000 -res <<-EOF
14
EOF
#generated rmsd
gmx rms -s $path_output/chainAres_av.pdb -f $path_output/chainA.xtc -o $path_output/rmsd_chainA.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
gmx rms -s $path_output/chainBres_av.pdb -f $path_output/chainB.xtc -o $path_output/rmsd_chainB.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
#rmsd in function of time
module load R
R CMD BATCH Rmsdtemps.r



