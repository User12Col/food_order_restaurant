import 'package:restaurant/models/menu_item.dart';

abstract class RequestOrderEvent{}

class EventLoading extends RequestOrderEvent{}

class EventUpdateQuantity extends RequestOrderEvent{
  final MenuItem menuItem;
  EventUpdateQuantity(this.menuItem);
}

class EventDecreaseQuantity extends RequestOrderEvent{
  final MenuItem menuItem;
  EventDecreaseQuantity(this.menuItem);
}

class EventSendRequest extends RequestOrderEvent{
  final int tableID;
  final List<MenuItem> menuItems;
  EventSendRequest(this.tableID, this.menuItems);
}