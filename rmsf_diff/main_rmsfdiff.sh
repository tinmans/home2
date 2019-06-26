#!/bin/bash
#use bash version 4.2.46(1) 
module load R
#R CMD BATCH diff_rmsf_AC5.r
R CMD BATCH diff_rmsf.r
#R CMD BATCH diff_rmsftotal.r
