public class Partida {
  Lista_jugadores lista;
  boolean juego_finalizado;
  
  public Partida (int cant_jug) {
    this.juego_finalizado = false;
    this.lista = new Lista_jugadores (new Jugador());
    
    for (int i = 1; i < cant_jug; i++) {
      this.lista.añadirJugador (new Jugador());
    }
  }
  
  public void cambiarTablero () {
    if (juego_finalizado)
      return;
    
    if (menu == 3)       //Tablero -> Radar
      menu = 4;
    else if (menu == 4)  //Radar -> Tablero
      menu = 3;
  }
  
  public void pasarTurno () {    
    this.lista = this.lista.siguiente;
    menu = 3;
  }
  
  
  public void mostrarTablero () {
    if (menu == 3)  //Mostrar tablero de barcos
      this.lista.jugador.mostrarTab();
    else if (menu == 4)          //Mostrar tablero de disparos
      this.lista.jugador.mostrarRad();
  }
  
  
  public void disparar (int x, int y) {
    Jugador jugador = lista.jugador;
    Jugador enemigo = lista.siguiente.jugador;
    
    if (jugador.casillaDisparada(x, y))  //Si la casilla ya fue disparada anteriormente
      return;
    
    lista.jugador.disparar(x, y, enemigo.acertado(x, y));
    enemigo.disparado (x, y);
    
    if (finPartida()) {
      juego_finalizado = true;
    }
    
    this.pasarTurno();
  }
  
  
  public boolean finPartida () {
    if (lista.siguiente.jugador.jugadorDerrotado())
      return true;
      
    return false;
  }
}
