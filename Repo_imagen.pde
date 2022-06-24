

/*
|====================================================================|
*                       |Repositorio de imagen|
*                           [Clase Padre]
* Descripción:   
*   Se encarga de almacenar las imagenes cargadas
*   Al ser la clase padre de la que heredan Imagen y Animación
*   esta puede pasar la imagen correspiente a un objeto estático
*   o pasar las diferentes imágenes que tiene una animación
|====================================================================|
*/
public class Repo_imagen {
  String archivo;    //Nombre del archivo
  int cont;          //Contador de la cantidad de veces que la imagen ha sido llamada
  int cont_ref;      //Contador de la última vez que fue referenciada la imagen
  
  protected Repo_imagen (String archivo) {
    this.archivo = archivo;
    this.cont = 0;
  }
  
  
  //-------------------------|Solicitar imagen|-------------------------//
  public PImage solicitarImagen () {
    return null;
  }
  
  
  //-------------------------|Incrementar Contador|-------------------------//
  public void incContador () {
    this.cont += 1;
  }
  
  
  //-------------------------|Comprobar Formato|-------------------------//
  //Comprueba los formatos válidos para lectura (png, jpg, tga)
  //si el formato no es válido asignará el predeterminado
  protected String comprobarFormato (String formato) {
    if (formato.equals("png"))
      return formato;
      
    if (formato.equals("jpg"))
      return formato;
      
    if (formato.equals("tga"))
      return formato;
      
    return "png";
  }
  
  
  //-------------------------|Cargar Archivo|-------------------------//
  //Carga el archivo de la imagen solicitada
  //Si el archivo no se encuentra asignará la imagen de error predeterminada
  protected PImage cargarArchivo (String archivo, String formato, String carpeta, String sufijo) {
    PImage temp;  //Variable temporal

    temp = loadImage (carpeta + archivo + sufijo + "." + formato);
      
    if (temp == null)    //Si no se encuentra en carpeta especificada
      temp = loadImage (archivo + sufijo + "." + formato);  //Comprobar en carpeta general
        
    if (temp == null)    //Si no se encuentra en carpeta principal
      temp = loadImage ("defecto.png");                     //Cargar imagen de error
      
    return temp;
  }
}



/*
|====================================================================|
*                              |Imagen|
*                [Clase hija de Repositorio de imagen]
* Descripción:                                                        
*   Repositorio de imágenes estáticas, almacenan una sola imagen
*   y una vez solicitado solo devolveran dicha imagen
*   Para cargarla solo es necesario ingresar el nombre del archivo
*   de la imagen, se carga como .png por defecto
|====================================================================|
*/
public class Imagen extends Repo_imagen {
  PImage imagen;    //Objeto de imagen
  
  public Imagen (String nombre, String formato, String carpeta) {
    super(nombre);
    formato = comprobarFormato (formato);
    cargarImagen(archivo, formato, carpeta);
  }
  
  
  //-------------------------|Solicitar imagen|-------------------------//
  public PImage solicitarImagen () {
    return this.imagen;
  }
  
  
  //-------------------------|Cargar Archivo de imagen|-------------------------//
  private void cargarImagen (String archivo, String formato, String carpeta) {
    this.imagen = cargarArchivo (archivo, formato, carpeta, "");
  }
}



/*
|====================================================================|
*                           |Animacion|
*                [Clase hija de Repositorio de imagen]
* Descripción:                                                        
*   Botón para desarrollar en interfaz que permite contener 
*   la información de una casilla y devolverla cuando sea presionado
|====================================================================|
*/
public class Animacion extends Repo_imagen {
  PImage[] imagenes;    //Objeto de imagen
  int secuencia;        //Cantidad de imágenes en la secuencia
  
  public Animacion (String nombre, String formato, String carpeta, int secuencia) {
    super(nombre);
    this.secuencia = secuencia;
    formato = comprobarFormato (formato);
    cargarAnimacion(archivo, formato, carpeta);
  }
  
  
  //-------------------------|Solicitar imagen|-------------------------//
  public PImage solicitarImagen () {
    int fotograma = this.cont % this.secuencia;
    return this.imagenes[fotograma];
  }
  
  
  //-------------------------|Cargar Secuencia de Animación|-------------------------//
  private void cargarAnimacion (String archivo, String formato, String carpeta) {
    if (!carpeta.equals(""))  //Si se ingresa una carpeta
      carpeta = carpeta + "/";
    
    //Cargar todas las imágenes
    for (int i = 1; i <= secuencia; i++) {
      this.imagenes[i] = cargarArchivo (archivo, formato, carpeta, "-" + i);
    }
  }
}
