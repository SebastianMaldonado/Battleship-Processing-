/*
|-------------------------------//-------------------------------|
|  Battleship - Beta 1.0 (21/06/22)                              |
|  Proyecto Independiente                                        |
|                                                                |
|  Desarrolladores: Aaron Rodríguez & Sebastián Maldonado        |
|-------------------------------//-------------------------------|

  Descripción de versión:
    Nuevas Implementaciones:
      
*/


/*
|----------------------------//----------------------------|
|  Página Principal - Zona de Pruebas                      |
|----------------------------//----------------------------|
*/

import javax.swing.JOptionPane;

//Variables del Juego
Jugador jugador1 = new Jugador(1);
Jugador jugador2 = new Jugador(2);
Jugador jugador;


//Inicializa el motor gráfico con la proporción del mundo virtual
Motor_Grafico motor = new Motor_Grafico(1000, 1000);

//Variables de Prueba
int menu = 3;

void setup (){
  motor.inicializar();
  fullScreen();
  jugador = jugador1;
  jugador1.iniciarB ();
  //jugador2.iniciarB();
  //jugador1.mostrarTab(2);
  //jugador2.mostrarTab(2);
}

void draw (){
  switch (menu) {
    case 0:  //Menú de Inicio
      break;
    case 1:  //Menú de Opciones
      break;
    case 2:  //Menú de Inicio
      break;
    case 3:  //Mapa de Batalla
      jugador.mostrarTab(2);
      break;
    case 4:  //Radar
      break;
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
