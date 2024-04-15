import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/pages/order/children/food_widget.dart';
import 'package:restaurant/pages/order/children/button_pay_widget.dart';
import 'package:restaurant/pages/order/children/search_widget.dart';
import 'package:restaurant/theme/color.dart';

class OrderPage extends StatefulWidget {
  final Map tableName;
  const OrderPage({Key? key, required this.tableName}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _selectedCate = 'All';
  final List<String> categories = ['All', 'Burger', 'Chicken', 'Drink'];

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
    value: item,
    child: Text(
      item,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tableName['title'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Danh mục: ', style: TextStyle(fontSize: 18),),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      width: MediaQuery.of(context).size.width / 4,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          onChanged: (value) {
                            setState(() {
                              _selectedCate = value!;
                            });
                          },
                          value: _selectedCate,
                          iconSize: 20,
                          icon: Icon(Icons.arrow_downward),
                          isExpanded: true,
                          items: categories.map(buildMenuItem).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                SearchWidget(),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  Food food = fakeData[index];
                  return FoodWidget(food: food);
                },
                itemCount: fakeData.length,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                color: AppColors.backgroundColor,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Tổng tiền: ',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        Format.formatMoney('0'),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const ButtonPayWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
