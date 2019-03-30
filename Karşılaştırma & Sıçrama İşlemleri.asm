          mov si, offset nums
          mov cl,[numcnt]
                 
                 
next:     lodsb
          cmp al,[max]
          jb minvalue  
          
          mov [max],al

minvalue: cmp al,[min]
 
          ja sumvalue
          
          mov [min],al
          
sumvalue: mov ah,0h
          add [sum],ax
          loop next   
                    
                    
          mov ax,[sum]
          div [numcnt]
          mov [avg], al
    
          hlt
        
nums DB 101 , 99, 85 , 104 , 75 , 106 , 50 , 109 , 100 
numcnt DB 9
min DB 255
max DB ' ' 
avg DB ' ' 
sum DW 0