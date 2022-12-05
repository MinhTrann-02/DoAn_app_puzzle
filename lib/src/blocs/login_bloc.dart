import 'dart:async';
import 'package:app_puzzle/src/validators/validations.dart';

class LoginBloc {
  final StreamController _userController = StreamController();
  final StreamController _passController = StreamController();

  Stream get userStream => _userController.stream;
  Stream get passStream => _passController.stream;

  bool isValidInfo(String username, String password) {
    if (!Validations.isValidEmail(username)) {
      _userController.sink.addError("Email không hợp lệ!");
      return false;
    }
    _userController.sink.add("OK");

    if (!Validations.isValidPass(password)) {
      _passController.sink.addError("Mật khẩu phải trên 8 ký tự");
      return false;
    }
    _passController.sink.add("OK");
    return true;
  }
}
