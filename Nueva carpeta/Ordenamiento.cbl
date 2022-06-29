      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. ORDENAMIENTO.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.

       01 VECTOR.
           03 NUMERO OCCURS 10         PIC 9(02).
           03 PROMEDIO                 PIC 9(02)V99.

       01 CONSTANTES.
           03 WSC-10                   PIC 9(02) VALUE 10.
           03 WSC-9                    PIC 9(01) VALUE 9.

       01 INDICE.
           03 IND-NUM                  PIC 9(02).
           03 IND-SUB-IND              PIC 9(02).

       01 ACUMULADORES.
           03 ACUM                     PIC 9(04).

       01 AUXILIAR.
           03 NUM-AUX                  PIC 9(02).


       PROCEDURE DIVISION.
           PERFORM 100000-INICIO
           PERFORM 200000-PROCESO
           PERFORM 300000-FINAL
           STOP RUN.

           100000-INICIO.
               COMPUTE NUMERO(1) = 10
               COMPUTE NUMERO(2) = 20
               COMPUTE NUMERO(3) = 2
               COMPUTE NUMERO(4) = 5
               COMPUTE NUMERO(5) = 4
               COMPUTE NUMERO(6) = 89
               COMPUTE NUMERO(7) = 32
               COMPUTE NUMERO(8) = 88
               COMPUTE NUMERO(9) = 99
               COMPUTE NUMERO(10) = 0.

           200000-PROCESO.
               PERFORM VARYING IND-NUM FROM 1 BY 1 UNTIL IND-NUM>WSC-10
                   PERFORM VARYING IND-SUB-IND FROM 1 BY 1 UNTIL
                                   IND-SUB-IND > WSC-9
                      IF (NUMERO(IND-NUM) > NUMERO(IND-SUB-IND)) THEN
                          COMPUTE NUM-AUX = NUMERO(IND-NUM)
                          COMPUTE NUMERO(IND-NUM) = NUMERO(IND-SUB-IND)
                          COMPUTE NUMERO(IND-SUB-IND) = NUM-AUX
                      END-IF
                   END-PERFORM
               END-PERFORM.


           300000-FINAL.
               PERFORM VARYING IND-NUM FROM 1 BY 1 UNTIL IND-NUM>WSC-10
                   DISPLAY NUMERO(IND-NUM)
               END-PERFORM.
       END PROGRAM ORDENAMIENTO.
