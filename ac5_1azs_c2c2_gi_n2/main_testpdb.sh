#!/bin/bash
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1azs_c2c2_gi_n2/md
path_output=/home/tamans/home2/ac5_1azs_c2c2_gi_n2
#generated index 
gmx make_ndx -f $path_input/start.gro -o $path_output/index_testpdb.ndx <<-EOF 
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc
#gmx trjconv -sep -pbc mol -center -b 670000  -e 670001  -f $path_input/md_1500.xtc -s $path_input/md-2.tpr -n $path_output/index_part1.ndx -o $path_output/chainA_part1.xtc <<-EOF
#	13
#	13
#	q
#	EOF
gmx trjconv -sep -pbc mol -center -b 400000 -e 1500000 -f $path_input/md_1500.xtc -s $path_input/md-2.tpr -n $path_output/index_testpdb.ndx -o $path_output/chainB_testpdb.pdb <<-EOF
	14
	14
	q
	EOF
#generated rmsf
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part1.ndx -o $path_output/rmsf_chainA_part1.xvg -ox $path_output/chainA_avpart1.pdb -b 400000 <<-EOF
#13
#EOF
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part1.ndx -o $path_output/rmsf_chainB_part1.xvg -ox $path_output/chainB_avpart1.pdb -b 400000 <<-EOF
#14
#EOF
#generated rmsf residu
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part1.ndx -o $path_output/rmsf_chainAres_part1.xvg -ox $path_output/chainresA_avpart1.pdb -b 400000 -res <<-EOF
#13
#EOF
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part1.ndx -o $path_output/rmsf_chainBres_part1.xvg -ox $path_output/chainresB_avpart1.pdb -b 400000 -res <<-EOF
#14
#EOF
#generated rmsd
#gmx rms -s $path_output/chainresA_avpart1.pdb -f $path_output/chainA_part1.xtc -o $path_output/rmsd_chainA_part1.xvg -b 400000 <<-EOF
#	0
#	0
#	q
#	EOF
#gmx rms -s $path_output/chainresB_avpart1.pdb -f $path_output/chainB_part1.xtc -o $path_output/rmsd_chainB_part1.xvg -b 400000 <<-EOF
#        0
#        0
#        q
#	EOF
#rmsd in function of time
#module load R
#R CMD BATCH Rmsdtemps_part1.r
