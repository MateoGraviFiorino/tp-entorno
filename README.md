# Trabajo Práctico Final - Entorno de Programación.

El trabajo práctico consiste en generar un contenedor que al ejecutarse, despliegue un menú de opciones con scripts a ejecutar. Estos, filtraran de alguna forma el texto pasado como argumento.

Para llegar a esto, usamos la imágen base de ubuntu y editamos un dockerfile.

# ¿Cómo ejecutar el dockerfile?

- Desde linux:
  - Primero debemos clonar el repositorio de github. Para esto ponemos en la terminal lo siguiente:
      $ git clone https://github.com/D0lfi/tp-entorno.git  (en la carpeta deseada.)
      
  - Ya estamos en nuestra carpeta con los archivos del repositorio.
  
  - Ahora debemos 'buildear' nuestro menú desplegable, para eso:
      $ docker build --tag <nombre-que-queramos> .
  
  - Esperamos el proceso de 'build', que debería verse algo así:
  
        ![image](https://user-images.githubusercontent.com/98848893/182677608-f4c355e3-fc3c-4e93-a3b3-39e67745a5e3.png)


  - Una vez haya terminado el proceso, deberemos correr este menu desplegable con el siguiente código:
     $ docker run -it <nombre-que-hayamos-puesto>
  
  - Una vez ejecutado el contenedor (que se ejecuta con un texto predeterminado), debería desplegarse el menu. Se ve de la siguiente manera:
    
        ![image](https://user-images.githubusercontent.com/98848893/182678065-c1102519-e941-46e0-941f-a48e86e842a0.png)
  
  - Listo! Ahora ingresamos qué script queremos utilizar, deberemos ingresar el número correspondiente al script deseado.
  
  - Ejemplo, al ingresar por ejemplo el número 2, debería ejecutar el primer script correspondiente.
  
  - Para salir del contenedor/ menu desplegable, ingresaremos el número 1.
  
# Posibles problemas.
    
  - Si existen problemas de permisos ejecutaremos el código con $ sudo + el código necesario.
  
 
    
  
