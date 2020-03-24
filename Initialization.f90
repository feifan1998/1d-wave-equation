        SUBROUTINE INITIA()
        !! give the initial state for the 1d convection equation 
        USE LX
        USE INITIALIZATION_PART
        IMPLICIT NONE 
        DO I=1,NI
            IF(X(I).LE.0.3D0) THEN
                FI(I)=1.D0
            ELSE
                FI(I)=0.D0
            END IF
        END DO
        TIME=0.D0
        RETURN 
        END SUBROUTINE INITIA