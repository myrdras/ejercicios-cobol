      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 16 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG16-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.
       01 PRACTICA.
         02 NUM1               PIC S9(05).
         02 NUM2               PIC S9(07).
         02 NUM3               PIC 9(04).

       01 ZONEADO.
         02 Z-NUM1.
           03 Z-NUM11          PIC 9(04).
           03 Z-NUM12          PIC X.
         02 Z-NUM2.
           03 Z-NUM21          PIC 9(06).
           03 Z-NUM22          PIC X.
         02 Z-NUM3             PIC 9(04).

       01 TABLA-DE-VALORES     PIC X.
         88 P0                           VALUE '{'.
         88 P1                           VALUE 'A'.
         88 P2                           VALUE 'B'.
         88 P3                           VALUE 'C'.
         88 P4                           VALUE 'D'.
         88 P5                           VALUE 'E'.
         88 P6                           VALUE 'F'.
         88 P7                           VALUE 'G'.
         88 P8                           VALUE 'H'.
         88 P9                           VALUE 'I'.
         88 N0                           VALUE '}'.
         88 N1                           VALUE 'J'.
         88 N2                           VALUE 'K'.
         88 N3                           VALUE 'L'.
         88 N4                           VALUE 'M'.
         88 N5                           VALUE 'N'.
         88 N6                           VALUE 'O'.
         88 N7                           VALUE 'P'.
         88 N8                           VALUE 'Q'.
         88 N9                           VALUE 'R'.


       PROCEDURE DIVISION.

       000000-CONTROL.

            MOVE '2341{324895N5376' TO ZONEADO
            MOVE Z-NUM12 TO TABLA-DE-VALORES
            MOVE Z-NUM11 TO NUM1
            MOVE Z-NUM21 TO NUM2
            MOVE Z-NUM3 TO NUM3
            PERFORM 100000-CONVERSION-NUM1
            MOVE Z-NUM22 TO TABLA-DE-VALORES
            PERFORM 160000-CONVERSION-NUM2
            DISPLAY "VARIABLE NUM1: " NUM1
            DISPLAY "VARIABLE NUM2: " NUM2
            DISPLAY "VARIABLE NUM3: " NUM3
            DISPLAY "VARIABLE PRACTICA: " PRACTICA

            STOP RUN.

       100000-CONVERSION-NUM1.
            MULTIPLY 10 BY NUM1
            EVALUATE TRUE
              WHEN P0
                CONTINUE
              WHEN P1
                ADD 1 TO NUM1
              WHEN P2
                ADD 2 TO NUM1
              WHEN P3
                ADD 3 TO NUM1
              WHEN P4
                ADD 4 TO NUM1
              WHEN P5
                ADD 5 TO NUM1
              WHEN P6
                ADD 6 TO NUM1
              WHEN P7
                ADD 7 TO NUM1
              WHEN P8
                ADD 8 TO NUM1
              WHEN P9
                ADD 9 TO NUM1
              WHEN N0
                SUBTRACT 1 FROM NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N1
                PERFORM 150000-NUM1-NEG
              WHEN N2
                ADD 1 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N3
                ADD 2 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N4
                ADD 3 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N5
                ADD 4 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N6
                ADD 5 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N7
                ADD 6 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N8
                ADD 7 TO NUM1
                PERFORM 150000-NUM1-NEG
              WHEN N9
                ADD 8 TO NUM1
                PERFORM 150000-NUM1-NEG
            END-EVALUATE.

       150000-NUM1-NEG.
           ADD 1 TO NUM1
           MULTIPLY -1 BY NUM1.

       160000-CONVERSION-NUM2.
            MULTIPLY 10 BY NUM2
            EVALUATE TRUE
              WHEN P0
                CONTINUE
              WHEN P1
                ADD 1 TO NUM2
              WHEN P2
                ADD 2 TO NUM2
              WHEN P3
                ADD 3 TO NUM2
              WHEN P4
                ADD 4 TO NUM2
              WHEN P5
                ADD 5 TO NUM2
              WHEN P6
                ADD 6 TO NUM2
              WHEN P7
                ADD 7 TO NUM2
              WHEN P8
                ADD 8 TO NUM2
              WHEN P9
                ADD 9 TO NUM2
              WHEN N0
                SUBTRACT 1 FROM NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N1
                PERFORM 170000-NUM2-NEG
              WHEN N2
                ADD 1 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N3
                ADD 2 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N4
                ADD 3 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N5
                ADD 4 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N6
                ADD 5 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N7
                ADD 6 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N8
                ADD 7 TO NUM2
                PERFORM 170000-NUM2-NEG
              WHEN N9
                ADD 8 TO NUM2
                PERFORM 170000-NUM2-NEG
            END-EVALUATE.

       170000-NUM2-NEG.
           ADD 1 TO NUM2
           MULTIPLY -1 BY NUM2.
