import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<StatefulWidget> createState() {
    return HistoryState();
  }
}

class HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFB2FDA3),
        centerTitle: true,
        title: const Text(
          'Lịch sử',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Utils.history(
            '20/10/2022',
            'images/history-1.png',
            'Làm gì để qua môn Lập Trình Di Động',
            true,
          ),
          Utils.history(
            '20/10/2022',
            'images/history-2.png',
            'Làm gì để qua môn Lập Trình Di Động',
            false,
          ),
          Utils.history(
            '20/10/2022',
            'images/history-3.png',
            'Làm gì để qua môn Lập Trình Di Động',
            true,
          ),
          Utils.history(
            '20/10/2022',
            'images/history-4.png',
            'Làm gì để qua môn Lập Trình Di Động',
            false,
          ),
          Utils.history(
            '20/10/2022',
            'images/history-1.png',
            'Làm gì để qua môn Lập Trình Di Động',
            true,
          ),
          Utils.history(
            '20/10/2022',
            'images/history-2.png',
            'Làm gì để qua môn Lập Trình Di Động',
            false,
          ),
        ],
      ),
    );
  }
}
