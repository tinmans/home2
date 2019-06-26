#!/bin/bash
module load gromacs
path_input=/mobi/group/AC5_Trajectories
path_output=/home/tamans/home2/test_angle
#index 
gmx make_ndx -f $path_input/ac5_1azs_c1c2/md/start.gro -o $path_output/index_ac5_1azs_c1c2pbock.ndx <<-EOF
	a 1 - 6537
	q
	EOF
gmx make_ndx -f $path_input/ac5_1azs_c1c2_golf/md/start.gro -o $path_output/index_ac5_1azs_c1c2golf.ndx <<-EOF
	a 1 - 6537
	q
	EOF
gmx make_ndx -f $path_input/ac5_1azs_c2c2_gi_n2/md/start.gro -o $path_output/index_ac5_1azs_c2c2_gi_n2.ndx <<-EOF
	a 1 - 6536
	q
	EOF
gmx make_ndx -f $path_input/ac5_1cjk_c2c2_gi_n2/md/start.gro -o $path_output/index_ac5_1cjk_c2c2_gi_n2.ndx <<-EOF
	a 1 - 6536
	q
	EOF
