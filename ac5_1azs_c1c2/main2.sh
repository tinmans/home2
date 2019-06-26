#!/bin/bash
#use bash version 4.2.46(1) 
#you want indicated the différents parameters in the argument files for the R graphic script and for rmsd, rmsf and xtc calcul

#####################parsing argument file for the rmsd, xtc  and rmsf calcul######################################
i=0;
declare -A tab_argv;
declare -A tab_chain;
function parseargv()
{

grep -v \# $1 >argfile_new.txt
 

for line in $(cat argfile_new.txt)
do
	if grep -v '^chain_name' <<< $line
		then
		name_argv=$(echo $line |cut -d: -f1);
		value_argv=$(echo $line | cut -d: -f2);
		tab_argv+=([$name_argv]=$value_argv);
	else
		name_argvchain=$(echo $line |cut -d: -f1);
		value_argvchain=$(echo $line | cut -d: -f2);
		tab_chain+=([$name_argvchain]=$value_argvchain);
	fi
done
}
parseargv argfile.txt
#echo ${tab_chain[@]}
#echo ${tab_argv[@]}
#echo "Nombre d'elements" ${#tab_chain[*]}

#######################rmsd, rmsf and xtc calcul####################################

if [ "${tab_argv[calcul_yes_or_no]}" = "yes" ]
then
	module load gromacs
	########index############
	echo "index"
	index_name_file='index.ndx'
	gmx make_ndx -f ${tab_argv[path_input_file]}/${tab_argv[input_gro]} -o ${tab_argv[path_output_file]}/$index_name_file <<-EOF
	a 1 - 3214
	a 3215 - 6536
	a 6537 - 12523
	11 & 4
	12 & 4
	13 & 4
	q
	EOF

	echo "calcul"
	if [ "${tab_argv[chain_total]}" = "yes" ]
	then

		######rmsd total#######
		echo "rmsdtotal"
		xvg_rmsd_name_file='rmsd_chaintotal.xvg'
		gmx rms -s ${tab_argv[path_input_file]}/${tab_argv[input_gro]} -f ${tab_argv[path_input_file]}/${tab_argv[input_xtc_total]} -o ${tab_argv[path_output_file]}/$xvg_rmsd_name_file <<-EOF
		4
		4
		EOF
	else
		echo "calcul for total chain was not asking"
	fi
	for j in ${tab_chain[@]}
	do
		echo "calcul1"
		case "$j" in
			"A")option=13;;
			"B")option=14;;
		esac
			
		#######xtc chain########
		echo "xtcchain"
		xtc_name_file='chain'$j'.xtc'
		gmx trjconv -f ${tab_argv[path_input_file]}/${tab_argv[input_xtc_total]} -s ${tab_argv[path_input_file]}/${tab_argv[input_gro]} -n ${tab_argv[path_output_file]}/$index_name_file -o ${tab_argv[path_output_file]}/$xtc_name_file <<-EOF
		$option 
		EOF
	
		#######rmsf chain####### si besoin de faire des rmsf moyen ajouter le mot total au tableau tab_chain
		echo "rmsfchain"
		xvg_rmsf_name_file='rmsf_chain'$j'.xvg'
		pdb_rmsf_name_file='rmsf_chain'$j'.pdb'
		gmx rmsf -s ${tab_argv[path_input_file]}/${tab_argv[input_tpr_total]} -f ${tab_argv[path_input_file]}/${tab_argv[input_xtc_total]} -n ${tab_argv[path_output_file]}/$index_name_file -o ${tab_argv[path_output_file]}/$xvg_rmsf_name_file -ox ${tab_argv[path_output_file]}/$pdb_rmsf_name_file -b ${tab_argv[start_time_option]} <<-EOF
		$option
		EOF

		#######rmsf residu chain####### si besoin de faire des rmsf moyen ajouter le mot total au tableau tab_chain
		echo "rmsfresidu"
		xvg_rmsfres_name_file='rmsfres_chain'$j'.xvg'
		pdb_rmsfres_name_file='rmsfres_chain'$j'.pdb'
		gmx rmsf -s ${tab_argv[path_input_file]}/${tab_argv[input_tpr_total]} -f ${tab_argv[path_input_file]}/${tab_argv[input_xtc_total]} -n ${tab_argv[path_output_file]}/$index_name_file -o ${tab_argv[path_output_file]}/$xvg_rmsfres_name_file -ox ${tab_argv[path_output_file]}/$pdb_rmsfres_name_file -b ${tab_argv[start_time_option]} -res <<-EOF
		$option
		EOF

		######rmsd chain########
		echo "rmsdchain"
		xvg_rmsd_name_file='rmsd_chain'$j'.xvg'
		gmx rms -s ${tab_argv[path_output_file]}/$pdb_rmsf_name_file -f ${tab_argv[path_output_file]}/$xtc_name_file -o ${tab_argv[path_output_file]}/$xvg_rmsd_name_file -b ${tab_argv[start_time_option]} <<-EOF
		0
		0
		EOF
	done
else
	echo "you have not ask calcul"
fi

if [ "${tab_argv[graph_yes_or_no]}" = "yes" ] 
	then
		echo "graphique"
		module load R
		#specify the differents parameters in the argument files for the R graphic scripts
		R CMD BATCH Rmsdtemps.r
#		R CMD BATCH mean2.r
		R CMD BATCH rmsf_graph2.r
		R CMD BATCH rmsd_supperposition.r
#		R CMD BATCH diff_rmsf.r
	else
		echo "you have not request a graph";
fi

