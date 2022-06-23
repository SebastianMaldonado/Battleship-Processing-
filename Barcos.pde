public class Barcos {
  Barco head;
  
  class Barco {
    int[][] pos;
    int tam;
    boolean hundido;
    public Barco next;
  
    Barco(int x, int y, int tam, boolean hov) {
      this.pos = new int [tam][3];
      this.tam = tam;
      this.hundido = false;
      for (int i = 0; i < tam; i++) {
        if (hov) {
          this.pos[i][0] = x + i;
          this.pos[i][1] = y;
          this.pos[i][2] = 0;
        } else {
          this.pos[i][0] = x;
          this.pos[i][1] = y + i;
          this.pos[i][2] = 0;
        }
      }
      
      this.next = null;
    }
    
    boolean siDisparado (int x, int y) {
      for (int i = 0; i < tam; i++) {
        if (this.pos[i][0] == x && this.pos[i][1] == y) {
          return true;  
        }
      }
      
      return false;
    }
    
    void mostrar () {
      int pos_x, pos_y;
      for (int i = 0; i < tam; i++) {
        pos_x = this.pos[i][0] * 100;
        pos_y = this.pos[i][1] * 100;
        
        motor.mostrar("prueba", pos_x, pos_y, 100, 100);
      }
    }
  }
  
  public void addBarcos(int x, int y, int tam, boolean hov) {  
    Barco temp = this.head;
    Barco nuevo = new Barco(x, y, tam, hov);
    
    if (temp == null) {
      this.head = nuevo;
      return;
    }
    
    while (temp.next != null) {
      temp = temp.next;
    }
          
    temp.next = nuevo;
  }
  
  public void disparo (int x, int y) {
    Barco temp = this.head;
    boolean disparado = false;
    
    while (temp.next == null && !disparado) {
      disparado = temp.siDisparado (x, y);
      temp = temp.next;
    }
  }
 
  public void mostrar () {
    Barco temp = this.head;
    
    while (temp != null) {
      temp.mostrar();
      temp = temp.next;
    }
  }
}
