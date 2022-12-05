import 'package:app_puzzle/src/resources/play_game/play.dart';
import 'package:flutter/material.dart';
import '../../../utils.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return ThemePageState();
  }
}

class ThemePageState extends State<ThemePage> {
  List list = [
    "Khoa học",
    "Văn Học",
    "Lịch sử",
    "Địa lý",
    "Đố vui",
    "Hại não",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFE9F8FF),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Utils.stackHead_noAdd('0', 'icons/icon-star.png'),
            Utils.stackHead('0', 'icons/icon-money.png'),
            Utils.stackHead('Max', 'icons/icon-heart.png'),
          ],
        ),
      ),
      // body: Container(
      //   constraints: const BoxConstraints.expand(),
      //   color: const Color(0xFFE9F8FF),
      //   alignment: Alignment.center,
      //   child: ListView.builder(
      //     itemCount: list.length,
      //     itemBuilder: (context, index) {
      //       return Utils.listTheme(list[index]);
      //     },
      //   ),
      // ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        color: const Color(0xFFE9F8FF),
        alignment: Alignment.center,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 50, bottom: 30),
              child: Text(
                'Chọn chủ đề',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Utils.listTheme("Khoa học", onClickedPlay),
            Utils.listTheme("Lịch sử", null),
            Utils.listTheme("Địa lý", null),
            Utils.listTheme("Đố vui", null),
            Utils.listTheme("Hại não", null),
          ],
        ),
      ),
    );
  }

  void onClickedPlay() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Play()));
    });
  }
}
