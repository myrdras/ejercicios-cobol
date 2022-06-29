      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 9 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG09-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-NOMBRECOMPLETO.
           03 WS-NOMBRE        PIC X(15)  VALUE SPACES.
           03 WS-APELLIDO      PIC X(15)  VALUE SPACES.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE NOMBRE: "
            ACCEPT WS-NOMBRE.
            DISPLAY "INGRESE APELLIDO: "
            ACCEPT WS-APELLIDO.
            DISPLAY "SU NOMBRE ES: " WS-NOMBRECOMPLETO.

            STOP RUN.
