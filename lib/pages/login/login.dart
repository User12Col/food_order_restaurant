import 'package:flutter/material.dart';
import 'package:restaurant/pages/login/children/input_widget.dart';
import 'package:restaurant/pages/login/children/login_button_widget.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/image/logo.png'),),
              const SizedBox(height: 20,),
              InputWidget(controller: _userNameController, hint: 'Nhập tên đăng nhập', isPass: false,),
              const SizedBox(height: 20,),
              InputWidget(controller: _passwordController, hint: 'Nhập mật khẩu', isPass: true,),
              const SizedBox(height: 30,),
              LoginButtonWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
