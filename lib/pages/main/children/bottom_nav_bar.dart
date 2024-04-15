import 'package:flutter/material.dart';
import 'package:restaurant/theme/color.dart';
class BottomNavBar extends StatefulWidget {
  final PageController pageController;
  const BottomNavBar({Key? key,required this.pageController}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index =0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: BottomNavigationBar(
          backgroundColor: AppColors.appBarColor,
          currentIndex: index,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: true,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: AppColors.textColor,
          elevation: 0,
          selectedFontSize: 10,
          unselectedFontSize: 10,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home, color: AppColors.tableColor,),
                label: 'Trang chủ'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                activeIcon: Icon(Icons.settings, color: AppColors.tableColor,),
                label: 'Thiết lập'),
          ],
          onTap: (int index) async {
            setState(() {
              this.index = index;
              widget.pageController.jumpToPage(index);
            });
          }),
    );
  }
}
