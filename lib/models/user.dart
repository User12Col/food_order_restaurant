import 'dart:convert';

import 'package:restaurant/models/role.dart';

class User{
  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? avatar;
  final int? disable;
  final int? role;
  final String? created_at;
  final String? updated_at;

  User({this.id, this.name, this.email, this.phone, this.avatar, this.disable, this.role, this.created_at, this.updated_at});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      avatar: json['avatar'],
      disable: json['disable'],
      role: json['role_id'],
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id':id,
      'name':name,
      'email':email,
      'phone':phone,
      'avatar':avatar,
      'disable':disable,
      'role':role,
      'created_at':created_at,
      'updated_at':updated_at,
    };
  }

}