      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 15 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG15-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 ZONEADO.
         02 NUM                PIC S9(01) USAGE PACKED-DECIMAL.


       PROCEDURE DIVISION.

       000000-CONTROL.

            MOVE -9 TO NUM
            DISPLAY "VARIABLE ZONEADO: " ZONEADO
            PERFORM WITH TEST BEFORE UNTIL NUM = +9
              ADD 1 TO NUM
              DISPLAY "VARIABLE ZONEADO: " ZONEADO
            END-PERFORM

            STOP RUN.
