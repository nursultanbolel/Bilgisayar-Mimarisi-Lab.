
        mov cl,[numCnt]
        mov si, offset nums
    
        call execBCDFormulaLab_sum1
        
        call execBCDFormulaLab_sum2
        
        call result
        
        hlt

        
proc execBCDFormulaLab_sum1
         mov cl,[numCnt]
         shr cl,1
     
nxt:     lodsw
         add al,dl
         daa
         mov dl,al 
         
         mov al,ah
         adc al,dh
         daa
         mov dh,al
         
         loop nxt
         mov [sum1],dx
         mov dx,00h
               
         ret
         

proc execBCDFormulaLab_sum2
         mov cl,[numCnt]
         shr cl,1
     
nxt12: 
         lodsw
         add al,dl
         daa
         mov dl,al 
         
         mov al,ah
         adc al,dh
         daa
         mov dh,al
         
         loop nxt12
         mov [sum2],dx
         mov dx,00h
               
         ret
         
proc result
         mov ax,[sum1]
         mov bx,[sum2]
         sbb ax,bx
         das
         mov [rslt],ax
         

     
numCnt db 6
nums dw 101h, 0099h, 0955h, 0100h, 0402h, 0204h
rslt dw 0000h
sum1 dw 0000h 
sum2 dw 0000h 