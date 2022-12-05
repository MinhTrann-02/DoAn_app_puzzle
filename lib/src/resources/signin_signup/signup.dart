// ignore_for_file: library_private_types_in_public_api, non_constant_identifier_names, unnecessary_null_comparison
import 'package:app_puzzle/src/blocs/signup_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

import 'confirm_signup.dart';

void main() => runApp(const SignUp());

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  SignUpBloc bloc = SignUpBloc();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController re_password = TextEditingController();
  TextEditingController email = TextEditingController();
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
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
                      'Tên', username, bloc.userStream),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Utils.textFieldWithStream_Pass(
                    'Mật khẩu',
                    password,
                    _showPass,
                    bloc.passStream,
                    onTapShowPass,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 10),
                  child: Utils.textFieldWithStream_Pass(
                    'Nhập lại mật khẩu',
                    re_password,
                    _showRePass,
                    bloc.re_PassStream,
                    onTapShowRePass,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 25),
                  child: Utils.textFieldWithStream(
                    'Email',
                    email,
                    bloc.emailStream,
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
                            if (bloc.isValidInfo(username.text, password.text,
                                re_password.text, email.text)) {
                              try {
                                final newUser =
                                    _auth.createUserWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text);
                                final user = <String, dynamic>{
                                  'email': email,
                                  'password': password,
                                  'user_name': username,
                                };
                                firestore.collection("users").add(user).then(
                                    (DocumentReference doc) => print(
                                        'DocumentSnapshot added with ID: ${doc.id}'));
                                if (newUser != null) {
                                  Navigator.pop(context);
                                  // const snackBar = SnackBar(
                                  //     content: Text('Đăng ký thành công!'));
                                  // ScaffoldMessenger.of(context)
                                  //     .showSnackBar(snackBar);
                                  // Create a new user with a first and last name

                                  // Future<void> addUser() {
                                  //   return users
                                  //       .add({
                                  //         'email': email,
                                  //         'password': password,
                                  //         'user_name': username,
                                  //       })
                                  //       .then((value) => Navigator.pop(context))
                                  //       .catchError((error) => print('Loi'));
                                  // }
                                } else {
                                  const snackBar = SnackBar(
                                      content: Text('Tài khoản không hợp lệ!'));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              } catch (e) {
                                const snackBar =
                                    SnackBar(content: Text('Có lỗi xảy ra!'));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            }
                          },
                          child: const Text(
                            'Xác nhận',
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
                )
              ],
            ),
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

  void onSignInClicked() {
    setState(() {
      if (bloc.isValidInfo(
          username.text, password.text, re_password.text, email.text)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ConfirmSignUp()));
      }
    });
  }
}
