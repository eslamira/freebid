import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D475B),
      body: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20),
            child: Column(
              children: <Widget>[
                InkWell(
                  child: Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                        color: Color(0xFFE57373),
                        borderRadius: BorderRadius.circular(5)
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 45),
                      child: Row(
                        children: <Widget>[
                          Text("Sign up with Facebook",style: TextStyle(color: Color(0xFF3B5998),fontSize: 20),),
                          Padding(padding: EdgeInsets.only(left: 10)),
                          Image.asset('assets/images/fb-logo.png',scale: 25,)
                        ],
                      ),
                    )
                  ),
                  onTap: null,
                ),

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
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration:
                                BoxDecoration(
                                    border: Border.all(width: 0.25,color: Colors.white,),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text("OR",
                                      style: TextStyle(
                                          fontSize: 20, color: Color(0xFF73EF37)))),
                            ),
                            new Expanded(
                              child: new Container(
                                margin: EdgeInsets.all(8.0),
                                decoration:
                                BoxDecoration(border: Border.all(width: 0.25,color: Colors.white)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: "First name",
                      hintStyle: TextStyle(
                        color: Color(0xFF676767),
                      ),
                      border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Last name",
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                        ),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                        ),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Tel no.",
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                        ),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                        ),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top)),

                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextFormField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                        hintText: "Confirm password",
                        hintStyle: TextStyle(
                          color: Color(0xFF676767),
                        ),
                        border: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white))
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 20)),

                InkWell(
                  child: Container(
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.1,
                      width: MediaQuery.of(context).size.width * 0.8,
                      decoration: BoxDecoration(
                          color: Color(0xFFE57373),
                          borderRadius: BorderRadius.circular(5)
                      ),
                    child: Text("NEXT",style: TextStyle(color: Colors.white,fontSize: 30),),
                  ),
                  onTap: ()=> Navigator.of(context).pushReplacementNamed('/categories'),
                ),


                Container(
                  margin: EdgeInsets.only(left: 25),
                  child: Row(
                    children: <Widget>[
                      Padding(padding: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 40)),
                      Text("By Joining you agree to our ",style: TextStyle(color: Colors.white,fontSize: 12),),
                      InkWell(
                        child: Text("Terms",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                        onTap: null,
                      ),
                      Text(" & ",style: TextStyle(color: Colors.white,fontSize: 12),),
                      InkWell(
                        child: Text("Privacy Policy",style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold),),
                        onTap: null,
                      ),
                    ],
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }
}
