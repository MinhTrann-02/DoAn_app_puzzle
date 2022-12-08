import 'package:cloud_firestore/cloud_firestore.dart';
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
  final String documentId = 'bM1zeTSweCpD5Yk8bs8v';

  CollectionReference info = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Scaffold(
        backgroundColor: const Color(0xFFE9F8FF),
        appBar: AppBar(
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
        ),
        body: ListView(),
      ),
    );
  }
}
