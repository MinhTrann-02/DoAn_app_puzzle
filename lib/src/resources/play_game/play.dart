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
    return Scaffold(
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFFE9F8FF),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: Text(
                'Câu hỏi',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Utils.answer("A.", null),
            Utils.answer("B.", null),
            Utils.answer("C.", null),
            Utils.answer("D.", null),
          ],
        ),
      ),
    );
  }
}
