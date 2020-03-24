        SUBROUTINE MESH1D()
        !! generate 1D mesh for discreting the computating domain
        USE LX
        USE INITIALIZATION_PART
        IMPLICIT NONE
        DX=(XB-XA)/(NI-1)
        DO I=1,NI
            X(I)=XA+(I-1)*DX
        END DO 
        RETURN
        END SUBROUTINE MESH1D