# Sesión 3

## Profundizando en el encapsulamiento 
Prompt para ChatGPT: 
- Los miembros privados y protegidos sí ocupan espacio físico dentro del objeto, porque forman parte de su estructura de datos en memoria.
- Lo que impide que un programa externo acceda a ellos no es la memoria en sí, sino las reglas de acceso que el compilador aplica: cualquier intento de usarlos fuera de su ámbito permitido genera un error de compilación.
- En ejecución, la memoria de un objeto es un bloque contiguo con todos sus atributos (incluidos los privados), pero solo el código dentro de la clase (o amigos) tiene permitido manipularlos directamente.

## Hagamos un poco de hackers y rompamos el encapsulamiento
- ¿Qué es el encapsulamiento y cuál es su propósito en la programación orientada a objetos?
- ¿Por qué es importante proteger los datos de una clase y restringir el acceso desde fuera de la misma?
- ¿Qué significa reinterpret_cast y cómo afecta la seguridad del programa?
- ¿Por qué crees que se pudo acceder a los miembros privados de MyClass en este experimento, a pesar de que el compilador normalmente lo impediría?
- ¿Cuáles podrían ser las consecuencias de utilizar técnicas como las mostradas en este experimento en un programa real?
- ¿Qué implicaciones tiene este experimento sobre la confianza en las barreras de encapsulamiento que proporciona C++?


## Herencia y la Relación en Memoria
- ¿Cómo se organizan los atributos en memoria?
- ¿Qué sucede si agregamos más niveles de herencia?
- Prompt para ChatGPT:

## Polimorfismo y Vtables en detalle
- ¿Cómo utiliza el programa las vtables para el polimorfismo?
- ¿Cuál es el impacto en el rendimiento?
- Prompt para ChatGPT:

## Reflexión
- ¿Cómo se implementan internamente el encapsulamiento, la herencia y el polimorfismo?
- Análisis: