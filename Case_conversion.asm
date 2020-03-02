                                         .MODEL SMALL
.STACK 100H
.DATA
  MSG1 DB 'ENTER INPUT:','$'
  MSG2 DB 0AH,0DH,'OUTPUT:','$'
  ARRY DB 100 DUP(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    XOR BX,BX
    MOV AH,01H
   
    
    FOR:
     INT 21H
    CMP AL,0DH
    JE EXIT
    CMP AL,'a'
    JGE LOWER
    CMP AL,'A'
    JL ARY
    ADD AL,20H
    JMP ARY
    
    
    LOWER:
    CMP AL,'z'
    JG ARY
    SUB AL,20H
    JMP ARY
    
    ARY:
    MOV ARRY[BX],AL
    INC BX
    JMP FOR
    
    
    
    EXIT:
    LEA DX,MSG2
    MOV AH,09H
    INT 21H 
    
    MOV CX,BX
    XOR BX,BX
    MOV AH,02H
    
    FOR2:
    MOV DL,ARRY[BX]
    INT 21H
    INC BX
    
    LOOP FOR2
    
    
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN