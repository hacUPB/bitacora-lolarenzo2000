# Sesión 2

## Análisis de la estructura de una clase
- **¿Donde se almacenan lo datos de una clase?**
   - No estáticos
     * Stack:
       Si el obheto se crea como una variable local, los datos se almacenan en el stack.
     * Heap:
       si el objeto es creado dinamicamente, los datos de almacenan en el heap.
   - Estáticos
     Se almacenan en una parte especial de la memoria, sin importar cuantas vecez se cree una instancia de la clase.
- **¿Donde se almacenan los metodos de una clase?**
   - No estáticos:
     Se almacenan en la misma sección de código del programa y se invocan atravez de intancias de una clase.
   - Estáticos:
     Se almacenan en una sección especial de la memoria, como los datos, y no tienen acceso a datos no estaticos, porque no pertenecen a ninguna instancia en especifico.
- **VTABLE:** Es una tabla que contiene punteros a los metodos virtuales de una clase. Cada clase qeu tenga al menos un método virtual tiene su propia vtable.
   - Relación con los Metodos Virtuales:  
     La vtable es esencial para que los metodos virtuales funcionen correctamente en c++. Gracias a ella, el programa puete determinar que version del metodo invocar, incluso si el tipo de variable o puntero es un tipo base.


## Exploración de metodos virtuales
- **¿En qué parte de la memoria se encuentran las vtable de cada objeto?**  
  En lugares distintos, una despues de la otra
- **¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?**  
  Aumenta el tamaño del objeto porque introduce un puntero virtual (vptr) adicional
- **Prompt para ChatGPT:**
  - **Puntero a función:** dirección directa a una función global o estática. Tamaño = puntero normal. No afecta a los objetos.
  - **Puntero a método miembro:** referencia a un método dentro de una clase, necesita un objeto para usarse. Puede ser más grande y requiere más pasos en tiempo de ejecución.
  - **Impacto en tamaño de objetos:** ninguno, salvo que guardes explícitamente uno como atributo.
  - **Impacto en rendimiento:** punteros a funciones son más rápidos; punteros a métodos miembro son más flexibles pero ligeramente más costosos.

## Reflexión
- **¿Dónde residen los datos y métodos de una clase en la memoria?**
  - Datos:
       - No estaticos: Se guardan por cada instancia, su ubicacion depende si se crearon de forma local o dinamica.
       - Estaticos: No se guardan en cada instancia, sino una sola copia para toda las instancias de la clase y residen en el segmento de datos estáticos del programa.
  - Metodos:  
    El código de los métodos vive en el segmento de código del programa y no se copia en cada instancia, sino que todos las instancias de la clase comparten las mismas funciones. Si son metodos virtuales se crea una vtable y un puntero oculto que apunta a ella que si aumentaria el tamaño del objeto.
- **¿Cómo interactúan las diferentes partes en tiempo de ejecución?**  
  Cuando se ejecutan los objetos aportan sus datos, los métodos se ejecutan desde código compartido y, si son virtuales, se resuelven mediante la vtable, mientras que los atributos estáticos se consultan en memoria global.
