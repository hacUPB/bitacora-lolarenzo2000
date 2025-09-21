# Sesión 1

## Introducción a los Objetos

- **¿Qué representa la clase Particle?**   
  La clase Particle representa un modelo para crear partículas en un plano bidimensional.
- **¿Cómo interactúan sus atributos y métodos?**
  * Atributos (x, y): Guardan la posición de la particula.
  * Método (move): Modifica esos atributos sumando un desplazamiento (dx, dy) a la posición actual.
- **Prompt para ChatGPT:**
  * Clase: es como un plano o molde. Define qué atributos y métodos tendrá algo, pero no es "algo" todavía.  
  → class Particle { ... }; es solo la definición.

  * Objeto: es una instancia concreta de esa clase. Es un "ejemplar real" que ocupa memoria y tiene valores propios en sus atributos.  
  → Particle p; crea un objeto llamado p.

``` cpp
#include <iostream>
using namespace std;

class Particle {
public:
    float x, y;
    void move(float dx, float dy) {
        x += dx;
        y += dy;
    }
};

int main() {
    Particle p1;   // Creo un objeto llamado p1
    p1.x = 0;
    p1.y = 0;

    cout << "Posición inicial: (" << p1.x << ", " << p1.y << ")\n";

    p1.move(2.5, 4.0); // Muevo la partícula
    cout << "Posición después de mover: (" << p1.x << ", " << p1.y << ")\n";

    return 0;
}

```

## Explorando la memoria
- **¿Los atributos están almacenados de forma contigua?**  
  Si, dentro de un objeto, sus atributos se almacenan uno después del otro en memoria.
- **¿Qué indica el tamaño del objeto sobre su estructura interna?**  
  El tamaño del objeto refleja no solo la suma de sus atributos, sino también la forma en que el compilador organiza y alinea esos datos en memoria para garantizar acceso eficiente.
- **Prompt para ChatGPT:**
  * Cada objeto (p1, p2) ocupa un bloque de tamaño fijo = sizeof(Particle).
  * Los bloques de distintos objetos suelen estar contiguos en memoria si están en el mismo contexto (ej. stack).
  * Los atributos de un mismo objeto sí se guardan contiguos, aunque puede haber espacios de relleno (padding) para alineación.

 ## Análisis de diferencias

- **¿Cómo afectan los datos estáticos al tamaño de la instancia?**  
  Los datos estáticos no afectan el tamaño de cada instancia, porque no se almacenan dentro de cada objeto, sino en una sola copia compartida a nivel de clase.
- **¿Qué diferencias hay entre datos estáticos y dinámicos en términos de memoria?**
  * Estáticos (static):
    * Se almacenan en una sola dirección de memoria fija (segmento estático o global).
    * No se replican en cada objeto.
    * Se comparten entre todas las instancias de la clase.
  * Dinámicos (new):
    * Se almacenan en el heap.
    * Cada objeto que reserve memoria dinámica tendrá su propio bloque en el heap.
    * El objeto solo guarda un puntero (que sí cuenta en sizeof), pero los datos a los que apunta están fuera del objeto.
- **Prompt para ChatGPT:**   
  Las variables estáticas no incrementan el tamaño de cada objeto, porque son compartidas y residen en memoria estática. En cambio, las variables dinámicas sí influyen indirectamente: el tamaño del objeto incluye solo el puntero, pero la memoria real que ocupa depende de cuánto se reserve con new.  
  **En conclusión:**  
    * **Estáticas** → no ocupan espacio adicional en cada objeto.  
    * **Dinámicas** → el objeto solo contiene el puntero, el resto vive en el heap y puede variar según lo que se reserve.

## Relexión
- **¿Qué es un objeto desde la perspectiva de la memoria?**
  Un objeto es un bloque de memoria reservado que contiene los atributos definidos en su clase.
- **¿Cómo influyen los atributos y métodos en el tamaño y estructura del objeto?**
  Los atributos afectan el tamaño de loa objetos
