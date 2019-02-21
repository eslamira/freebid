import 'package:flutter/material.dart';
import 'package:freebid/UI/Utils/database_client.dart';
import 'package:freebid/UI/search_model.dart';
import 'package:freebid/UI/widgets/drawer.dart';
import 'package:freebid/model/categoryModel.dart';
import 'package:freebid/model/user_model.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  DatabaseClient _databaseClient = DatabaseClient.internal();
  List<CategoryModel> cats = List<CategoryModel>();
  UserModel _userModel = UserModel();

  @override
  void initState() {
    super.initState();
    _initData();
  }

  _initData() async {
    List temp = await _databaseClient.getCategories();
    UserModel u = await _databaseClient.getCurrentUserData();
    setState(() {
      cats = temp;
      _userModel = u;
    });
  }

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
        leading: InkWell(
          onTap: () =>
              showSearch(context: context, delegate: SearchResult(cats)),
          child: Icon(Icons.search),
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
          name: "${_userModel.fName} ${_userModel.lName}",
        ),
      ),
      body: ListView.builder(
        itemCount: cats.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: cats[index],
          );
        },
      ),
    );
  }
}
