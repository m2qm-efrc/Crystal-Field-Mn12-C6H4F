

   Module Mn12_crystal
       integer, parameter   :: Nx = 101                  ! number of points in X
       integer, parameter   :: Ny = 101                  ! number of points in Y
       real(8)              :: X1(Nx)                    ! x mesh
       real(8)              :: Y1(Ny)                    ! y mesh
       real(8)              :: EF(3,Nx,Ny)               ! E field on xy mesh
       real(8)              :: a,b,c                     ! lattice constant
       real(8)              :: E1(3),E(3)                ! electric field at A1 and A2 
       real(8)              :: v3(3),rx                  ! unity radius vector r and the length of r
       real(8)              :: rq(3)                     ! position of point charge      
       real(8)              :: rSMM1(3)                  ! position of 1st SMM in the crystall               
       real(8)              :: rSMM2(3)                  ! position of 2nd SMM in the crystall               
       real(8)              :: rion1(3)                  ! position of 1st counterion in the crystall               
       real(8)              :: rion2(3)                  ! position of 2nd counterion in the crystall               
   contains






      subroutine set_crystal_param                       ! set parameters of the crystal
       a = 17.41d0
       b = 17.41d0
       c = 23.87d0
       rSMM1(1:3) = 0.d0                                 ! 1st SMM in the crystall
       rSMM2(1) = a/2.d0                                 ! 2nd SMM in the crystall
       rSMM2(2) = b/2.d0
       rSMM2(3) = c/2.d0
       rion1(1) = a/2.d0                                 ! 1st counterion in the crystall
       rion1(2) = b/2.d0
       rion1(3) = 0.d0
       rion2(1) = 0.d0                                   ! 2nd counterion in the crystall
       rion2(2) = 0.d0
       rion2(3) = c/2.d0
      end subroutine set_crystal_param




      subroutine calc_xy_mesh                            ! calculate xy mesh points
       do i=1,Nx
        X1(i) = (i-1)*a/dfloat(Nx-1)
       enddo
       do j=1,Ny
        Y1(j) = (j-1)*b/dfloat(Ny-1)
       enddo
      end subroutine calc_xy_mesh



   end Module Mn12_crystal







