      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 4 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG04-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       77 ESTADO-CIVIL     PIC X.
           88 CASADO               VALUE 'C','c'.
           88 SOLTERO              VALUE 'S','s'.
           88 VIUDO                VALUE 'V','v'.
           88 DIVORCIADO           VALUE 'D','d'.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY 'INGRESE SU ESTADO CIVIL: '
            DISPLAY 'C - CASADO    S - SOLTERO '
            DISPLAY 'V - VIUDO     D - DIVORCIADO '
            ACCEPT ESTADO-CIVIL

            EVALUATE TRUE
              WHEN CASADO
                DISPLAY 'SU ESTADO CIVIL ES CASADO'
              WHEN SOLTERO
                DISPLAY 'SU ESTADO CIVIL ES SOLTERO'
              WHEN VIUDO
                DISPLAY 'SU ESTADO CIVIL ES VIUDO'
              WHEN DIVORCIADO
                DISPLAY 'SU ESTADO CIVIL ES DIVORCIADO'
              WHEN OTHER
                DISPLAY 'ERROR, VALOR NO VALIDO'
            END-EVALUATE.

            STOP RUN.
