import 'package:app_puzzle/src/resources/play_game/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';
import 'daily_bonus.dart';
import 'rankings.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
final User user = _auth.currentUser!;
late String username, star_point, money_point, heart_point;

class HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    getdata();
  }

  String _uid = user.uid;
  CollectionReference info = FirebaseFirestore.instance.collection('users');

  void getdata() async {
    User user = _auth.currentUser!;
    _uid = user.uid;
    DocumentSnapshot data =
        await FirebaseFirestore.instance.collection('users').doc(_uid).get();
    setState(() {
      username = data.get('user_name');
      star_point = data.get('star_point').toString();
      money_point = data.get('money_point').toString();
      heart_point = data.get('heart_point').toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    List listFirend = [
      "Minh Trần",
      "Nguyễn Gia Bảo",
      "Trần Phương",
      "Nguyễn Anh Hào",
      "Admin",
      "TEst"
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(370.0),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: const Color(0xFFE9F8FF),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Utils.stackHead_noAdd(star_point, 'icons/icon-star.png'),
                Utils.stackHead(money_point, 'icons/icon-money.png'),
                Utils.stackHead(heart_point, 'icons/icon-heart.png'),
              ],
            ),
            flexibleSpace: Column(
              children: [
                const SizedBox(height: 120),
                Utils.avatar(),
                const SizedBox(height: 10),
                Text(
                  username,
                  style: const TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Expanded(child: Container(height: 56)),
                    Expanded(
                      flex: 3,
                      child: Container(
                        width: 100,
                        height: 55,
                        decoration: BoxDecoration(
                          color: const Color(0xFF69DF59),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ThemePage()));
                          },
                          child: const Text(
                            'Chơi',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container(height: 56)),
                  ],
                ),
              ],
            ),
            bottom: TabBar(
              tabs: [
                Tab(
                  child: Utils.iconWithColor(Icons.home, 'Trang chủ'),
                ),
                Tab(
                  child: Utils.iconWithColor(Icons.event_note, 'Nhiệm vụ'),
                ),
                Tab(
                  child: Utils.iconWithColor(Icons.people, 'Bạn bè'),
                ),
              ],
              indicatorColor: Colors.black,
              indicatorWeight: 7,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.black54,
              labelPadding: const EdgeInsets.only(bottom: 5),
            ),
          )),
      body: TabBarView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: (1 / .68),
              ),
              shrinkWrap: true,
              children: [
                Utils.gridViewButton('Giao đấu', const Color(0xFFAEAEAE),
                    'icons/icon-fighting.png', null),
                Utils.gridViewButton('Bảng xếp hạng', const Color(0xFF85B3CC),
                    'icons/icon-cup.png', onClickedRankings),
                Utils.gridViewButton(
                    'Thưởng hàng ngày',
                    const Color(0xFFBA78CA),
                    'icons/icon-giftbox.png',
                    onClickedDailyBonus),
                Utils.gridViewButton('Mini-games', const Color(0xFFDC802B),
                    'icons/icon-minigame.png', null),
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              Utils.mission(
                'Nhiệm vụ 1',
                'images/heart-30m.png',
                null,
                null,
                onTapMission,
              ),
              Utils.mission(
                'Nhiệm vụ 2',
                'images/heart-1h.png',
                null,
                null,
                onTapMission,
              ),
              Utils.mission(
                'Nhiệm vụ 3',
                'images/starx2-2h.png',
                'images/dollar-125.png',
                null,
                onTapMission,
              ),
              Utils.mission(
                'Nhiệm vụ 4',
                'images/starx2-4h.png',
                'images/dollar-300.png',
                null,
                onTapMission,
              ),
              Utils.mission(
                'Nhiệm vụ 5',
                'images/starx2-2h.png',
                'images/dollar-125.png',
                'images/50-50.png',
                onTapMission,
              ),
              Utils.mission(
                'Nhiệm vụ 6',
                'images/starx2-4h.png',
                'images/dollar-300.png',
                'images/dice.png',
                onTapMission,
              ),
            ],
          ),
          ListView.builder(
            itemCount: listFirend.length,
            itemBuilder: (context, index) {
              return Utils.listFriends(listFirend[index], onTapMoreHoriz);
            },
          ),
        ],
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

  void onClickedRankings() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Rankings()));
    });
  }

  void onClickedDailyBonus() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const DailyBonus()));
    });
  }
}
