      ******************************************************************
      * Author:      FABRICA DE SOFTWARE - SISTEMAS ACTIVOS S.R.L.
      * Date:        01 DE JUNIO 2019.
      * Purpose:     EJERCICIO 7 - Estructuras B�sicas
      * Tectonics:   cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. PROG07-08-ME.

       ENVIRONMENT DIVISION.

       CONFIGURATION SECTION.
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       DATA DIVISION.

       FILE SECTION.

       WORKING-STORAGE SECTION.

           01 WS-CUENTABANCARIA.
               05 WS-SUCURSAL         PIC 9(3)  VALUE 0.
               05 FILLER              PIC X     VALUE '-'.
               05 WS-PRODUCTO         PIC 9(2)  VALUE 0.
               05 FILLER              PIC X     VALUE '-'.
               05 WS-NROCUENTA        PIC 9(5)  VALUE 0.
               05 FILLER              PIC X     VALUE '-'.
               05 WS-DIGITO           PIC 9(1)  VALUE 0.

           77 WS-VALIDAR              PIC 99.
               88 WS-CAJAAHORRO                 VALUE 40.
               88 WS-PRESTAMOP                  VALUE 50.
               88 WS-PRESTAMOH                  VALUE 60.
               88 WS-CC                         VALUE 45.


       PROCEDURE DIVISION.

       000000-CONTROL.

            DISPLAY "INGRESE NUMERO DE SUCURSAL."
            ACCEPT WS-SUCURSAL
            DISPLAY "INGRESE NUMERO DE PRODUCTO."
            DISPLAY "40 - CAJA DE AHORRO"
            DISPLAY "50 - PRESTAMO PRENDARIO"
            DISPLAY "60 - PRESTAMO HIPOTECARIO"
            DISPLAY "45 - CUENTA CORRIENTE"
            DISPLAY " "
            DISPLAY "RESPUESTA: "
            ACCEPT WS-VALIDAR

            IF WS-CAJAAHORRO OR WS-PRESTAMOP OR WS-PRESTAMOH OR WS-CC
                MOVE WS-VALIDAR TO WS-PRODUCTO
            ELSE
                DISPLAY "NO EXISTE VALOR"
            END-IF.

            DISPLAY "INGRESE NUMERO DE CUENTA."
            ACCEPT WS-NROCUENTA.

            DISPLAY "INGRESE DIGITO."
            ACCEPT WS-DIGITO.

            DISPLAY "SU CUENTA ES: " WS-CUENTABANCARIA.

            STOP RUN.
