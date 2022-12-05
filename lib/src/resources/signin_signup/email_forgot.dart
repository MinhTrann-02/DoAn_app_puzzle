// ignore_for_file: file_names, non_constant_identifier_names
import 'package:app_puzzle/src/blocs/forgot-password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';
import 'confirm_forgot.dart';
import 'login_page.dart';

class EmailForgot extends StatefulWidget {
  const EmailForgot({super.key});

  @override
  State<StatefulWidget> createState() {
    return EmailForgotState();
  }
}

class EmailForgotState extends State<EmailForgot> {
  FogotPassWordBloc bloc = FogotPassWordBloc();
  TextEditingController email_forgot = TextEditingController();
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
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: Utils.textFieldWithStream(
                    'Email', email_forgot, bloc.userStream),
              ),
              Utils.buttonWithText(onConfirmClicked, 'Gửi mã xác nhận'),
              GestureDetector(
                onTap: onBackClicked,
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(0, 30, 0, 275),
                  child: Icon(Icons.arrow_back),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onConfirmClicked() {
    setState(() {
      if (bloc.isValidInfo(email_forgot.text)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ConfirmForgot()));
      }
    });
  }

  void onBackClicked() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Login()));
    });
  }
}
