class Validation {
  static bool isEmail(String string) {
    // Null or empty string is invalid
    if (string.isEmpty) {
      return false;
    }
    const emailRegExp = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    final regExp = RegExp(emailRegExp);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }

  static bool isPassword(String string) {
    // Null or empty string is invalid
    if (string.isEmpty) {
      return false;
    }
    const passwordRegExp = r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)";
    final regExp = RegExp(passwordRegExp);

    if (!regExp.hasMatch(string)) {
      return false;
    }
    return true;
  }
}
