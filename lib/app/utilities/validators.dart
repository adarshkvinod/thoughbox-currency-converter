class Validator {
  // Validate Email
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  // Validate Password (min 4 characters)
  static bool isValidPassword(String password) {
    final RegExp passwordRegex = RegExp(r'^.{6,}$');
    return passwordRegex.hasMatch(password);
  }
}
