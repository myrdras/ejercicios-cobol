      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 12 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG12-08-ME.

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

            DISPLAY "INGRESE LA FECHA COMO DD/MM/AAAA"
            ACCEPT WS-FECHA

            DISPLAY "********************************"
            DISPLAY "DIA: " WS-FECHA(1:2)
            DISPLAY "MES: " WS-FECHA(4:2)
            DISPLAY "AÑO: " WS-FECHA(7:4)

            STOP RUN.
