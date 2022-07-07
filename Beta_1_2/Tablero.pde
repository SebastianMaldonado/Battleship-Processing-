public class Tablero {
    public void imprimirTab() {
        
        //Mostrar Casillas de Agua
        for (int i = 0; i < 10; i++) {
          for (int j = 0; j < 10; j++) {
            motor.mostrar("agua", 100 * i, 100 * j, 110, 110);
          }
        }
    }
    
    
    public void imprimirRad (int[][] mat) {
      for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
          motor.mostrar("prueba_3", 100 * i, 100 * j, 110, 110);
          if (mat[i][j] == 1)
            motor.mostrar("prueba", 100 * i, 100 * j, 110, 110);
          else if (mat[i][j] == 2)
            motor.mostrar("prueba_4", 100 * i, 100 * j, 110, 110);
        }
      }
    }

    public boolean ponerB (int matriz[][], int x, int y, boolean hov, int tam) {
        int i = 0;
        boolean ent = true;
        if (hov) {
            while (ent && tam != i) {
                if (y + i < 10) {
                    if (matriz[y + i][x] != 0) {
                        ent = false;
                        return false;
                    }
                    i = i + 1;
                } else {
                    JOptionPane.showMessageDialog(null, "El barco no puede ser colocado en esta posicion por su tamaño y orientacion");
                    ent = false;
                    return false;
                }
            }
            i = 0;
            if (ent) {
                while (i != tam) {
                    matriz[y + i][x] = 1;
                    i = i + 1;
                }
            } else {
                JOptionPane.showMessageDialog(null, "No se ha podido poner el barco porque se encuentra ocupada la casilla");
                ent = false;
                return false;
            }
        } else {
            while (ent && tam != i) {
                if (x + i < 10) {
                    if (matriz[y][x + i] != 0) {
                        ent = false;
                        return false;
                    }
                    i = i + 1;
                } else {
                    JOptionPane.showMessageDialog(null, "El barco no puede ser colocado en esta posicion por su tamaño y orientacion");
                    ent = false;
                    return false;
                }
            }
            i = 0;
            if (ent) {
                while (i != tam) {
                    matriz[y][x + i] = 1;
                    i = i + 1;
                }
            } else {
                JOptionPane.showMessageDialog(null, "No se ha podido poner el barco porque se encuentra ocupada la casilla");
                ent = false;
                return false;
            }
        }
        return ent;
    }

}
