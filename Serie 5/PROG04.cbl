      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 4 - ARCHIVOS - CREACION DE ARCHIVO DE
      *              SALIDA A IMAGEN DEL DE ENTRADA
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  PROG04-08-ME.

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


       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO
                                UNTIL WSS-FS-ENTRADA-EOF
                 PERFORM 300000-FINAL.

       100000-INICIO.
           INITIALIZE SWITCHES

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
           PERFORM 131000-LEER-ENTRADA.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 330000-CERRAR-ENTRADA
           STOP RUN.


       310000-TITULOS.
           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 4 - ARCHIVOS'
           DISPLAY 'Programme: PROG04-08-ME'
           DISPLAY '**************************************'.


       330000-CERRAR-ENTRADA.
           CLOSE ENTRADA
           IF NOT WSS-FS-ENTRADA-OK
              DISPLAY 'ERROR DE ARCHIVO DE ENTRADA'
            DISPLAY 'FILE STATUS ' WSS-FS-ENTRADA
           END-IF.
