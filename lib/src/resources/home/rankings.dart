import 'package:flutter/material.dart';

class Rankings extends StatefulWidget {
  const Rankings({super.key});

  @override
  State<Rankings> createState() => _RankingsState();
}

class _RankingsState extends State<Rankings> {
  List<String> lsRank = [
    "Minh Trần",
    "Nguyễn Gia Bảo",
    "Nguyễn Anh Hào",
    "Trần Phương",
    "Nguyễn Văn A",
    "Nguyễn Văn B",
    "Nguyễn Văn C",
    "Nguyễn Văn D",
    "Trần Văn A",
    "Trần Văn B"
  ];
  List<int> lsRank2 = [999, 956, 879, 704, 609, 538, 412, 356, 243, 120, 99];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: const Color(0xFFB2FDA3),
          title: const Text(
            "Bảng xếp hạng",
            style: TextStyle(fontSize: 21),
          ),
          flexibleSpace: Container(
            height: 20,
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                child: Text(
                  "Bạn bè",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Tab(
                child: Text(
                  "Việt Nam",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
            indicatorColor: Colors.black,
            indicatorWeight: 7,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.black54,
            labelPadding: EdgeInsets.only(bottom: 5),
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              color: const Color(0xFFE9F8FF),
              child: ListView.builder(
                itemCount: lsRank.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF93CAC3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: index == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                            'images/ranking-01.png'),
                                      )
                                    : Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  lsRank[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    lsRank2[index].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              color: const Color(0xFFE9F8FF),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: const Color(0xFF93CAC3),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: index == 0
                                    ? Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Image.asset(
                                            'images/ranking-01.png'),
                                      )
                                    : Text(
                                        (index + 1).toString(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  lsRank[index],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text(
                                    lsRank2[index].toString(),
                                    style: const TextStyle(fontSize: 17),
                                  ),
                                  const SizedBox(width: 10),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
