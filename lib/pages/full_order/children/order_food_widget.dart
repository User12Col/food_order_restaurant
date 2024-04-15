import 'package:flutter/material.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/pages/full_order/children/infor_widget.dart';
import 'package:restaurant/theme/color.dart';
class OrderFoodWidget extends StatelessWidget {
  final Food food;
  const OrderFoodWidget({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        )
      ),
      width: foodWidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InforWidget(title: food.name, content: ''),
          Container(
            width: foodWidth/2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InforWidget(title: 'Số lượng: ', content: '1'),
                InforWidget(title: Format.formatMoney(food.unitPrice.toString()), content: ''),
              ],
            ),
          )
        ],
      ),
    );
  }
}
