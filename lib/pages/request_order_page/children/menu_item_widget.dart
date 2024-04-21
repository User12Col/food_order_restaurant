import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_event.dart';
import 'package:restaurant/bloc/request_order/request_order_state.dart';
import 'package:restaurant/helpers/format.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/theme/color.dart';

class MenuItemWidget extends StatefulWidget {
  final MenuItem menuItem;
  const MenuItemWidget({Key? key, required this.menuItem}) : super(key: key);

  @override
  State<MenuItemWidget> createState() => _MenuItemWidgetState();
}

class _MenuItemWidgetState extends State<MenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    final foodWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<RequestOrderBloc, RequestOrderState>(
      builder: (context, state){
        if(state.isUpdateSuccess || state.isSuccess){
          return Container(
            padding: const EdgeInsets.all(4.0),
            margin: EdgeInsets.only(bottom: 10.0),
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
                    'http://192.168.1.146:8000/assets/img/avatars/${widget.menuItem.photo!}',
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
                      widget.menuItem.name!,
                      style:
                      const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.appBarColor),
                          child: IconButton(
                            onPressed: () {
                              context.read<RequestOrderBloc>().add(EventDecreaseQuantity(widget.menuItem));
                            },
                            icon: Icon(
                              Icons.remove,
                              color: AppColors.textColor,
                              size: 14,
                            ),
                          ),
                        ),
                        SizedBox(width: 10,),
                        Text(
                          widget.menuItem.quantity.toString(),
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(width: 10,),
                        Container(
                          width: 34,
                          height: 34,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: AppColors.appBarColor),
                          child: IconButton(
                            onPressed: () {
                              context.read<RequestOrderBloc>().add(EventUpdateQuantity(widget.menuItem));
                            },
                            icon: Icon(
                              Icons.add,
                              color: AppColors.textColor,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  Format.formatMoney(widget.menuItem.price.toString()),
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
