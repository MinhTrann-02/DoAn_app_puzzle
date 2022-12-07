// ignore_for_file: non_constant_identifier_names

import 'package:app_puzzle/src/resources/play_game/theme.dart';
import 'package:flutter/material.dart';
import '../../../utils.dart';

class Play extends StatefulWidget {
  const Play({super.key});

  @override
  State<StatefulWidget> createState() {
    return PlayState();
  }
}

class PlayState extends State<Play> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              // constraints: const BoxConstraints.expand(),
              color: const Color(0xFFE9F8FF),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: size.height * 0.25,
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3),
                      color: const Color(0xFF38B83C),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'Drosophila là tên khoa học của một chi của loài nào?',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 27,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Utils.answer("A. Mèo", onClick, answer_false),
                  Utils.answer("B. Ruồi", onClick, answer_true),
                  Utils.answer("C. Cừu", onClick, answer_false),
                  Utils.answer("D. Chuột", null, answer_false),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                        ),
                        child: const Text(
                          'Nhân đôi',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                        ),
                        child: const Text(
                          '50/50',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 80,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                        ),
                        child: const Text(
                          'Bỏ qua',
                          style: TextStyle(fontSize: 17),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  bool answer_true = true;
  bool answer_false = false;

  Future<void> result_true(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Đáp án"),
          content: const Text("Chúc mừng bạn đã trả lời đúng!"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> result_false(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Đáp án"),
          content: const Text("Bạn đã trả lời sai!"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void onClick() {
    setState(() {
      if (answer_true) {
        result_true(context);
      } else {
        result_false(context);
      }
    });
  }
}
