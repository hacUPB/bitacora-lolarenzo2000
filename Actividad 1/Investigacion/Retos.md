### Reto 1
Carga en D el valor 1978
```assembly
@1978
D=A
```
### Reto 2
Guarda en la posición 100 de la RAM el número 69
```assembly
@69
D=A
@100
M=D
```
### Reto 3
Guarda en la posición 200 de la RAM el contenido de la posición 24 de la RAM
```assembly
@24
D=M
@200
M=D
```
### Reto 4
Lee lo que hay en la posición 100 de la RAM, resta 15 y guarda el resultado en la posición 100 de la RAM
```assembly
@100
D=M
@15
D=D-A
@100
M=D
```
### Reto 5
Suma el contenido de la posición 0 de la RAM, el contenido de la posición 1 de la RAM y con la constante 69. Guarda el resultado en la posición 2 de la RAM
```assembly
@69
D=A
@0
D=D+M
@1
D=D+M
@2
M=D
```
### Reto 6
Si el valor almacenado en D es igual a 0 salta a la posición 100 de la ROM
```assembly
@100
D;JEQ
```
### Reto 7
Si el valor almacenado en la posición 100 de la RAM es menor a 100 salta a la posición 20 de la ROM
```assembly
@100
D=M
D=D-A
@20
D;JLT
```
### Reto 8
* #### ¿Que hace este programa?
    Suma el valor de var1 y var2, y el resultado lo guarda en var3
* #### En qué posición de la memoria está var1, var2 y var3? ¿Por qué en esas posiciones?
    16,17 y 18 respectivamente, porque las primeras 16 ya estan nombradas (0-15)
### Reto 9
* #### ¿que hace este programa?
    Crea una variable i y la iguala a 1, luego crea una variable sum y la iguala a 0, luego a sum se le suma i, por ultimo i se aumenta en 1
* #### ¿En qué parte de la memoria RAM está la variable i y sum? ¿Por qué en esas posiciones?
    16 y 17 respectivamente, porque las primeras 16 ya estan nombradas (0-15)
* ####    Optimiza esta parte del código para que use solo dos instrucciones:
```assembly
@i
M=M+1
```