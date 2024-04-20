import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:restaurant/models/user.dart';
class UserService{
  Future<User?> getUserDetail(String token) async {
    final response = await http.Client().get(
        Uri.parse('http://192.168.1.146:8000/api/user-detail'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Bearer $token',
          'Accept':'application/json',
        }
    );

    if(response.statusCode == 200){
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse['success'] == true){
        final data = mapResponse['data'] as Map<String, dynamic>;
        return User.fromJson(data);
      } else{
        return null;
      }
    }
    return null;
  }
}