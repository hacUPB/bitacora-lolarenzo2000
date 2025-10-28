- ¿Qué es la entrada-salida mapeada a memoria?  
Es cuando los inputs (entradas) y outputs (salidas) tienen su propio espacio en la memoria

- ¿Cómo se implementa en la plataforma Hack?  
Para editar la pantalla o leer la tecla que se presione 

- Inventa un programa que haga uso de la entrada-salida mapeada a memoria.  
``` assembly
(reset)
    @SCREEN
    M=1
    @32
    D=A
    @KBD
    D=D-M
    @mover
    D;JEQ
    @reset
    0;JMP
(mover)
    @SCREEN
    D=M
    DM=D+M
    @32768
    D=D-A
    @mover
    D;JNE
    @reset
    0;JMP
```
- Investiga el funcionamiento del programa con el simulador.  
Mueve un pixel cada vez que se undapresione espacio
