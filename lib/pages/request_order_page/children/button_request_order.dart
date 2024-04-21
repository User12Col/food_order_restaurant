import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_event.dart';
import 'package:restaurant/bloc/request_order/request_order_state.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';
class ButtonRequestOrder extends StatefulWidget {
  final int tableID;
  final List<MenuItem> menuItems;
  const ButtonRequestOrder({Key? key, required this.tableID, required this.menuItems}) : super(key: key);

  @override
  State<ButtonRequestOrder> createState() => _ButtonRequestOrderState();
}

class _ButtonRequestOrderState extends State<ButtonRequestOrder> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RequestOrderBloc, RequestOrderState>(
      builder: (context, state){
        if(state.isSendRequest || state.isSuccess){
          return GestureDetector(
            onTap: (){
              context.read<RequestOrderBloc>().add(EventSendRequest(widget.tableID, widget.menuItems));
              // Navigator.of(context).pushReplacementNamed(NavigatorNames.MAIN_PAGE);
              Navigator.of(context).popAndPushNamed(NavigatorNames.REQUET_ORDER_SUCCESS);
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: AppColors.appBarColor
              ),
              child: const Center(
                child: Text(
                  'Yêu cầu đặt món',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
