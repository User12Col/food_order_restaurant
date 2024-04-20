import 'dart:convert';

import 'package:restaurant/models/table.dart';
import 'package:http/http.dart' as http;

class TableService{
  Future<List<Table>> getAllTable(String token) async {
    final response = await http.Client().get(
        Uri.parse('http://192.168.1.146:8000/api/get-list-table-order'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
          'Accept':'application/json',
        }
    );

    if(response.statusCode == 200){
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse['success']){
        final listData = mapResponse['data'].cast<Map<String, dynamic>>();
        final listTable =await listData.map<Table>(
            (json){
              return Table.fromJson(json);
            }
        ).toList();
        return listTable;
      } else{
        return [];
      }
    }
    return [];
  }
}