/// Clase que almacena las rutas a los datos dentro de la BD de firestore
class FirestorePaths {
  /// Ruta a todos los usuarios
  static String usuarios(String uid) => 'usuarios';

  /// Ruta a un usuario concreto: [IDUsuario]
  static String usuario(String uid, String IDUsuario) => 'usuarios/$IDUsuario';

  /// Ruta a todas las categorías
  static String categorias(String uid) => 'categorias';

  /// Ruta a una categoría concreta: [IDCategoria]
  static String categoria(String uid, String IDCategoria) => 'categorias/$IDCategoria';

  
}