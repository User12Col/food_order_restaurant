import 'package:restaurant/bloc/login/login_state.dart';
import 'package:restaurant/models/menu_item.dart';

class RequestOrderState{
  final bool isLoading;
  final bool isSuccess;
  final bool isUpdateSuccess;
  final bool isSendRequest;
  final List<MenuItem> menuItems;
  final int totalPrice;

  RequestOrderState({this.isLoading = true, this.isSuccess = false, this.isUpdateSuccess = false, this.isSendRequest = false, this.menuItems = const[], this.totalPrice = 0});

  RequestOrderState copyWith({bool? isLoading, bool? isSuccess, bool? isUpdateSuccess, bool? isSendRequest, List<MenuItem>? menuItems, int? totalPrice}){
    return RequestOrderState(
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      isUpdateSuccess: isUpdateSuccess ?? this.isUpdateSuccess,
      isSendRequest: isSendRequest ?? this.isSendRequest,
      menuItems: menuItems ?? this.menuItems,
      totalPrice: totalPrice ?? this.totalPrice,
    );
  }
}