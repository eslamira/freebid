import 'package:flutter/material.dart';
import 'package:freebid/UI/auth/validation.dart';
import 'package:freebid/model/signin_model.dart';
import 'package:freebid/UI/Utils/auth_client.dart';


class signUp extends StatefulWidget {
  @override
  _signUpState createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();
  final GlobalKey<FormFieldState> _passKey = GlobalKey<FormFieldState>();
  final Color start = const Color(0xFF2af598);
  final Color end = const Color(0xFF009efd);
  final SigningModel _signInData = SigningModel();

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    return Scaffold(
     body: ListView(
       children: <Widget>[
         Form(
           key: _signUpFormKey,
           child: Column(
             children: <Widget>[

               Padding(
                   padding:
                   EdgeInsets.only(top: mediaQuery.padding.top + 10)),

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
                   EdgeInsets.only(top: mediaQuery.padding.top + 10)),

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
                   maxLength: 32,
                   onSaved: (val) => _signInData.email = val,
                   validator: (email) =>
                       Validation.isValidEmail(email, context),
                 ),
               ),

               Padding(padding: EdgeInsets.only(top: 10.0)),

               //////////////////////////////////////  Password TextField  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\

               Container(
                 width: mediaQuery.size.width * 0.83,
                 child: TextFormField(
                   key: _passKey,
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
                   maxLength: 32,
                   onSaved: (val) => _signInData.password = val,
                   validator: (password) =>
                       Validation.isValidPassword(password, context),
                   obscureText: true,
                 ),
               ),

               Padding(padding: EdgeInsets.only(top: 10.0)),

               //////////////////////////////////////  Confirm Password TextField  \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\


               Container(
                 width: mediaQuery.size.width * 0.83,
                 child: TextFormField(
                   decoration: InputDecoration(
                       hintText: "Confirm password",
                       contentPadding:
                       EdgeInsets.fromLTRB(30.0, 20.0, 0.0, 20.0),
                       hintStyle: TextStyle(
                         color: Colors.black26,
                       ),
                       border: OutlineInputBorder(
                         borderRadius:
                         BorderRadius.all(Radius.circular(30.0)),
                       )),
                   obscureText: true,
                   autovalidate: true,
                   maxLength: 32,
                   validator: (confirmation) {
                     var password = _passKey.currentState.value;
                     return confirmation == password
                         ? null
                         : "Password doesn't match";
                   },
                 ),
               ),

               Padding(padding: EdgeInsets.only(top: 10.0)),

               Container(
                 width: mediaQuery.size.width * 0.83,
                 child: TextFormField(
                   keyboardType: TextInputType.phone,
                   decoration: InputDecoration(
                       hintText: "Phone Number",
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
                   maxLength: 11,
                   validator: (pNum) =>
                       Validation.isValidPhone(pNum, context),
                 ),
               ),

               Padding(padding: EdgeInsets.only(top: 10.0)),

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
                     child: Text("Sign up"),
                     onPressed: () => null,
                   )),

             ],
           ),
         ),
       ],
     ),
    );
  }
}
