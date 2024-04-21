import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/home/home_bloc.dart';
import 'package:restaurant/bloc/login/login_bloc.dart';
import 'package:restaurant/bloc/order/order_bloc.dart';
import 'package:restaurant/bloc/request_order/request_order_bloc.dart';
import 'package:restaurant/pages/home/home_page.dart';
import 'package:restaurant/pages/login/login.dart';
import 'package:restaurant/pages/main/main_page.dart';
import 'package:restaurant/routes/route_generator.dart';
import 'package:restaurant/services/login_service.dart';
import 'package:restaurant/services/menu_service.dart';
import 'package:restaurant/services/order_service.dart';
import 'package:restaurant/services/share_preference_service.dart';
import 'package:restaurant/services/table_service.dart';
import 'package:restaurant/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<Widget> checkLogin() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isLogin = prefs.containsKey('user');
    print(isLogin);
    if(isLogin){
      return MainScreen();
    } else{
      return LoginPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (context)=>LoginBloc(loginService: LoginService())),
        BlocProvider<HomeBloc>(create: (context)=>HomeBloc(tableService: TableService())),
        BlocProvider<OrderBloc>(create: (context)=>OrderBloc(menuService: MenuService())),
        BlocProvider<RequestOrderBloc>(create: (context)=>RequestOrderBloc(orderService: OrderService())),
      ],
      child: FutureBuilder<Widget>(
        future: checkLogin(),
        builder: (context, snapshot){
          if(snapshot.hasData){
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: themeData,
              home: snapshot.data,
              onGenerateRoute: RouteGenerator.generateRoute,
            );
          }
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: themeData,
            home: Scaffold(),
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        },
      ),
    );
  }
}

