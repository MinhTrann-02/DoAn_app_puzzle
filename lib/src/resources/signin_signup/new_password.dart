// ignore_for_file: file_names, non_constant_identifier_names
import 'package:app_puzzle/src/blocs/new-password_bloc.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

import '../home_page.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<StatefulWidget> createState() {
    return NewPasswordState();
  }
}

class NewPasswordState extends State<NewPassword> {
  NewPassWordBloc bloc = NewPassWordBloc();
  TextEditingController newpassword = TextEditingController();
  TextEditingController re_newpassword = TextEditingController();
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
                child: Utils.textFieldWithStream_Pass(
                  'Nhập mật khẩu mới',
                  newpassword,
                  _showPass,
                  bloc.newpassStream,
                  onTapShowPass,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: Utils.textFieldWithStream_Pass(
                  'Nhập lại mật khẩu mới',
                  re_newpassword,
                  _showRePass,
                  bloc.re_PassStream,
                  onTapShowRePass,
                ),
              ),
              Utils.buttonWithText(onConfirmClicked, 'Xác nhận'),
              const Padding(padding: EdgeInsets.all(135)),
            ],
          ),
        ),
      ),
    );
  }

  bool _showPass = true;
  bool _showRePass = true;

  void onTapShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onTapShowRePass() {
    setState(() {
      _showRePass = !_showRePass;
    });
  }

  void onConfirmClicked() {
    setState(() {
      if (bloc.isValidInfo(newpassword.text, re_newpassword.text)) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }
}
