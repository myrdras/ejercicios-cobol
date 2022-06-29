      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        14 DE JUNIO 2019.
      * Purpose:     EJERCICIO 2 - EVALUACION INTEGRADORA
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.   EVINT-EJ02.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 VECTOR           OCCURS 99 TIMES.
          05 WSV-NUM              PIC 9(05).

       01 INDICES.
          05 WSI-I                PIC 9(02).
          05 WSI-J                PIC 9(02).
          05 WSI-AUX              PIC 9(02).

       01 VARIABLES.
          05 WSV-CANT             PIC 9(02).
          05 WSV-AUX              PIC 9(05).


       PROCEDURE DIVISION.

       000000-CONTROL.
           PERFORM 100000-INICIO
           PERFORM 200000-PROCESO
           PERFORM 300000-FINAL
           STOP RUN.


       100000-INICIO.
           INITIALIZE VARIABLES
           DISPLAY 'CUANTOS NUMEROS DESEA INGRESAR?'
           ACCEPT WSV-CANT.


       200000-PROCESO.
           PERFORM 210000-CARGAR
           PERFORM 220000-ORDENAR-MENOR-A-MAYOR.


       210000-CARGAR.
           MOVE 1 TO WSI-I
           PERFORM UNTIL WSI-I > WSV-CANT
              DISPLAY '**************************************'
              DISPLAY 'INGRESE EL ' WSI-I '° NUMERO'
              DISPLAY '**************************************'
              ACCEPT WSV-NUM(WSI-I)
              ADD 1 TO WSI-I
           END-PERFORM.


       220000-ORDENAR-MENOR-A-MAYOR.
           SUBTRACT 1 FROM WSV-CANT
           PERFORM VARYING WSI-I FROM 1 BY 1 UNTIL WSI-I = WSV-CANT
             PERFORM VARYING WSI-J FROM 1 BY 1 UNTIL WSI-J = WSV-CANT
               MOVE WSI-J TO WSI-AUX
               ADD 1 TO WSI-AUX
               IF WSV-NUM(WSI-J) GREATER THAN WSV-NUM(WSI-AUX)
                 MOVE WSV-NUM(WSI-J) TO WSV-AUX
                 MOVE WSV-NUM(WSI-AUX) TO WSV-NUM(WSI-J)
                 MOVE WSV-AUX TO WSV-NUM(WSI-AUX)
               END-IF
             END-PERFORM
           END-PERFORM.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 320000-MOSTRAR-MAYOR
           PERFORM 330000-ANALISIS.


       310000-TITULOS.
           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 2 - EVALUACION INTEGRADORA'
           DISPLAY 'Programme: EVINT-EJ02'
           DISPLAY '**************************************'.

       320000-MOSTRAR-MAYOR.
           ADD 1 TO WSV-CANT
           DISPLAY 'NUMERO MAYOR: ' WSV-NUM(WSV-CANT).

       330000-ANALISIS.
           DISPLAY 'AL ORDENAR EL VECTOR, EL NUMERO MAS GRANDE '
           'Y EL MAS CHICO QUEDAN EN EL INDICE MAS BAJO O EL MAS ALTO'
           'SEGUN SI ES DE MAYOR A MENOR O VICEVERSA.'.
