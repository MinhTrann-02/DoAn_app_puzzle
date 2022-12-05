// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: const Color(0xFFB2FDA3),
        title: const Text('Profile'),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Utils.avatar(),
              const SizedBox(height: 10),
              const Text(
                'User Name',
                style: TextStyle(fontSize: 20),
              ),
              TextField(
                controller: username,
                decoration: const InputDecoration(
                  hintText: 'User Name',
                  helperText: 'aaaaaa',
                  counterText: 'cccccc',
                  semanticCounterText: 'abcccccc',
                  labelText: 'aaaaaaaaa',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
