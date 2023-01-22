class LoginFormValidator {
  static String? validateEmail(String email) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);

    if (!regex.hasMatch(email)) {
      return 'Username must be at least 6 characters';
    } else {
      return null;
    }
  }

  static String? validatePassword(String password) {
    Pattern pattern = r'^.{6,}$';
    RegExp regex = RegExp(pattern as String);

    if (!regex.hasMatch(password)) {
      return 'Password must be at least 6 characters.';
    } else {
      return null;
    }
  }
}
