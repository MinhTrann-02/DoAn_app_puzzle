// ignore_for_file: non_constant_identifier_names

import 'dart:math';
import 'package:app_puzzle/src/resources/play_game/theme.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Play extends StatefulWidget {
  const Play({Key? key, required this.theme}) : super(key: key);
  final String theme;
  @override
  PlayState createState() {
    return PlayState();
  }
}

class PlayState extends State<Play> {
  late CollectionReference chude =
      FirebaseFirestore.instance.collection(widget.theme);

  List lsResult = ["dapan1", "dapan2", "dapan3", "dapandung"];
  List lsAnswer = [
    "cau-01",
    "cau-02",
    "cau-03",
    "cau-04",
    "cau-05",
    "cau-06",
    "cau-07",
    "cau-08",
    "cau-09",
    "cau-10",
  ];
  int idAnswer = 0;
  var color_origin = const Color(0xFFB4B291);
  var color_50 = Color.fromARGB(0, 180, 178, 145);
  var color_black = const Color(0xFF000000);
  int total_true = 0;
  int total = 0;
  int total_next = 0;
  bool trogiup_50 = false;

  @override
  Widget build(BuildContext context) {
    int random1 = Random().nextInt(lsResult.length);
    int random2 = Random().nextInt(lsResult.length);
    int random3 = Random().nextInt(lsResult.length);
    int random4 = Random().nextInt(lsResult.length);
    while (random2 == random1 || random2 == random3 || random2 == random4) {
      random2 = Random().nextInt(lsResult.length);
    }
    while (random3 == random1 || random3 == random2 || random3 == random4) {
      random3 = Random().nextInt(lsResult.length);
    }
    while (random4 == random1 || random4 == random2 || random4 == random3) {
      random4 = Random().nextInt(lsResult.length);
    }

    bool trogiup_50 = true;
    int i = 0;

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Container(
          constraints: const BoxConstraints.expand(),
          color: const Color(0xFFE9F8FF),
          alignment: Alignment.center,
          child: FutureBuilder<DocumentSnapshot>(
            future: chude.doc(lsAnswer[idAnswer]).get(),
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

                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      color: const Color(0xFFE9F8FF),
                      alignment: Alignment.center,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: size.height * 0.25,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.all(10),
                            padding: const EdgeInsets.all(30),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 3),
                              color: const Color(0xFF38B83C),
                            ),
                            child: Text(
                              data['cauhoi'],
                              softWrap: true,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 27,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Text(
                            '${idAnswer + 1}/${lsAnswer.length}',
                            style: const TextStyle(fontSize: 20),
                          ),
                          //Đáp án A
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Expanded(child: Container(height: 56)),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: color_origin,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random1 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random1]],

                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: color_black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(height: 56)),
                              ],
                            ),
                          ),
                          //Đáp án B
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Expanded(child: Container(height: 56)),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFB4B291),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random2 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random2]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(height: 56)),
                              ],
                            ),
                          ),
                          //Đáp án C
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Expanded(child: Container(height: 56)),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFB4B291),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random3 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random3]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(height: 56)),
                              ],
                            ),
                          ),
                          //Đáp án D
                          Padding(
                            padding: const EdgeInsets.only(top: 30),
                            child: Row(
                              children: [
                                Expanded(child: Container(height: 56)),
                                Expanded(
                                  flex: 8,
                                  child: Container(
                                    width: 100,
                                    height: 70,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFB4B291),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: TextButton(
                                      onPressed: () {
                                        total++;
                                        if (random4 == 3) {
                                          total_true++;
                                          right_answer(context);
                                        } else {
                                          wrong_answer(context);
                                        }
                                      },
                                      child: Text(
                                        //Câu trả lời
                                        data[lsResult[random4]],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(child: Container(height: 56)),
                              ],
                            ),
                          ),
                          //Thoát
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: IconButton(
                              onPressed: () {
                                _outPlay(context);
                              },
                              icon: const Icon(Icons.exit_to_app),
                              iconSize: 40,
                              color: const Color(0xFF59A9DF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.purple,
                                ),
                                child: const Text(
                                  'Nhân đôi',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                ),
                                child: const Text(
                                  '50/50',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 80,
                              child: ElevatedButton(
                                onPressed: () {
                                  total_next++;
                                  if (idAnswer < lsAnswer.length - 1) {
                                    idAnswer = idAnswer + 1;
                                  }
                                  setState(() {
                                    if (total + total_next == lsAnswer.length) {
                                      result_answer(context);
                                    }
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                ),
                                child: const Text(
                                  'Bỏ qua',
                                  style: TextStyle(fontSize: 17),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              }
              return const Text("Loanding...");
            },
          ),
        ),
      ),
    );
  }

  Future<void> _outPlay(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Lưu ý"),
          content: const Text("Nếu bạn thoát kết quả sẽ không được lưu!"),
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
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ThemePage(),
                    ),
                    (route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> right_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/right_128.png',
              ),
              const SizedBox(height: 20),
              const Text(
                "Bạn đã trả lời đúng!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black, fontSize: 18),
              ),
              onPressed: () {
                if (idAnswer < lsAnswer.length - 1) {
                  idAnswer = idAnswer + 1;
                }
                setState(() {
                  Navigator.of(context).pop();
                  if (total + total_next == lsAnswer.length) {
                    result_answer(context);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> wrong_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'images/wrong_128.png',
              ),
              const SizedBox(height: 20),
              const Text(
                "Bạn đã trả lời sai!",
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                if (idAnswer < lsAnswer.length - 1) {
                  idAnswer = idAnswer + 1;
                }

                setState(() {
                  Navigator.of(context).pop();
                  if (total + total_next == lsAnswer.length) {
                    result_answer(context);
                  }
                });
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> result_answer(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Kết quả:'),
          content:
              Text("Số câu bạn trả lời đúng: $total_true/${lsAnswer.length}"),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text(
                'Tiếp tục',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                setState(() {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ThemePage(),
                      ));
                });
              },
            ),
          ],
        );
      },
    );
  }
}
