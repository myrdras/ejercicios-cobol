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
       77 WS-INDICE        PIC 9(2)    VALUE 0.
       01 SEMANA.
           03 DATOS        PIC X(10) OCCURS 7 TIMES.
           03 R-DATOS      PIC X(10).
               88 PRIMERO              VALUE "LUNES".
               88 SEGUNDO              VALUE "MARTES".
               88 TERCERO              VALUE "MIERCOLES".
               88 CUARTO               VALUE "JUEVES".
               88 QUINTO               VALUE "VIERNES".
               88 SEXTO                VALUE "SABADO".
               88 SEPTIMO              VALUE "DOMINGO".
      * ESTA TABLA OCUPA 70 BYTES

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            PERFORM VARYING WS-INDICE FROM 1 BY 1 UNTIL WS-INDICE > 7
               EVALUATE WS-INDICE
               WHEN 1 MOVE "LUNES" TO DATOS(WS-INDICE)
               WHEN 2 MOVE "MARTES" TO DATOS(WS-INDICE)
               WHEN 3 MOVE "MIERCOLES" TO DATOS(WS-INDICE)
               WHEN 4 MOVE "JUEVES" TO DATOS(WS-INDICE)
               WHEN 5 MOVE "VIERNES" TO DATOS(WS-INDICE)
               WHEN 6 MOVE "SABADO" TO DATOS(WS-INDICE)
               WHEN 7 MOVE "DOMINGO" TO DATOS(WS-INDICE)
               END-EVALUATE
            END-PERFORM
            DISPLAY SEMANA.
            STOP RUN.

       END PROGRAM YOUR-PROGRAM-NAME.
