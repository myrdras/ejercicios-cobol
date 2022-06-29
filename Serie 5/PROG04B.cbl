      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 4B - ARCHIVOS - CREACION DE ARCHIVO DE
      *              SALIDA A IMAGEN DEL DE ENTRADA
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  PROG04B-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA            ASSIGN TO DISK '..\CLIENTES.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-ENTRADA.

       DATA DIVISION.

       FILE SECTION.
       FD ENTRADA.
       01 REG-ENTRADA.
         05 WSV-NUMCLIEN               PIC X(08).
         05 WSV-OFIAPE                 PIC X(03).
         05 WSV-IMPORTE                PIC 9(08)V99.


       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-ENTRADA           PIC X(02).
               88 WSS-FS-ENTRADA-OK                     VALUE '00'.
               88 WSS-FS-ENTRADA-EOF                    VALUE '10'.

       01 Constantes.
           05 WSC-1                    PIC 9(01)        VALUE 1.

       01 ACUMULADORES.
           05 WSA-LEI-ENTRADA          PIC 9(09).
           05 WSA-IMPORTE-TOTAL        PIC 9(10)V99.


       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO
                                UNTIL WSS-FS-ENTRADA-EOF
                 PERFORM 300000-FINAL.

       100000-INICIO.
           INITIALIZE SWITCHES
                      ACUMULADORES

           PERFORM 110000-ABRIR-ENTRADA

           PERFORM 130000-PRIMER-LECTURA.


       110000-ABRIR-ENTRADA.
           OPEN INPUT ENTRADA
           IF NOT WSS-FS-ENTRADA-OK
             DISPLAY 'ERROR DE ARCHIVO DE ENTRADA'
             DISPLAY 'FILE STATUS ' WSS-FS-ENTRADA
             PERFORM 300000-FINAL
           END-IF.


       130000-PRIMER-LECTURA.
           PERFORM 131000-LEER-ENTRADA
           IF WSS-FS-ENTRADA-EOF
             DISPLAY 'ARCHIVO VACIO'
             PERFORM 300000-FINAL
           END-IF.


       131000-LEER-ENTRADA.
           READ ENTRADA
              EVALUATE TRUE
                 WHEN WSS-FS-ENTRADA-OK
                      CONTINUE
                 WHEN WSS-FS-ENTRADA-EOF
                      CONTINUE
                 WHEN OTHER
                      DISPLAY 'FILE STATUS ' WSS-FS-ENTRADA
                      PERFORM 300000-FINAL.


       200000-PROCESO.
           ADD WSC-1                       TO WSA-LEI-ENTRADA
           PERFORM 220000-TOTIMPORT
           PERFORM 131000-LEER-ENTRADA.


       220000-TOTIMPORT.

           COMPUTE WSA-IMPORTE-TOTAL=
                                  WSA-IMPORTE-TOTAL + WSV-IMPORTE
           DISPLAY 'IMPORTE: ' WSV-IMPORTE.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 320000-TOTALES-DE-CONTROL
           PERFORM 330000-CERRAR-ENTRADA
           STOP RUN.


       310000-TITULOS.
           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 4B - ARCHIVOS'
           DISPLAY 'Programme: PROG04B-08-ME'
           DISPLAY '**************************************'.


       320000-TOTALES-DE-CONTROL.
           DISPLAY '**************************************'
           DISPLAY 'TOTAL LEIDOS = ' WSA-LEI-ENTRADA
           DISPLAY '**************************************'.

           DISPLAY '**************************************'
           DISPLAY 'IMPORTE TOTAL: ' WSA-IMPORTE-TOTAL
           DISPLAY '**************************************'.


       330000-CERRAR-ENTRADA.
           CLOSE ENTRADA
           IF NOT WSS-FS-ENTRADA-OK
              DISPLAY 'ERROR DE ARCHIVO DE ENTRADA'
            DISPLAY 'FILE STATUS ' WSS-FS-ENTRADA
           END-IF.
