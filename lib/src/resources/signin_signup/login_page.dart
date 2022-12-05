import 'package:app_puzzle/src/blocs/login_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';
import 'email_forgot.dart';
import 'signup.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<StatefulWidget> createState() {
    return LoginState();
  }
}

class LoginState extends State<Login> {
  LoginBloc bloc = LoginBloc();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.bottomCenter,
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 233, 248, 255),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Utils.logo(),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                child: Utils.textFieldWithStream(
                    'Email', username, bloc.userStream),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                child: Utils.textFieldWithStream_Pass(
                  'Mật khẩu',
                  password,
                  _showPass,
                  bloc.passStream,
                  onTapShowPass,
                ),
              ),

              Row(
                children: [
                  Expanded(flex: 2, child: Container(height: 56)),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: const Color(0xFFC1FED2),
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(width: 1),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          if (bloc.isValidInfo(username.text, password.text)) {
                            try {
                              await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: username.text,
                                      password: password.text);
                              _auth.authStateChanges().listen(
                                (event) {
                                  if (event != null) {
                                    // username.clear();
                                    // password.clear();
                                    const snackBar = SnackBar(
                                        content: Text('Đăng nhập thành công!'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, 'home', (route) => false);
                                  }
                                },
                              );
                            } catch (e) {
                              const snackBar = SnackBar(
                                  content:
                                      Text('Email hoặc mật khẩu không đúng!'));
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            }
                          }
                        },
                        child: const Text(
                          'Đăng nhập',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(flex: 2, child: Container(height: 56)),
                ],
              ),
              //
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                child: Utils.textButtonWithOnTap(
                    'Forgot your password?', onForgotClicked),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 150, 0, 40),
                child: Utils.textButtonWithOnTap(
                    "Don’t have account? Sign Up", onSignUpClicked),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _showPass = true;

  void onTapShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void onSignUpClicked() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const SignUp()));
    });
  }

  void onForgotClicked() {
    setState(() {
      Navigator.push(context,
              MaterialPageRoute(builder: (context) => const EmailForgot()))
          .then((value) {
        if (value != null) {
          final snackBar = SnackBar(content: Text(value));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      });
    });
  }
}
