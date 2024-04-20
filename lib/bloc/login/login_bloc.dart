import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/login/login_event.dart';
import 'package:restaurant/bloc/login/login_state.dart';
import 'package:restaurant/models/user.dart';
import 'package:restaurant/services/login_service.dart';
import 'package:restaurant/services/share_preference_service.dart';
import 'package:restaurant/services/user_service.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState>{
  final LoginService _loginService;
  LoginBloc({required LoginService loginService}):_loginService = loginService, super(LoginState()){
    on<EventLogin>(_login);
    on<EventLogout>(_logout);
  }

  Future<void> _login(EventLogin event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    try{
      String token = await _loginService.login(event.email, event.password);
      if(token != 'Login fail' && token !='Error'){
        User? user = await UserService().getUserDetail(token);
        await SharedPreferencesService.saveUser(user!);
        await SharedPreferencesService.saveToken(token);
        emit(state.copyWith(isSuccess: true, isFail: false, token: token));
        print('Login success');
      } else{
        emit(state.copyWith(isSuccess: false, isFail: true));
      }
    } catch (e){
        emit(state.copyWith(isSuccess: false, isFail: true));
    }
    emit(state.copyWith(isLoading: false));
  }

  Future<void> _logout(EventLogout event, Emitter<LoginState> emit) async {
    emit(state.copyWith(isLoading: true));
    await SharedPreferencesService.removeUser();
    emit(state.copyWith(isLoading: false, isLogout: true));
  }
}