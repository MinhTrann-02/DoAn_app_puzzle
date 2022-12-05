class Validations {
  static bool isValidUserName(String user) {
    return user.isNotEmpty;
  }

  static bool isValidEmail(String email) {
    return email.length > 6 && email.contains("@gmail.com");
  }

  static bool isValidPass(String pass) {
    return pass.length > 8;
  }

  static bool isValidSamePass(String newpass, String rePass) {
    return newpass == rePass;
  }

  static bool isValidCode(String code) {
    return code.length == 6;
  }
}
