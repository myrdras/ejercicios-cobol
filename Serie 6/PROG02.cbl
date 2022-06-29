      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 2 - ARCHIVOS SECUENCIALES
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  PROG02-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO            ASSIGN TO DISK '..\CUENTAS.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-ARCHIVO.

       DATA DIVISION.

       FILE SECTION.
       FD ARCHIVO.
       01 REG-ARCHIVO.
         05 NROCUENTA                  PIC 9(08).
         05 CODCLIENTE                 PIC 9(08).
         05 MONTO                      PIC S9(15)V99.


       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-ARCHIVO           PIC X(02).
               88 WSS-FS-ARCHIVO-OK                     VALUE '00'.
               88 WSS-FS-ARCHIVO-EOF                    VALUE '10'.

       01 VARIABLES.
         05 WSV-NROCUENTA              PIC 9(08).
         05 WSV-CODCLIENTE             PIC 9(08).
         05 WSV-MONTO                  PIC S9(15)V99.

      * Por alguna razon no se guardan los decimales cuando es negativo
      * y tiene los 15 numeros enteros (se guarda el signo, los 15
      * enteros pero no los decimales) por eso tomo el valor en una
      * variable auxiliar para poder guardar el numero completo.
       01 WS-AUX-MONTO                 PIC S9(16)V99.

       01 WS-RESPUESTA                 PIC A.
           88 WS-SI                                     VALUE 'S'.
           88 WS-NO                                     VALUE 'N'.


       PROCEDURE DIVISION.

       000000-CONTROL.
                 PERFORM 100000-INICIO
                 PERFORM 200000-PROCESO UNTIL WS-NO
                 PERFORM 300000-FINAL.


       100000-INICIO.
           INITIALIZE SWITCHES

           PERFORM 110000-ABRIR-ARCHIVO
           PERFORM 130000-PREGUNTA.


       110000-ABRIR-ARCHIVO.
           OPEN EXTEND ARCHIVO
           IF NOT WSS-FS-ARCHIVO-OK
             DISPLAY 'ERROR DE ARCHIVO'
             DISPLAY 'FILE STATUS ' WSS-FS-ARCHIVO
             PERFORM 300000-FINAL
           END-IF.


       130000-PREGUNTA.
           DISPLAY 'DESEA UN NUEVO REGISTRO AL ARCHIVO?'
           ACCEPT WS-RESPUESTA.


       200000-PROCESO.
           PERFORM 210000-INGRESO
           PERFORM 220000-GRABAR
           PERFORM 130000-PREGUNTA.


       210000-INGRESO.
           DISPLAY 'INGRESE EL NUMERO DE CUENTA: '
           ACCEPT WSV-NROCUENTA
           DISPLAY 'INGRESE EL CODIGO DE CLIENTE: '
           ACCEPT WSV-CODCLIENTE
           DISPLAY 'INGRESE EL MONTO DE LA CUENTA: '
           ACCEPT WS-AUX-MONTO
           MOVE WS-AUX-MONTO TO WSV-MONTO.


       220000-GRABAR.
           MOVE VARIABLES TO REG-ARCHIVO
           WRITE REG-ARCHIVO.


       300000-FINAL.
           PERFORM 310000-TITULOS
           PERFORM 330000-CERRAR-ARCHIVO
           STOP RUN.


       310000-TITULOS.
           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 2 - ARCHIVOS'
           DISPLAY 'Programme: PROG02-08-ME'
           DISPLAY '**************************************'.


       330000-CERRAR-ARCHIVO.
           CLOSE ARCHIVO
           IF NOT WSS-FS-ARCHIVO-OK
              DISPLAY 'ERROR DE ARCHIVO'
            DISPLAY 'FILE STATUS ' WSS-FS-ARCHIVO
           END-IF.
