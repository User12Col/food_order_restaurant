import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/login/login_bloc.dart';
import 'package:restaurant/bloc/login/login_event.dart';
import 'package:restaurant/bloc/login/login_state.dart';
import 'package:restaurant/pages/login/children/input_widget.dart';
import 'package:restaurant/pages/login/children/login_button_widget.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/theme/color.dart';

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
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            return Container(
              child: Center(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.25,
                  width: MediaQuery.of(context).size.width / 1.25,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: AppColors.textColor,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage('assets/image/logo.png'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputWidget(
                        controller: _userNameController,
                        hint: 'Nhập tên đăng nhập',
                        isPass: false,
                        icon: Icons.accessibility_sharp,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputWidget(
                        controller: _passwordController,
                        hint: 'Nhập mật khẩu',
                        isPass: true,
                        icon: Icons.lock,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      GestureDetector(
                        onTap: () {
                          context.read<LoginBloc>().add(EventLogin(
                              _userNameController.text,
                              _passwordController.text));
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.appBarColor,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: state.isLoading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : const Center(
                                  child: Text(
                                    'Đăng Nhập',
                                    style: TextStyle(
                                      color: AppColors.textColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                      BlocListener<LoginBloc, LoginState>(
                        listener: (context, state) {
                          if (state.isSuccess) {
                            Navigator.of(context).pushNamed(NavigatorNames.MAIN_PAGE);
                          }
                        },
                        child: SizedBox.shrink(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
