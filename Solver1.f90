        SUBROUTINE SOLVER1()
        !! 2 order and 1 order scheme(being commented) solving the convection term 1 order scheme: backward difference;
        ! ref site: https://baike.baidu.com/item/%E5%90%8E%E5%90%91%E5%B7%AE%E5%88%86/600908
        ! 2 order scheme:
        ! ref site: https://www.sciencedirect.com/science/article/pii/S0021999113008516
        ! Output: the fi value of every x for the next moment
        USE LX
        USE SOLUTION_PART
        IMPLICIT NONE
        REAL*8::                B,C,G_1,G_2,G(-1:NI)
        !! midden variable
        IF(ORDER == 2) THEN
        ! Second order scheme
            DO I=-1,NI
                G(I)=ABS((FI(I+1)-FI(I))/DX)
            END DO
            DO I=1,NI
                B=FI(I+1)-FI(I)
                C=FI(I)-FI(I-1)
                IF(B.GT.0.D0) THEN
                    SIGN_1=1
                ELSE 
                    IF(B.LE.0.D0) THEN
                        SIGN_1=-1
                    ELSE
                        SIGN_1=0
                    END IF
                END IF
                IF(C.GT.0.D0) THEN
                    SIGN_2=1
                ELSE 
                    IF(C.LE.0.D0) THEN
                        SIGN_2=-1
                    ELSE
                        SIGN_2=0
                    END IF
                END IF
                G_1=MIN(G(I),G(I-1))
                G_2=MIN(G(I-1),G(I-2))
                FA(I)=FI(I)+0.5*SIGN_1*(DX-A*DT)*G_1
                FA(I-1)=FI(I-1)+0.5*SIGN_2*(DX-A*DT)*G_2
                FM(I)=FI(I)+A*DT*(FA(I-1)-FA(I))/DX
            END DO
            DO I=1,NI
                FI(I)=FM(I)
            END DO
        ELSE IF(ORDER == 1) THEN
        ! One order scheme
            DO I=1,NI
            FM(I)=FI(I)+A*DT*(FI(I-1)-FI(I))/DX
            END DO
            DO I=1,NI
            FI(I)=FM(I)
            END DO
        END IF
        RETURN
        END SUBROUTINE SOLVER1
