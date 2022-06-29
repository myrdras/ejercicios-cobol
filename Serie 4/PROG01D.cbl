      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1D - Estructuras Básicas
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID.   PROG01D-08-ME.

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
          05 WSV-TOT-IVA          PIC 9(04)V9(02).
          05 WSV-TOTAL            PIC 9(04)V9(02).
          05 WSV-CUOTA-PROM       PIC 9(04)V9(02).

       77 MASC-IMP                PIC ZZZZ.V9(2).
       77 MASC-TOT-IVA            PIC ZZZZ.V9(2).
       77 MASC-TOTAL              PIC ZZZZ.V9(2).
       77 MASC-CUOTA-PROM         PIC ZZZZ.V9(2).

       01 NOMBRE-CLIENTE.
          05 WSV-NOMBRE           PIC X(10).
          05 WSV-APELLIDO         PIC X(10).

       01 CONSTANTES.
          05 WSC-5                PIC 9(01)       VALUE 5.
          05 WSC-IVA              PIC 9(02)       VALUE 21.

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

           DISPLAY "INGRESE NOMBRE"
           ACCEPT WSV-NOMBRE.
           DISPLAY "INGRESE APELLIDO"
           ACCEPT WSV-APELLIDO.


       200000-PROCESO.

           PERFORM 210000-CARGA.
           PERFORM 220000-CALCULO.


           210000-CARGA.

             PERFORM UNTIL WSA-CONT = WSC-5
               ADD 1 TO WSV-NRO-CUOTA
               DISPLAY '**************************************'
               DISPLAY 'INGRESE IMPORTE CUOTA ' WSV-NRO-CUOTA
               DISPLAY '**************************************'
               ACCEPT WSV-IMP-CUOTA
               COMPUTE WSA-ACUM-IMPORTE=WSA-ACUM-IMPORTE + WSV-IMP-CUOTA
               ADD 1 TO WSA-CONT
             END-PERFORM.


           220000-CALCULO.

             COMPUTE WSV-TOT-IVA = WSA-ACUM-IMPORTE * WSC-IVA / 100
             COMPUTE WSV-TOTAL = WSV-TOT-IVA + WSA-ACUM-IMPORTE
             COMPUTE WSV-CUOTA-PROM = WSA-ACUM-IMPORTE / WSC-5.


       300000-FINAL.

           DISPLAY '**************************************'
           DISPLAY 'Author:    SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:   EJERCICIO 1D - Estr.Basicas'
           DISPLAY 'Programme: PROG01D-08-ME'
           DISPLAY '**************************************'.
           DISPLAY 'WSC-IVA: ' WSC-IVA '%'

           DISPLAY 'NOMBRE Y APELLIDO: ' FUNCTION TRIM(WSV-NOMBRE) ' '
                   FUNCTION TRIM(WSV-APELLIDO).

           MOVE WSA-ACUM-IMPORTE TO MASC-IMP.
           MOVE WSV-TOT-IVA TO MASC-TOT-IVA.
           MOVE WSV-TOTAL TO MASC-TOTAL.
           MOVE WSV-CUOTA-PROM TO MASC-CUOTA-PROM.

           DISPLAY '**************************************'
           DISPLAY 'PAGOS TOTALES SIN IVA:   $' MASC-IMP
           DISPLAY 'MONTO IVA:               $' MASC-TOT-IVA
           DISPLAY 'PAGOS TOTALES CON IVA:   $' MASC-TOTAL
           DISPLAY '**************************************'
           DISPLAY '                                      '
           DISPLAY 'CUOTA PROMEDIO:          $' MASC-CUOTA-PROM
           DISPLAY '**************************************'.
