INCLUDE 'EMU8086.INC'
.MODEL SMALL
.STACK 100H
.DATA
    MSG1 DB 'ENTER INPUT:','$'
    MSG2 DB 0AH,0DH,'OUTPUT:','$'
   ARRAY DB 100 DUB(?)
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG1
    MOV AH,09H
    INT 21H
    
    XOR BX,BX
    MOV AH,1
    
    FOR:
        INT 21H 
        INC BX
        CMP AL,0DH
        JE EXIT
        MOV ARRAY[BX],AL
        
    JMP FOR
    EXIT:
    
    LEA DX,MSG2
    MOV AH,09H
    INT 21H
    
    
    MOV CX,BX
    MOV AH,2 
    
    FOR2:
        MOV DL,ARRAY[BX]
        INT 21H
        DEC BX
        
    LOOP FOR2
    
    MOV AH,4CH
    INT 21H
    MAIN ENDP
END
