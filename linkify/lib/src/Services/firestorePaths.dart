/// Clase que almacena las rutas a los datos dentro de la BD de firestore
class FirestorePaths {
  /// Ruta a todos los usuarios
  static String usuarios(String uid) => 'usuarios';

  /// Ruta a un usuario concreto: [IDUsuario]
  static String usuario(String uid, String idUsuario) => 'usuarios/$idUsuario';

  /// Ruta a todas las categorías
  static String categorias(String uid) => 'categorias';

  /// Ruta a una categoría concreta: [idCategoria]
  static String categoria(String uid, String idCategoria) => 'categorias/$idCategoria';

  
}