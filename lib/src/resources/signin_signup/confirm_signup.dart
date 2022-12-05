// ignore_for_file: file_names, non_constant_identifier_names
import 'package:app_puzzle/src/blocs/confirm-fogot_bloc.dart';
import 'package:app_puzzle/src/resources/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

class ConfirmSignUp extends StatefulWidget {
  const ConfirmSignUp({super.key});

  @override
  State<StatefulWidget> createState() {
    return ConfirmSignUpState();
  }
}

class ConfirmSignUpState extends State<ConfirmSignUp> {
  ConfirmCodeBloc bloc = ConfirmCodeBloc();
  TextEditingController confirm_newpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 233, 248, 255),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 125),
              Utils.logo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: Utils.textFieldWithStream(
                  'Mã xác nhận',
                  confirm_newpass,
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
      if (bloc.isValidInfo(confirm_newpass.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }
}
