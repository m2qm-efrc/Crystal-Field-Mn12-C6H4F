default: CrystalField

include make.gfortran                 # use GNU compiler
#include make.pgi                     # use PGI NVIDIA compiler
#include make.intel                   # use Intel compiler

OBJS = obj/Mn12_crystal.o   obj/E_field.o   obj/Plot_results.o   obj/CrystalField.o

CrystalField: $(OBJS)
	$(FC) $(FFLAGS) -o ~/bin/CrystalField $(OBJS)

clean:
	rm -rf ~/bin/CrystalField obj/*.o obj/*.mod

Plot_results.o:       Mn12_crystall.o
E_field.o:            Mn12_crystall.o
CrystalField.o:       E_field.o Mn12_crystal.o Plot_results.o



