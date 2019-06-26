#!/bin/bash
#use bash version 4.2.46(1)
module load gromacs
#generated index
path_input=/mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md
path_output=/home/tamans/home2/ac5_1azs_c1c2_pbcmol
#generated index
gmx make_ndx -f $path_input/start.gro -o $path_output/index_pbock_pbccenter.ndx <<-EOF
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc 
gmx trjconv -pbc mol -center -f $path_input/md_1500_pbcok.xtc -s $path_input/md-2.tpr -n $path_output/index_pbock_pbccenter.ndx -o $path_output/chainA_pbock_pbccenter.xtc <<-EOF
	13
	13
	q
	EOF
gmx trjconv -pbc mol -center -f $path_input/md_1500_pbcok.xtc -s $path_input/md-2.tpr -n $path_output/index_pbock_pbccenter.ndx -o $path_output/chainB_pbock_pbccenter.xtc <<-EOF
	14
	14
	q
	EOF
#generated rmsf
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock_pbccenter.ndx -o $path_output/rmsf_chainA_pbock_pbccenter.xvg -ox $path_output/chainA_av_pbock_pbccenter.pdb -b 400000 <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock_pbccenter.ndx -o $path_output/rmsf_chainB_pbock_pbccenter.xvg -ox $path_output/chainB_av_pbock_pbccenter.pdb -b 400000 <<-EOF
14
EOF
#generated rmsf residu
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock_pbccenter.ndx -o $path_output/rmsf_chainAres_pbock_pbccenter.xvg -ox $path_output/chainAres_av_pbock_pbccenter.pdb -b 400000 -res <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_pbock_pbccenter.ndx -o $path_output/rmsf_chainBres_pbock_pbccenter.xvg -ox $path_output/chainBres_av_pbock_pbccenter.pdb -b 400000 -res <<-EOF
14
EOF
#generated rmsd
gmx rms -s $path_output/chainA_av_pbock_pbccenter.pdb -f $path_output/chainA_pbock_pbccenter.xtc -o $path_output/rmsd_chainA_pbock_pbccenter.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
gmx rms -s $path_output/chainB_av_pbock_pbccenter.pdb -f $path_output/chainB_pbock_pbccenter.xtc -o $path_output/rmsd_chainB_pbock_pbccenter.xvg -b 400000 <<-EOF
        0
        0
        q
	EOF
