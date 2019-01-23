import 'package:flutter/material.dart';
import 'package:freebid/UI/auth/validation.dart';
import 'package:freebid/model/signin_model.dart';
import 'package:freebid/UI/Utils/auth_client.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final AuthClient _authClient = AuthClient.internal();
  final Color start = const Color(0xFF2af598);
  final Color end = const Color(0xFF009efd);
  final SigningModel _signInData = SigningModel();
  final String _fbLogo = "assets/images/fb-logo.png";
  final String _GLogo = "assets/images/G-logo.png";
  _emailLogin(BuildContext context) async {
    final formState = _signInFormKey.currentState;
    _loading();
    if (formState.validate()) {
      formState.save();
      try {
        await _authClient.signInWithEmailAndPassword(
            _signInData.email, _signInData.password);
        //Navigator.of(context).pushReplacementNamed('/main');
      } catch (e) {
        _showErrorDialog(e.toString());
      }
    }
  }

  _loading() {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CircularProgressIndicator(
                backgroundColor: Colors.purple,
                strokeWidth: 4.0,
              ),
            ],
          ),
        );
      },
    );
  }

  _facebookLogin(BuildContext context) async {
    _loading();
    try {
      await _authClient.signInWithFacebook();
      Navigator.of(context).pushReplacementNamed('/main');
    } catch (e) {
      _showErrorDialog(e.toString());
    }
  }

  _showErrorDialog(String error) {
    Navigator.of(context).pop();
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Error!"),
          content: Text(error.toString()),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);

    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 40.0),
            alignment: Alignment.topCenter,
            child: Form(
              //key: _signInFormKey,
              child: Column(
                children: <Widget>[
                  //////////////////////////////////////  Logo \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.cyan
                    ),
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Text("freebid",style: TextStyle(fontWeight: FontWeight.w300),),
                    alignment: Alignment.center,
                  ),

                  Padding(
                      padding:
                      EdgeInsets.only(top: mediaQuery.padding.top + 20)),

                  //////////////////////////////////////  Email TextField  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

                  Container(
                    width: mediaQuery.size.width * 0.83,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Email",
                          contentPadding:
                          EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          )),
                      onSaved: (val) => _signInData.email = val,
                      maxLength: 32,
                      validator: (email) =>
                          Validation.isValidEmail(email, context),
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 20.0)),

                  //////////////////////////////////////  Password TextField  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

                  Container(
                    width: mediaQuery.size.width * 0.83,
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Password",
                          contentPadding:
                          EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
                          hintStyle: TextStyle(
                            color: Colors.black26,
                          ),
                          border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(30.0)),
                          )),
                      onSaved: (val) => _signInData.password = val,
                      maxLength: 32,
                      validator: (password) =>
                          Validation.isValidPassword(password, context),
                      obscureText: true,
                    ),
                  ),

                  Padding(padding: EdgeInsets.only(top: 10.0)),

                  //////////////////////////////////////  Forogt password Button  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

                  Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: mediaQuery.padding.left + 60)),
                      Text(
                        "did`t have a account ?",
                        style: TextStyle(color: Colors.black26),
                      ),
                      InkWell(
                        child: Text(
                          " Sign Up here",
                          style: TextStyle(color: Colors.blueAccent,),

                        ),
                        onTap: () => Navigator.of(context).pushNamed('/signUp'),
                      )
                    ],
                  ),

                  Padding(
                      padding:
                      EdgeInsets.only(top: mediaQuery.padding.top - 5)),

                  //////////////////////////////////////  Login Button \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

                  Container(
                      width: mediaQuery.size.width * 0.83,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        gradient: LinearGradient(
                          colors: [start, end],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                        ),
                      ),
                      child: MaterialButton(
                        height: 55.0,
                        minWidth: 300.0,
                        textColor: Colors.white,
                        child: Text("Log in"),
                        onPressed: () => _emailLogin(context),
                      )
                  ),

                  Padding(padding: EdgeInsets.only(top: 10)),

                  InkWell(
                    child: Text(
                      "Forgot Password ?",
                      style: TextStyle(color: Colors.black26),
                    ),
                    onTap: () => Navigator.of(context).pushNamed('/forgotPass'),
                  ),

                ],
              ),
            ),
          ),

          //////////////////////////////////////   OR  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

          Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  margin:
                  const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          decoration:
                          BoxDecoration(border: Border.all(width: 0.25)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black26),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text("Or",
                                style: TextStyle(
                                    fontSize: 15.0, color: Colors.black26))),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.all(8.0),
                          decoration:
                          BoxDecoration(border: Border.all(width: 0.25)),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          margin: EdgeInsets.only(top: 15.0),
//                    margin: EdgeInsets.only(
//                        left: mediaQuery.padding.left + 30.0,
//                        top: mediaQuery.padding.top + 55.0),
                          width: mediaQuery.size.width * 0.85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xFF3B5998)),
                          child: MaterialButton(
                            height: 55.0,
                            minWidth: 300.0,
                            textColor: Colors.white,
                            padding: EdgeInsets.only(left: 30.0),
                            child: new Text(
                              "Continue with Facebook",
                            ),
                            onPressed: () => _facebookLogin(context),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.all(25),
                      child: Image.asset(
                        '$_fbLogo',
                        width: 20.0,
                        height: 30.0,
                      ),
                    ),
                  ],
                ),
                Stack(
                  children: <Widget>[
                    InkWell(
                      child: Container(
                          margin: EdgeInsets.only(top: 3.0),
//                    margin: EdgeInsets.only(
//                        left: mediaQuery.padding.left + 30.0,
//                        top: mediaQuery.padding.top + 55.0),
                          width: mediaQuery.size.width * 0.85,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: Color(0xFF3367d6)),
                          child: MaterialButton(
                            height: 55.0,
                            minWidth: 300.0,
                            textColor: Colors.white,
                            padding: EdgeInsets.only(left: 30.0),
                            child: new Text(
                              "Continue with Facebook",
                            ),
                            onPressed: () => null,
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,top: 0,),
                      //color: Colors.white,
                      child: Image.asset(
                        '$_GLogo',
                        width: 50.0,
                        height: 60.0,
                        alignment: Alignment.center,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
