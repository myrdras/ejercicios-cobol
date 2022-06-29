      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. SIGNEX2.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 LS-P           PIC S9(03)  VALUE +256
               SIGN IS LEADING SEPARATE CHARACTER.
       01 TA-P           PIC S9(03)  VALUE +256
               SIGN IS TRAILING SEPARATE CHARACTER.
       01 NO-SEP-P       PIC S9(03)  VALUE 256.
       01 LS-N           PIC S9(03)  VALUE -256
               SIGN IS LEADING SEPARATE CHARACTER.
       01 TA-N           PIC S9(03)  VALUE -256
               SIGN IS TRAILING SEPARATE CHARACTER.
       01 NO-SEP-N       PIC S9(03)  VALUE -256.

       01 COD            PIC S9(2)   VALUE 10.
       01 CODCOPY        PIC S9(3).


       PROCEDURE DIVISION.

       000000-CONTROL.

            ACCEPT CODCOPY
            DISPLAY "SIGN +VE LEADING SEPARATE DISPLAY : " LS-P
            DISPLAY "SIGN +VE TRAILING SEPARATE DISPLAY: " TA-P
            DISPLAY "SIGN +VE WITH NO SEPARATE DISPLAY : " NO-SEP-P
            DISPLAY "SIGN -VE LEADING SEPARATE DISPLAY : " LS-N
            DISPLAY "SIGN -VE TRAILING SEPARATE DISPLAY: " TA-N
            DISPLAY "SIGN -VE WITH NO SEPARATE DISPLAY : " NO-SEP-N
            MOVE CODCOPY TO COD
            DISPLAY COD

            STOP RUN.
