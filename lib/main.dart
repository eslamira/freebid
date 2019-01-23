import 'package:flutter/material.dart';
import 'package:freebid/SearchScreen.dart';
import 'package:freebid/UI/auth/LogIn.dart';
import 'package:freebid/UI/auth/signUp.dart';

void main() {
  runApp(MaterialApp(
    title: "freebid",
    home: LoginScreen(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => LoginScreen(),
      '/signUp': (BuildContext context) => signUp(),
      '/SearchScreen': (BuildContext context) => SearchScreen(),
      /*'/forgotPass': (BuildContext context) => ForgotPasswordScreen(),
      '/main': (BuildContext context) => MainScreen(),
      '/prof': (BuildContext context) => ProfileScreen(),*/
    },
  ));
}
