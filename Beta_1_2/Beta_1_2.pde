/*
|-------------------------------//-------------------------------|
|  Battleship - Beta 1.2 (7/07/22)                               |
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
Partida juego = new Partida (2);



//Inicializa el motor gráfico con la proporción del mundo virtual
Motor_Grafico motor = new Motor_Grafico(1000, 1000);

//Variables de Prueba
int menu = 3;

void setup (){
  motor.inicializar();
  fullScreen();
  
  //Prueba
  juego.lista.jugador.temp();
  juego.lista.siguiente.jugador.temp();
}

void draw (){
  switch (menu) {
    case 0:  //Menú de Inicio
      break;
    case 1:  //Menú de Opciones
      break;
    case 2:  //Posicionar barcos
      break;
    case 3:  //Mapa de Batalla
      juego.mostrarTablero();
      break;
    case 4:  //Radar
      juego.mostrarTablero();
      break;
  }
}

void mousePressed () {
  motor.presionar();
  
  if (menu == 4)
    juego.disparar (int(motor.rt_x/100), int(motor.rt_y/100));
}

void mouseWheel (MouseEvent event) {
  motor.zoom(event.getCount());
}

void keyPressed() {
  if (key == ENTER)    //Pasar Turno
    juego.pasarTurno();
    
  if (key == TAB)      //Cambiar de Tablero
    juego.cambiarTablero();
  
  motor.mover();
}
  
