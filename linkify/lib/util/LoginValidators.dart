/// Clase que contiene métodos para validar la información del formulario para iniciar sesión en la app

class LoginValidator {
  static String _userMailValidator(String mail) {
    if (mail.isEmpty) {
      return 'No ha introducido ningún correo';
    }
  }

  static String _userPasswordValidator(String pass) {
    if (pass.isEmpty) {
      return 'No ha introducido ninguna contraseña';
    }
  }

}