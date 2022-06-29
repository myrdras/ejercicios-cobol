      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        14 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1 - EVALUACION INTEGRADORA
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  EVINT-EJ01.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT TRANSAC            ASSIGN TO DISK '..\TRANSAC.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-TRANSAC.

           SELECT CLIENTES           ASSIGN TO DISK '..\CLIENTES.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-CLIENTES.

           SELECT RESULT             ASSIGN TO DISK '..\RESULT.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-RESULT.
       DATA DIVISION.

       FILE SECTION.
       FD TRANSAC.
       01 REG-TRANSAC.
         05 NRO-CLIENTE-T              PIC 9(7).
         05 COD_SERVICIO               PIC X(3).
         05 IMPORTE-T                  PIC 9(7)V99.

       FD CLIENTES.
       01 REG-CLIENTES.
         05 NRO-CLIENTE-C              PIC 9(7).
         05 NYA-C                      PIC X(60).
         05 IMPORTE-C                  PIC 9(7)V99.

       FD RESULT.
       01 REG-RESULT.
         05 NRO-CLIENTE-R              PIC 9(7).
         05 NYA-R                      PIC X(60).
         05 IMPORTE-R                  PIC 9(7)V99.
         05 CANT-TR                    PIC 9(3).

       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-TRANSAC           PIC X(02).
               88 WSS-FS-TRANSAC-OK                     VALUE '00'.
               88 WSS-FS-TRANSAC-EOF                    VALUE '10'.

           05 WSS-FS-CLIENTES          PIC X(02).
               88 WSS-FS-CLIENTES-OK                    VALUE '00'.
               88 WSS-FS-CLIENTES-EOF                   VALUE '10'.

           05 WSS-FS-RESULT            PIC X(02).
               88 WSS-FS-RESULT-OK                      VALUE '00'.
               88 WSS-FS-RESULT-EOF                     VALUE '10'.

       01 AUXILIARES.
         05 WS-AUX-NROC                PIC 9(7).

       01 ACUMULADORES.
           05 WSA-CANT-MOV-C           PIC 9(3).
           05 WSA-CANT-C-LEIDOS        PIC 9(3).
           05 WSA-CANT-C-NOMOV         PIC 9(3).



       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO UNTIL WSS-FS-CLIENTES-EOF
                 PERFORM 300000-FINAL.

       100000-INICIO.
           INITIALIZE SWITCHES
                      ACUMULADORES
                      AUXILIARES

           PERFORM 110000-ABRIR-TRANSAC
           PERFORM 120000-ABRIR-CLIENTES
           PERFORM 130000-ABRIR-RESULT
           PERFORM 140000-PRIMER-LECTURA
           PERFORM 150000-SEGUNDA-LECTURA.


       110000-ABRIR-TRANSAC.
           OPEN INPUT TRANSAC
           IF NOT WSS-FS-TRANSAC-OK
             DISPLAY 'ERROR DE ARCHIVO DE TRANSACCIONES'
             DISPLAY 'FILE STATUS ' WSS-FS-TRANSAC
             PERFORM 300000-FINAL
           END-IF.

       120000-ABRIR-CLIENTES.
           OPEN INPUT CLIENTES
           IF NOT WSS-FS-CLIENTES-OK
             DISPLAY 'ERROR DE ARCHIVO DE RESULT'
             DISPLAY 'FILE STATUS ' WSS-FS-RESULT
             PERFORM 300000-FINAL
           END-IF.

       130000-ABRIR-RESULT.
           OPEN OUTPUT RESULT
           IF NOT WSS-FS-RESULT-OK
             DISPLAY 'ERROR DE ARCHIVO DE RESULTADOS'
             DISPLAY 'FILE STATUS ' WSS-FS-RESULT
             PERFORM 300000-FINAL
           END-IF.

       140000-PRIMER-LECTURA.
           PERFORM 131000-LEER-TRANSAC
           IF WSS-FS-TRANSAC-EOF
             DISPLAY 'ARCHIVO VACIO'
             PERFORM 300000-FINAL
           END-IF.

       150000-SEGUNDA-LECTURA.
           PERFORM 132000-LEER-CLIENTES
           IF WSS-FS-CLIENTES-EOF
             DISPLAY 'ERROR: ARCHIVO CLIENTES VACIO '
                             'PERO TRANSACCIONES NO'
             PERFORM 300000-FINAL
           END-IF.

       131000-LEER-TRANSAC.
           READ TRANSAC
           EVALUATE TRUE
             WHEN WSS-FS-TRANSAC-OK
               CONTINUE
             WHEN WSS-FS-TRANSAC-EOF
               CONTINUE
             WHEN OTHER
               DISPLAY 'FILE STATUS' WSS-FS-TRANSAC
               PERFORM 300000-FINAL.

       132000-LEER-CLIENTES.
           READ CLIENTES
           EVALUATE TRUE
             WHEN WSS-FS-CLIENTES-OK
               MOVE REG-CLIENTES TO REG-RESULT
               MOVE 0 TO IMPORTE-R
               MOVE 0 TO CANT-TR
               ADD 1 TO WSA-CANT-C-LEIDOS
               CONTINUE
             WHEN WSS-FS-CLIENTES-EOF
               CONTINUE
             WHEN OTHER
               DISPLAY 'FILE STATUS' WSS-FS-TRANSAC
               PERFORM 300000-FINAL.


       200000-PROCESO.
           MOVE NRO-CLIENTE-C TO WS-AUX-NROC
           IF NRO-CLIENTE-T EQUALS NRO-CLIENTE-C
             PERFORM 210000-IGUAL-CLIENTE
                       UNTIL NRO-CLIENTE-T > NRO-CLIENTE-C
                                   OR WSS-FS-TRANSAC-EOF
             MOVE WSA-CANT-MOV-C TO CANT-TR
           ELSE
             ADD 1 TO WSA-CANT-C-NOMOV
           END-IF
           WRITE REG-RESULT
           PERFORM 132000-LEER-CLIENTES
           IF WS-AUX-NROC EQUAL NRO-CLIENTE-C
               DISPLAY 'ERROR FATAL: DUPLICADO DE REGISTRO CLIENTE'
               PERFORM 300000-FINAL
           END-IF
           IF WSS-FS-CLIENTES-EOF
               PERFORM 220000-CLIENTE-NO-EXISTE.

       210000-IGUAL-CLIENTE.
           ADD 1 TO WSA-CANT-MOV-C
           ADD IMPORTE-T TO IMPORTE-R
           PERFORM 131000-LEER-TRANSAC.

       220000-CLIENTE-NO-EXISTE.
           IF NRO-CLIENTE-T > WS-AUX-NROC
               DISPLAY 'EROR FATAL ' NRO-CLIENTE-T ' !E AL ARCHIVO'
                                                   ' CLIENTES'
               PERFORM 300000-FINAL.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 320000-TOTALES-DE-CONTROL
           PERFORM 330000-CERRAR-TRANSAC
           PERFORM 340000-CERRAR-CLIENTES
           PERFORM 350000-CERRAR-RESULT
           STOP RUN.

       310000-TITULOS.
           DISPLAY '***********************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 1 - EVALUACION INTEGRADORA'
           DISPLAY 'Programme: EVINT-EJ01'
           DISPLAY '***********************************************'.

       320000-TOTALES-DE-CONTROL.
           DISPLAY '***********************************************'
           DISPLAY 'CANTIDAD DE CLIENTES LEIDOS = ' WSA-CANT-C-LEIDOS
           DISPLAY '***********************************************'
           DISPLAY 'CANTIDAD DE CLIENTES SIN MOVIMIENTOS = '
                                                    WSA-CANT-C-NOMOV
           DISPLAY '***********************************************'.
.
       330000-CERRAR-TRANSAC.
           CLOSE TRANSAC
           IF NOT WSS-FS-TRANSAC-OK
              DISPLAY 'ERROR DE ARCHIVO TRANSACCIONES'
              DISPLAY 'FILE STATUS ' WSS-FS-TRANSAC
           END-IF.

       340000-CERRAR-CLIENTES.
           CLOSE CLIENTES
           IF NOT WSS-FS-CLIENTES-OK
              DISPLAY 'ERROR DE ARCHIVO CLIENTES'
              DISPLAY 'FILE STATUS ' WSS-FS-CLIENTES
           END-IF.

       350000-CERRAR-RESULT.
           CLOSE RESULT
           IF NOT WSS-FS-RESULT-OK
              DISPLAY 'ERROR DE ARCHIVO RESULTADOS'
              DISPLAY 'FILE STATUS ' WSS-FS-RESULT
           END-IF.
