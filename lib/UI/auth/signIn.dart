import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('assets/images/background.png',fit: BoxFit.fill,),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 160),
              child: Image.asset('assets/images/Freebid.png',fit: BoxFit.fill,),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 200),
              child: Column(
                children: <Widget>[
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          color: Color(0xFFE57373),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Sign up",style: TextStyle(color: Colors.white,fontSize: 30),),
                    ),
                    onTap: ()=> Navigator.of(context).pushNamed('/signUp'),
                  ),
                  Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20)),
                  InkWell(
                    child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.6,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(5)
                      ),
                      child: Text("Log in",style: TextStyle(color: Colors.white,fontSize: 30),),
                    ),
                    onTap: ()=> Navigator.of(context).pushNamed('/signIn'),
                  )
                ],
              ),
            )
          ],
        )
    );
  }
}
