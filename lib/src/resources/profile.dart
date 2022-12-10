import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';
import 'home_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
User user = _auth.currentUser!;

class ProfileState extends State<Profile> {
  final String _uid = user.uid;

  CollectionReference info = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    List listBasket = [
      // "Gói nạp lần đầu",
      // "Gói combo 1",
      // "Gói combo 2",
    ];
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(320.0),
        child: FutureBuilder<DocumentSnapshot>(
          future: info.doc(_uid).get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text("Có gì đó sai sai?");
            }
            if (snapshot.hasData && !snapshot.data!.exists) {
              return const Text("Không trùng thông tin!");
            }
            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: const Color(0xFFE9F8FF),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Utils.stackHead_noAdd(
                        data['star_point'].toString(), 'icons/icon-star.png'),
                    Utils.stackHead(
                        data['money_point'].toString(), 'icons/icon-money.png'),
                    Utils.stackHead(
                        data['heart_point'].toString(), 'icons/icon-heart.png'),
                  ],
                ),
                flexibleSpace: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 70),
                      child: Container(
                        height: 200,
                        color: const Color(0xFFB6FFAA),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Utils.avatar(),
                        Text(
                          data['user_name'],
                          style: const TextStyle(fontSize: 20),
                        ),
                        const SizedBox(width: 65),
                        // Padding(
                        //   padding: const EdgeInsets.only(bottom: 25),
                        //   child: TextButton(
                        //     onPressed: onTapEdit,
                        //     style: TextButton.styleFrom(
                        //       shape: RoundedRectangleBorder(
                        //         borderRadius: BorderRadius.circular(50),
                        //       ),
                        //     ),
                        //     child: const CircleAvatar(
                        //       backgroundColor: Colors.white70,
                        //       radius: 25,
                        //       child: CircleAvatar(
                        //         backgroundColor: Colors.grey,
                        //         radius: 20,
                        //         child: Icon(
                        //           Icons.edit,
                        //           color: Colors.white,
                        //           size: 28,
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Utils.iconWithColor(
                            Icons.local_play, 'Thành tích')),
                    Tab(
                        child:
                            Utils.iconWithColor(Icons.equalizer, 'Thống kê')),
                    Tab(
                        child: Utils.iconWithColor(
                      Icons.shopping_basket,
                      'Mua hàng',
                    )),
                  ],
                  indicatorColor: Colors.black,
                  indicatorWeight: 7,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black54,
                  labelPadding: const EdgeInsets.only(bottom: 4),
                ),
              );
            }
            return const Text("Loanding...");
          },
        ),
      ),
      body: TabBarView(
        children: [
          ListView(
            shrinkWrap: true,
            children: [
              Utils.achievement('Đại gia', 'Hoàn thành nạp lần đầu',
                  'images/money.png', false),
              Utils.achievement('Tri thức', 'Hoàn thành 10 cấp độ',
                  'images/thought.png', true),
              Utils.achievement(
                  'Tiến sĩ đóng góp',
                  'Đóng góp 10 câu hỏi bất kì lĩnh vực nào',
                  'images/graduation-hat.png',
                  false),
              Utils.achievement('Nhà ngoại giao', 'Kết bạn với 10 người',
                  'images/add-user.png', true),
            ],
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: (1 / .68),
                    ),
                    shrinkWrap: true,
                    children: [
                      Utils.statistical(
                        '1',
                        'Số cấp độ hoàn thành',
                        const Color(0xFF8EE79A),
                        'icons/icon-timeline.png',
                      ),
                      Utils.statistical(
                        'Kể từ',
                        'Tháng 10 2022',
                        const Color(0xFFAB90CE),
                        'icons/icon-time.png',
                      ),
                      Utils.statistical(
                        '68',
                        'Số câu hỏi đã trả lời',
                        const Color(0xFF78C7CA),
                        'icons/icon-total-question.png',
                      ),
                      Utils.statistical(
                        '99%',
                        'Tỷ lệ trả lời đúng',
                        const Color(0xFFD2D881),
                        'icons/icon-complete.png',
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  'Hiệu suất theo danh mục',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(height: 35),
                Utils.listRate(
                  'images/rate-khoahoc.png',
                  'Khoa học',
                  '5',
                  '23',
                ),
                Utils.listRate(
                  'images/rate-vanhoc.png',
                  'Văn học',
                  '5',
                  '31',
                ),
                Utils.listRate(
                  'images/rate-lichsu.png',
                  'Lịch sử',
                  '5',
                  '43',
                ),
                Utils.listRate(
                  'images/rate-dialy.png',
                  'Địa lí',
                  '5',
                  '23',
                ),
                Utils.listRate(
                  'images/rate-dovui.png',
                  'Đố vui',
                  '15',
                  '54',
                ),
              ],
            ),
          ),
          listBasket.isEmpty
              ? Utils.basket(onTapStore)
              : ListView.builder(
                  itemCount: listBasket.length,
                  itemBuilder: (context, index) {
                    return Utils.buy(listBasket[index]);
                  },
                ),
        ],
      ),
    );
  }

  void onTapStore() {
    setState(() {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    });
  }
}
