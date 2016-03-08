#!/bin/bash 
############################################################################
# Icarus Verilog build script for OH! 
# Requires $OH_HOME variable to be set
############################################################################

DUT=$1

#Create directory of all links
mkdir -p $OH_HOME/symlinks/hdl
mkdir -p $OH_HOME/symlinks/dv
pushd $OH_HOME/symlinks/hdl
ln -s ../../*/hdl/*.v .
cd ../dv
ln -s ../../*/dv/*.v .
popd
exit
#Build
iverilog -g2005\
 -DTARGET_SIM=1\
 $DUT\
 $OH_HOME/symlinks/dv/dv_top.v\
 -y .\
 -y $OH_HOME/symlinks/hdl\
 -y $OH_HOME/symlinks/dv\
 -I $OH_HOME/symlinks/hdl
 -o dut.bin\
