import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/order/order_bloc.dart';
import 'package:restaurant/bloc/order/order_event.dart';
import 'package:restaurant/bloc/order/order_state.dart';
import 'package:restaurant/theme/color.dart';
class ButtonCancelWidget extends StatelessWidget {
  const ButtonCancelWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state){
        return GestureDetector(
          onTap: (){
            context.read<OrderBloc>().add(EventCancel());
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
                'Hủy món',
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
