# Sesión 3

## Profundizando en el encapsulamiento 
**Prompt para ChatGPT:** 
- Los miembros privados y protegidos sí ocupan espacio físico dentro del objeto, porque forman parte de su estructura de datos en memoria.
- Lo que impide que un programa externo acceda a ellos no es la memoria en sí, sino las reglas de acceso que el compilador aplica: cualquier intento de usarlos fuera de su ámbito permitido genera un error de compilación.
- En ejecución, la memoria de un objeto es un bloque contiguo con todos sus atributos (incluidos los privados), pero solo el código dentro de la clase (o amigos) tiene permitido manipularlos directamente.

## Hagamos un poco de hackers y rompamos el encapsulamiento
- **¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?**  
  El encapsulamiento es el principio que agrupa los datos  y los métodos de una clase, ocultando los detalles internos y exponiendo solo lo que es publico.
  
- **¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?**  
  Porque así se evitan modificaciones indebidas que puedan dejar al objeto en un estado inválido.
  
- **¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?**  
  ``reinterpret_cast`` permite reinterpretar los bits de un objeto como si fueran de otro tipo sin verificar compatibilidad lógica. Es peligroso, porque el compilador no garantiza que lo que se lea tenga sentido. Puede romper la seguridad de tipos, producir comportamientos indefinidos y vulnerabilidades.
  
- **¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?**  
  Los miembros privados siguen estando en memoria junto a los demás atributos. Usando punteros y reinterpret_cast, se puede saltar la restricción de acceso y leer directamente esos bytes de memoria.
  
- **¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real?**  
  Acceder a datos fuera de control puede corromper memoria; exponer información sensible o permitir exploits; Rompe la encapsulación y hace el programa muy difícil de mantener.
- **¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++?**   
  El encapsulamiento en C++ es una restricción del compilador, no del tiempo de ejecución, la seguridad de acceso a miembros no es absoluta, se basa en disciplina del programador, no en aislamiento real, en C++ puedes romper las reglas si usas casts peligrosos, por lo que la encapsulación no debe considerarse una barrera de seguridad, sino una herramienta de organización y diseño.

## Herencia y la Relación en Memoria
- **¿Cómo se organizan los atributos en memoria?**  
  Primero se colocan en memoria los atributos heredados de la clase base, luego se suman los atributos propios de la clase derivada, en orden de declaración.
- **¿Qué sucede si agregamos más niveles de herencia?**  
  La memoria se organiza de forma jerarquica y secuencial.
- **Prompt para ChatGPT:**  
  En C++, cuando se crea un objeto de una clase derivada:
  * Sus atributos de la clase base se almacenan al inicio del objeto, seguidos por los atributos definidos en la clase derivada.
  * Esto asegura que un puntero a la clase base pueda apuntar correctamente a la parte base del objeto derivado.
  * Si hay múltiples niveles de herencia, cada clase agrega su “bloque” en memoria, en el orden de herencia.

## Polimorfismo y Vtables en detalle
- **¿Cómo utiliza el programa las vtables para el polimorfismo?**  
  Cuando una clase declara un método virtual, el compilador crea una tabla de punteros a funciones llamada vtable, dada objeto de esa clase guarda un puntero oculto a su vtable (vptr).
- **¿Cuál es el impacto en el rendimiento?**  
  Llamar a un método virtual cuesta una búsqueda en tabla mas el salto requerido para correrla, es un poco más lento que una llamada normal, pero la diferencia es mínima en la mayoría de programas, el costo real aparece cuando hay demasiadas llamadas.
- **Prompt para ChatGPT:**  
  En C++ el polimorfismo se implementa mediante:
  - Un puntero oculto (vptr) en cada objeto con métodos virtuales.
  - Una vtable por clase, que guarda las direcciones de los métodos virtuales.
  - Al heredar y sobreescribir métodos, la vtable se ajusta para apuntar a las nuevas funciones.
  - Así, en tiempo de ejecución, el programa puede decidir cuál versión del método llamar según el tipo real del objeto, no el tipo del puntero.

## Reflexión
- **¿Cómo se implementan internamente el encapsulamiento, la herencia y el polimorfismo?**
  - Encapsulamiento:  
    Implementado en tiempo de compilación mediante reglas de acceso, el compilador impide accesos ilegales, pero en memoria los atributos privados están ahí junto a los demás, y no añade sobrecarga en ejecución, es solo una barrera lógica.
  - Herencia:
    La clase derivada contiene una subparte en memoria correspondiente a la clase base, si no hay virtuales, no hay punteros extras, solo los atributos heredados y los propios de la derivada, si si hay herencia virtual, se añade un puntero oculto (vptr).
  - Polimorfismo:
    Un puntero oculto en cada objeto con virtuales (vptr), Una tabla de funciones por clase (vtable), En tiempo de ejecución, la llamada virtual busca en la vtable y salta a la función correcta.
