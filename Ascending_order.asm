.MODEL SMALL
.STACK 100H
.DATA 
  MSG1 DB 'ENTER INPUT:','$'
  MSG2 DB 0AH,0DH,'OUTPUT:','$'
  ARRY DB 100 DUP (?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    MOV SI,1
    MOV AH,01H
    
 FOR:
    INT 21H
    CMP AL,0DH
    JE EXIT
    MOV ARRY[SI],AL
    INC SI
  JMP FOR  
    
 EXIT:
     MOV CX,SI
     MOV BX,CX
     DEC BX
     
  F:
     F2:
       MOV DL,ARRY[BX]
       MOV DI,CX
       CMP ARRY[DI],DL
       JG EX
       JMP EX2
       
   EX:
     XCHG DL,ARRY[DI]
     MOV ARRY[BX],DL
    
   EX2:
     LOOP F2
     MOV CX,BX
     DEC BX
     LOOP F
     
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    
    MOV CX,SI
    MOV BX,1
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