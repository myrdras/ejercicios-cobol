      *****************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 1 - Estructuras Básicas
      * Tectonics:   cobc
      *****************************************************************
       IDENTIFICATION DIVISION.
      *****************************************************************
      *****El nombre de programa se conforma de la sig. manera      ***
      *****PROG01 donde 01 corresponde al nro de ejerc de 2 digitos ***
      *****       si el ejercicio fuera 1-b se agrega la letra      ***
      *****       a continuación ej. PROG01B                        ***
      *****-00-   indica el cod. de usuario s/lista curso           ***
      *****-SA    indica las iniciales del usuario                  ***
      *****************************************************************
       PROGRAM-ID.   PROG01-00-SA.

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
          05 WSV-IMP-CUOTA        PIC 9(04)V9(02).


       01 CONSTANTES.
          05 WSC-0                PIC 9(01)       VALUE 0.
          05 WSC-1                PIC 9(01)       VALUE 1.
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

       200000-PROCESO.

              PERFORM UNTIL WSA-CONT= WSC-5
              ADD 1 TO WSA-CONT
              DISPLAY '**************************************'
              DISPLAY 'INGRESE IMPORTE CUOTA ' WSA-CONT
              DISPLAY '**************************************'
              ACCEPT WSV-IMP-CUOTA
              COMPUTE WSA-ACUM-IMPORTE=WSA-ACUM-IMPORTE + WSV-IMP-CUOTA
              END-PERFORM.


       300000-FINAL.

           DISPLAY '**************************************'
           DISPLAY 'Author:   SISTEMAS ACTIVOS S.R.L.'
           DISPLAY 'Purpose:  EJERCICIO 1 - Estr.Basicas'
           DISPLAY 'Programme:PROG01-00-SA'.
           DISPLAY '**************************************'.

           DISPLAY '**************************************'
           DISPLAY 'PAGOS TOTALES ULTIMO SEMESTRE $' WSA-ACUM-IMPORTE.
           DISPLAY '**************************************'.

       END-RUN.
