import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
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
              Utils.stackHead_noAdd('0', 'icons/icon-star.png'),
              Utils.stackHead('0', 'icons/icon-money.png'),
              Utils.stackHead('Max', 'icons/icon-heart.png'),
            ],
          ),
          flexibleSpace: Column(
            children: [
              const SizedBox(height: 120),
              Utils.avatar(),
              const SizedBox(height: 10),
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
                        color: const Color(0xFFADB3AC),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                          Navigator.pushNamedAndRemoveUntil(
                              context, 'welcome', (route) => false);
                          const snackBar =
                              SnackBar(content: Text('Đăng xuất thành công!'));
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          'Đăng xuất',
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
                child: Utils.iconWithColor(Icons.settings, 'Cài đặt'),
              ),
              Tab(
                child: Utils.iconWithColor(Icons.play_circle, 'Trò chơi'),
              ),
              Tab(
                child:
                    Utils.iconWithColor(Icons.lock_person_rounded, 'Riêng tư'),
              ),
            ],
            indicatorColor: Colors.black,
            indicatorWeight: 7,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            labelPadding: const EdgeInsets.only(bottom: 5),
          ),
        ),
      ),
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
              children: [],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [],
          ),
          ListView(
            shrinkWrap: true,
            children: [],
          ),
        ],
      ),
    );
  }
}
