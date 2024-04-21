import 'package:flutter/material.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';
import 'package:restaurant/models/table.dart' as model;

class TableWidget extends StatelessWidget {
  final model.Table table;
  const TableWidget({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tableWidth = MediaQuery.of(context).size.width / 3.5;
    final tableHeight = MediaQuery.of(context).size.height / 9;

    String convert(int status) {
      return status == 0 ? 'Empty' : 'Full';
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(
          NavigatorNames.ORDER_PAGE,
          arguments: {'table': table.toMap()},
        );
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
          color: table.status == 1 ? AppColors.tableFullColor : Colors.white,
        ),
        child: Center(
          child: Text(
            '${table.location} - ${convert(table.status!)}',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: table.status == 1 ? Colors.grey : AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
