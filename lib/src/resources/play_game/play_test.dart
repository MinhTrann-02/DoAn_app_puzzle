import 'package:flutter/material.dart';

class PlayTest extends StatefulWidget {
  const PlayTest({super.key});

  @override
  State<PlayTest> createState() => _PlayTestState();
}

class _PlayTestState extends State<PlayTest> {
  final TextEditingController txtController = TextEditingController();
  final TextEditingController txtController2 = TextEditingController();
  var mau1 = Colors.blueGrey;
  var mau2 = Colors.blueGrey;
  var mau3 = Colors.blueGrey;
  var maudung = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        top: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(32),
              child: Text(
                'Drosophila là tên khoa học của một'
                ' chi của loài nào?',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 50, right: 50, bottom: 70, top: 0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    _createButton(id: '1', btnText: 'Mèo', btnColor: mau1),
                    const SizedBox(
                      height: 30,
                    ),
                    _createButton(
                        id: 'True', btnText: 'Ruồi', btnColor: maudung),
                    const SizedBox(
                      height: 30,
                    ),
                    _createButton(id: '2', btnText: 'Cừu', btnColor: mau2),
                    const SizedBox(
                      height: 30,
                    ),
                    _createButton(id: '3', btnText: 'Chuột', btnColor: mau3)
                  ]),
            ),
            Row(
              children: [
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.purple,
                        padding: const EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Nhân đôi cơ hội',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.looks_two,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {
                      setState(() {
                        mau1 = Colors.grey;
                        mau3 = Colors.grey;
                      });
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '50 / 50',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 15),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'image/icon/icon-button/icon5050.png',
                          width: 40,
                          height: 40,
                        )
                      ],
                    ),
                  ),
                )),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 80,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightGreen,
                        padding: const EdgeInsets.all(25.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        )),
                    onPressed: () {},
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Bỏ qua'),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.published_with_changes_sharp,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

Widget _createButton(
    {String? id,
    String? btnText,
    Color? btnColor,
    Color textColor = Colors.black}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: btnColor,
        padding: const EdgeInsets.all(25.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        )),
    child: Text(btnText!, style: TextStyle(fontSize: 20)),
    onPressed: () {},
  );
}
