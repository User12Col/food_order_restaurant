import 'package:flutter/material.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';

class RequestOrderSuccess extends StatelessWidget {
  const RequestOrderSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Icon(Icons.check_circle, color: AppColors.appBarColor, size: 300,),
                    SizedBox(height: 10,),
                    Text('Yêu cầu đặt món đã được gữi!!!', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),)
                  ],
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).pushReplacementNamed(NavigatorNames.MAIN_PAGE);
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.appBarColor,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: const Center(
                      child: Text(
                        'Tiếp tục',
                        style: TextStyle(
                          color: AppColors.textColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
