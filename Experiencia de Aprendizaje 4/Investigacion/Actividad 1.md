# Actividad 1

1. ### Entiende la aplicación

2. ### Realiza evaluaciones formativas

3. ### ¿Qué es una lista enlazada y en qué se diferencia de un arreglo en cuanto a la forma en que los elementos están almacenados en la memoria?
   Una lista enlazada es una estructura de datos donde cada nodo contiene un dato y el puntero del siguiente nodo, mientras que un arreglo es una collecion de elementos almacenados en ubicaciones de la memoria contiguas, mientras que una lista esta distribuida en la memoria de forma no contigua.
   
5. ### Al observar el código de una lista enlazada en C++, ¿Cómo crees que se vinculan los nodos entre sí? ¿Qué estructura se utiliza para lograr esta conexión?
   Guardando la direccion del siguiente nodo en la misma clase de nodo ```Node* next```

6. ### ¿Cómo se gestiona la memoria en una lista enlazada? Investiga cómo se crea y se destruye un nodo en memoria utilizando el operador new y delete en C++.
   Con el operador new se crea en la memoria heap, y con delete se libera esa memoria

7. ### Considerando la estructura de una lista enlazada, ¿qué ventajas ofrece en comparación con un arreglo cuando se trata de insertar o eliminar elementos en posiciones intermedias?
   Insertar o eliminar nodos en medio es rápido porque solo se cambian punteros, no hay que mover todos los elementos como en un arreglo.

8. ### En el código presentado, ¿Cómo se asegura que no haya fugas de memoria? ¿Qué papel juega el destructor en la clase LinkedList?
   El destructor recorre y libera cada nodo. Hace que al destruir la lista no queden nodos ocupando la memoria

9. ### ¿Qué sucede en la memoria cuando se invoca el método clear() en una lista enlazada? Explica paso a paso cómo se liberan los recursos.
   Se liberan todos los nodos de la memoria, exepto la memoria utilizada por la lista en si (puntero cabeza y puntero cola).

10. ### Explica cómo cambia la estructura en memoria de una lista enlazada al agregar un nuevo nodo al final de la lista. ¿Cómo afecta esto al rendimiento de la lista enlazada?
   Se crea un nuevo nodo en la memoria, se conecta el ```next``` del ```tail``` con el nuevo nodo y este nuevo se convierte en el tail

11. ### Analiza una situación en la que utilizar una lista enlazada sería más ventajoso que utilizar un arreglo. Justifica tu respuesta considerando la gestión de memoria y las operaciones de inserción y eliminación.
    En un programa que crea circulos dibujando con el mouse y esos circulos se pueden borrar aleatoriamente sin que siempre sea el ultimo, una lista seria mas ventajosa porque no habria que reacomodar la memoria cada vez que se borra un circulo.

12. ### Después de estudiar el manejo de memoria en listas enlazadas, ¿Cómo aplicarías este conocimiento para diseñar una estructura de datos personalizada para una aplicación creativa? ¿Qué aspectos considerarías para asegurar la eficiencia y evitar fugas de memoria?
    Usar clear cuando un objeto desaparesca de la escena, evitar llamar new y delete cada frame, tener cuidado con nodos sueltos.

13. ### Reflexiona sobre las diferencias en la gestión de memoria entre C++ y un lenguaje con recolección de basura automática como C#. ¿Qué ventajas y desafíos encuentras en la gestión explícita de memoria en C++ al trabajar con estructuras de datos?
    Con C++ hay mas control de memoria, con el riesgo de un memory leak, C# hay menos control sobre la memoria, con menos probabilidad de un memory leak.

14. ### Imagina que estás optimizando una pieza de arte generativo que usa listas enlazadas para representar elementos en movimiento. ¿Qué consideraciones tomarías en cuenta para garantizar que la gestión de la memoria sea eficiente y que no ocurran fugas de memoria?


15. ### Prueba
