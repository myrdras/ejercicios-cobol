      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 3 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG03-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-DATOS.
           03 WS-AUXSIGLO     PIC 9(2)  VALUE 0.
           03 WS-AUXANIO      PIC 9(2)  VALUE 0.
           03 WS-AUXMES       PIC 9(2)  VALUE 0.
           03 WS-AUXDIA       PIC 9(2)  VALUE 0.

       01 FECHA.
           02 DIA             PIC 9(02) VALUE 0.
           02 FILLER          PIC X     VALUE '/'.
           02 MES             PIC 9(02) VALUE 0.
           02 FILLER          PIC X     VALUE '/'.
           02 SIGLO           PIC 9(02) VALUE 0.
           02 ANIO            PIC 9(02) VALUE 0.


       PROCEDURE DIVISION.

       000000-CONTROL.

            MOVE FUNCTION CURRENT-DATE(1:8) TO WS-DATOS

            MOVE WS-AUXDIA TO DIA.
            MOVE WS-AUXMES TO MES.
            MOVE WS-AUXANIO TO ANIO.
            MOVE WS-AUXSIGLO TO SIGLO.

            DISPLAY FECHA.

            STOP RUN.
