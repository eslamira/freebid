import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/auth_client.dart';
import 'package:freebid/UI/widgets/divider.dart';

class DrawerCus extends StatefulWidget {
  final String img;
  final String name;

  DrawerCus({@required this.img, @required this.name});

  @override
  _DrawerCusState createState() => _DrawerCusState();
}

class _DrawerCusState extends State<DrawerCus> {
  final AuthClient _authClient = AuthClient.internal();

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 10),
        color: Color(0xFFF1ECE6),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              height: MediaQuery.of(context).size.height * 0.12 * 1.2,
              width: MediaQuery.of(context).size.width * 0.2 * 1.2,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              child: Image.asset(
                widget.img,
                fit: BoxFit.contain,
              ),
            ),
            Text(
              widget.name,
              style: TextStyle(
                  color: Color(0xFF676767),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            divder(),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "Profile",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            divder(),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "Wish list",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            divder(),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "My adverts",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            divder(),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "Massages",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 5)),
            divder(),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "Settings",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: null,
              ),
            ),
            divder(),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).padding.left + 10),
              child: ListTile(
                title: Text(
                  "LogOut",
                  style: TextStyle(
                      color: Color(0xFF676767),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  _authClient.signOut();
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/login', (Route<dynamic> route) => false);
                },
              ),
            ),
          ],
        ));
  }
}
