import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/order/order_bloc.dart';
import 'package:restaurant/bloc/order/order_event.dart';
import 'package:restaurant/bloc/order/order_state.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';

class ButtonPayWidget extends StatefulWidget {
  final Map? table;
  const ButtonPayWidget({Key? key, required this.table}) : super(key: key);

  @override
  State<ButtonPayWidget> createState() => _ButtonPayWidgetState();
}

class _ButtonPayWidgetState extends State<ButtonPayWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state){
        return GestureDetector(
          onTap: (){
            Navigator.of(context).popAndPushNamed(NavigatorNames.REQUEST_ORDER_PAGE, arguments: {'table':widget.table});
            context.read<OrderBloc>().add(EventNavigate());
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
      },
    );
  }
}
