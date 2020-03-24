
        SUBROUTINE CFLCON()
        !! give the advancing time step through CFL criterion(CFL should < 1)
        USE LX
        USE SOLUTION_PART
        IMPLICIT NONE 
        DT=DX*CFL/A
        TIME=TIME+DT
        RETURN 
        END SUBROUTINE CFLCON