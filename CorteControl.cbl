      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       100000-COMIENZO.
           OPEN ARCHIVO.
           IF FILE-STATUS = 00
               NEXT SENTENCE
           ELSE
               DISPLAY "ERROR OPEN"
               PERFORM 999999-FIN
           END-IF.

           READ ARCHIVO.

           IF FILE-STATUS = 00
               MOVE CUENTA TO CUENTA-ANT
               MOVE TARJETA TO TARJETA-ANT
               MOVE IMPORTE TO TOT-CUENTA-ANT
               MOVE IMPORTE TO TOT-TARJETA-ANT
           ELSE
               IF FILE-STATUS = 10
                   DISPLAY "ARCHIVO VACIO"
                   PERFORM 999999-FIN
               ELSE
                   DISPLAY "ERROR LECTURA"
                   PERFORM 999999-FIN
               END-IF
           END-IF.
           PERFORM 200000-PROCESO.
           PERFORM 999999-FIN.




       999999-FIN.
           STOP RUN.

       200000-PROCESO.
           PERFORM 300000-LEER UNTIL FILE-STATUS = 10.
           PERFORM 500000-TOTALES.

       300000-LEER.
           READ ARCHIVO.

           IF FILE-STATUS = 00
               NEXT SENTENCE
           ELSE
               DISPLAY "ERROR LECTURA"
               MOVE 10 TO FILE-STATUS
           END-IF.

           IF CUENTA = CUANTA-ANT
               COMPUTE TOT-CUENTA-ANT = TOT-CUENTA-ANT + IMPORTE
           ELSE
               PERFORM 400000-CORTE-CUENTA
           END-IF.

           IF TARJETA = TARJETA-ANT
               COMPUTE TOT-CUENTA-ANT = TOT-CUENTA-ANT + IMPORTE
           ELSE
               PERFORM 450000-CORTE-TARJETA
           END-IF.

       400000-CORTE-CUENTA.
           PRINT TOT-TARJETA-ANT.
           PRINT TOT-CUENTA-ANT.
           MOVE CUENTA TO CUENTA-ANT.
           MOVE TARJETA TO TARJETA-ANT.
           MOVE IMPORTE TO TOT-CUENTA-ANT.

       450000-CORTE-TARJETA.

       500000-TOTALES.
           PRINT TOT-TARJETA-ANT.
           PRINT TOT-CUENTA-ANT.

       END PROGRAM YOUR-PROGRAM-NAME.
