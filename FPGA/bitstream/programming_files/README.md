=====================================================
FPGA Programming Files
=====================================================

This directory contains generated FPGA programming
artifacts from Quartus compilation.

Files:
------
cpu_top.sof  -> SRAM Object File
cpu_top.pof  -> Programming Object File
cpu_top.rbf  -> Raw Binary File

Usage:
------
SOF :
    Used for direct FPGA configuration.

POF :
    Used for flash programming.

RBF :
    Used for remote updates and embedded loading.

Generated Using:
----------------
Intel Quartus Prime
Intel Quartus Programmer

Target Device:
--------------
Cyclone V FPGA