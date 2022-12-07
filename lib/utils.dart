// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class Utils {
  //Icon với màu sắc
  static Column iconWithColor(IconData icon, String text) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30,
        ),
        Text(text)
      ],
    );
  }

  //Icon với text
  static TextButton buttonIconWithText(IconData icon, String text) {
    return TextButton(
      onPressed: () {},
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 25,
          ),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(color: Colors.black, fontSize: 17),
          ),
        ],
      ),
    );
  }

  //Icon từ image
  static Column iconFormImage(String text, String icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          icon,
          width: 28,
          height: 28,
          color: Colors.black54,
        ),
        Text(
          text,
        ),
      ],
    );
  }

  //Logo
  static CircleAvatar logo() {
    return CircleAvatar(
      backgroundColor: const Color.fromARGB(0, 0, 0, 0),
      radius: 100,
      child: Image.asset('images/logo-app.png'),
    );
  }

  // Image - avatar
  static CircleAvatar avatar() {
    return const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 55,
      child: CircleAvatar(
        backgroundImage: AssetImage('images/logo-app.png'),
        backgroundColor: Color.fromARGB(255, 190, 243, 255),
        radius: 50,
      ),
    );
  }

  //Confirm
  static Row confirm() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.refresh),
        ),
        const Text('Gửi lại mã sau 60s.'),
      ],
    );
  }

  ///TextFormField
  static StreamBuilder textFieldWithStream(
      String text, TextEditingController ctrl, Stream bloc) {
    return StreamBuilder(
      stream: bloc,
      builder: (context, snapshot) => TextFormField(
        controller: ctrl,
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          errorText: snapshot.hasError ? (snapshot.error).toString() : null,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }

  ///TextFormField - Password
  static StreamBuilder textFieldWithStream_Pass(String text,
      TextEditingController ctrl, bool obs, Stream bloc, var function) {
    return StreamBuilder(
      stream: bloc,
      builder: (context, snapshot) => TextFormField(
        obscureText: obs,
        controller: ctrl,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: function,
              icon: Icon(obs ? Icons.visibility_off : Icons.visibility)),
          filled: true,
          fillColor: Colors.white,
          hintText: text,
          errorText: snapshot.hasError ? (snapshot.error).toString() : null,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
        ),
      ),
    );
  }

  //TextButton
  static TextButton textButtonWithOnTap(String text, var function) {
    return TextButton(
      onPressed: function,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    );
  }

  //Button: Đăng nhập, đăng ký, xác nhận,....
  static Row buttonWithText(var function, String text) {
    return Row(
      children: [
        Expanded(flex: 2, child: Container(height: 56)),
        Expanded(
          flex: 3,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: const Color(0xFFC1FED2),
              borderRadius: BorderRadius.circular(22),
              border: Border.all(width: 1),
            ),
            child: TextButton(
              onPressed: function,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
        Expanded(flex: 2, child: Container(height: 56)),
      ],
    );
  }

  //Stack head
  static Stack stackHead(String text, String icon) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Container(
            alignment: Alignment.center,
            width: 75,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 15, color: Colors.black),
            ),
          ),
        ),
        Image.asset(
          icon,
          width: 30,
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(72, 0, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.add_circle,
              color: Colors.green,
              size: 25,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  static Padding stackHead_noAdd(String text, String icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Stack(
        alignment: AlignmentDirectional.centerStart,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              alignment: Alignment.center,
              width: 75,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                text,
                style: const TextStyle(fontSize: 15, color: Colors.black),
              ),
            ),
          ),
          Image.asset(
            icon,
            width: 30,
            height: 30,
          ),
        ],
      ),
    );
  }

  //Button gridview
  static Padding gridViewButton(
      String text, Color colorBg, String icon, var onClicked) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: onClicked,
        child: Container(
          decoration: BoxDecoration(
              color: colorBg, borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                color: Colors.white,
                width: 40,
                height: 40,
              ),
              const SizedBox(height: 5),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //List view achievement
  static Padding achievement(
      String text, String text2, String icon, bool color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFFC9D8D5),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: AlignmentDirectional.center,
                  height: 100,
                  child: CircleAvatar(
                    radius: 32,
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: color
                          ? const Color(0xFF7CFA71)
                          : const Color(0xFFFA7A71),
                      child: Image.asset(
                        icon,
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 5,
              child: Container(
                alignment: AlignmentDirectional.centerStart,
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      text2,
                      style: const TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Listview History
  static Padding history(String day, String image, String question, bool b) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 5),
      child: Expanded(
        child: Container(
          // alignment: Alignment.center,
          height: 170,
          color: const Color(0xFFD6DDE4),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                Text(
                  day,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 140,
                      child: Image.asset(image),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: Text(
                        question,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.center,
                        height: 30,
                        width: 50,
                        decoration: BoxDecoration(
                          color: b
                              ? const Color(0xFF7CFA71)
                              : const Color(0xFFFA7A71),
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: b ? const Text('Đúng') : const Text('Sai'),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

//Avatar
  static Container avatar_02() {
    return Container(
      alignment: AlignmentDirectional.center,
      height: 100,
      child: const CircleAvatar(
        radius: 32,
        backgroundColor: Color(0xFF6FF1FA),
        child: CircleAvatar(
          radius: 30,
          backgroundColor: Color(0xFFCBCCFF),
          // backgroundImage: NetworkImage('https://goeco.link/cCjJH'),
        ),
      ),
    );
  }

//ListView Bạn bè
  static Padding listFriends(String text, var onClicked) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: const Color(0xFFC9D8D5),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Expanded(flex: 2, child: Utils.avatar_02()),
            Expanded(
              flex: 5,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
                onPressed: onClicked, icon: const Icon(Icons.more_horiz)),
          ],
        ),
      ),
    );
  }

  //MoreHoriz profile friend
  static Row profileFriend(String text) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: Container(
              alignment: AlignmentDirectional.centerStart,
              child: const CircleAvatar(
                radius: 32,
                backgroundColor: Color(0xFF6FF1FA),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Color(0xFFCBCCFF),
                  backgroundImage: NetworkImage('https://goeco.link/cCjJH'),
                ),
              ),
            )),
        const SizedBox(width: 10),
        Expanded(
          flex: 5,
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  //List view Nhiệm vụ
  static TextButton mission(
      String stt, String image1, String? image2, String? image3, var function) {
    return TextButton(
      onPressed: function,
      child: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 120,
                    color: const Color(0xFFA9F3BF),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, right: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 50,
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Image.asset(image1),
                                ),
                                if (image2 != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Image.asset(image2),
                                  ),
                                if (image3 != null)
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Image.asset(image3),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    alignment: AlignmentDirectional.centerStart,
                    height: 50,
                    color: const Color(0xFFD3D679),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        stt,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //aa
  static Container missionDetails(
      String image1, String? image2, String? image3) {
    return Container(
      height: 120,
      color: const Color(0xFFA9F3BF),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 70,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Image.asset(image1),
                ),
                if (image2 != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(image2),
                  ),
                if (image3 != null)
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Image.asset(image3),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Details
  static Row details(
      String stt, String detail_1, String detail_2, String? detail_3) {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: const Color(0xFFD3D679),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stt,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("images/number-1.png")),
                      Expanded(
                        child: Text(
                          detail_1,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.asset("images/number-2.png")),
                      Expanded(
                        child: Text(
                          detail_2,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (detail_3 != null)
                    Row(
                      children: [
                        SizedBox(
                            height: 50,
                            width: 50,
                            child: Image.asset("images/number-3.png")),
                        Expanded(
                          child: Text(
                            stt,
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(child: Container(height: 56)),
                      Expanded(
                        flex: 5,
                        child: Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0xFF69DF59),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Bắt đầu',
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
            ),
          ),
        ),
      ],
    );
  }

  //Basket
  static Column basket(var onTap) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 50, 30, 50),
          child: Text(
            "Bắt đầu mua sắm ngay. Tất cả các mục đã mua sẽ được hiện ở đây",
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 109, 109, 109)),
            textAlign: TextAlign.center,
          ),
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              height: 50,
            )),
            Expanded(
              flex: 3,
              child: Container(
                alignment: AlignmentDirectional.center,
                height: 50,
                decoration: BoxDecoration(
                  color: const Color(0xFF6CD46F),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: onTap,
                  child: const Text(
                    "Mua ngay",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                child: Container(
              height: 50,
            )),
          ],
        ),
      ],
    );
  }

  //Store
  static Padding buy(String name) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
            color: const Color(0xFFC9D8D5),
            borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Expanded(flex: 3, child: Image.asset('images/dollar.png')),
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset('icons/icon-money.png'),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        '500',
                        style: TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Expanded(
                flex: 2,
                child: Text(
                  '22/10/2022',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  //Gridview thong ke
  static Padding statistical(
      String text, String text2, Color colorBg, String icon) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: colorBg, borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 8, 8, 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    icon,
                    color: Colors.white,
                    width: 55,
                    height: 55,
                  ),
                ),
              ),
              Text(
                text,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                text2,
                style: const TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //List ty le
  static Padding listRate(
      String image, String theme, String total, String rate) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Image.asset(
              image,
              width: 50,
              height: 50,
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  theme,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  '$total câu hỏi đã được trả lời',
                  style: const TextStyle(fontSize: 15, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              '$rate%',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  //List Theme
  static Padding listTheme(String text, var onClick) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        children: [
          Expanded(child: Container(height: 56)),
          Expanded(
            flex: 4,
            child: Container(
              width: 100,
              height: 55,
              decoration: BoxDecoration(
                color: const Color(0xFF69DF59),
                borderRadius: BorderRadius.circular(15),
              ),
              child: TextButton(
                onPressed: onClick,
                child: Text(
                  text,
                  style: const TextStyle(
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
    );
  }

  static Padding answer(String text, var onClick, bool answer) {
    return Padding(
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
                onPressed: onClick,
                child: Text(
                  text,
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
    );
  }
}
