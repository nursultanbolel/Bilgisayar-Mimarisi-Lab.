; BilMimLab Uygulama 1
   
    
    mov cx, 0Ah;20 tane karakter icin kullanilacagindan counter 10(0Ah) degerinden baslatilir.
    mov si, offset textRaw;textRax'un adresi SI register'a yuklenir.
    mov di, offset textOrg;textOrg'un adresi DI register'a yuklenir.
    
lp: call myproc;myproc procedure'u çcagirilir.
    loop lp;CX register'ina atanan deger(10 kere) kadar lp etiketine program dallanir. 
    
    hlt;program sonlanir.


proc myproc;myproc adindaki procedure tanimlanir.
    lodsw;SI'in tutdugu adresdeki veri word olarak AX'e yuklenir.
    xor ax,0F55Fh;þsifreleme algoritmasini cozmek icin cesitli logic islemler yapilir.
    neg al 
    not ah
    xchg al,ah
    ror al,1
    rol ah,1
    xor ax,09FF9h
    stosw;AX'teki veriyi DI'in tutdugu adrese yarar.
    ret
              


;BilMimLabBUygulama1(program calistirildiktan sonra textOrg'un degeri)
textOrg db 'XXXXXXXXXXXXXXXXXXX'

;Sifre
textRaw db 0DAh,07Dh,0C8h,021h,0D8h,02Bh,0DEh,061h, 04Dh,03Dh,0D2h,053h,0D4h,037h,0DEh,021h,0DEh, 023h,08Fh,09Bh
