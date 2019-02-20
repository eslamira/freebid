import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/auth_client.dart';
import 'package:freebid/model/signin_model.dart';

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
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 160),
          child: Image.asset(
            'assets/images/Freebid.png',
            fit: BoxFit.fill,
          ),
        ),
        Container(
          alignment: Alignment.center,
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).padding.top + 400),
          child: Column(
            children: <Widget>[
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      color: Color(0xFFE57373),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Sign up",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed('/signUp'),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 20)),
              InkWell(
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.09,
                  width: MediaQuery.of(context).size.width * 0.6,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  child: Text(
                    "Log in",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ),
                onTap: () => Navigator.of(context).pushNamed('/signIn'),
              )
            ],
          ),
        )
      ],
    ));
  }
}
