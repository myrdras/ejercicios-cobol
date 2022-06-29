      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 5 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG05-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       77 RIESGO            PIC 9(1).
           88 WS-NORIESGO              VALUE 1 2.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE UN VALOR DE RIESGO: "
            ACCEPT RIESGO.

            IF WS-NORIESGO
                DISPLAY "ACEPTADO, NO HAY RIESGO"
                ELSE
                    DISPLAY "NO ACEPTADO, HAY RIESGOS"

            STOP RUN.
