import 'package:restaurant/models/menu.dart';
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/models/table.dart';
import 'package:restaurant/models/user.dart';
import 'package:restaurant/services/login_service.dart';
import 'package:restaurant/services/menu_service.dart';
import 'package:restaurant/services/order_service.dart';
import 'package:restaurant/services/table_service.dart';
import 'package:restaurant/services/user_service.dart';

void main() async{
  String token = await LoginService().login('loc@gmail.com', '123123');
  // User? user = await UserService().getUserDetail(token);
  // print(user!.email);

  // List<Table> tables = await TableService().getAllTable(token);
  // print(tables[0].location);

  // List<Menu> menus = await MenuService().getAllMenu(token);
  // print(menus[0].menu_items![0].name);

  String rs = await OrderService().orderMenuItem(token, 1, [MenuItem(id: 1, quantity: 1)]);
  print(rs);
}