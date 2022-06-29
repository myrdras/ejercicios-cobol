      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 14 - Estructuras Básicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG14-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SALIDA             ASSIGN TO DISK '..\ARCHIVO.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-SALIDA.
       DATA DIVISION.

       FILE SECTION.
       FD SALIDA.
       01 REG-SALIDA.
         05 WSV-NUM               PIC S9(02) USAGE IS PACKED-DECIMAL.

       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-SALIDA            PIC X(02).
               88 WSS-FS-SALIDA-OK                      VALUE '00'.
               88 WSS-FS-SALIDA-EOF                     VALUE '10'.

       01 ZONEADO.
         02 NUM                 PIC S9(02) USAGE IS PACKED-DECIMAL.

       01 VAR                  PIC S9(3) USAGE IS PACKED-DECIMAL.


       PROCEDURE DIVISION.

       000000-CONTROL.
           INITIALIZE SWITCHES

           PERFORM 120000-ABRIR-SALIDA

            MOVE -10 TO VAR
              MOVE VAR TO NUM
            DISPLAY "VARIABLE ZONEADO: " ZONEADO
            MOVE ZONEADO TO REG-SALIDA
            PERFORM 210000-GRABAR-SALIDA
            PERFORM WITH TEST BEFORE UNTIL NUM = +10
              ADD 1 TO VAR
              MOVE VAR TO NUM
              MOVE ZONEADO TO REG-SALIDA
              DISPLAY "VARIABLE ZONEADO: " ZONEADO
              PERFORM 210000-GRABAR-SALIDA
            END-PERFORM
            PERFORM 300000-FINAL.

       120000-ABRIR-SALIDA.
           OPEN OUTPUT SALIDA
           IF NOT WSS-FS-SALIDA-OK
             DISPLAY 'ERROR DE ARCHIVO DE SALIDA'
             DISPLAY 'FILE STATUS ' WSS-FS-SALIDA
             PERFORM 300000-FINAL
           END-IF.


       210000-GRABAR-SALIDA.
           WRITE REG-SALIDA.


       300000-FINAL.
           PERFORM 340000-CERRAR-SALIDA
           STOP RUN.

       340000-CERRAR-SALIDA.
           CLOSE SALIDA
           IF NOT WSS-FS-SALIDA-OK
              DISPLAY 'ERROR DE ARCHIVO DE ENTRADA'
            DISPLAY 'FILE STATUS ' WSS-FS-SALIDA
           END-IF.
