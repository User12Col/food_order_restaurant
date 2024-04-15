import 'package:flutter/material.dart';
import 'package:restaurant/pages/login/login.dart';
import 'package:restaurant/pages/main/main_page.dart';
import 'package:restaurant/routes/route_generator.dart';
import 'package:restaurant/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,
      home: LoginPage(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

