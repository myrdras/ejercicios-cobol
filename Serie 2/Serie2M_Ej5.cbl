      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.

       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 WS-NOTAS.
           05 WS-FILA OCCURS 5 TIMES INDEXED BY WS-I.
               10 WS-ITEM-FILA PIC X(3).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
            DISPLAY "Hello world"
            STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
