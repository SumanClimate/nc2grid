This code converts netcdf 3D and 4D variable to binary format which you can open using grads .ctl file. It is written in fortran language which can be compiled using any fortran compiler. Here I used intel fortran compiler. It also needs netcdf library to compile.
## Installation:
Change the variable "NCINC" and "NCLIB" in Makefile to provide the netcdf include and lib directory respectively. Then "make". It wil create an executable binary "nc2grid".
## How to run:
./nc2grid\
****************************************\
 syntax to run:
 nc2grid <file> <dims (3 or 4)> <varname> <output>\
 file: Name of the file to process\
 dims (3 or 4): dimension of the variable to process\
 varname: Variable name\
 output: Name of the output file
****************************************\n
 For example let's consider an netcdf file (xyz.nc) which contains a 3D variable abc(time,lat,lon). Then
 ./nc2grid xyz.nc 3 abc xyz.grd
 will create the corresponding binary file. To open it in grads generate the following xyz.ctl file
DSET       xyz.grd
TITLE      Test
OPTIONS YREV
UNDEF      -999.0
XDEF      144 LINEAR  0 2.5
YDEF       73 LINEAR  -90 2.5
ZDEF         1 LINEAR 1 1
TDEF        12 LINEAR 12Z15jan2015 1mo
VARS        1
test_var        1 9  test
ENDVARS
save it. Put the XDEF, YDEF form the netcdf file and don't forget to use OPTIONS YREV as netcdf considers latitude 90 to -90 but grads consider -90 to 90.
