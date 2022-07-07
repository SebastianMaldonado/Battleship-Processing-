public class Jugador {

    Tablero tab = new Tablero();
    Flota listB = new Flota ();

    int mat_barcos[][] = new int[10][10];
    int mat_radar[][] = new int[10][10];
    int barcos;

    public Jugador () {
      for (int i = 0; i != 10; i++) {
        for (int j = 0; j != 10; j++) {
          this.mat_barcos[i][j] = 0;
          this.mat_radar[i][j] = 0;
        }
      }
    }
    
    public void posicionarFlota () {
      
    }
    
    public void disparado (int x, int y) {
      if (this.mat_barcos[x][y] == 0) {    //Casilla vacía
        println("No se encontró barco");
        return;
      }
      
      //Si hay un barco, indicar qué barco es
      println("Barco encontrado");
      this.listB.disparoFlota (x, y, this.mat_barcos[x][y]);
    }
    
    
    public void disparar (int x, int y, boolean acierto) {
      if (acierto)
        this.mat_radar[x][y] = 1;
      else
        this.mat_radar[x][y] = 2;
    }
    
    
    public boolean acertado (int x, int y) {
      if (this.mat_barcos[x][y] != 0)
        return true;
        
      return false;
    }
    
    
    public boolean casillaDisparada (int x, int y) {
      if (this.mat_radar[x][y] == 0)
        return false;
        
      return true;
    }
    
        
    public void añadirBarco (int x, int y, int tam, boolean hor) {
      this.barcos += 1;
      this.listB.addBarcos(x, y, tam, hor);
      
      if (hor) {  //Barco horizontal
        for (int i = 0; i < tam; i++)
          this.mat_barcos[x + i][y] = this.barcos;
        return;
      }
      
      //Barco vertical
      for (int i = 0; i < tam; i++)
        this.mat_barcos[x][y + i] = this.barcos;
    }
    
    public void mostrarTab () {
      tab.imprimirTab();
      listB.mostrar();
    }
    
    public void mostrarRad () {
      tab.imprimirRad(mat_radar);
    }

    
    public void temp () {
      this.añadirBarco (1, 0, 5, true);
      this.añadirBarco (1, 1, 5, true);
      this.añadirBarco (1, 2, 5, true);
      this.añadirBarco (1, 3, 5, false);
    }    
    
    
    public boolean jugadorDerrotado () {
      return listB.flotaDerrotada();
    }
}


public class Lista_jugadores {
  Jugador jugador;
  Lista_jugadores siguiente;
  
  public Lista_jugadores (Jugador jugador) {
    this.jugador = jugador;
    this.siguiente = this;
  }
  
  
  public void añadirJugador (Jugador jugador) {
    Lista_jugadores nuevo = new Lista_jugadores (jugador);
    Lista_jugadores temp = this;
    
    while (temp.siguiente != this) {
      temp = temp.siguiente;
    }
    
    nuevo.siguiente = this;
    temp.siguiente = nuevo;
  }
}
