        SUBROUTINE OUTPUT()
        !! output discrete x and fi making result visualized through sofeware like tecplot.
        USE LX
        USE OUTPUT_PART
        IMPLICIT NONE 
        OPEN(1,FILE='SKY.dat')
            DO I=1,NI
                WRITE(1,*) X(I),FI(I)
            END DO
        CLOSE(1)
        RETURN 
        END SUBROUTINE OUTPUT