import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/pages/full_order/children/order_food_widget.dart';
import 'package:restaurant/pages/full_order/children/button_pay_widget.dart';
import 'package:restaurant/pages/full_order/children/infor_widget.dart';
import 'package:restaurant/theme/color.dart';
class FullOrderPage extends StatefulWidget {
  const FullOrderPage({Key? key}) : super(key: key);

  @override
  State<FullOrderPage> createState() => _FullOrderPageState();
}

class _FullOrderPageState extends State<FullOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBarColor,
        title: const Text('Bàn 1'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const Text('THÔNG TIN HÓA ĐƠN', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
              const SizedBox(height: 10,),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      InforWidget(title: 'Bàn: ', content: 'Bàn 1'),
                      const SizedBox(height: 10,),
                      InforWidget(title: 'Ngày giờ: ', content: '14/10/2023 19:05:37'),
                      const SizedBox(height: 10,),
                      InforWidget(title: 'Nhân viên: ', content: 'Võ Trần Tấn Lộc'),
                      const SizedBox(height: 10,),
                      InforWidget(title: 'Trạng thái: ', content: 'Chưa thanh toán'),
                      const SizedBox(height: 10,),
                      InforWidget(title: 'Món ăn: ', content: ''),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            Food food = fakeData[index];
                            return OrderFoodWidget(food: food);
                          },
                          itemCount: fakeData.length,
                        ),
                      ),
                      const SizedBox(height: 10,),
                      InforWidget(title: 'Ghi chú: ', content: 'Không cay'),
                      const SizedBox(height: 10,),
                      const ButtonPayWidget(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
