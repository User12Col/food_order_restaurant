import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/order/order_event.dart';
import 'package:restaurant/bloc/order/order_state.dart';
import 'package:restaurant/helpers/sqlite_helper.dart';
import 'package:restaurant/models/menu.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/services/menu_service.dart';
import 'package:restaurant/services/share_preference_service.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final MenuService _menuService;

  OrderBloc({required MenuService menuService})
      : _menuService = menuService,
        super(OrderState()) {
    on<EventLoadingMenu>(_loadingMenu);
    on<EventAddToCart>(_addToCart);
    on<EventCancel>(_cancel);
  }

  Future<void> _loadingMenu(
      EventLoadingMenu event, Emitter<OrderState> emit) async {
    try {
      String token = await SharedPreferencesService.getToken();
      List<Menu> menus = await MenuService().getAllMenu(token);
      emit(state.copyWith(isLoadingFood: false, isSuccess: true, menus: menus));
    } catch (e) {
      emit(state.copyWith(isSuccess: false));
    }
    emit(state.copyWith(isLoadingFood: false));
  }

  Future<void> _addToCart(
      EventAddToCart event, Emitter<OrderState> emit) async {
    try {
      MenuItem menuItem = event.menuItem;
      menuItem.quantity = 1;
      bool isExist = await SqliteHelper().isMenuItemExists(menuItem.id!);
      if (isExist) {
        MenuItem? getMenuItem =
            await SqliteHelper().getMenuItemById(menuItem.id!);
        getMenuItem?.quantity = getMenuItem.quantity! + 1;
        await SqliteHelper().updateMenuItem(getMenuItem!);
        emit(state.copyWith(
            totalPrice: state.totalPrice + getMenuItem.price!,
            isAddSuccess: true));
      } else {
        await SqliteHelper().insertMenuItem(menuItem);
        emit(state.copyWith(
            totalPrice: state.totalPrice + menuItem.price!,
            isAddSuccess: true));
      }
      // emit(state.copyWith(
      //     totalPrice: state.totalPrice + menuItem.price!, isAddSuccess: true));
    } catch (e) {
      emit(state.copyWith(isAddSuccess: false));
    }
  }

  Future<void> _cancel(EventCancel event, Emitter<OrderState> emit) async{
    await SqliteHelper().deleteAllMenuItems();
    emit(state.copyWith(isAddSuccess: false, totalPrice: 0));
  }
}
