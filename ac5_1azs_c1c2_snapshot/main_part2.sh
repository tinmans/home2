#!/bin/bash
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md
path_output=/home/tamans/home2/ac5_1azs_c1c2_snapshot
#generated index 
gmx make_ndx -f $path_input/start.gro -o $path_output/index_part2.ndx <<-EOF 
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc
gmx trjconv -sep -pbc mol -center -b 750000  -e 750001  -f $path_input/md_1500_pbcok.xtc -s $path_input/md-2.tpr -n $path_output/index_part2.ndx -o $path_output/chainA_part2.pdb <<-EOF
	13
	13
	q
	EOF
#gmx trjconv -sep -pbc mol -center -f $path_input/md_1500.xtc -s $path_input/md-2.tpr -n $path_output/index_part2.ndx -o $path_output/chainB_part2.xtc <<-EOF
#	14
#	14
#	q
#	EOF
#generated rmsf
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part2.ndx -o $path_output/rmsf_chainA_part2.xvg -ox $path_output/chainA_avpart2.pdb -b 400000 <<-EOF
#13
#EOF
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part2.ndx -o $path_output/rmsf_chainB_part2.xvg -ox $path_output/chainB_avpart2.pdb -b 400000 <<-EOF
#14
#EOF
#generated rmsf residu
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part2.ndx -o $path_output/rmsf_chainAres_part2.xvg -ox $path_output/chainresA_avpart2.pdb -b 400000 -res <<-EOF
#13
#EOF
#gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500.xtc -n $path_output/index_part2.ndx -o $path_output/rmsf_chainBres_part2.xvg -ox $path_output/chainresB_avpart2.pdb -b 400000 -res <<-EOF
#14
#EOF
#generated rmsd
#gmx rms -s $path_output/chainresA_avpart2.pdb -f $path_output/chainA_part2.xtc -o $path_output/rmsd_chainA_part2.xvg -b 400000 <<-EOF
#	0
#	0
#	q
#	EOF
#gmx rms -s $path_output/chainresB_avpart2.pdb -f $path_output/chainB_part2.xtc -o $path_output/rmsd_chainB_part2.xvg -b 400000 <<-EOF
#        0
#        0
#        q
#	EOF
#rmsd in function of time
#module load R
#R CMD BATCH Rmsdtemps_part2.r
