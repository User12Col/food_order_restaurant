import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant/models/menu_item.dart';
import 'package:restaurant/models/table.dart';

class OrderService{
  Future<String> orderMenuItem(String token, int tableId, List<MenuItem> menuItems)async {

    List<Map<String, dynamic>> menuItemMaps = menuItems.map((item) {
      return {
        'menu_item_id': item.id,
        'quantity': item.quantity,
      };
    }).toList();

    Map<String, dynamic> body = {
      'table_id':tableId,
      'menu_items': menuItemMaps
    };

    print(json.encode(body));
    final response = await http.Client().post(
        Uri.parse('http://192.168.1.146:8000/api/order-menu'),
        body: json.encode(body),
        headers: {
          'Content-Type':'application/json',
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
        }
    );

    if(response.statusCode == 200){
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse['status']){
        return 'Success';
      } else{
        return 'Fail';
      }
    }
    return 'Fail';
  }
}