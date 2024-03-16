! Suman Maity                           Date: May 4, 2022
module data_4d

contains
    subroutine process_4d(filename,varname,outf)
        implicit none
        include 'netcdf.inc'
        integer,parameter :: bl4 = 1
        integer :: nlon,nlat,nlev,ntime
        integer :: rec,it,ii,jj,kk
        real,allocatable :: conc(:,:,:,:)
        character*120 :: filename,varname,outf
        integer :: ncid,ierr,lonid,lenlon,latid,lenlat,levid,lenlev,timid,lentim,conid
! Open file
        ierr = nf_open(filename,0,ncid); print*,'Opening netcdf file ', trim(filename)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
! Get dimension ID
        ierr = nf_inq_dimid(ncid,'lon',lonid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimid(ncid,'lat',latid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimid(ncid,'level',levid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimid(ncid,'time',timid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
! Get dimension lengths
        ierr = nf_inq_dimlen(ncid,lonid,nlon)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimlen(ncid,latid,nlat)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimlen(ncid,levid,nlev)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_dimlen(ncid,timid,ntime)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
! Get variable ID
        ierr = nf_inq_varid(ncid,'lon',lonid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_varid(ncid,'lat',latid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_varid(ncid,'level',levid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_varid(ncid,'time',timid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        ierr = nf_inq_varid(ncid,varname,conid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
        allocate(conc(nlon,nlat,nlev,ntime))
! Get values
        ierr = nf_get_var_real(ncid,conid,conc)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
!- close netcdf file :
        ierr = nf_close(ncid)
        if (ierr.ne.0) write(6,*) nf_strerror(ierr)
! output file
        open(100,file=trim(outf),form='unformatted',access='direct',recl=nlon*nlat*nlev*bl4)
        print*,'Writing grd file ', trim(outf)
        do it = 1,ntime
                        write(100,rec=it) (((conc(ii,jj,kk,it),ii=1,nlon),jj=1,nlat),kk=1,nlev)
        end do
    end subroutine process_4d
end module data_4d
