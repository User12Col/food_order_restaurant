import 'package:flutter/cupertino.dart';
import 'package:restaurant/models/user.dart';

class LoginState {
  final String token;
  final bool isSuccess;
  final bool isFail;
  final bool isLoading;
  final bool isLogout;

  LoginState({this.token = '', this.isSuccess = false, this.isFail = true, this.isLoading = false, this.isLogout = false});

  LoginState copyWith({String? token, bool? isSuccess, bool? isFail, bool? isLoading, bool? isLogout}){
    return LoginState(
      token: token ?? this.token,
      isSuccess: isSuccess ?? this.isSuccess,
      isFail: isFail ?? this.isFail,
      isLoading: isLoading ?? this.isLoading,
      isLogout: isLogout ?? this.isLogout,
    );
  }
}