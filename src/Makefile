# Makefile for LBM-BENCH
#
# Invoke as:
# 	make build=<mic/host>
#
# Copyright 2016 Carlos Rosales Fernandez and The University of Texas at Austin.
#
# This file is part of LBM-BENCH.
#
# LBM-BENCH is free software: you can redistribute it and/or modify it under the
# terms of the GNU GPL version 3 or (at your option) any later version.
#
# LBM-BENCH is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE. See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along with
# LBM-BENCH, in the file COPYING.txt. If not, see <http://www.gnu.org/licenses/>.

SHELL = /bin/sh

MPIFC=mpif90

# Comment out -DLBMIO to get minimal IO (recommended for benchmarking)
CFLAGS=-c -O3 -no-vec -free -openmp #-DLBMIO 
LFLAGS=   -O3 -no-vec       -openmp 

INSTALL_DIR=../bin

ARCH=-xHOST
ifeq ($(build),mic)
	ARCH=-mmic
	EXT=.mic
else
	ARCH=-xHOST	 
endif
CFLAGS += $(ARCH)
LFLAGS += $(ARCH)

#Object files
OBJS = common.o main.o collision.o finalsave.o init.o memalloc.o parameters.o relaxstats.o postcollision.o poststream.o stats.o stream.o vgrid.o vtksave.o

#Link into an excutable
LBM : $(OBJS); $(MPIFC) $(LFLAGS) $(OBJS) -o lbs$(EXT)

#Compile the common modules
common.o : common.F90; $(MPIFC) $(CFLAGS) common.F90

#Compile the subroutines
main.o           : main.F90 common.F90 collision.F90 finalsave.F90        \
                   init.F90 memalloc.F90 parameters.F90 postcollision.F90 \
                   poststream.F90 relaxstats.F90 stats.F90 stream.F90     \
                   vgrid.F90 vtksave.F90; $(MPIFC) $(CFLAGS) main.F90
collision.o      : common.F90 collision.F90;  $(MPIFC) $(CFLAGS) collision.F90
finalsave.o      : common.F90 finalsave.F90;  $(MPIFC) $(CFLAGS) finalsave.F90
init.o           : common.F90 init.F90;       $(MPIFC) $(CFLAGS) init.F90
memalloc.o       : common.F90 memalloc.F90;   $(MPIFC) $(CFLAGS) memalloc.F90
parameters.o     : common.F90 parameters.F90; $(MPIFC) $(CFLAGS) parameters.F90
relaxstats.o     : common.F90 relaxstats.F90; $(MPIFC) $(CFLAGS) relaxstats.F90
stats.o          : common.F90 stats.F90;      $(MPIFC) $(CFLAGS) stats.F90
stream.o         : common.F90 stream.F90;     $(MPIFC) $(CFLAGS) stream.F90
vgrid.o          : common.F90 vgrid.F90;      $(MPIFC) $(CFLAGS) vgrid.F90
vtksave.o        : common.F90 vtksave.F90;    $(MPIFC) $(CFLAGS) vtksave.F90
postcollision.o  : common.F90 postcollision.F90; $(MPIFC) $(CFLAGS) postcollision.F90
poststream.o     : common.F90 poststream.F90;    $(MPIFC) $(CFLAGS) poststream.F90

#Build options
build: LBM

install:
	mkdir -p $(INSTALL_DIR)
	mv -v ./lbs$(EXT) $(INSTALL_DIR)
	cp -v ../input/*.in $(INSTALL_DIR)

clean:
	-rm -f ./*.o ./*.mod

mrMonk:
	mkdir -p $(INSTALL_DIR)
	mv -v ./lbs$(EXT) $(INSTALL_DIR)
	rm -f ./*.o ./*.mod



