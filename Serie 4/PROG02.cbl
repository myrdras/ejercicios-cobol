      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 2 - VECTORES - CALCULO PROMEDIO DE NOTAS
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG02-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 VARIABLES.
          05 WSV-PROMEDIO         PIC 9(02)V9(02).

       01 CONSTANTES.
          05 WSC-0                PIC 9(01)       VALUE 0.
          05 WSC-1                PIC 9(01)       VALUE 1.
          05 WSC-3                PIC 9(01)       VALUE 3.
          05 WSC-7                PIC 9(02)V9(02) VALUE 07,00.
          05 WSC-10               PIC 9(02)       VALUE 10.
          05 WSC-APROBADO         PIC X(08)       VALUE 'APROBADO'.
          05 WSC-DESAPROBADO      PIC X(11)       VALUE 'DESAPROBADO'.

       01 INDICES.
          05 WSI-I                PIC 9(01).

       01 TABLAS.
          05 WST-TAB-NOTAS        OCCURS 3 TIMES.
             10 WST-NOTA          PIC 9(02)V9(02).

       01 ACUMULADORES.
          05 WSA-ACUMULADOR       PIC 9(02)V9(02).

       77 WSM-PROMEDIO            PIC Z9,99.


       PROCEDURE DIVISION.

       000000-CONTROL.
           PERFORM 100000-INICIO
           PERFORM 200000-PROCESO
           PERFORM 300000-FINAL
           STOP RUN.

       100000-INICIO.

           INITIALIZE VARIABLES

           PERFORM VARYING WSI-I FROM 1 BY 1 UNTIL WSI-I > WSC-3

              DISPLAY '**************************************'
              DISPLAY 'INGRESE NOTA ' WSI-I
              DISPLAY '**************************************'
              ACCEPT WST-NOTA(WSI-I)

              PERFORM UNTIL WST-NOTA(WSI-I)> WSC-0
                        AND WST-NOTA(WSI-I)<= WSC-10

                 DISPLAY '**************************************'
                 DISPLAY 'DATO INVALIDO.'
                 DISPLAY 'INGRESE UNA NOTA NUMERICA'
                 DISPLAY 'ENTRE 1 Y 10.'
                 DISPLAY '**************************************'
                 ACCEPT WST-NOTA(WSI-I)

              END-PERFORM
           END-PERFORM.

       200000-PROCESO.

           MOVE WSC-1 TO WSI-I
           MOVE WSC-0 TO WSA-ACUMULADOR

           PERFORM VARYING WSI-I FROM 1 BY 1 UNTIL WSI-I > WSC-3
                ADD WST-NOTA(WSI-I) TO WSA-ACUMULADOR
           END-PERFORM

           COMPUTE WSV-PROMEDIO = WSA-ACUMULADOR / WSC-3.


       300000-FINAL.

           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 2 - ARCHIVOS'
           DISPLAY 'Programme: PROG02-08-ME'.
           DISPLAY '**************************************'.

           MOVE WSV-PROMEDIO TO WSM-PROMEDIO.
           DISPLAY '**************************************'
           DISPLAY 'PROMEDIO ' WSM-PROMEDIO

           IF WSV-PROMEDIO < WSC-7
              DISPLAY WSC-DESAPROBADO " DEBE RENDIR FINAL"
           ELSE
              DISPLAY WSC-APROBADO
           END-IF.

           DISPLAY '**************************************'.

       END-RUN.
