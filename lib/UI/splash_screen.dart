import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/auth_client.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthClient _authClient = AuthClient.internal();

  @override
  void initState() {
    super.initState();
    time();
    _isLoggedIn();
  }

  Future<FirebaseUser> _isLoggedIn() async {
    return await _authClient.isLoggedIn();
  }

  void time() async {
    Timer(Duration(seconds: 3), () async {
      _isLoggedIn() == null
          ? Navigator.of(context).pushReplacementNamed('/login')
          : Navigator.of(context).pushReplacementNamed('/categories');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            'assets/images/background.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.topCenter,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 230),
          child: Image.asset(
            'assets/images/Freebid.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
    ));
  }
}
