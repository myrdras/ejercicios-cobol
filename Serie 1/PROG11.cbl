      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 11 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG11-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-FECHA     PIC X(10).


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE LA FECHA COMO AAAA-MM-DD"
            ACCEPT WS-FECHA

            DISPLAY "********************************"
            DISPLAY "AÑO: " WS-FECHA(1:4)
            DISPLAY "MES: " WS-FECHA(6:2)
            DISPLAY "DIA: " WS-FECHA(9:2)

            STOP RUN.
