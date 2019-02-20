import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/auth_client.dart';
import 'package:freebid/model/signin_model.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _signInFormKey = GlobalKey<FormState>();
  final AuthClient _authClient = AuthClient.internal();
  final SigningModel _signInData = SigningModel();

  _emailLogin(BuildContext context) async {
    final formState = _signInFormKey.currentState;
    if (formState.validate()) {
      formState.save();
      _loading();
      try {
        await _authClient.signInWithEmailAndPassword(
            _signInData.email, _signInData.password);
        Navigator.of(context).pushReplacementNamed('/categories');
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
                backgroundColor: Color(0xFF2af598),
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
      Navigator.of(context).pushReplacementNamed('/categories');
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
    return Scaffold(
      backgroundColor: Color(0xFF0D475B),
      body: ListView(
        children: <Widget>[
          Container(
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            child: Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Color(0xFFE57373),
                          borderRadius: BorderRadius.circular(5)),
                      child: Container(
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).padding.left + 45),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "Log In with Facebook",
                              style: TextStyle(
                                  color: Color(0xFF3B5998), fontSize: 20),
                            ),
                            Padding(padding: EdgeInsets.only(left: 10)),
                            Image.asset(
                              'assets/images/fb-logo.png',
                              scale: 25,
                            )
                          ],
                        ),
                      )),
                  onTap: () => _facebookLogin(context),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(
                            left: 30.0, right: 30.0, top: 20.0),
                        alignment: Alignment.center,
                        child: Row(
                          children: <Widget>[
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 0.25,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("OR",
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF73EF37)))),
                            ),
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 0.25, color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Form(
                  key: _signInFormKey,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          onSaved: (v) => _signInData.email = v,
                          style: TextStyle(color: Colors.white),
                          validator: (v) {},
                          decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: TextStyle(
                                color: Color(0xFF676767),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top)),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: TextFormField(
                          onSaved: (v) => _signInData.password = v,
                          style: TextStyle(color: Colors.white),
                          validator: (v) {},
                          obscureText: true,
                          decoration: InputDecoration(
                              hintText: "Password",
                              hintStyle: TextStyle(
                                color: Color(0xFF676767),
                              ),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white))),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(
                              top: MediaQuery.of(context).padding.top + 20)),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: Color(0xFFE57373),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "Log In",
                            style: TextStyle(color: Colors.white, fontSize: 30),
                          ),
                        ),
                        onTap: () => _emailLogin(context),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
