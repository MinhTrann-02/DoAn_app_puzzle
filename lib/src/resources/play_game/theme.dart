// ignore_for_file: non_constant_identifier_names

import 'package:app_puzzle/src/resources/home_page.dart';
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
      body: Container(
        // constraints: const BoxConstraints.expand(),
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
            Utils.listTheme("Khoa học", play_KhoaHoc),
            Utils.listTheme("Lịch sử", play_LichSu),
            Utils.listTheme("Địa lý", play_DiaLy),
            Utils.listTheme("Đố vui", null),
            Utils.listTheme("Văn học", play_VanHoc),
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: IconButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (route) => false);
                },
                icon: const Icon(Icons.exit_to_app),
                iconSize: 40,
                color: const Color(0xFF59A9DF),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String theme = '';

  void play_KhoaHoc() {
    setState(() {
      theme = 'goikhoahoc';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_LichSu() {
    setState(() {
      theme = 'goilichsu';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_DiaLy() {
    setState(() {
      theme = 'goidialy';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_DoVui() {
    setState(() {
      theme = 'goikhoahoc';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }

  void play_VanHoc() {
    setState(() {
      theme = 'goivanhoc';
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Play(
                    theme: theme,
                  )));
    });
  }
}
