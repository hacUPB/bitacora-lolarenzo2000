# Bitacora

### Actividad 1
---
- #### ¿Cuál es el resultado que se obtiene al ejecutar este programa?  
    Una aplicacion que abre una ventana donde hay un circulo que sigue al mouse

### Actividad 2
---
- #### ¿Qué fue lo que incluimos en el archivo .h?  
    Un vector de particulas y una variable de color
- #### ¿Cómo funciona la aplicación?  
    Cada vez que el mouse se mueve crea un circulo de un color el cual se puede cambiar si se presiona cualquiera de los botones del mouse (incluyendo la rueda y extras), despues de 100 circulos el programa empieza a borrar los mas viejos.
- #### ¿Qué hace la función mouseMoved?  
    Coloca los circulos, mientras borra los viejos
- #### ¿Qué hace la función mousePressed?  
    Cambia el color del mouse
- #### ¿Qué hace la función setup?  
    Selecciona el color del fondo y el circulo
- #### ¿Qué hace la función update?  
    nada
- #### ¿Qué hace la función draw?  
    Dibuja los circulos

### Actividad 3
---
El color (en azul y rojo) cambia dependiendo de la coordenada X (rojo) y Y (azul) del mouse, la cual se consigue con la funcion interna de OpenFrameworks de ```ofGetMouseX()``` y ```ofGetMouseY()```. Verde queda en zero. La funcion de ```mousePressed``` se borra ya que no tiene uso en el codigo.
``` c++
void ofApp::mouseMoved(int x, int y) {
	particles.push_back(ofVec2f(x, y));
	particleColor = ofColor(ofGetMouseX() / 4, 0, ofGetMouseY() / 3);
	if (particles.size() > 100) {
		particles.erase(particles.begin());
	}
}
```

### Actividad 5
---
- #### ¿Cuál es la definición de un puntero?
  	Es una variable que guarda la direccion de memoria de otra variable
- #### ¿Dónde está el puntero?
  	En ```ofApp.h``` con ```Sphere* selectedSphere``` que señala la esfera que sea selleccionada
- #### ¿Cómo se inicializa el puntero?
  	Cuando se crea una esfera en el vector ```spheres``` en ```ofApp.cpp setup()```
- #### ¿Para qué se está usando el puntero?
  	Para guardar el lugar de memoria de la esfera seleccionada
- #### ¿Qué es exactamente lo que está almacenado en el puntero?
  	La direccion de una instancia de una esfera

### Actividad 6
El problema es que la vola no se suelta, esto se puede arreglar poniendo la funcion ```mousedragged()``` que detecta cuando se mueve el mouse con una tecla undida moviendo lo que estaba en la funcion ```update()``` dentro de la nueva funcion.

### Actividad 7
1. ¿Qué sucede cuando presionas la tecla “c”?
   El programa intenta dibujar una esfera pero no puede, en la esquina superior menciona haberlo hecho
2. ¿Qué sucede cuando presionas la tecla “c”?
   Dibuja un circulo en un lugar aleatorio de la ventana y en la esquina superior aparece un mensaje confirmando la creacion de la esfera con sus coordenadas
3. ¿Porque ocurre esto?
   Al guardarlo en memoria stack se borra tan pronto se salga de la funcion (una variable local), mientras lo que se guarde en memoria heap no (variable global)
