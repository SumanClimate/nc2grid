# Makefile for nc2grid
FC = ifort
OPT = -O3
# netCDF libraries
NCINC = /Users/suman/allinstall_intel/include
NCLIB = /Users/suman/allinstall_intel/lib
## Don't touch below this line ##

FFLAGS = $(OPT) -I$(NCINC) -L$(NCLIB) -lnetcdf -lnetcdff
SRC = mod_input.f90 mod_3d.f90 mod_4d.f90 nc2grd.f90
EXE = nc2grd

all :

	$(FC) $(SRC) $(FFLAGS) -o $(EXE)

clean :
	rm -f $(EXE) *.mod
