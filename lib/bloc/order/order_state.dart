import 'package:restaurant/models/menu.dart';

class OrderState {
  final bool isLoadingFood;
  final bool isSuccess;
  final bool isAddSuccess;
  final int totalPrice;
  final List<Menu> menus;

  OrderState({this.isSuccess = false, this.isLoadingFood = true, this.isAddSuccess = false,this.menus = const[], this.totalPrice = 0});

  OrderState copyWith({bool? isLoadingFood, bool? isSuccess, bool? isAddSuccess, List<Menu>? menus, int? totalPrice}){
    return OrderState(
      isLoadingFood: isLoadingFood ?? this.isLoadingFood,
      isSuccess: isSuccess ?? this.isSuccess,
      isAddSuccess: isAddSuccess ?? this.isAddSuccess,
      menus: menus ?? this.menus,
      totalPrice: totalPrice ?? this.totalPrice
    );
  }
}