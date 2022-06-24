public class Tablero {
    public void imprimirTab(int matriz[][]) {
        
        //Mostrar Casillas de Agua
        for (int i = 0; i < 10; i++) {
          for (int j = 0; j < 10; j++) {
            motor.mostrar("prueba_3", 100 * i, 100 * j, 100, 100);
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
