# Actividad 1

- ¿Qué son los vértices?
  Puntos en el espacio tridimensional.
- ¿Con qué figura geométrica se dibuja en 3D?
  Con triangulos.
- ¿Qué es un shader?
  Es un programa que se ejecuta en lla GPU.
- ¿Cómo se le llaman a los grupos de píxeles de un mismo triángulo?
  Se llaman fragments
- ¿Qué es un fragment shader?
  Es el shader que se encarga de calcular el color final de cada fragmento
- ¿Qué es un vertex shader?
  Es el shader que se encarga de procesar carda vertice de un 3d mesh.
- ¿Al proceso de determinar qué pixels del display va a cubrir cada triángulo de una mesh se le llama?
  Rasterizacion
- ¿Qué es el render pipeline?
  Es la secuencia completa de datos desde el modelo o figura hasta la imagen final en pantalla
- ¿Hay alguna diferencia entre aplicar un color a una superficie de una mesh o aplicar una textura?
  Si, el color es un valor unico, mientras que la textura es una imagen que se mapea sobre la figura.
- ¿Cuál es la diferencia entre una textura y un material?
  Las texturas son imagenes, mientras que el material es un conjunto de propiedades que definen como se va a ver una superficie.
- ¿Qué transformaciones se requieren para mover un vértice del 3D world al View Screen?
  Posicion del objeto en el mundo, posicion relativa a la camara, projeccion, se hace la division de perspectiva y se pasa al screen space.
- ¿Al proceso de convertir los triángulos en fragmentos se le llama?
  Rasterizacion
- ¿Qué es el framebuffer?
  Es una zona de memoria que almacena las imagenes renderizadas
- ¿Para qué se usa el Z-buffer o depth buffer en el render pipeline?
  Para controlar la profundidad de los píxeles y decidir qué fragmentos están delante o detrás.