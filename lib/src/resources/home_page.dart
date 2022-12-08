import 'package:app_puzzle/src/resources/store.dart';
import 'package:flutter/material.dart';
import 'history.dart';
import 'home/home.dart';
import 'menu.dart';
import 'profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  int _selectedIndex = 2;
  final Widget _profile = const Profile();
  final Widget _history = const History();
  final Widget _home = const Home();
  final Widget _store = const Store();
  final Widget _menu = const Menu();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: const Color(0xFFE9F8FF),
        body: getBody(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Hồ sơ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_time_filled),
              label: 'Lịch sử',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Trang chủ',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cửa hàng',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu),
              label: 'Menu',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: onTapHandler,
          selectedIconTheme: const IconThemeData(
            color: Colors.black,
            opacity: 1.0,
            size: 45,
          ),
          unselectedIconTheme: const IconThemeData(
            color: Colors.black54,
            opacity: 1.0,
            size: 30,
          ),
        ),
      ),
    );
  }

  void onTapHandler(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget getBody() {
    if (_selectedIndex == 0) {
      return _profile;
    } else if (_selectedIndex == 1) {
      return _history;
    } else if (_selectedIndex == 2) {
      return _home;
    } else if (_selectedIndex == 3) {
      return _store;
    } else {
      return _menu;
    }
  }
}
