INCLUDE "EMU8086.INC"
.MODEL SMALL
.STACK 100H
.DATA
  MSG DB 'INPUT:','$'
  CCOUNT1 DB '0'
  VCOUNT2 DB '0'
  SCOUNT3 DB '0'
  DCOUNT4 DB '0'
  
.CODE

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,09H
    INT 21H
    
    MOV AH,01H
    
    FOR:
    
       INT 21H
       CMP AL,0DH
       JE EXIT
       
       CMP AL,'A'
       JGE LETTER
       
       CMP AL,' '
       JE SPACE
       
       CMP AL,'0'
       JGE DIGIT
       
    DIGIT:
    
        CMP AL,'9'
        JLE DIGIT2
    JMP FOR
    
    DIGIT2:
        INC DCOUNT4
    JMP FOR    
       
    LETTER:
       
       CMP AL,'z'
       JLE LETTER2
    JMP FOR
    
    LETTER2:
      
       CMP AL,'a'
       JE VOWEL
       CMP AL,'A'
       JE VOWEL
       
       CMP AL,'e'
       JE VOWEL
       CMP AL,'E'
       JE VOWEL 
       
       CMP AL,'i'
       JE VOWEL
       CMP AL,'I'
       JE VOWEL 
       
       CMP AL,'o'
       JE VOWEL
       CMP AL,'O'
       JE VOWEL 
       
       CMP AL,'u'
       JE VOWEL
       CMP AL,'U'
       JE VOWEL
       
       INC CCOUNT1
    JMP FOR
    
    VOWEL:
    
       INC VCOUNT2
    JMP FOR
    
    SPACE:
    
       INC SCOUNT3
    JMP FOR    
       
       
   EXIT:
   
      PRINTN
      PRINT "CONSONENT:"
      MOV AH,02H
      MOV DL,CCOUNT1
      INT 21H
      
      PRINTN
      PRINT "VOWEL:"
      MOV AH,02H
      MOV DL,VCOUNT2
      INT 21H
      
      PRINTN
      PRINT "SPACE:"
      MOV AH,02H
      MOV DL,SCOUNT3
      INT 21H
      
      PRINTN
      PRINT "DIGIT:"
      MOV AH,02H
      MOV DL,DCOUNT4
      INT 21H
          
    
    MOV AH,4CH
    INT 21H
    
    MAIN ENDP
END MAIN