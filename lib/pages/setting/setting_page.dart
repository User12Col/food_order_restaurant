import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/theme/color.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                Image(image: AssetImage('assets/image/logo.png')),
                SizedBox(height: 20,),
                Text('Nhân viên 1', style: TextStyle(fontWeight: FontWeight.bold),),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){},
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.logout, color: Colors.grey,),
                            SizedBox(width: 8,),
                            Text('Đăng xuất'),
                          ],
                        ),
                        Icon(Icons.arrow_forward, color: Colors.grey,),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
