import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_event.dart';
import 'package:restaurant/bloc/request_order/request_order_state.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/pages/request_order_page/children/button_request_order.dart';
import 'package:restaurant/pages/request_order_page/children/menu_item_widget.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';

class RequestOrderPage extends StatefulWidget {
  final Map? table;
  const RequestOrderPage({Key? key, required this.table}) : super(key: key);

  @override
  State<RequestOrderPage> createState() => _RequestOrderPageState();
}

class _RequestOrderPageState extends State<RequestOrderPage> {
  late RequestOrderBloc _requestOrderBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _requestOrderBloc = BlocProvider.of<RequestOrderBloc>(context);
    _requestOrderBloc.add(EventLoading());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đặt món', style: TextStyle(fontWeight: FontWeight.bold, color: AppColors.textColor, fontSize: 18),),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<RequestOrderBloc, RequestOrderState>(
            builder: (context, state){
              if(state.isLoading && !state.isSuccess){
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if(!state.isLoading && state.isSuccess){
                List<MenuItem> menuItems = state.menuItems;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Gọi món tại bàn:',
                            style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.table!['location'],
                            style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: AppColors.appBarColor),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      'Món đã chọn:',
                      style:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10,),
                    Expanded(
                      child: ListView.builder(itemBuilder: (context, index){
                        return MenuItemWidget(menuItem: menuItems[index]);
                      }, itemCount: menuItems.length,),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Thông tin thanh toán:',
                            style:
                            TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Tổng tiền:',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                Format.formatMoney(state.totalPrice.toString()),
                                style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.appBarColor),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          ButtonRequestOrder(tableID: widget.table!['id'], menuItems: menuItems,),
                        ],
                      ),
                    )
                  ],
                );
              } else{
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
