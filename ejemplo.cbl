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

       77 NUMERO       PIC 9(3)    VALUE 0.
       77 N-REAL       PIC X(3)    VALUE SPACES.

       01 WS-TABLE.
           05 WS-FILA OCCURS 5 TIMES INDEXED BY WS-I.
               10 WS-ITEM-FILA PIC X(3).
               10 WS-COLUMNA OCCURS 5 TIMES INDEXED BY WS-J.
                   15 WS-ITEM-COLUMNA PIC X(3).


       PROCEDURE DIVISION.

       MAIN-PROCEDURE.
            PERFORM UNTIL NUMERO >= 24
               PERFORM 1000-ARMO-FILA VARYING WS-I FROM 1 BY 1 UNTIL
                   WS-I > 5
            END-PERFORM.

            STOP RUN.


            1000-ARMO-FILA.
               PERFORM 2000-ARMO-COLUMNA VARYING WS-J FROM 1 BY 1 UNTIL
                   WS-J > 5.
               DISPLAY WS-FILA (WS-I).

            2000-ARMO-COLUMNA.
               ADD 1 TO NUMERO.
               MOVE NUMERO TO N-REAL.
               MOVE N-REAL TO WS-ITEM-COLUMNA (WS-I WS-J).

       END PROGRAM YOUR-PROGRAM-NAME.
