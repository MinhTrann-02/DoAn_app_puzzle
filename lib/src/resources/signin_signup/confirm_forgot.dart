// ignore_for_file: file_names
import 'package:app_puzzle/src/blocs/confirm-fogot_bloc.dart';
import 'package:app_puzzle/utils.dart';
import 'package:flutter/material.dart';

import 'new_password.dart';

class ConfirmForgot extends StatefulWidget {
  const ConfirmForgot({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfirmForgotState();
  }
}

class ConfirmForgotState extends State<ConfirmForgot> {
  ConfirmCodeBloc bloc = ConfirmCodeBloc();
  // ignore: non_constant_identifier_names
  TextEditingController confirm_forgot = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 233, 248, 255),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              const SizedBox(height: 125),
              Utils.logo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: Utils.textFieldWithStream(
                  'Mã xác nhận',
                  confirm_forgot,
                  bloc.codeStream,
                ),
              ),
              Utils.confirm(),
              Utils.buttonWithText(onConfirmClicked, 'Xác nhận'),
              const Padding(padding: EdgeInsets.all(148)),
            ],
          ),
        ),
      ),
    );
  }

  void onConfirmClicked() {
    setState(() {
      if (bloc.isValidInfo(confirm_forgot.text)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const NewPassword()));
      }
    });
  }
}
