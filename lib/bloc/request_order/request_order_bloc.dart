import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_event.dart';
import 'package:restaurant/bloc/request_order/request_order_state.dart';
import 'package:restaurant/helpers/sqlite_helper.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/services/order_service.dart';
import 'package:restaurant/services/share_preference_service.dart';

class RequestOrderBloc extends Bloc<RequestOrderEvent, RequestOrderState>{
  final OrderService _orderService;
  RequestOrderBloc({required OrderService orderService}): _orderService = orderService, super(RequestOrderState()){
    on<EventLoading>(_loading);
    on<EventUpdateQuantity>(_updateQuantity);
    on<EventDecreaseQuantity>(_decreaseQuantity);
    on<EventSendRequest>(_sendRequest);
  }

  Future<void> _loading(EventLoading event, Emitter<RequestOrderState> emit) async{
    try{
      List<MenuItem> menuItems = await SqliteHelper().menuItems();
      emit(state.copyWith(isLoading: false, isSuccess: true, menuItems: menuItems, totalPrice: _countTotalPrice(menuItems)));
    } catch(e){
      emit(state.copyWith(isLoading: false, isSuccess: false));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _updateQuantity(EventUpdateQuantity event, Emitter<RequestOrderState> emit) async{
    try{
      MenuItem menuItem = event.menuItem;
      int currQuantity = menuItem.quantity!;
      menuItem.quantity = currQuantity + 1;
      await SqliteHelper().updateMenuItem(menuItem);

      List<MenuItem> menuItems = await SqliteHelper().menuItems();
      emit(state.copyWith(isUpdateSuccess: true, isLoading: false, isSuccess: true, menuItems: menuItems, totalPrice: _countTotalPrice(menuItems)));
    } catch (e){
      emit(state.copyWith(isUpdateSuccess: false));
    }
  }

  Future<void> _decreaseQuantity(EventDecreaseQuantity event, Emitter<RequestOrderState> emit) async {
    try{
      MenuItem menuItem = event.menuItem;
      int currQuantity = menuItem.quantity!;
      if(currQuantity > 1){
        menuItem.quantity = currQuantity - 1;
        await SqliteHelper().updateMenuItem(menuItem);
      } else if(currQuantity == 1){
        await SqliteHelper().deleteMenuItem(menuItem.id!);
      }
      List<MenuItem> menuItems = await SqliteHelper().menuItems();
      emit(state.copyWith(isUpdateSuccess: true, isLoading: false, isSuccess: true, menuItems: menuItems, totalPrice: _countTotalPrice(menuItems)));
    } catch(e){
      emit(state.copyWith(isUpdateSuccess: false));
    }
  }

  Future<void> _sendRequest(EventSendRequest event, Emitter<RequestOrderState> emit) async {
    try{
      String token = await SharedPreferencesService.getToken();
      String result = await _orderService.orderMenuItem(token, event.tableID, event.menuItems);
      if(result == 'Success'){
        print('Order');
        await SqliteHelper().deleteAllMenuItems();
        emit(state.copyWith(isSendRequest: true));
      } else{
        print('fail');
        emit(state.copyWith(isSendRequest: false));
      }
    } catch(e){
      emit(state.copyWith(isSendRequest: false));
    }
  }

  int _countTotalPrice(List<MenuItem> menuItems){
    int sum = 0;
    for(int i = 0;i < menuItems.length;i++){
      sum +=(menuItems[i].price ?? 0) * (menuItems[i].quantity ?? 0);
    }
    return sum;
  }
}
