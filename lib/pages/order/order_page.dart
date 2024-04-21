import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/order/order_bloc.dart';
import 'package:restaurant/bloc/order/order_event.dart';
import 'package:restaurant/bloc/order/order_state.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/menu.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/pages/order/children/button_cancel_widget.dart';
import 'package:restaurant/pages/order/children/food_widget.dart';
import 'package:restaurant/pages/order/children/button_pay_widget.dart';
import 'package:restaurant/pages/order/children/search_widget.dart';
import 'package:restaurant/theme/color.dart';

class OrderPage extends StatefulWidget {
  final Map? table;
  const OrderPage({Key? key, required this.table}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  String _selectedCate = 'All';
  late OrderBloc _orderBloc;

  DropdownMenuItem<String> buildMenuItem(String? item) => DropdownMenuItem(
    value: item,
    child: Text(
      item!,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _orderBloc = BlocProvider.of<OrderBloc>(context);
    _orderBloc.add(EventLoadingMenu());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.table!['location'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocBuilder<OrderBloc, OrderState>(
          builder: (context, state){
            if(state.isLoadingFood){
              return Center(child: CircularProgressIndicator(),);
            } else if(!state.isLoadingFood && state.isSuccess){
              List<Menu> menus = state.menus;
              Set<String?> categorySet = menus.map((menu) => menu.name_type).toSet();
              List<String?> categories = [
                'All',
                ...categorySet
              ];
              List<MenuItem> menuItems = menus.expand((menu) => menu.menu_items!).toList();
              print(menuItems.length);
              return Column(
                children: [
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Danh mục: ', style: TextStyle(fontSize: 14),),
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
                        return FoodWidget(menuItem: menuItems[index]);
                      },
                      itemCount: menuItems.length,
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
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              Format.formatMoney(state.totalPrice.toString()),
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ButtonPayWidget(table: widget.table,),
                            const ButtonCancelWidget(),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              );
            } else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}
