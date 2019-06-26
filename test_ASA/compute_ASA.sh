FILE=$1
CHAIN1=$2
CHAIN2=$3


module load naccess



# separate chains
awk -vC=$CHAIN1 'BEGIN{FS=""}{if( ($1$2$3$4=="ATOM" || $1$2$3$4$5$6=="HETATM") && $16$17$18$19$20!="HOH" && $22==C ){print $0}}'  $FILE > chain$CHAIN1.pdb
awk -vC=$CHAIN2 'BEGIN{FS=""}{if( ($1$2$3$4=="ATOM" || $1$2$3$4$5$6=="HETATM") && $16$17$18$19$20!="HOH" && $22==C ){print $0}}'  $FILE > chain$CHAIN2.pdb
cat chain$CHAIN1.pdb chain$CHAIN2.pdb > complex.pdb


# CHAIN1 alone
naccess chain$CHAIN1.pdb > naccess.log
ASA1=`grep TOTAL chain$CHAIN1.rsa | awk '{print $2}'`
ASA1_HYD=`grep TOTAL chain$CHAIN1.rsa | awk '{print $5}'`

# CHAIN2 alone
naccess chain$CHAIN2.pdb >>naccess.log
ASA2=`grep TOTAL chain$CHAIN2.rsa | awk '{print $2}'`
ASA2_HYD=`grep TOTAL chain$CHAIN2.rsa | awk '{print $5}'` 

# CHAIN1+CHAIN2
naccess complex.pdb >> naccess.log
ASA3=`grep TOTAL complex.rsa | awk '{print $2}'`
ASA3_HYD=`grep TOTAL complex.rsa | awk '{print $5}'`

# if the complex is too big, redo the computation on a restricted portion of the complex
if test -z $ASA3 
    then
#    echo "load $FILE
#   select H, hydro or resname hoh
#   remove H
#   remove not (alt ''+A)
#   select a1,  chain $CHAIN1 within 50 from chain $CHAIN2
#   select a2, chain $CHAIN2 within 50 from chain $CHAIN1
#   select inter, a1 or a2
#   save restricted.pdb , inter
#   quit
#   " > temp.pml
#pymol -c temp.pml >/dev/null
cp $FILE temp.pdb

# CHAIN1 alone
    awk -vC=$CHAIN1 'BEGIN{FS=""}{if( ($1$2$3$4=="ATOM" || $1$2$3$4$5$6=="HETATM") && $16$17$18$19$20!="HOH" && $22==C ){print $0}}'  restricted.pdb > chain$CHAIN1.pdb
    naccess chain$CHAIN1.pdb > naccess.log
    ASA1=`grep TOTAL chain$CHAIN1.rsa | awk '{print $2}'`
    ASA1_HYD=`grep TOTAL chain$CHAIN1.rsa | awk '{print $5}'`
    
# CHAIN2 alone
    awk -vC=$CHAIN2 'BEGIN{FS=""}{if( ($1$2$3$4=="ATOM" || $1$2$3$4$5$6=="HETATM") && $16$17$18$19$20!="HOH" && $22==C ){print $0}}'  restricted.pdb > chain$CHAIN2.pdb
    naccess chain$CHAIN2.pdb >>naccess.log
    ASA2=`grep TOTAL chain$CHAIN2.rsa | awk '{print $2}'`
    ASA2_HYD=`grep TOTAL chain$CHAIN2.rsa | awk '{print $5}'` 
    
# CHAIN1+CHAIN2
    cat chain$CHAIN1.pdb chain$CHAIN2.pdb > complex.pdb
    naccess complex.pdb >> naccess.log
    
    ASA3=`grep TOTAL complex.rsa | awk '{print $2}'`
    ASA3_HYD=`grep TOTAL complex.rsa | awk '{print $5}'`
    
    if test -z $ASA3
	then
	echo buried surface NA
       echo buried hydrophobic surface NA
       exit
    fi
    
fi


SURF=`echo $ASA1 $ASA2 $ASA3 | awk '{print ($1+$2-$3)/2}'`

#SURF=`echo $ASA1 $ASA2 $ASA3 `

SURF_HYD=`echo $ASA1_HYD $ASA2_HYD $ASA3_HYD | awk '{print ($1+$2-$3)/2}'`

echo buried surface $SURF
echo buried hydrophobic surface $SURF_HYD

#rm -f naccess.log chain$CHAIN1.pdb chain$CHAIN2.pdb temp.pdb  chain$CHAIN1.rsa chain$CHAIN2.rsa complex.rsa   chain$CHAIN1.asa chain$CHAIN2.asa complex.asa chain$CHAIN1.log chain$CHAIN2.log complex.log complex.pdb 
