

! Copyright (C) 2022   Center for Molecular Magnetic Quantum Materials (M2QM),
!                      Quantum Theory Project (QTP),
!                      Department of Physics, University of Florida, Gainesville, FL 32611, USA 
!                      https://efrc.ufl.edu/

   Module E_field
    use Mn12_crystal  
    integer, parameter   :: Nsum = 10                 ! number of cells for summation              
    real(8)              :: L(3)                      ! lattice vector
    real(8)              :: rxy(3)                    ! point r in the plane z = c/2
    real(8)              :: qsign                     ! sign of the charge
   contains




      subroutine calc_efield_xy                       ! calculate E field on xy mesh points
       do i=1,Nx
        do j=1,Ny
         rxy(1) = X1(i)                               ! point r in the plane z = c/2
         rxy(2) = Y1(j)  
         rxy(3) = c/2.d0
         call calc_efield_r                           ! calculate E field from periodic point charges of the crystal
         EF(1:3,i,j) = E1(1:3)                        ! store E field
        enddo
       enddo
      end subroutine calc_efield_xy



      subroutine calc_efield_r
       E1(1:3) = 0.d0                                 ! store sum in E1

       qsign = +1.d0
       rq(1:3) = rion1(1:3)                           ! 1st counterion +1
       call calc_summ3                                ! sum over all periodic counterions

       qsign = +1.d0
       rq(1:3) = rion2(1:3)                           ! 2nd counterion +1
       call calc_summ4                                ! sum over all periodic counterions

       qsign = -1.d0
       rq(1:3) = rSMM1(1:3)                           ! 1st SMM   -1
       call calc_summ1                                ! sum over all periodic SMMs         

       qsign = -1.d0
       rq(1:3) = rSMM2(1:3)                           ! 2nd SMM   -1
       call calc_summ2                                ! sum over all periodic SMMs excluding SMM at (0,0,0)
      end subroutine calc_efield_r




      subroutine calc_summ1                     
       do i=-Nsum,Nsum+1                              ! sum in 3D
        L(1) = i*a                                    ! lattice vector
        do j=-Nsum,Nsum+1
         L(2) = j*b
         do k=-Nsum,Nsum+1
          L(3) = k*c
          call calc_r                                 ! calculate vector r from point charge to the investigated point r
          call calc_efield                            ! calculate E field from one point charge
          call calc_summ                              ! summation over all periodic charges   
         enddo
        enddo
       enddo
      end subroutine calc_summ1



      subroutine calc_summ2                      
       do i=-Nsum,Nsum                                ! sum in 3D
        L(1) = i*a                                    ! lattice vector
        do j=-Nsum,Nsum
         L(2) = j*b
         do k=-Nsum,Nsum
          if(.not.(i==0.and.j==0.and.k==0)) then
           L(3) = k*c
           call calc_r                                ! calculate vector r from point charge to the investigated point r
           call calc_efield                           ! calculate E field from one point charge
           call calc_summ                             ! summation over all periodic charges   
          endif
         enddo
        enddo
       enddo
      end subroutine calc_summ2



      subroutine calc_summ3                      
       do i=-Nsum,Nsum                                ! sum in 3D
        L(1) = i*a                                    ! lattice vector
        do j=-Nsum,Nsum
         L(2) = j*b
         do k=-Nsum,Nsum+1
          L(3) = k*c
          call calc_r                                 ! calculate vector r from point charge to the investigated point r
          call calc_efield                            ! calculate E field from one point charge
          call calc_summ                              ! summation over all periodic charges   
         enddo
        enddo
       enddo
      end subroutine calc_summ3



      subroutine calc_summ4                      
       do i=-Nsum,Nsum+1                              ! sum in 3D
        L(1) = i*a                                    ! lattice vector
        do j=-Nsum,Nsum+1
         L(2) = j*b
         do k=-Nsum,Nsum
          L(3) = k*c
          call calc_r                                 ! calculate vector r from point charge to the investigated point r
          call calc_efield                            ! calculate E field from one point charge
          call calc_summ                              ! summation over all periodic charges   
         enddo
        enddo
       enddo
      end subroutine calc_summ4



      subroutine calc_r                               ! calculate vector r from point charge to the point (x,y,z)
       real(8)          :: r1(3),rx              
       r1(1:3) =  rxy(1:3) - rq(1:3) - L(1:3)
       rx = dlength(r1)                               ! length of vector r1
       v3(1:3) = r1(1:3)/rx                           ! unity vector
      end subroutine calc_r




      subroutine calc_efield                          ! E field from point charge, r in A, E in V/A
       real(8), parameter  :: k = 14.39965d0
       if(rx > 1.d-10) then
        E(1:3) = qsign*k*v3(1:3)/(rx**2)
       else
        E(1:3) = 0.d0
       endif
      end subroutine calc_efield





      subroutine calc_summ                            ! sum over all periodic charges
       real(8)          :: Ex
       do i=1,3
        Ex = E1(i)
        Ex = Ex + E(i)          
        E1(i) = Ex 
       enddo
      end subroutine calc_summ




      real(8) function dlength(X)                     ! length of the vector
       real(8)    :: X(3)
       dlength = dsqrt(X(1)**2+X(2)**2+X(3)**2)
      end function dlength





   end Module E_field









