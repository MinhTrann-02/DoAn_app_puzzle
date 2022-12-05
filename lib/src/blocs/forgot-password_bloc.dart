// ignore_for_file: file_names

import 'dart:async';
import 'package:app_puzzle/src/validators/validations.dart';

class FogotPassWordBloc {
  final StreamController _userController = StreamController();

  Stream get userStream => _userController.stream;

  bool isValidInfo(String username) {
    if (!Validations.isValidEmail(username)) {
      _userController.sink.addError("Email không hợp lệ");
      return false;
    }

    return true;
  }
}
