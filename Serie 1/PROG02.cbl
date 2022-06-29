      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 2 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG02-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 FECHA.
           03 WS-DD       PIC 9(2).
           03 FILLER      PIC X VALUE '-'.
           03 WS-MM       PIC 9(2).
           03 FILLER      PIC X VALUE '-'.
           03 WS-AA       PIC 9(4).


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE EL DIA :"
            ACCEPT WS-DD
            DISPLAY "INGRESE EL MES :"
            ACCEPT WS-MM
            DISPLAY "INGRESE EL AÑO :"
            ACCEPT WS-AA
            DISPLAY "LA FECHA DEL DIA ES: "
            FECHA

            STOP RUN.
