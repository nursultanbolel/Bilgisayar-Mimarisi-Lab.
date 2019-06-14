MOV SI, OFFSET inputCodded
MOV DI, OFFSET inputText


NXT:     LODSB
         CMP AL, '$'
         JE OUTPUT
         CMP AL, [codeSave]
         JE NXT
         CMP AL, [codeSwap]
         JE NXT
         CMP AL, [codeEnd]
         JE NXT
         CMP AL, '0'
         JB SPA
         CMP AL, '9'
         JA Cap
         STOSB
         JMP NXT
 

OUTPUT:  NOP
         MOV SI, OFFSET inputCodded
         MOV DI, OFFSET outputText
 
NEXT:    NOP
         LODSB
         CMP AL, '$'
         JE FIN
         CMP AL, [codeSave]
         JE SAVE
         CMP AL, [codeSwap]
         JE SWAP
         CMP AL, [codeEnd]
         JE NEXT
         CMP AL, '0'
         JB SPACE
         CMP AL, '9'
         JA UPCHAR
         STOSB
         JMP NEXT
 
 
SPACE:   NOP
         MOV AL, ' '
         STOSB
         JMP NEXT
 

UPCHAR:  NOP
         CMP AL, 'A'
         JB SPACE
         CMP AL, 'Z'
         JA LOWCHAR
         STOSB
         JMP NEXT
 
LOWCHAR: NOP
         CMP AL, 'a'
         JB SPACE
         CMP AL, 'z'
         JA SPACE
         STOSB
         JMP NEXT
 
 
SAVE:    NOP
         LODSB
         CMP AL, [codeEnd]
         JE NEXT
         STOSB
         JMP SAVE
 
SWAP:    NOP
         LODSB
         CMP AL, [codeEnd]
         JE NEXT
         CMP AL, 'Z'
         JA TOUPPER
         ADD AL, 32
         STOSB
         JMP SWAP 
         
         
TOUPPER: NOP
         SUB AL, 32
         STOSB
         JMP SWAP
 
Cap:     CMP AL, 'A'
         JB SPA
         CMP AL, 'Z'
         JA LWR
         STOSB
         JMP NXT
 
LWR:     CMP AL, 'a'
         JB SPA
         CMP AL, 'z'
         JA SPA
         STOSB
         JMP NXT
 
 
SPA:     MOV AL, ' '
         STOSB
         JMP NXT
 
 
FIN:HLT 
            

codeSave db '@' ; save the characters
codeSwap db '*' ; only low2up or vice versa
codeEnd db '!'
inputCodded db 'B*ILGmIM!_18-19@#Lab-!A@Uyg-4!-STR*ing!+ISLem#$'
inputText db '*****************'
outputText db 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'