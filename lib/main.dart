import 'package:flutter/material.dart';
import 'package:freebid/UI/advert.dart';
import 'package:freebid/UI/auth/LogIn.dart';
import 'package:freebid/UI/auth/signIn.dart';
import 'package:freebid/UI/auth/signUp.dart';
import 'package:freebid/UI/categories.dart';
import 'package:freebid/UI/splash_screen.dart';

void main() {
  runApp(MaterialApp(
    title: "freebid",
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      '/login': (BuildContext context) => LoginScreen(),
      '/signIn': (BuildContext context) => SignIn(),
      '/signUp': (BuildContext context) => SignUp(),
      '/SearchScreen': (BuildContext context) => Categories(),
      '/adverts': (BuildContext context) => advert(),
      '/categories': (BuildContext context) => Categories(),
      /*'/forgotPass': (BuildContext context) => ForgotPasswordScreen(),
      '/main': (BuildContext context) => MainScreen(),
      '/prof': (BuildContext context) => ProfileScreen(),*/
    },
  ));
}
