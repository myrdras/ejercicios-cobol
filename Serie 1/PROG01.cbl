      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG01-08-ME.

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
           DISPLAY FECHA
           STOP RUN.
