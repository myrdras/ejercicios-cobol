      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 6 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG06-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 RESPUESTA-VALIDA   PIC X.
           88 RESPUESTA-SI          VALUE 'S'.
           88 RESPUESTA-NO          VALUE 'N'.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY 'DESEA VERIFICAR LAS VARIABLES? (S/N)'
            ACCEPT RESPUESTA-VALIDA

            EVALUATE TRUE
              WHEN RESPUESTA-SI
                DISPLAY 'LA RESPUESTA ES SI'
              WHEN RESPUESTA-NO
                DISPLAY 'LA RESPUESTA ES NO'
              WHEN OTHER
                DISPLAY 'RESPUESTA INVALIDA'
            END-EVALUATE

            STOP RUN.
