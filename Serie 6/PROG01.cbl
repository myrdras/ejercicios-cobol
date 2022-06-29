      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1 - ARCHIVOS SECUENCIALES
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
           PROGRAM-ID.  PROG01-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.

       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT ARCHIVO            ASSIGN TO DISK '..\SERVICIO.DAT'
                                       ORGANIZATION IS LINE SEQUENTIAL
                                       FILE STATUS IS WSS-FS-ARCHIVO.

       DATA DIVISION.

       FILE SECTION.
       FD ARCHIVO.
       01 REG-ARCHIVO.
         05 CODSERVICIO               PIC X(03).
         05 NUMCUENTA                 PIC 9(08).
         05 DESCRIP                   PIC X(30).
         05 PERIODO.
           10 AAAA                    PIC X(04).
           10 MM                      PIC X(02).
         05 MONTO                     PIC S9(05)V99.


       WORKING-STORAGE SECTION.

       01 SWITCHES.
           05 WSS-FS-ARCHIVO           PIC X(02).
               88 WSS-FS-ARCHIVO-OK                     VALUE '00'.
               88 WSS-FS-ARCHIVO-EOF                    VALUE '10'.

       01 VARIABLES.
         05 WSV-CODSERVICIO            PIC X(03).
         05 WSV-NUMCUENTA              PIC 9(08).
         05 WSV-DESCRIP                PIC X(30).
         05 WSV-PERIODO.
           10 WSV-AAAA                 PIC X(04).
           10 WSV-MM                   PIC 9(02).
         05 WSV-MONTO                  PIC S9(05)V99.

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
           DISPLAY 'INGRESE EL CODIGO DE SERVICIO: '
           ACCEPT WSV-CODSERVICIO
           DISPLAY 'INGRESE EL NUMERO DE CUENTA: '
           ACCEPT WSV-NUMCUENTA
           DISPLAY 'INGRESE LA DESCRIPCION DEL SERVICIO: '
           ACCEPT WSV-DESCRIP
           DISPLAY 'INGRESE EL AÑO DEL PERIODO FACTURADO: '
           ACCEPT WSV-AAAA
           DISPLAY 'INGRESE EL MES DEL PERIODO FACTURADO: '
           ACCEPT WSV-MM
           DISPLAY 'INGRESE EL MONTO FACTURADO: '
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
           DISPLAY 'Purpose:   EJERCICIO 1 - ARCHIVOS'
           DISPLAY 'Programme: PROG01-08-ME'
           DISPLAY '**************************************'.


       330000-CERRAR-ARCHIVO.
           CLOSE ARCHIVO
           IF NOT WSS-FS-ARCHIVO-OK
              DISPLAY 'ERROR DE ARCHIVO'
            DISPLAY 'FILE STATUS ' WSS-FS-ARCHIVO
           END-IF.
