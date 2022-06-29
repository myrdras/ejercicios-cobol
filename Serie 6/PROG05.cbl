      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 5 - ARCHIVOS SECUENCIALES
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  PROG05-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ENTRADA            ASSIGN TO DISK '..\CUENTAS.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-ENTRADA.

       DATA DIVISION.

       FILE SECTION.
       FD ENTRADA.
       01 REG-ENTRADA.
         05 NROCUENTA                  PIC 9(08).
         05 CODCLIENTE                 PIC 9(08).
         05 MONTO                      PIC S9(15)V99.


       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-ENTRADA           PIC X(02).
               88 WSS-FS-ENTRADA-OK                     VALUE '00'.
               88 WSS-FS-ENTRADA-EOF                    VALUE '10'.

       01 VARIABLES.
         05 WSV-NROCUENTA.
           10 WSV-NC1                  PIC 9(02).
           10 WSV-NC2                  PIC 9(05).
           10 WSV-NC3                  PIC 9(01).
         05 WSV-CODCLIENTE             PIC 9(08).
         05 WSV-MONTO                  PIC S9(15)V99.

       01 WS-SALIDA.
         05 WS-NROCUENTA.
           10 WSV-NC1                  PIC 9(02).
           10 FILLER                   PIC X            VALUE '-'.
           10 WSV-NC2                  PIC 9(05).
           10 FILLER                   PIC X            VALUE '-'.
           10 WSV-NC3                  PIC 9(01).
         05 WS-CODCLIENTE              PIC 9(08).
         05 WS-MONTO                   PIC -(15)9,99.

       01 WS-MAXMIN.
         05 WS-MAXMONTO                PIC S9(15)V99.
         05 WS-MAXCODCLIENTE           PIC 9(08).
         05 WS-MINMONTO                PIC S9(15)V99.
         05 WS-MINCODCLIENTE           PIC 9(08).


       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO UNTIL WSS-FS-ENTRADA-EOF
                 PERFORM 300000-FINAL.

       100000-INICIO.
           INITIALIZE SWITCHES

           PERFORM 110000-ABRIR-ENTRADA
           PERFORM 130000-PRIMER-LECTURA
           MOVE WSV-MONTO TO WS-MAXMONTO
           MOVE WSV-CODCLIENTE TO WS-MAXCODCLIENTE
           MOVE WSV-MONTO TO WS-MINMONTO
           MOVE WSV-CODCLIENTE TO WS-MINCODCLIENTE.


       110000-ABRIR-ENTRADA.
           OPEN INPUT ENTRADA
           IF NOT WSS-FS-ENTRADA-OK
             DISPLAY 'ERROR DE ARCHIVO '
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
                      MOVE REG-ENTRADA TO VARIABLES
                      CONTINUE
                 WHEN WSS-FS-ENTRADA-EOF
                      CONTINUE
                 WHEN OTHER
                      DISPLAY 'FILE STATUS' WSS-FS-ENTRADA
                      PERFORM 300000-FINAL.


       200000-PROCESO.
           PERFORM 210000-CALCULARMAXMIN
           PERFORM 131000-LEER-ENTRADA.


       210000-CALCULARMAXMIN.
           IF WSV-MONTO > WS-MAXMONTO
               MOVE WSV-MONTO TO WS-MAXMONTO
               MOVE WSV-CODCLIENTE TO WS-MAXCODCLIENTE
           END-IF
           IF WSV-MONTO < WS-MINMONTO
               MOVE WSV-MONTO TO WS-MINMONTO
               MOVE WSV-CODCLIENTE TO WS-MINCODCLIENTE
           END-IF.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 320000-TOTALES-DE-CONTROL
           PERFORM 330000-CERRAR-ENTRADA
           STOP RUN.


       310000-TITULOS.
           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 5 - ARCHIVOS'
           DISPLAY 'Programme: PROG05-08-ME'
           DISPLAY '**************************************'.


       320000-TOTALES-DE-CONTROL.
           DISPLAY '**************************************'
           DISPLAY 'MAXIMO DISPONIBLE: ' WS-MAXMONTO
           DISPLAY 'CODIGO DE CLIENTE: ' WS-MAXCODCLIENTE
           DISPLAY '**************************************'
           DISPLAY 'MINIMO DISPONIBLE: ' WS-MINMONTO
           DISPLAY 'CODIGO DE CLIENTE: ' WS-MINCODCLIENTE
           DISPLAY '**************************************'.


       330000-CERRAR-ENTRADA.
           CLOSE ENTRADA
           IF NOT WSS-FS-ENTRADA-OK
              DISPLAY 'ERROR DE ARCHIVO DE ENTRADA'
            DISPLAY 'FILE STATUS ' WSS-FS-ENTRADA
           END-IF.
