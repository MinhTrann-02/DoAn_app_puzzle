import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<StatefulWidget> createState() {
    return StoreState();
  }
}

class StoreState extends State<Store> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: const Color(0xFFE9F8FF),
        appBar: AppBar(
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
        body: ListView(),
      ),
    );
  }

  void onTapMoreHoriz() {
    setState(
      () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Utils.profileFriend('XXXXXXXXXXX'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Utils.buttonIconWithText(Icons.person, 'Xem hồ sơ'),
                  Utils.buttonIconWithText(Icons.delete, 'Xóa bạn bè'),
                ],
              ),
            );
          },
        );
      },
    );
  }

  void onTapMission() {
    setState(
      () {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Utils.missionDetails(
                    'images/heart-30m.png',
                    null,
                    null,
                  ),
                  Utils.details(
                    'Nhiệm vụ 1',
                    'Hoàn thành 3 cấp độ',
                    'Hãy trả lời 10 câu hỏi liên tiếp',
                    null,
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
