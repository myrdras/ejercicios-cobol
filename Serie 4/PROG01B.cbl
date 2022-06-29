      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1B - Estructuras Básicas
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG01B-08-ME.

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
          05 WSV-NRO-CUOTA        PIC 9(01).
          05 WSV-IMP-CUOTA        PIC 9(04)V9(02).

       77 MASCARA                 PIC ZZZZ.V9(2).

       01 NOMBRE-CLIENTE.
          05 WSV-NOMBRE           PIC X(10).
          05 WSV-APELLIDO         PIC X(10).

       01 CONSTANTES.
          05 WSC-5                PIC 9(01)       VALUE 5.

       01 ACUMULADORES.
          05 WSA-ACUM-IMPORTE     PIC 9(04)V9(02).
          05 WSA-CONT             PIC 9.

       PROCEDURE DIVISION.

       000000-CONTROL.
           PERFORM 100000-INICIO
           PERFORM 200000-PROCESO
           PERFORM 300000-FINAL
           STOP RUN.

       100000-INICIO.

           INITIALIZE VARIABLES
                      ACUMULADORES.

           DISPLAY 'INGRESE NOMBRE'
           ACCEPT WSV-NOMBRE.
           DISPLAY 'INGRESE APELLIDO'
           ACCEPT WSV-APELLIDO.


       200000-PROCESO.

           PERFORM UNTIL WSA-CONT = WSC-5
              ADD 1 TO WSV-NRO-CUOTA
              DISPLAY '**************************************'
              DISPLAY 'INGRESE IMPORTE CUOTA ' WSV-NRO-CUOTA
              DISPLAY '**************************************'
              ACCEPT WSV-IMP-CUOTA
              COMPUTE WSA-ACUM-IMPORTE=WSA-ACUM-IMPORTE + WSV-IMP-CUOTA
              ADD 1 TO WSA-CONT
           END-PERFORM.

       300000-FINAL.

           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 1B - Estr.Basicas'
           DISPLAY 'Programme: PROG01B-08-ME'.
           DISPLAY '**************************************'.

           DISPLAY 'NOMBRE Y APELLIDO: ' FUNCTION TRIM(WSV-NOMBRE) ' '
                   FUNCTION TRIM(WSV-APELLIDO).

           MOVE WSA-ACUM-IMPORTE TO MASCARA.

           DISPLAY '**************************************'
           DISPLAY 'PAGOS TOTALES ULTIMO SEMESTRE $' MASCARA.
           DISPLAY '**************************************'.
