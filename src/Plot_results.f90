





   Module Plot_results
    use Mn12_crystal                         
   contains




   subroutine plot_E       
    real(8)              :: Er
    open(unit=1,file='EField.dat')
     write(1,1)
     do i=1,Nx
      do j=1,Ny
       Er = dsqrt(EF(1,i,j)**2+EF(2,i,j)**2)                 !+EF(3,i,j)**2)
       write(1,2) X1(i),Y1(j),EF(1:3,i,j),Er
      enddo
     enddo
    close(unit=1)
 1  format('! "X", "Y", "Ex", "Ey", "Ez", "E" ')
 2  format(6F18.10)
   end subroutine plot_E



   end Module Plot_results








