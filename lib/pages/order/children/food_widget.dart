import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/order/order_bloc.dart';
import 'package:restaurant/bloc/order/order_event.dart';
import 'package:restaurant/bloc/order/order_state.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/food.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/theme/color.dart';

class FoodWidget extends StatelessWidget {
  final MenuItem menuItem;
  const FoodWidget({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state){
        return Container(
          padding: const EdgeInsets.all(4.0),
          margin: const EdgeInsets.all(10.0),
          width: foodWidth,
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: CachedNetworkImage(
                  imageUrl:
                  'http://192.168.1.146:8000/assets/img/avatars/${menuItem.photo!}',
                  width: foodWidth / 4,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    menuItem.name!,
                    style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      context.read<OrderBloc>().add(EventAddToCart(menuItem));
                    },
                    child: Container(
                      width: foodWidth/3.5,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: AppColors.appBarColor),
                      child: Center(
                        child: Text(
                          'Đặt món',
                          style: TextStyle(color: AppColors.textColor, fontSize: 12),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                Format.formatMoney(menuItem.price.toString()),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        );
      },
    );
  }
}
