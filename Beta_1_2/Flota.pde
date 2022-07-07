public class Flota {
  Barco head;
  
  private class Barco {
    Cubierta[] casillas;  //Lista de Casillas del barco
    int tam;              //Tamaño del barco
    boolean hundido;      //Si el barco fue hundido [true] | [false] si sigue operativo
    
    public Barco siguiente;
    
    Barco (int x, int y, int tam, boolean hor) {
      this.casillas = new Cubierta [tam];
      this.tam = tam;
      this.hundido = false;
      this.siguiente = null;
      
      if (hor) {
        for (int i = 0; i < tam; i++)
          this.casillas[i] = new Cubierta (x + i, y, "barco-" + tam + "-horizontal-" + (i + 1));
        return;
      }
      
      for (int i = 0; i < tam; i++)
        this.casillas[i] = new Cubierta (x , y + i, "barco-" + tam + "-vertical-" + (i + 1));
    }
    
    private class Cubierta {
      int pos_x, pos_y;    //Posición de esta parte del barco
      String imagen;       //Nombre de la imagen
      int estado;          //[1] buen estado | [2] dañado
      
      public Cubierta (int x, int y, String imagen) {
        this.pos_x = x;
        this.pos_y = y;
        this.imagen = imagen;
        this.estado = 1;
      }
      
      //----------------------------|Verificar Ataque|----------------------------//
      //Retornará la validación de si el disparo acertó en esta parte del barco o no
      public boolean verificarPos (int x, int y) {
        if (this.pos_x == x && this.pos_y == y)
          return true;
          
        return false;
      }
      
      
      //----------------------------|Verificar Ataque|----------------------------//
      public void atacado () {
        this.estado = 2;
        this.imagen = this.imagen + "-averiado";
      }
      
      
      //----------------------------|Mostrar Casilla|----------------------------//
      public void mostrar () {
        motor.mostrar(this.imagen, 100 * pos_x, 100 * pos_y, 100, 100);
      }
    }
    
    public void disparoBarco (int x, int y) {
      for (int i = 0; i < tam; i++) {
        if (casillas[i].verificarPos(x, y)) {
          casillas[i].atacado();
        }
      }
    }
    
    public void mostrar () {
      for (int i = 0; i < tam; i++)
        casillas[i].mostrar();
    }
    
    public boolean barcoHundido () {
      boolean hundido = true;
      
      for (int i = 0; i < tam; i++)
        if (casillas[i].estado != 2)
          hundido = false;
         
      this.hundido = hundido;
      return hundido;
    }
  }
  
  public void mostrar () {
    Barco temp = this.head;
    
    while (temp != null) {
      temp.mostrar();
      temp = temp.siguiente;
    }
  }
  
  public void addBarcos(int x, int y, int tam, boolean hov) {  
    Barco temp = this.head;
    Barco nuevo = new Barco(x, y, tam, hov);
    
    if (temp == null) {
      this.head = nuevo;
      return;
    }
    
    while (temp.siguiente != null) {
      temp = temp.siguiente;
    }
          
    temp.siguiente = nuevo;
  }
  
  public void disparoFlota (int x, int y, int barco) {
    Barco temp = this.head;
    
    for (int i = 1; i < barco; i++)
      temp = temp.siguiente;
      
    temp.disparoBarco(x, y);
  }
  
  public boolean flotaDerrotada () {
    boolean derrota = true;
    
    Barco temp = this.head;
    
    while (temp != null) {
      if (!temp.barcoHundido())
        derrota = false;
        
      temp = temp.siguiente;
    }
    
    println(derrota);
    
    return derrota;
  }
}
