/*
|-------------------------------//-------------------------------|
|  Motor Gráfico para Java - Versión Mk I Beta 1.0 (17/06/22)    |
|  Proyecto Independiente                                        |
|                                                                |
|  Desarrollador: Marudonado-kami-sama Studios                   |
|-------------------------------//-------------------------------|

  Descripción de versión:
    Nuevas Implementaciones:
      
*/


/*
|----------------------------//----------------------------|
|  Página Principal - Zona de Pruebas                      |
|----------------------------//----------------------------|
*/

//Inicializa el motor gráfico con la proporción del mundo virtual
Motor_Grafico motor = new Motor_Grafico(5000, 5000);

//Variables de Prueba
int cont = 0, prom = 0;

void setup (){
  motor.inicializar();
  fullScreen();
}

void draw (){  
  
  for (int i = 0; i <= 50; i++){
    for (int j = 0; j <= 50; j++){
      motor.mostrar("prueba_3", 100 * i, 100 * j, 100, 100);
      motor.mostrar("prueba", 100 * i, 100 * j, 100, 100);
    }
  }
}

void mousePressed () {
  motor.presionar();
}

void mouseWheel (MouseEvent event) {
  motor.zoom(event.getCount());
}

void keyPressed(){
  motor.mover();
}
