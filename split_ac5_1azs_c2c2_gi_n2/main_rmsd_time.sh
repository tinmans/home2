#!/bin/bash
#use bash version 4.2.46(1) 
module load R
R CMD BATCH Rmsdtemps_chainA.r
R CMD BATCH Rmsdtemps_chainB.r
