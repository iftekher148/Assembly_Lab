.MODEL SMALL
.STACK 100H
.DATA
  MSG1 DB 'ENTER INPUT:','$'
  MSG2 DB 0AH,0DH,'OUTPUT:','$'
  M DW '0'
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    INT 21H
    MOV BL,AL
    SUB BL,30H
    MOV CX,BX
    CMP CX,0
    JE EXIT
    MOV AX,1
    
    FOR:
      MUL CX
      LOOP FOR
      
      MOV BX,AX
      
      JMP EXIT2
    EXIT:
      MOV BX,1
      EXIT2:
      
      LEA DX,MSG2
       MOV AH,09H
       INT 21H
       
       MOV AH,02H
       MOV DX,BX
       ADD DL,30H
       INT 21H
      
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN