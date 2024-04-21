import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant/bloc/login/login_bloc.dart';
import 'package:restaurant/bloc/login/login_event.dart';
import 'package:restaurant/bloc/login/login_state.dart';
import 'package:restaurant/models/user.dart';
import 'package:restaurant/routes/navigator_names.dart';
import 'package:restaurant/services/share_preference_service.dart';
import 'package:restaurant/theme/color.dart';
class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state){
              if(state.isLogout){
                Navigator.of(context).popAndPushNamed(NavigatorNames.LOGIN_PAGE);
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state){
                if(state.isLoading && state.isLogout){
                  return Center(child: CircularProgressIndicator(),);
                } else{
                  return Center(
                    child: Column(
                      children: [
                        Image(image: AssetImage('assets/image/logo.png')),
                        SizedBox(height: 20,),
                        FutureBuilder<User?>(future: SharedPreferencesService.getUser(), builder: (context, snapshot){
                          if(snapshot.hasData){
                            return Text(snapshot.data!.name!, style: TextStyle(fontWeight: FontWeight.bold),);
                          } else if(snapshot.connectionState == ConnectionState.waiting){
                            return Container();
                          } else{
                            return Text('Error');
                          }
                        }),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            context.read<LoginBloc>().add(EventLogout());
                          },
                          child: Container(
                            height: 50,
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 7,
                                  offset: const Offset(0, 3), // changes position of shadow
                                ),
                              ],
                              color: AppColors.textColor,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.logout, color: Colors.grey,),
                                    SizedBox(width: 8,),
                                    Text('Đăng xuất'),
                                  ],
                                ),
                                Icon(Icons.arrow_forward, color: Colors.grey,),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
