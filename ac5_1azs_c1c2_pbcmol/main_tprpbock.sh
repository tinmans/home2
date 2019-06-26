#!/bin/bash
#use md_1500_pbcok.xtc and not md_1500.xtc
module load gromacs
path_input=/mobi/group/AC5_Trajectories/ac5_1azs_c1c2/md
path_output=/home/tamans/home2/ac5_1azs_c1c2_pbcmol
#index 
gmx make_ndx -f $path_input/start.gro -o $path_output/index_tprpbock.ndx <<-EOF
	a 1 - 3214
	a 3215 - 6536
	11 & 4
	12 & 4
	q
	EOF
#generated xtc
gmx trjconv -f $path_input/md_1500_pbcok.xtc -s $path_input/md-2.tpr -n $path_output/index_tprpbock.ndx -o $path_output/chainAtprpbock.xtc <<-EOF
13
EOF
gmx trjconv -f $path_input/md_1500_pbcok.xtc -s $path_input/md-2.tpr -n $path_output/index_tprpbock.ndx -o $path_output/chainBtprpbock.xtc <<-EOF
14
EOF
#generated rmsf
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_tprpbock.ndx -o $path_output/rmsf_chainAtprpbock.xvg -ox $path_output/rmsf_chainAtprpbock.pdb -b 400000 <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_tprpbock.ndx -o $path_output/rmsf_chainBtprpbock.xvg -ox $path_output/rmsf_chainBtprpbock.pdb -b 400000 <<-EOF
14
EOF
#generated rmsf residu
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_tprpbock.ndx -o $path_output/rmsf_chainAtprpbock_res.xvg -ox $path_output/rmsf_chainAtprpbock_res.pdb -b 400000 -res <<-EOF
13
EOF
gmx rmsf -s $path_input/md-2.tpr -f $path_input/md_1500_pbcok.xtc -n $path_output/index_tprpbock.ndx -o $path_output/rmsf_chainBtprpbock_res.xvg -ox $path_output/rmsf_chainBtprpbock_res.pdb -b 400000 -res <<-EOF
14
EOF
#generated rmsd 
gmx rms -s $path_output/rmsf_chainAtprpbock.pdb -f $path_output/chainAtprpbock.xtc -o $path_output/rmsd_chainAtprpbock.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
gmx rms -s $path_output/rmsf_chainBtprpbock.pdb -f $path_output/chainBtprpbock.xtc -o $path_output/rmsd_chainBtprpbock.xvg -b 400000 <<-EOF
	0
	0
	q
	EOF
