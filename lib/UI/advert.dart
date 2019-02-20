import 'package:flutter/material.dart';
import 'package:freebid/UI/widgets/advert_box.dart';
import 'package:freebid/UI/widgets/drawer.dart';

class Advert extends StatefulWidget {
  @override
  _AdvertState createState() => _AdvertState();
}

class _AdvertState extends State<Advert> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D475B),
        centerTitle: true,
        title: Text(
          "Categories",
          style: TextStyle(color: Color(0xFFE57373)),
        ),
        actions: <Widget>[
          Builder(
              builder: (context) => InkWell(
                    child: Image.asset(
                      'assets/images/setting.png',
                      scale: 1.15,
                    ),
                    onTap: () => Scaffold.of(context).openEndDrawer(),
                  )),
        ],
      ),
      drawer: Drawer(
        child: DrawerCus(
          img: 'assets/images/G-logo.png',
          name: "Utchiha Sasuke",
        ),
      ),
      endDrawer: Drawer(
        child: DrawerCus(
          img: 'assets/images/G-logo.png',
          name: "Utchiha Sasuke",
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          AdvertBox(
            name: 'Gaming Pc i5 6th gen.',
            img: 'assets/images/pc.png',
            date: 5,
            price: 1500,
            location: 'London',
          ),
        ],
      )),
    );
  }
}
