// ignore_for_file: file_names

import 'dart:async';
import 'package:app_puzzle/src/validators/validations.dart';

class NewPassWordBloc {
  final StreamController _newPassController = StreamController();
  // ignore: non_constant_identifier_names
  final StreamController _re_PassController = StreamController();

  Stream get newpassStream => _newPassController.stream;
  // ignore: non_constant_identifier_names
  Stream get re_PassStream => _re_PassController.stream;

  bool isValidInfo(String newpass, String rePass) {
    if (!Validations.isValidPass(newpass)) {
      _newPassController.sink.addError("Mật khẩu phải trên 8 ký tự");
      return false;
    }
    _newPassController.sink.add("OK");
    if (!Validations.isValidPass(rePass)) {
      _re_PassController.sink.addError("Mật khẩu phải trên 8 ký tự");
      return false;
    }
    if (!Validations.isValidSamePass(newpass, rePass)) {
      _re_PassController.sink.addError("Mật khẩu phải trùng khớp!");
      return false;
    }
    _re_PassController.sink.add("OK");
    return true;
  }
}
