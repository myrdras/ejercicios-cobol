      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 10 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG10-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-MONTO         PIC 9(20)V99    VALUE 0.
       01 WS-IVA           PIC 9(05)V99    VALUE 0.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE EL MONTO:"
            ACCEPT WS-MONTO.

            MULTIPLY WS-MONTO BY 0,21 GIVING WS-IVA.

            DISPLAY "EL IVA DEL MONTO ES: " WS-IVA

            STOP RUN.
