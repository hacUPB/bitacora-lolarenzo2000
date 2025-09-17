# Sesión 2

## Análisis de la estructura de una clase

### ¿Donde se almacenan lo datos de una clase?

#### 1. No estáticos
    * Stack:
        Si el obheto se crea como una variable local, los datos se almacenan en el stack.
    * Heap:
        si el objeto es creado dinamicamente, los datos de almacenan en el heap.

#### 2. Estáticos
    Se almacenan en una parte especial de la memoria, sin importar cuantas vecez se cree una instancia de la clase.

---

### ¿Donde se almacenan los metodos de una clase?

#### 1. No estáticos
    Se almacenan en la misma sección de código del programa y se invocan atravez de intancias de una clase.

#### 2. Estáticos
    Se almacenan en una sección especial de la memoria, como los datos, y no tienen acceso a datos no estaticos, porque no pertenecen a ninguna instancia en especifico.

---

### vtable

#### Definición
    Es una tabla que contiene punteros a los metodos virtuales de una clase. Cada clase qeu tenga al menos un método virtual tiene su propia vtable.

#### Relación con los Metodos Virtuales
    La vtable es esensial para que los metodos virtuales funcionen correctamente en c++. Gracias a ella, el programa puete determinar que version del metodo invocar, incluso si el tipo de variable o puntero es un tipo base.

---

## Exploración de metodos virtuales

### ¿En qué parte de la memoria se encuentran las vtable de cada objeto?
---
    En lugares distintos, una despues de la otra

### ¿Cómo afecta la presencia de métodos virtuales al tamaño del objeto?
---
    Aumenta el tamaño del objeto porque introduce un puntero virtual (vptr) adicional

### ¿Qué papel juegan las vtables en el polimorfismo?
---
    El puntero vptr apunta a la tabla virtual, que permite la resolucion dinamica de métodos.