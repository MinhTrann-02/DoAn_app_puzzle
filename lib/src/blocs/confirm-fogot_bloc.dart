// ignore_for_file: file_names

import 'dart:async';
import 'package:app_puzzle/src/validators/validations.dart';

class ConfirmCodeBloc {
  final StreamController _confirmController = StreamController();

  Stream get codeStream => _confirmController.stream;

  bool isValidInfo(String codeConfirm) {
    if (!Validations.isValidCode(codeConfirm)) {
      _confirmController.sink.addError("Mã xác nhận gồm 6 chữ số");
      return false;
    }

    return true;
  }
}
