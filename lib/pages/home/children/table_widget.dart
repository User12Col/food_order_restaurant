import 'package:flutter/material.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';

class TableWidget extends StatelessWidget {
  final String title;
  final String status;
  const TableWidget({Key? key, required this.title, required this.status})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tableWidth = MediaQuery.of(context).size.width / 3.5;
    final tableHeight = MediaQuery.of(context).size.height / 9;
    return GestureDetector(
      onTap: () {
        status == 'Empty'
            ? Navigator.of(context).pushNamed(
                NavigatorNames.ORDER_PAGE,
                arguments: {
                  'title': {'title': title}
                },
              )
            : Navigator.of(context).pushNamed(NavigatorNames.FULL_ORDER_PAGE);
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        height: tableHeight,
        width: tableWidth,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 7,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(20.0),
          color: status == 'Full' ? AppColors.foodColor : Colors.white,
        ),
        child: Center(
          child: Text(
            '$title - $status',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
