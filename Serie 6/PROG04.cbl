      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 4 - ARCHIVOS SECUENCIALES
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


       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO
                 PERFORM 300000-FINAL.

       100000-INICIO.
           INITIALIZE SWITCHES

           PERFORM 110000-ABRIR-ENTRADA
           PERFORM 130000-PRIMER-LECTURA.


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
                      CONTINUE
                 WHEN WSS-FS-ENTRADA-EOF
                      CONTINUE
                 WHEN OTHER
                      DISPLAY 'FILE STATUS' WSS-FS-ENTRADA
                      PERFORM 300000-FINAL.


       200000-PROCESO.
           PERFORM 211000-MOSTRAR-ENCABEZADO
           PERFORM 210000-MOSTRAR UNTIL WSS-FS-ENTRADA-EOF
           PERFORM 213000-MOSTRAR-PIE.


       210000-MOSTRAR.
           PERFORM 210100-CARGAR-SALIDA
           PERFORM 212000-MOSTRAR-CUERPO
           PERFORM 131000-LEER-ENTRADA.


       210100-CARGAR-SALIDA.
           MOVE REG-ENTRADA TO VARIABLES
           MOVE CORRESPONDING WSV-NROCUENTA TO WS-NROCUENTA
           MOVE WSV-CODCLIENTE TO WS-CODCLIENTE
           MOVE WSV-MONTO TO WS-MONTO.


       211000-MOSTRAR-ENCABEZADO.
           DISPLAY '*------------*----------*-------------------*'
           DISPLAY '| NRO.CUENTA | COD.CLI. | DISPONIBLE CUENTA |'
           DISPLAY '*------------*----------*-------------------*'.


       212000-MOSTRAR-CUERPO.
           DISPLAY '| 'WS-NROCUENTA' | 'WS-CODCLIENTE' |' WS-MONTO '|'.


       213000-MOSTRAR-PIE.
           DISPLAY '*------------*----------*-------------------*'.


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
