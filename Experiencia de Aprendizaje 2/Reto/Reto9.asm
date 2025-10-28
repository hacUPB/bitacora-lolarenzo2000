@main
0;JMP

(suma)
    @a
    D=M
    @b
    D=D+M
    @salida
    0;JMP

(main)
    @suma
    0;JMP
    (salida)
    @c
    M=D
    

(fin)
@fin
0;JMP