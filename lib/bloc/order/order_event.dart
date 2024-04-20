import 'package:restaurant/models/menu_item.dart';

abstract class OrderEvent{}

class EventLoadingMenu extends OrderEvent{}

class EventAddToCart extends OrderEvent{
  final MenuItem menuItem;
  EventAddToCart(this.menuItem);
}

class EventCancel extends OrderEvent{

}

