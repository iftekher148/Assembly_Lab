.MODEL SMALL
.STACK 100
.DATA
  MSG1 DB 'ENTER INPUT:','$'
  MSG2 DB 0AH,0DH,'EVEN:','$'
  MSG3 DB 0AH,0DH,'ODD:','$'
  R DB ?
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSG1
    MOV AH,9
    INT 21H 
    
    MOV AH,01H
    INT 21H
    MOV CL,AL
    SUB CL,30H
    MOV AX,CX
    MOV BL,2
    DIV BL
    MOV R,AH
    CMP R,0
    JE EVEN
    JMP ODD
    
    EVEN:
      LEA DX,MSG2
      MOV AH,9
      INT 21H
      JMP EXIT
      
    ODD:
      LEA DX,MSG3
      MOV AH,9
      INT 21H
      JMP EXIT  
           
           
      EXIT: 
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END MAIN
      