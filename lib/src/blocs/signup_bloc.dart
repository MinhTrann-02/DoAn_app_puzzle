import 'dart:async';
import 'package:app_puzzle/src/validators/validations.dart';

class SignUpBloc {
  final StreamController _userController = StreamController();
  final StreamController _passController = StreamController();
  // ignore: non_constant_identifier_names
  final StreamController _re_PassController = StreamController();
  final StreamController _emailController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;
  // ignore: non_constant_identifier_names
  Stream get re_PassStream => _re_PassController.stream;
  Stream get emailStream => _emailController.stream;

  bool isValidInfo(
      String username, String newpass, String rePass, String email) {
    //User Name
    if (!Validations.isValidUserName(username)) {
      _userController.sink.addError("Tên không được để trống!");
      return false;
    }
    _userController.sink.add("OK");

    //Pass Word
    if (!Validations.isValidPass(newpass)) {
      _passController.sink.addError("Mật khẩu phải trên 8 ký tự");
      return false;
    }
    _passController.sink.add("OK");

    //Re-Pass Word
    if (!Validations.isValidPass(rePass)) {
      _re_PassController.sink.addError("Mật khẩu phải trên 8 ký tự");
      return false;
    }
    if (!Validations.isValidSamePass(newpass, rePass)) {
      _re_PassController.sink.addError("Mật khẩu phải trùng khớp!");
      return false;
    }
    _re_PassController.sink.add("OK");

    //Email
    if (!Validations.isValidEmail(email)) {
      _emailController.sink.addError("Email không hợp lệ!");
      return false;
    }
    _emailController.sink.add("OK");
    return true;
  }
}
