import 'package:flutter/material.dart';

class signIn extends StatefulWidget {
  @override
  _signInState createState() => _signInState();
}

class _signInState extends State<signIn> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 50,bottom: MediaQuery.of(context).padding.top + 50),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.2,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.cyan
                ),
                child: Text("LOGIN"),
              ),
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.8,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Form(
                  key: _signInFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(right: MediaQuery.of(context).padding.right + 250),
                            child: Text("Email"),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: "Email",
                                border: UnderlineInputBorder(borderSide: BorderSide(width: 0.5))
                            ),
                            onSaved: (val) => email=val,
                          ),
                        ],
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Password",
                            border: UnderlineInputBorder(borderSide: BorderSide(width: 0.5))
                        ),
                        onSaved: (val) => email=val,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )
        ],
      )
    );
  }
}
