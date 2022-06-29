      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 8 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG08-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-NUMERO        PIC S9(5)
               SIGN IS LEADING SEPARATE CHARACTER.
       77 WS-MIN           PIC S9(5)  VALUE -45834.
       77 WS-MAX           PIC S9(5)  VALUE +49234.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE UN NUMERO: "
            ACCEPT WS-NUMERO.

            IF WS-NUMERO >= WS-MIN AND WS-NUMERO <= WS-MAX
                DISPLAY "SU NUMERO ES: " WS-NUMERO
                ELSE
                   DISPLAY "SU NUMERO SUPERA EL RANGO".

            STOP RUN.
