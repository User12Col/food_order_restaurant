import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginService{
  Future<String> login(String email, String password) async{
    Map<String, String> body = {
      'email': email,
      'password': password,
    };

    final response = await http.Client().post(
      Uri.parse('http://192.168.1.146:8000/api/login'),
      body: body,
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      }
    );

    if(response.statusCode == 200){
      Map<String, dynamic> mapResponse = json.decode(response.body);
      if(mapResponse['success'] == true){
        return mapResponse['data'];
      } else{
        return 'Login fail';
      }
    }
    return 'Error';
  }
}