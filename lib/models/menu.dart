import 'package:restaurant/models/menu_item.dart';

class Menu{
  final int? id;
  final String? name_type;
  final int? availability;
  final String? created_at;
  final String? updated_at;
  final List<MenuItem>? menu_items;

  Menu({this.id, this.name_type, this.availability, this.created_at, this.updated_at, this.menu_items});

  factory Menu.fromJson(Map<String, dynamic> json){
    var menuItemsList = json['menu_items'] as List;
    List<MenuItem> menuItemList = menuItemsList.map((item) => MenuItem.fromJson(item)).toList();
    return Menu(
      id: json['id'],
      name_type: json['name_type'],
      availability: json['availability'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
      menu_items: menuItemList,
    );
  }
}