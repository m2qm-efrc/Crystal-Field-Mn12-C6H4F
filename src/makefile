default: CrystallField

include make.intel                    # use Intel compiler
#include make.gfortran               # use GNU compiler
#include make.pgi                     # use PGI NVIDIA compiler

OBJS = obj/Mn12_crystall.o   obj/E_field.o   obj/Plot_results.o obj/CrystallField.o

CrystallField: $(OBJS)
	$(FC) $(FFLAGS) -o ~/owens/bin/CrystallField $(OBJS)

clean:
	rm -rf ~/owens/bin/CrystallField obj/*.o obj/*.mod

Plot_results.o:       Mn12_crystall.o
E_field.o:            Mn12_crystall.o
CrystallField.o:      E_field.o Mn12_crystall.o Plot_results.o



