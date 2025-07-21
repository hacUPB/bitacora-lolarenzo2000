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