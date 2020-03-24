        PROGRAM Conv1d
        !! the code for the 1d convection equation!
        USE LX
        IMPLICIT NONE
        INTEGER:: N
        !! a local variable, iteration times
        CALL MESH1D()
        CALL INITIA()
        DO N=1,100000000
            CALL CFLCON()
            CALL BOUNDA()
            CALL SOLVER1()
            WRITE(*,*) TIME
            IF(TIME.GT.TIMEOUT) GOTO 1000
        END DO
1000    CONTINUE
        CALL OUTPUT()
        END PROGRAM