

! Copyright (C) 2022   Center for Molecular Magnetic Quantum Materials (M2QM),
!                      Quantum Theory Project (QTP),
!                      Department of Physics, University of Florida, Gainesville, FL 32611, USA 
!                      https://efrc.ufl.edu/

      Program CrystalField                          ! calculate crystal field  for Mn12 crystall        
       use Mn12_crystal                         
       use E_field           
       use Plot_results
       call set_crystal_param                       ! crystal parameters
       call calc_xy_mesh                            ! calculate xy mesh
       call calc_efield_xy                          ! calculate E field on xy mesh points
       call plot_E                                  ! write data for plotting
      end program CrystalField







