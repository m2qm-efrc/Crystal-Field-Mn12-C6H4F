# Electric field in [Mn<sub>12</sub>-C<sub>6</sub>H<sub>4</sub>F] SMM crystal

Program [src/CrystalField.f90](src/CrystalField.f90) to calculate electric field in the crystal of Mn<sub>12</sub>-C<sub>6</sub>H<sub>4</sub>F with crystal parameters taken from [Inorg. Chem., 2017,  56, 10706](https://doi.org/10.1021/acs.inorgchem.7b01676). The explanation of the calculations is in the [E_field_crystal.pdf](https://github.com/Dmitry-Skachkov/Crystal-Field-Mn12-C6H4F/blob/main/E_field_crystal.pdf)

![GitHub Logo](https://github.com/Dmitry-Skachkov/Crystal-Field-Mn12-C6H4F/blob/main/figs/E_field_2_log_31.jpg)

**Figure.** Electric field in Mn<sub>12</sub>-C<sub>6</sub>H<sub>4</sub>F crystal. The upper part of the figure shows the crystal schematically with blue dots as [Mn12]-, and red dots as positively charged counterions. Mn atoms are purple balls. Oxygen and carbon atoms are at vertices of red and grey bars, correspondingly. Hydrogen and fluorine atoms are at the open ends of white and green bars, correspondingly. Four water molecules are shown as blue-white sticks. Four carboxylate groups O<sub>2</sub>C-C<sub>6</sub>H<sub>4</sub>F in front and four at back of the molecule are removed for clarity.

For more details see [DOI](DOI)

# Compilation of the code

Load appropriate Fortran compiler
> module load <gnu, pgi, or intel compilers>

Correct [*makefile*](src/makefile) for used compiler and compile the program

> make

# Run 

> CrystalField

The data for plotting will be saved into the file *Efield.dat*

