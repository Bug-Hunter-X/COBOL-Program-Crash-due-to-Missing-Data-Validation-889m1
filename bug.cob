01  WS-DATA-RECORD.         
    05  WS-CUSTOMER-ID PIC 9(5). 
    05  WS-CUSTOMER-NAME PIC X(30). 
    05  WS-AMOUNT PIC 9(7)V99. 

PROCEDURE DIVISION. 
    PERFORM UNTIL EOF-FLAG = 'Y' 
        READ CUSTOMER-FILE AT END MOVE 'Y' TO EOF-FLAG 
        IF EOF-FLAG = 'N' THEN 
            ADD WS-AMOUNT TO WS-TOTAL-AMOUNT 
        END-IF 
    END-PERFORM 
    DISPLAY "Total amount:" WS-TOTAL-AMOUNT
    STOP RUN.