! Suman Maity                           Date: May 4, 2022
module input
     implicit none
     integer :: num_args, i, dno
     character(len=120), dimension(:), allocatable :: args
contains
subroutine argh()
     num_args = command_argument_count()
     if (num_args .eq. 0) then
              print*,'****************************************************'
              print*,'syntax to run:'
              print*,'nc2grid <file> <dims (3 or 4)> <varname> <output>'
              print*,'file: Name of the file to process'
              print*,'dims (3 or 4): dimension of the variable to process'
              print*,'varname: Variable name'
              print*,'output: Name of the output file'
              print*,'****************************************************'
     else
              allocate(args(num_args)) 
              do i = 1, num_args
                    call get_command_argument(i,args(i))
              end do
              read(args(2),*) dno
     end if
end subroutine argh
     
end module input
