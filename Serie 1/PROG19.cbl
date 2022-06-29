      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 19 - Estructuras B�sicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG19-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       77  WS-NUM          PIC 9(11)    VALUE 0.
       77  WS-CONT         PIC 9(2)     VALUE 0.

       01  WS-AUX.
          05 WS-AUXNUM     PIC 9(11)    VALUE 0 OCCURS 5 TIMES.

       77 WS-SUMA          PIC 9(2)v99  VALUE 0.
       77 WS-IVA           PIC 9(2)v99  VALUE 21.
       77 WS-RESULT        PIC 9(2)v99  VALUE 0.


       PROCEDURE DIVISION.

       000000-CONTROL.

            PERFORM   100000-CARGA.
            PERFORM   200000-CALCULO.
            PERFORM   300000-RESULTADO.

            STOP RUN.


       100000-CARGA.

            PERFORM UNTIL WS-CONT > 4
               DISPLAY "INGRESE UN NUMERO: "
               ACCEPT WS-NUM
               MOVE WS-NUM TO WS-AUXNUM (WS-NUM)
               COMPUTE WS-CONT = WS-CONT + 1
            END-PERFORM.


       200000-CALCULO.

            COMPUTE WS-CONT = WS-CONT - 4.
            PERFORM UNTIL WS-CONT > 4
               COMPUTE WS-SUMA = WS-SUMA + WS-AUXNUM (WS-NUM)
               COMPUTE WS-CONT = WS-CONT + 1
            END-PERFORM.
            COMPUTE WS-IVA = WS-SUMA * WS-IVA / 100.
            COMPUTE WS-RESULT = WS-SUMA - WS-IVA.


       300000-RESULTADO.

            DISPLAY "El Monto bruto es: " WS-SUMA.
            DISPLAY "El IVA es: " WS-IVA.
            DISPLAY "El Monto neto es: " WS-RESULT.
