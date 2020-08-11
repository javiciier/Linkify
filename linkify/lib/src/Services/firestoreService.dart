import 'dart:async';
import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:linkify/src/Services/firestorePaths.dart';
import 'package:linkify/src/Models/Usuario.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Clase adaptador que expone las funcionalidades de un documento de Firestore.
/// Esta clase nos permitirá usar los servicios de Firestore accediento a rutas personalizadas
/// dentro de nuestra BD (ver fichero [Services/firestorePaths.dart])
class FirestoreService {
  // Constructor privado
  FirestoreService._();

  // Patrón singleton (inicialización tardía)
  static FirestoreService _instance = null;

  static FirestoreService getInstance() {
    if (_instance == null) {
      return new FirestoreService._();
    }

    return _instance;
  }

  /// Adaptador del método setData(): Inserta los datos almacenados en [data] en la ruta [path].
  /// Si [merge] es true, mezclará todos los neuvos datos dentro de un documento; si es false, sobreescribirá los datos que coincidan.
  Future<void> setData({@required String path,
    @required Map<String, dynamic> data,
    bool merge = false}) async {
      final DocumentReference docReference = Firestore.instance.document(path);     // Accede a la ruta recibida
      print("Insertando $data en \"$path\"\n");
      await docReference.setData(data, merge: merge);             // Establece los datos recibidos en dicha ruta
  }


  /// Adaptador de deleteData(): Elimina los datos almacenados en [path].
  Future<void> deleteData({@required String path}) async {
    final DocumentReference docReference = Firestore.instance.document(path);       // Accede a la ruta recibida
    print("Eliminando contenido de \"$path\"\n");
    await docReference.delete();                                  // Elimina su contenido
  }

  /// Adaptador de collectionStream<T>: devuelve un Stream que contiene una lista de elementos de tipo T.
  /// Construye un elemento de tipo T mediante una función [builder] que recibe los datos [data] y el [documentId].
  /// Para obtener los elementos genera una consulta [queryBuilder] y admite una función [sort] para ordenar dichos datos.
  Stream<List<T>> collectionStream<T> ({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder,
    Query Function(Query query) queryBuilder,
    int Function(T lhs, T rhs) sort}) {
      Query query = Firestore.instance.collection(path);       // Accede a la ruta de la cual obtendrá los datos
      // Si recibe una función para generar consultas, genera la consulta a partir de ella
      if (queryBuilder != null) {
        query = queryBuilder(query);
      }
      final Stream<QuerySnapshot> querySnapshots = query.snapshots();       // Obtiene los resultados de la consulta (snapshot es sinónimo de resultado)
      return querySnapshots.map((snapshot) {
        // Obtiene todos los documentos dentro de la consulta
        final result = snapshot.documents
          .map((document) => builder(document.data, document.documentID))   // Construye los elementos con el constructor builder recibido
          .where((value) => value != null)
          .toList();                                                        // Devuelve una lista con dichos elementos
        if (sort != null) {                                             // Si recibe un método de ordenación, lo aplica
          result.sort(sort);
        }

        return result;
      });
    }

  /// Crea una serie de objetos de tipo T usando un constructor [builder] con los datos almacenados en [path]
  Future<Stream<T>> documentStream<T>({
    @required String path,
    @required T Function(Map<String, dynamic> data, String documentID) builder}) async {
      final DocumentReference docReference = Firestore.instance.document(path);     // Accede al documento
      final Stream<DocumentSnapshot> docSnapshots = docReference.snapshots();       // Obtiene todos los elementos que contiene
      return docSnapshots
        .map((snapshot) => builder(snapshot.data, snapshot.documentID));        // Devuelve los objetos construidos a partir de los datos obtenidos
    }


}