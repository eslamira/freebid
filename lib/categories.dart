import 'package:flutter/material.dart';
import 'package:freebid/UI/widgets/drawer.dart';

class Categories extends StatefulWidget {

  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {

  TextEditingController controller = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0D475B),
        centerTitle: true,
        title: Text("Categories",style: TextStyle(color: Color(0xFFE57373)),),

        actions: <Widget>[
          Builder(
            builder: (context) => InkWell(
              child: Image.asset('assets/images/setting.png',scale: 1.15,),
              onTap: () => Scaffold.of(context).openEndDrawer(),
            )
          ),
        ],
      ),
      drawer: Drawer(
        child: drawer(img: 'assets/images/G-logo.png',name: "Utchiha Sasuke",),
      ),
      endDrawer: Drawer(
        child: drawer(img: 'assets/images/G-logo.png',name: "Utchiha Sasuke",),
      ),
      body: ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    title: TextFormField(
                      decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(padding: EdgeInsets.only(top: 10)),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Motors",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap:()=> Navigator.of(context).pushNamed('/adverts'),
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Fashion",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Collectibles & Art",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Home & Garden",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Sporting Goods",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Toys & Hobbies",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Business & Industrial",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),

              Divider(color: Colors.black),

              Container(
                margin: EdgeInsets.only(left: MediaQuery.of(context).padding.left + 10),
                child: ListTile(
                  title: Text("Music",style: TextStyle(color: Color(0xFF676767),fontSize: 23,),),
                  onTap: null,
                ),
              ),
              
            ],
          )
        ],
      ),
    );
  }
}
