import 'package:flutter/material.dart';
import 'package:restaurant/theme/color.dart';

class ButtonPayWidget extends StatelessWidget {
  final Map? table;
  const ButtonPayWidget({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

      },
      child: Container(
        width: MediaQuery.of(context).size.width/2.3,
        height: 40,
        decoration: BoxDecoration(
          color: AppColors.appBarColor,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: const Center(
          child: Text(
            'Thanh Toán',
            style: TextStyle(
              color: AppColors.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
