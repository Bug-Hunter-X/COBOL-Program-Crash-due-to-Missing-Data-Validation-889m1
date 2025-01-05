01  WS-DATA-RECORD.         
    05  WS-CUSTOMER-ID PIC 9(5). 
    05  WS-CUSTOMER-NAME PIC X(30). 
    05  WS-AMOUNT PIC 9(7)V99. 
    05  WS-AMOUNT-TEMP PIC 9(7)V99. 
    05 WS-ERROR-FLAG PIC X VALUE 'N'. 

PROCEDURE DIVISION. 
    PERFORM UNTIL EOF-FLAG = 'Y' 
        READ CUSTOMER-FILE AT END MOVE 'Y' TO EOF-FLAG 
        IF EOF-FLAG = 'N' THEN 
            MOVE WS-AMOUNT TO WS-AMOUNT-TEMP 
            IF NUMERIC WS-AMOUNT-TEMP THEN 
                ADD WS-AMOUNT TO WS-TOTAL-AMOUNT 
            ELSE 
                DISPLAY "Invalid amount detected in record" 
                MOVE 'Y' TO WS-ERROR-FLAG 
            END-IF 
        END-IF 
    END-PERFORM 
    IF WS-ERROR-FLAG = 'N' THEN 
        DISPLAY "Total amount:" WS-TOTAL-AMOUNT 
    ELSE 
        DISPLAY "Errors detected during processing." 
    END-IF 
    STOP RUN.