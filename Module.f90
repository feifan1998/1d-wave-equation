
        MODULE LX
        !! definition of all the global variables, used for data passing in different parts.
        INTEGER,PARAMETER::                                      NI=101
        !! mesh number, total number of grid nodes, the array size of fi and location
        REAL*8,PARAMETER::                                       A=1.D0
        !! propagating velocity, the function of location and time for general cases
        REAL*8,PARAMETER::                                       V=1.D9
        !! stiffness coeffience, not used in the 1d wave equation solution
        REAL*8,PARAMETER::                                       TIMEOUT=0.3D0
        !! final time, the ending time for loop out
        INTEGER::                                                I
        !! loop index
        REAL*8::                                                 TIME
        !! pysical time, can be used for the criterion for loop ending.
        REAL*8::                                                 DX
        !! grid space, otten from mesh number and the computational domain.
        REAL*8::                                                 DT
        !! timestep, gotten from the CFL criterion
        REAL*8::                                                 X(NI)
        !! location array, array size = mesh numebr
        REAL*8::                                                 FI(-1:NI+1)
        !! scalar value fi, Dependent variety
        REAL*8::                                                 FN(-1:NI+1)
        !! 1st midden variety for fi
        REAL*8::                                                 FM(NI)
        !! 2nd midden variety for fi
        REAL*8::                                                 FA(0:NI+1)
        !! 3rd midden variety for fi
        END MODULE
        

        MODULE INITIALIZATION_PART
        !! Variables definition for the initialization part. It including the procedure Mesh1d and Initia.
        !! This part provides the dispersed meshes and initial distribution
        REAL*8,PARAMETER::                                       XA=0.D0
        !! Name:xa, the left point of the computational domain
        REAL*8,PARAMETER::                                       XB=1.D0
        !! Name:xb, the right point of the computational domain
        END MODULE


        MODULE SOLUTION_PART
        !! variables definition for the solution part. It including the procedure Bounda, Cflcon and Solver1.
        !! This part solves the 1d wave equation using timestep advancing method.
        !! and the part will loop until the out loop condition is satisfied.
        INTEGER,PARAMETER::                                      ORDER = 2
        !! scheme order, order for solving the problem, 1 for 1st backward difference; 2 for 2nd order schemee.
        REAL*8,PARAMETER::                                       CFL=0.8D0
        !! CFL number, used for calculating the advanced timestep
        REAL*8::                                                 SIGN_1
        !! sign_1, midden variety used in the 2-nd sovler
        REAL*8::                                                 SIGN_2
        !! sign_2, midden variety used in the 2-nd solver
        END MODULE


        MODULE OUTPUT_PART
        !! variables definition for the output part. It including the procedure Output.
        !! Output the location and scalar value into the dat file, which can be opened with the tecplot.
        END MODULE
    