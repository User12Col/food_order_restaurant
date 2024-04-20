import 'dart:convert';

import 'package:restaurant/models/menu.dart';
import 'package:http/http.dart' as http;

class MenuService {
  Future<List<Menu>> getAllMenu(String token) async {
    final response = await http.Client()
        .get(Uri.parse('http://192.168.1.146:8000/api/get-list-menu'), headers: {
      'Content-Type': 'application/x-www-form-urlencoded',
      'Authorization': 'Bearer $token',
      'Accept': 'application/json',
    });

    if (response.statusCode == 200) {
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if (mapResponse['success']) {
        final listData = mapResponse['data'].cast<Map<String, dynamic>>();
        final listMenu = await listData.map<Menu>((json) {
          return Menu.fromJson(json);
        }).toList();
        return listMenu;
      } else {
        return [];
      }
    }
    return [];
  }
}
