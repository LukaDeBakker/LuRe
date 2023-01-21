class LoginFormValidator {
  static String? validateEmail(String email) {
    Pattern pattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp regex = RegExp(pattern as String);

    if (!regex.hasMatch(email)) {
      return '🚩 Please enter a valid email address.';
    } else {
      return null;
    }
  }
}
