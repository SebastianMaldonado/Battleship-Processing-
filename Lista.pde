/*
|====================================================================|
*                           |Lista de Imágenes|
* Descripción:                                                        
*   Lista enlazada circular encargada de almacenar las imágenes 
*   para utilizar en el motor gráfico
|====================================================================|
*/
public class Lista_imagenes1 {
  Nodo lista;
  String carpeta;
  String formato;
  
  public Lista_imagenes1 () {
    this.lista = new Nodo ("defecto", "png", "");
    this.carpeta = "";
    this.formato = "";
  }
  
  
  /*
  |====================================================================|
  *                              |Nodo|
  * Descripción:                                                        
  *   Clase de almacenamiento de cada nodo de la lista
  |====================================================================|
  */
  private class Nodo {
    Repo_imagen imagen;      //Repositorio de Imagen
    int tipo;                //[1] Imagen estática | [2] Animación      
    Nodo siguiente;          //Siguiente objeto en la lista
    
    /* 
    ||================|Constructor Imagen Estática|================||
    */ 
    Nodo (String archivo, String formato, String carpeta) {
      this.imagen = new Imagen (archivo, formato, carpeta);
      this.tipo = 1;
      this.siguiente = this;
    }
    
    /* 
    ||===================|Constructor Animación|===================||
    */
    Nodo (String archivo, String formato, String carpeta, int secuencia) {
      this.imagen = new Animacion (archivo, formato, carpeta, secuencia);
      this.tipo = 2;
      this.siguiente = this;
    }
  }
  
  
  //----------------------------|Solicitar Imagen|----------------------------//
  public PImage solicitarImagen (String archivo) {
    Nodo temp = encontrarNodo (archivo);
    return temp.imagen.solicitarImagen();
  }
  
  
  //----------------------------|Ingresar Imagen|----------------------------//
  public void ingresarImagen (String archivo, String formato, String carpeta) {
    Nodo nuevo = new Nodo (archivo, formato, carpeta);
    ingresarNodo (nuevo);
  }
  
  
  //----------------------------|Ingresar Animacion|----------------------------//
  public void ingresarAnimacion (String archivo, String formato, String carpeta, int secuencia) {
    Nodo nuevo = new Nodo (archivo, formato, carpeta, secuencia);
    ingresarNodo (nuevo);
  }
  
  
  //========================[Métodos para Operar Nodos]========================//
  
  //----------------------------|Encontrar un Nodo|----------------------------//
  private Nodo encontrarNodo (String archivo) {
    Nodo temp = lista;
    
    //Buscar en la lista
    while (temp.siguiente != this.lista){
      temp = temp.siguiente;
      
      if (temp.imagen.archivo == archivo)  //Si se encontró
        return temp;
    }
    
    Nodo nuevo = new Nodo (archivo, this.formato, this.carpeta);
    ingresarNodo (nuevo);
    return nuevo;
  }
  
  
  //----------------------------|Ingresar Nodo|----------------------------//
  private void ingresarNodo (Nodo nuevo) {
    nuevo.siguiente = this.lista;
    this.lista = nuevo;
  }
}
