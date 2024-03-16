! This package converts netcdf files to .grd format. Only requirement is the data should be
! in 3D (time,lat,lon) or 4D (time,level,lat,lon) format only. The name of the dimensions also
! in this format only. If your data dimension name are not lat/lon/level/time then use the following 
! Example:
! ncrename -d x/lon ss.nc    =====> change the dimenson name x to lon
! ncrename -v x/lon ss.nc    =====> change the variable name x to lon
! 
! Suman Maity				Date: May 4, 2022
!
program nc2grid
       use input
       use data_3d
       use data_4d
       implicit none
       call argh()
       select case(dno)
            case(3)
                call process_3d(trim(args(1)),trim(args(3)),trim(args(4)))
            case(4)
                call process_4d(trim(args(1)),trim(args(3)),trim(args(4)))
            end select
end program nc2grid
