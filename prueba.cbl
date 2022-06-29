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
       01 SEMANA.
           03 DATOS        PIC X(10) OCCURS 7 TIMES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
            MOVE "LUNES"     TO DATOS(1)
            MOVE "MARTES"    TO DATOS(2)
            MOVE "MIERCOLES" TO DATOS(3)
            MOVE "JUEVES"    TO DATOS(4)
            MOVE "VIERNES"   TO DATOS(5)
            MOVE "SABADO"    TO DATOS(6)
            MOVE "DOMINGO"   TO DATOS(7)
            DISPLAY SEMANA
            STOP RUN.
       END PROGRAM YOUR-PROGRAM-NAME.
