import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/database_client.dart';
import 'package:freebid/UI/widgets/advert_box.dart';
import 'package:freebid/UI/widgets/drawer.dart';

class Advert extends StatefulWidget {
  final String cat;

  const Advert({Key key, @required this.cat}) : super(key: key);

  @override
  _AdvertState createState() => _AdvertState();
}

class _AdvertState extends State<Advert> {
  DatabaseClient _databaseClient = DatabaseClient.internal();
  List<AdvertBox> _prods = List<AdvertBox>();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    List t = await _databaseClient.getProducts();
    setState(() {
      t.retainWhere((f) => f.cat == widget.cat);
      _prods = t;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D475B),
        centerTitle: true,
        automaticallyImplyLeading: true,
        title: Text(
          "Products",
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
      endDrawer: Drawer(
        child: DrawerCus(
          img: 'assets/images/G-logo.png',
          name: "Utchiha Sasuke",
        ),
      ),
      body: _prods.length == 0
          ? Container(
              child: Center(
                child: Text('No Products here yet'),
              ),
            )
          : ListView.builder(
              itemCount: _prods.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: _prods[index],
                );
              },
            ),
    );
  }
}
