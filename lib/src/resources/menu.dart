// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
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
  final String documentId = 'bM1zeTSweCpD5Yk8bs8v';

  CollectionReference info = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(370.0),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0xFFE9F8FF),
          title: FutureBuilder<DocumentSnapshot>(
              future: info.doc(documentId).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Có gì đó sai sai?");
                }
                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Không trùng thông tin!");
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Utils.stackHead_noAdd(
                          data['star_point'].toString(), 'icons/icon-star.png'),
                      Utils.stackHead(data['money_point'].toString(),
                          'icons/icon-money.png'),
                      Utils.stackHead(data['heart_point'].toString(),
                          'icons/icon-heart.png'),
                    ],
                  );
                }
                return const Text("Loanding...");
              }),
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
                        onPressed: () {
                          _dialogBuilder(context);
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

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Đăng xuất"),
          content: const Text("Bạn có chắc chắn muốn đăng xuất?"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'No',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Yes'),
              onPressed: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, 'welcome', (route) => false);
              },
            ),
          ],
        );
      },
    );
  }
}
