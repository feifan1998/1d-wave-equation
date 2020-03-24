        SUBROUTINE BOUNDA()
        !! give the boundary condition in the solving process of the 1d convection equation
        USE LX
        USE SOLUTION_PART
        IMPLICIT NONE
        FI(0)=FI(1)
        FI(-1)=FI(1)
        FI(NI+1)=FI(NI)
        RETURN 
        END SUBROUTINE BOUNDA