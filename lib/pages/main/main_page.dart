import 'package:flutter/material.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/main/children/bottom_nav_bar.dart';
import 'package:restaurant/pages/setting/setting_page.dart';
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: [
          HomePage(),
          SettingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavBar(pageController: _pageController),
    );
  }
}
