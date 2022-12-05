import 'package:flutter/material.dart';

class DailyBonus extends StatefulWidget {
  const DailyBonus({super.key});

  @override
  State<DailyBonus> createState() => _DailyBonusState();
}

class _DailyBonusState extends State<DailyBonus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: const Color(0xFFB2FDA3),
        centerTitle: true,
        title: const Text(
          "Thưởng hàng ngày",
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color.fromARGB(255, 248, 206, 142),
        child: Column(
          children: [
            Container(),
          ],
        ),
      ),
    );
  }
}
