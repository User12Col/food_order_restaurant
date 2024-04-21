import 'package:flutter/material.dart';
import 'package:restaurant/pages/login/login.dart';
import 'package:restaurant/pages/main/main_page.dart';
import 'package:restaurant/pages/full_order/full_order_page.dart';
import 'package:restaurant/pages/order/order_page.dart';
import 'package:restaurant/pages/request_order_page/children/request_order_success.dart';
import 'package:restaurant/pages/request_order_page/request_order_page.dart';
import 'package:restaurant/routes/navigator_names.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments as Map?;
    final Map<String, dynamic>? data = (settings.arguments ?? Map<String, dynamic>()) as Map<String, dynamic>;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case NavigatorNames.MAIN_PAGE:
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case NavigatorNames.ORDER_PAGE:
        return MaterialPageRoute(
          builder: (_) => OrderPage(
            table: data?['table'],
          ),
        );
      case NavigatorNames.FULL_ORDER_PAGE:
        return MaterialPageRoute(
          builder: (_) => const FullOrderPage(),
        );
      case NavigatorNames.LOGIN_PAGE:
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case NavigatorNames.REQUEST_ORDER_PAGE:
        return MaterialPageRoute(builder: (_) => RequestOrderPage(
          table: data?['table'],
        ));
      case NavigatorNames.REQUET_ORDER_SUCCESS:
        return MaterialPageRoute(builder: (_) => const RequestOrderSuccess());
      default:
        return MaterialPageRoute(builder: (_) => Container());
    }
  }
}
