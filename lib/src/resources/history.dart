import 'package:flutter/material.dart';
import 'package:app_puzzle/utils.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<StatefulWidget> createState() {
    return HistoryState();
  }
}

class HistoryState extends State<History> {
  bool result = true;
  List<String> lsQuestion = [
    "Nhà khoa học nào dưới đây là người tìm ra vắc-xin chữa bệnh Dại",
    "Loài nào dưới đây không phải là 'Loài bản địa' của Việt Nam?",
    "Phát minh nào dưới đây ra đời sớm nhất?",
    "'Năm ánh sáng' là đơn vị dùng để đo đại lượng nào trong vũ trụ?",
    "Theo các nhà thiên văn học, thành phần chủ yếu cấu tạo nên sao chổi là gì?",
  ];
  List<bool> lsBool = [true, true, true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE9F8FF),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFFB2FDA3),
        centerTitle: true,
        title: const Text(
          'Lịch sử',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: lsQuestion.length,
        itemBuilder: (context, index) {
          return Utils.history(lsQuestion[index], lsBool[index]);
        },
      ),
    );
  }
}
